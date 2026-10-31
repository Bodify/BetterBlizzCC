local addonName, CC = ...
local BBG = CC.BBG

local testQueued

local function DB()
    return CC.DB()
end

local function RefreshAndTest()
    CC.RefreshLossOfControl()
    if testQueued then return end
    testQueued = true
    C_Timer.After(0.25, function()
        testQueued = nil
        CC.ToggleLossOfControlTestMode()
    end)
end

local function Option(key, label, desc)
    return {
        label = label,
        desc  = desc,
        get   = function() return DB()[key] and true or false end,
        set   = function(v)
            DB()[key] = v
            RefreshAndTest()
        end,
    }
end

function CC.PanelTitle()
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
    return CC.addonNameColor .. " |cff808080v" .. version .. "|r"
end

function CC.BuildBBGPanel()
    BBG.SetPopupBranding({ title = CC.addonNameColor, icon = { atlas = "gmchat-icon-blizz", size = 16 } })
    local p = BBG.CreatePanel("BetterBlizzCC_Main", CC.addonNameLogo, 620, 580)

    BBG.MakePanelHeader({
        title       = CC.PanelTitle(),
    }, p)

    BBG.MakeHeaderButton({
        key     = "testmode",
        width   = 85,
        height  = 25,
        scale   = 1.15,
        anchor  = SettingsPanel and SettingsPanel.SearchBox and {
            point         = "TOPRIGHT",
            relativeTo    = SettingsPanel.SearchBox,
            relativePoint = "TOPLEFT",
            x             = -5,
            y             = -0.5,
        },
        label   = "Test",
        func    = CC.ToggleLossOfControlTestMode,
    }, p)

    BBG.MakeTitle("Tweaks", p, { atlas = "GM-icon-visible-hover", sizeX = 33, sizeY = 33, offsetX = 6 })

    local textPosition
    local function SyncTextPosition()
        if not textPosition then return end
        local iconOnly = DB().lossOfControlIconOnly
        textPosition:SetEnabled(not iconOnly)
        textPosition:SetAlpha(iconOnly and 0.5 or 1)
    end

    local iconOnly = Option("lossOfControlIconOnly", "Show Icon Only", "Hide the CC name and timer.")
    local setIconOnly = iconOnly.set
    iconOnly.set = function(v)
        setIconOnly(v)
        SyncTextPosition()
    end
    BBG.MakeCheckbox(iconOnly, p)
    BBG.MakeCheckbox(Option("hideLossOfControlFrameBg", "Hide CC Background", "Hide the dark background."), p)
    BBG.MakeCheckbox(Option("hideLossOfControlFrameLines", "Hide CC Red Lines", "Hide the red lines above and below."), p)
    BBG.MakeCheckbox(Option("lossOfControlInterruptsOnly", "Interrupts Only", "Only show interrupts."), p)
    local secondIconScale
    local showSecondIcon = Option("lossOfControlShowSecondIcon", "Show Second Icon", "Show a second icon for a second CC also affecting you. Especially useful for when you get interrupted and CC'd at the same time.")
    local setShowSecondIcon = showSecondIcon.set
    showSecondIcon.set = function(v)
        setShowSecondIcon(v)
        if secondIconScale then secondIconScale:SetShown(v) end
    end
    local secondIconBox = BBG.MakeCheckbox(showSecondIcon, p)
    local secondIconInterrupts = Option("lossOfControlSecondIconInterruptsOnly", "Only for Interrupts", "Only show the second icon for interrupts.")
    secondIconInterrupts.subsettingOf = secondIconBox
    BBG.MakeCheckbox(secondIconInterrupts, p)
    BBG.MakeCheckbox(Option("lossOfControlShowSchool", "Show Interrupted School", "Show the school you got interrupted on."), p)
    local swipe = BBG.MakeCheckbox(Option("showCooldownOnLoC", "Show Cooldown Swipe on Icon", "Show the cooldown swipe on the icon."), p)
    local reverseSwipe = Option("lossOfControlReverseSwipe", "Reverse Swipe", "Reverse swipe so icon starts fully visible instead.")
    reverseSwipe.subsettingOf = swipe
    BBG.MakeCheckbox(reverseSwipe, p)

    local function FontItems()
        local items = { { label = "Default", value = "" } }
        local LSM = LibStub("LibSharedMedia-3.0")
        for _, name in ipairs(LSM:List("font")) do
            items[#items + 1] = { label = name, value = name, previewFont = LSM:Fetch("font", name) }
        end
        return items
    end

    local function FontOption(key, label)
        return {
            label = label,
            items = FontItems,
            get   = function() return DB()[key] or "" end,
            set   = function(v)
                DB()[key] = v ~= "" and v or nil
                RefreshAndTest()
            end,
        }
    end

    BBG.MakeTitle("Position & Scale", p, { atlas = "OptionsIcon-Brown", sizeX = 17, sizeY = 17, offsetX = -1.5, offsetY = 0.5 })
    textPosition = BBG.MakeDropdown({
        label   = "CC Text Position",
        options = {
            { label = "Left",   value = "LEFT" },
            { label = "Right",  value = "RIGHT" },
            { label = "Top",    value = "OVER" },
            { label = "Bottom", value = "UNDER" },
        },
        get = function() return DB().lossOfControlTextPosition or "RIGHT" end,
        set = function(v)
            DB().lossOfControlTextPosition = v
            RefreshAndTest()
        end,
    }, p)
    SyncTextPosition()

    if CC.LoC.HasEditMode() then
        BBG.MakeSlider({ label = "Scale", min = 0.5, max = 2, step = 0.05, fmt = "%.2f",
            default = 1,
            get = function() return CC.LoC.GetScale() end,
            set = function(v) DB().lossOfControlEditModeScale = v; RefreshAndTest() end }, p)
    else
        BBG.MakeSlider({ label = "Scale", min = 0.4, max = 1.5, step = 0.05, fmt = "%.2f",
            default = CC.defaultSettings.lossOfControlScale,
            get = function() return DB().lossOfControlScale or 1 end,
            set = function(v) DB().lossOfControlScale = v; RefreshAndTest() end }, p)
        BBG.MakeSlider({ label = "Horizontal Position", min = -400, max = 400, step = 1,
            default = CC.defaultSettings.lossOfControlXPos,
            get = function() return DB().lossOfControlXPos or 0 end,
            set = function(v) DB().lossOfControlXPos = v; RefreshAndTest() end }, p)
        BBG.MakeSlider({ label = "Vertical Position", min = -400, max = 400, step = 1,
            default = CC.defaultSettings.lossOfControlYPos,
            get = function() return DB().lossOfControlYPos or 0 end,
            set = function(v) DB().lossOfControlYPos = v; RefreshAndTest() end }, p)
    end

    BBG.MakeDropdown({
        label   = "Second Icon Position",
        options = {
            { label = "Left",   value = "LEFT" },
            { label = "Right",  value = "RIGHT" },
            { label = "Top",    value = "UP" },
            { label = "Bottom", value = "DOWN" },
        },
        get = function() return DB().lossOfControlSecondaryPosition or "LEFT" end,
        set = function(v)
            DB().lossOfControlSecondaryPosition = v
            RefreshAndTest()
        end,
    }, p)
    secondIconScale = BBG.MakeSlider({ label = "Second Icon Scale", min = 0.3, max = 1.5, step = 0.05, fmt = "%.2f",
        default = CC.defaultSettings.lossOfControlSecondIconScale,
        get = function() return DB().lossOfControlSecondIconScale or 0.75 end,
        set = function(v) DB().lossOfControlSecondIconScale = v; RefreshAndTest() end }, p)
    secondIconScale:SetShown(DB().lossOfControlShowSecondIcon ~= false)

    BBG.SetCursor(p, BBG.GetCursor(p) + 5)
    BBG.MakeTitle("Timer Text", p, { atlas = "icon-clock", sizeX = 18, sizeY = 18, offsetX = -1 })
    local function ColorItem(key, label)
        return {
            label    = label,
            getColor = function() return DB()[key] end,
            setColor = function(r, g, b)
                DB()[key] = { r, g, b, 1 }
                CC.RefreshLossOfControl()
            end,
        }
    end
    local tweaksGroup = BBG.MakeSubTitleGroup("Tweaks", p)
    BBG.MakeCheckbox(Option("lossOfControlCountdown", "Show Countdown Numbers", "Show the time left as numbers on the icon."), p)
    BBG.MakeCheckbox(Option("lossOfControlTimerMilliseconds", "Show Decimals", "Show decimals once the Low Color starts."), p)
    BBG.MakeCheckbox(Option("lossOfControlHideTimer", "Hide Timer Text", "Hide the timer next to the CC text."), p)
    BBG.MakeCheckbox(Option("lossOfControlHideName", "Hide CC Text", "Hide the CC name next to the timer."), p)
    BBG.MakeFontDropdown(FontOption("lossOfControlFont", "Text Font"), p)
    BBG.MakeFontDropdown(FontOption("lossOfControlNumberFont", "CD Timer Text Font"), p)
    BBG.FinaliseSubTitleGroup(tweaksGroup)

    local colorsGroup = BBG.MakeSubTitleGroup("Colors", p)
    BBG.MakeColorSlider({ color = ColorItem("lossOfControlTimerLowColor", "Low Color"),
        min = 0.5, max = 20, step = 0.1, fmt = "%.1f",
        default = CC.defaultSettings.lossOfControlTimerLowThreshold,
        get = function() return DB().lossOfControlTimerLowThreshold or 3 end,
        set = function(v) DB().lossOfControlTimerLowThreshold = v; RefreshAndTest() end }, p)
    BBG.MakeColorSlider({ color = ColorItem("lossOfControlTimerBaseColor", "Medium Color"),
        min = 1, max = 60, step = 0.1, fmt = "%.1f",
        default = CC.defaultSettings.lossOfControlTimerHighThreshold,
        get = function() return DB().lossOfControlTimerHighThreshold or 10 end,
        set = function(v) DB().lossOfControlTimerHighThreshold = v; RefreshAndTest() end }, p)
    BBG.MakeColorSlider({ color = ColorItem("lossOfControlTimerHighColor", "High Color") }, p)
    BBG.FinaliseSubTitleGroup(colorsGroup)

    local sizesGroup = BBG.MakeSubTitleGroup("Sizes", p)
    BBG.MakeSlider({ label = "CC Text Scale", min = 0.5, max = 3, step = 0.05, fmt = "%.2f",
        default = CC.defaultSettings.lossOfControlTextScale,
        get = function() return DB().lossOfControlTextScale or 1 end,
        set = function(v) DB().lossOfControlTextScale = v; RefreshAndTest() end }, p)
    BBG.MakeSlider({ label = "Timer Text Size", min = 0.5, max = 3, step = 0.05, fmt = "%.2f",
        default = CC.defaultSettings.lossOfControlTimerScale,
        get = function() return DB().lossOfControlTimerScale or 1 end,
        set = function(v) DB().lossOfControlTimerScale = v; RefreshAndTest() end }, p)
    BBG.MakeSlider({ label = "CD Timer Text Size", min = 0.5, max = 3, step = 0.05, fmt = "%.2f",
        default = CC.defaultSettings.lossOfControlCountdownScale,
        get = function() return DB().lossOfControlCountdownScale or 1 end,
        set = function(v) DB().lossOfControlCountdownScale = v; RefreshAndTest() end }, p)
    BBG.FinaliseSubTitleGroup(sizesGroup)

    BBG.AddRefresher(p, function()
        SyncTextPosition()
        secondIconScale:SetShown(DB().lossOfControlShowSecondIcon ~= false)
    end)

    BBG.UpdateScrollHeight(p)
    CC.settingsPanel = p
    function CC.LoCPositionChanged()
        BBG.RefreshPanel(p)
    end

    local movedSettings
    p:HookScript("OnShow", function()
        if movedSettings then return end
        movedSettings = true
        if C_AddOns.IsAddOnLoaded("BlizzMove") or C_AddOns.IsAddOnLoaded("MoveAny") then return end
        if BetterBlizzFramesDB and BetterBlizzFramesDB.dontMoveSettingsPanel then return end
        local frame = SettingsPanel
        if frame and not frame:GetScript("OnDragStart") then
            frame:RegisterForDrag("LeftButton")
            frame:SetScript("OnDragStart", frame.StartMoving)
            frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
        end
    end)

    CC.CreateProfilesPanel(p)

    SLASH_BBCC1 = "/bbcc"
    SlashCmdList["BBCC"] = function()
        BBG.OpenPanel(p)
    end
end

local function MakeProfilePopups(refresh)
    local popups = {}

    local function NameDialog(key, text, button, onAccept)
        return function(data)
            BBG.ShowPopup({
                key     = key,
                text    = text,
                data    = data,
                editBox = { text = data and data.suggested or "", maxLetters = 40 },
                buttons = {
                    {
                        text    = button,
                        onClick = function(popup, popupData)
                            local name, reason = onAccept(popup:GetEditBoxText(), popupData)
                            if not name then
                                CC.Print(reason or "Could not create that profile.")
                                return
                            end
                            refresh()
                        end,
                    },
                    { text = CANCEL },
                },
            })
        end
    end

    popups.New = NameDialog("BBCC_NEW_PROFILE", "Name for the new profile:", "Create",
        function(text, data) return CC.CreateProfile(text, data and data.copyFrom) end)
    popups.Rename = NameDialog("BBCC_RENAME_PROFILE", "Rename this profile to:", "Rename",
        function(text, data) return CC.RenameProfile(data.old, text) end)
    popups.Import = NameDialog("BBCC_IMPORT_PROFILE", "Import this profile as:", "Import",
        function(text, data)
            local name = CC.NormalizeProfileName(text)
            if name and CC.ProfileExists(name) then
                CC.Print(string.format("Overwriting profile \"%s\".", name))
            end
            return CC.ImportProfile(data.payload, text)
        end)

    local function Confirm(key, text, button, action)
        return function(data)
            BBG.ShowPopup({
                key     = key,
                text    = string.format(text, data.name),
                alert   = true,
                data    = data,
                buttons = {
                    {
                        text    = button,
                        onClick = function(_, popupData)
                            local ok, reason = action(popupData.name)
                            if not ok then CC.Print(reason) end
                            refresh()
                        end,
                    },
                    { text = CANCEL },
                },
            })
        end
    end

    popups.Delete = Confirm("BBCC_DELETE_PROFILE", "Delete the profile \"%s\"? This cannot be undone.", DELETE, CC.DeleteProfile)
    popups.Reset = Confirm("BBCC_RESET_PROFILE", "Reset the profile \"%s\" back to defaults?", RESET, CC.ResetProfile)

    return popups
end

function CC.CreateProfilesPanel(main)
    local p = BBG.CreateSubPanel(main._category, "BetterBlizzCC_Profiles", "Profiles", 620, 480)
    local exportBox, importBox

    local function RefreshAll()
        BBG.RefreshPanel(main)
        BBG.RefreshPanel(p)
    end

    local popups = MakeProfilePopups(RefreshAll)

    BBG.MakePanelHeader({
        title       = CC.PanelTitle(),
    }, p)

    BBG.MakeTitle("Profiles", p, { atlas = "GM-icon-assistActive", sizeX = 26, sizeY = 26, offsetX = 2, offsetY = 1 })

    local options = {}
    local function RebuildOptions()
        wipe(options)
        for i, name in ipairs(CC.GetProfileNames()) do
            options[i] = { label = name, value = name }
        end
    end
    RebuildOptions()
    table.insert(p._refreshers, 1, RebuildOptions)

    BBG.MakeDropdown({
        label   = "Active Profile",
        options = options,
        get     = CC.GetActiveProfile,
        set     = function(v)
            CC.SetProfile(v)
            RefreshAll()
        end,
    }, p)

    local function NotDefault()
        return CC.GetActiveProfile() ~= CC.DEFAULT_PROFILE
    end

    BBG.MakeButtonRow({
        {
            label = "New",
            func  = function() popups.New({ suggested = "" }) end,
            desc  = "Create a new profile",
        },
        {
            label = "Copy",
            func  = function()
                local active = CC.GetActiveProfile()
                popups.New({ suggested = active .. " Copy", copyFrom = active })
            end,
            desc  = "Copy the active profile into a new one",
        },
        {
            label   = "Rename",
            func    = function()
                local active = CC.GetActiveProfile()
                popups.Rename({ suggested = active, old = active })
            end,
            desc    = "Rename the active profile",
            enabled = NotDefault,
        },
        {
            label   = "Delete",
            func    = function() popups.Delete({ name = CC.GetActiveProfile() }) end,
            desc    = "Delete the active profile",
            enabled = NotDefault,
        },
        {
            label = "Reset",
            func  = function() popups.Reset({ name = CC.GetActiveProfile() }) end,
            desc  = "Reset the active profile to defaults",
        },
    }, p, { xOffset = -3, yOffset = -7 })

    BBG.MakeTitle("Share", p, { atlas = "GM-icon-headCount", sizeX = 17, sizeY = 17, offsetX = -2, offsetY = 1 })
    exportBox = BBG.MakeTextArea({
        label       = "Export, then copy the string with Ctrl+C",
        height      = 66,
        readOnly    = true,
        buttonLabel = "Export",
        buttonFunc  = function(handle)
            local str, reason = CC.ExportProfile(CC.GetActiveProfile())
            if not str then
                CC.Print(reason)
                return
            end
            handle:SetText(str)
            handle:SelectAll()
        end,
    }, p)
    importBox = BBG.MakeTextArea({
        label       = "Import: paste a profile string with Ctrl+V",
        height      = 66,
        labelGap    = 9,
        boxGap      = 12,
        buttonLabel = "Import",
        buttonFunc  = function(handle)
            local payload, reason = CC.DecodeProfileString(handle:GetText())
            if not payload then
                CC.Print(reason)
                return
            end
            popups.Import({ suggested = payload.name or "Imported", payload = payload })
        end,
    }, p)

    local lastProfile = CC.GetActiveProfile()
    table.insert(p._refreshers, function()
        if CC.GetActiveProfile() ~= lastProfile then
            lastProfile = CC.GetActiveProfile()
            exportBox:Clear()
            importBox:Clear()
        end
    end)

    BBG.UpdateScrollHeight(p)
end
