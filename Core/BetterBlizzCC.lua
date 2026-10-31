local addonName, CC = ...

CC.addonName      = "BetterBlizzCC"
CC.addonNameColor = "Better|cff00c0ffBlizz|rCC"
CC.addonNameLogo  = "Better|cff00c0ffBlizz|rCC |A:gmchat-icon-blizz:16:16|a"
CC.logoAddonName  = "|A:gmchat-icon-blizz:16:16|a Better|cff00c0ffBlizz|rCC"

local addon = {}
CC.addon    = addon

local eventFrame    = CreateFrame("Frame")
local eventHandlers = {}

eventFrame:SetScript("OnEvent", function(_, event, ...)
    local list = eventHandlers[event]
    if not list then return end
    local i  = 1
    local fn = list[1]
    while fn do
        fn(event, ...)
        if list[i] == fn then i = i + 1 end
        fn = list[i]
    end
end)

function CC.On(event, handler)
    if not eventHandlers[event] then
        eventHandlers[event] = {}
        eventFrame:RegisterEvent(event)
    end
    local list = eventHandlers[event]
    for _, fn in ipairs(list) do
        if fn == handler then return end
    end
    list[#list + 1] = handler
end

function CC.Off(event, handler)
    local list = eventHandlers[event]
    if not list then return end
    for i = #list, 1, -1 do
        if list[i] == handler then table.remove(list, i) end
    end
    if #list == 0 then
        eventHandlers[event] = nil
        eventFrame:UnregisterEvent(event)
    end
end

function CC.Print(msg)
    print(CC.logoAddonName .. ": " .. msg)
end

local bootFrame = CreateFrame("Frame")
bootFrame:RegisterEvent("ADDON_LOADED")
bootFrame:SetScript("OnEvent", function(_, _, name)
    if name == addonName then
        bootFrame:UnregisterEvent("ADDON_LOADED")
        addon:OnInitialize()
        addon:OnEnable()
    end
end)

CC.EnableCallbacks = {}

function CC.LoCSettingsOpen()
    return CC.settingsPanel and CC.settingsPanel:IsVisible() or false
end

function CC.RefreshLossOfControl()
    if CC.LoC.Supported() then
        CC.LoC.Refresh()
    elseif CC.UpdateLoCFrame then
        CC.UpdateLoCFrame()
    end
end

function CC.ToggleLossOfControlTestMode()
    if CC.LoC.Supported() then
        CC.LoC.Test()
    elseif BBLossOfControlFrame then
        CC.LoC.TestOwn(BBLossOfControlFrame)
    end
end

function addon:OnInitialize()
    CC.InitProfiles()
end

function addon:OnEnable()
    for _, fn in ipairs(CC.EnableCallbacks) do fn(self) end
    CC.RefreshLossOfControl()
    CC.BuildBBGPanel()
end
