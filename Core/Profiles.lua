local _, CC = ...
local L = CC.L

local LibSerialize = LibStub("LibSerialize")
local LibDeflate = LibStub("LibDeflate")

local EXPORT_PREFIX = "!BBCC!"
local EXPORT_VERSION = 1

CC.DEFAULT_PROFILE = "Default"

local function Root()
    return BetterBlizzCCDB
end

function CC.DB()
    return BetterBlizzCCDB.profiles[BetterBlizzCCDB.profile]
end

function CC.FillDefaults(db)
    if db.lossOfControlXPos == nil then
        db.lossOfControlXPos = db.xPos
    end
    if db.lossOfControlYPos == nil then
        db.lossOfControlYPos = db.yPos
    end
    db.xPos, db.yPos = nil, nil
    for k, v in pairs(CC.defaultSettings) do
        if db[k] == nil then
            db[k] = type(v) == "table" and CopyTable(v) or v
        end
    end
end

function CC.InitProfiles()
    BetterBlizzCCDB = BetterBlizzCCDB or {}
    local root = BetterBlizzCCDB
    if type(root.profiles) ~= "table" then
        local legacy = {}
        for k, v in pairs(root) do
            legacy[k] = v
            root[k] = nil
        end
        root.profiles = { [CC.DEFAULT_PROFILE] = legacy }
    end
    root.profiles[CC.DEFAULT_PROFILE] = root.profiles[CC.DEFAULT_PROFILE] or {}
    if type(root.profile) ~= "string" or not root.profiles[root.profile] then
        root.profile = CC.DEFAULT_PROFILE
    end
    for _, profile in pairs(root.profiles) do
        CC.FillDefaults(profile)
    end
end

local function IsSettingKey(key)
    return type(key) == "string" and (key == "enableLoCFrame" or key == "showCooldownOnLoC"
        or key:match("^hideLossOfControl") or key:match("^lossOfControl")) and true or false
end

local function SameValue(a, b)
    if type(a) ~= type(b) then return false end
    if type(a) ~= "table" then return a == b end
    for k, v in pairs(a) do
        if b[k] ~= v then return false end
    end
    for k in pairs(b) do
        if a[k] == nil then return false end
    end
    return true
end

local function ValidValue(key, value)
    local default = CC.defaultSettings[key]
    if default ~= nil and type(value) ~= type(default) then return false end
    local kind = type(value)
    if kind == "table" then
        for k, v in pairs(value) do
            if type(k) ~= "number" or type(v) ~= "number" then return false end
        end
        return true
    end
    return kind == "boolean" or kind == "number" or kind == "string"
end

local function CopySettings(from, to)
    for key, value in pairs(from) do
        if IsSettingKey(key) and ValidValue(key, value) then
            to[key] = type(value) == "table" and CopyTable(value) or value
        end
    end
    CC.FillDefaults(to)
    return to
end

function CC.NormalizeProfileName(name)
    if type(name) ~= "string" then return nil end
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    if name == "" then return nil end
    return name
end

function CC.GetProfileNames()
    local names = {}
    for name in pairs(Root().profiles) do
        names[#names + 1] = name
    end
    table.sort(names, function(a, b)
        if a == CC.DEFAULT_PROFILE then return true end
        if b == CC.DEFAULT_PROFILE then return false end
        return a:lower() < b:lower()
    end)
    return names
end

function CC.GetActiveProfile()
    return Root().profile
end

function CC.ProfileExists(name)
    return Root().profiles[name] ~= nil
end

function CC.SetProfile(name)
    if not Root().profiles[name] then return nil, L["Msg.ProfileMissing"] end
    Root().profile = name
    CC.RefreshLossOfControl()
    return name
end

function CC.CreateProfile(name, copyFrom)
    name = CC.NormalizeProfileName(name)
    if not name then return nil, L["Msg.ProfileNameEmpty"] end
    local profiles = Root().profiles
    if profiles[name] then return nil, string.format(L["Msg.ProfileExists"], name) end
    profiles[name] = CopySettings(copyFrom and profiles[copyFrom] or {}, {})
    return CC.SetProfile(name)
end

function CC.RenameProfile(old, new)
    local profiles = Root().profiles
    if old == CC.DEFAULT_PROFILE then return nil, L["Msg.DefaultCannotRename"] end
    if not profiles[old] then return nil, L["Msg.ProfileMissing"] end
    new = CC.NormalizeProfileName(new)
    if not new then return nil, L["Msg.ProfileNameEmpty"] end
    if new == old then return old end
    if profiles[new] then return nil, string.format(L["Msg.ProfileExists"], new) end
    profiles[new], profiles[old] = profiles[old], nil
    if Root().profile == old then
        Root().profile = new
    end
    return new
end

function CC.DeleteProfile(name)
    local profiles = Root().profiles
    if name == CC.DEFAULT_PROFILE then return nil, L["Msg.DefaultCannotDelete"] end
    if not profiles[name] then return nil, L["Msg.ProfileMissing"] end
    profiles[name] = nil
    if Root().profile == name then
        CC.SetProfile(CC.DEFAULT_PROFILE)
    end
    return true
end

function CC.ResetProfile(name)
    local profile = Root().profiles[name]
    if not profile then return nil, L["Msg.ProfileMissing"] end
    wipe(profile)
    CC.FillDefaults(profile)
    if Root().profile == name then
        CC.RefreshLossOfControl()
    end
    return true
end

function CC.ExportProfile(name)
    local profile = Root().profiles[name]
    if not profile then return nil, L["Msg.ProfileMissing"] end
    local settings = {}
    for key, value in pairs(profile) do
        if IsSettingKey(key) and ValidValue(key, value) and not SameValue(value, CC.defaultSettings[key]) then
            settings[key] = value
        end
    end
    local payload = { addon = "BetterBlizzCC", version = EXPORT_VERSION, name = name, settings = settings }
    local serialized = LibSerialize:SerializeEx({ errorOnUnserializableType = false }, payload)
    local compressed = LibDeflate:CompressDeflate(serialized, { level = 9 })
    if not compressed then return nil, L["Msg.CompressFailed"] end
    return EXPORT_PREFIX .. LibDeflate:EncodeForPrint(compressed)
end

function CC.DecodeProfileString(str)
    if type(str) ~= "string" then return nil, L["Msg.NothingToImport"] end
    str = str:gsub("%s+", "")
    if str == "" then return nil, L["Msg.NothingToImport"] end
    if str:sub(1, #EXPORT_PREFIX) ~= EXPORT_PREFIX then
        return nil, L["Msg.NotProfileString"]
    end
    local decoded = LibDeflate:DecodeForPrint(str:sub(#EXPORT_PREFIX + 1))
    local decompressed = decoded and LibDeflate:DecompressDeflate(decoded)
    if not decompressed then return nil, L["Msg.StringDamaged"] end
    local ok, payload = LibSerialize:Deserialize(decompressed)
    if not ok or type(payload) ~= "table" or payload.addon ~= "BetterBlizzCC" or type(payload.settings) ~= "table" then
        return nil, L["Msg.StringDamaged"]
    end
    if payload.version ~= EXPORT_VERSION then
        return nil, L["Msg.IncompatibleVersion"]
    end
    return payload
end

function CC.ImportProfile(payload, name)
    name = CC.NormalizeProfileName(name)
    if not name then return nil, L["Msg.ProfileNameEmpty"] end
    local profiles = Root().profiles
    local profile = profiles[name] or {}
    wipe(profile)
    profiles[name] = CopySettings(payload.settings, profile)
    return CC.SetProfile(name)
end
