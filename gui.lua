local AddonName, BetterBlizzCC = ...
local CC = BetterBlizzCC

local function UpdateLoCFrame()
    local frame = BBLossOfControlFrame
    local pFrame = BBLossOfControlParentFrame
    frame:SetPoint("CENTER", UIParent, "CENTER", BetterBlizzCCDB.xPos or 0, BetterBlizzCCDB.yPos or 0)

    pFrame:SetScale(BetterBlizzCCDB.lossOfControlScale or 1)

    local iconOnlyMode = BetterBlizzCCDB.lossOfControlIconOnly
    frame.RedLineTop:SetSize(iconOnlyMode and 70 or 236, 27)
    frame.RedLineBottom:SetSize(iconOnlyMode and 70 or 236, 27)
    frame.Icon:SetPoint("CENTER", frame, "CENTER", iconOnlyMode and 0 or -70, 0)
    frame.AbilityName:SetShown(not iconOnlyMode)
    frame.TimeLeft:SetShown(not iconOnlyMode)

    local showCooldown = not iconOnlyMode or BetterBlizzCCDB.showCooldownOnLoC
    frame.Icon.Cooldown:SetDrawEdge(showCooldown)
    frame.Icon.Cooldown:SetDrawSwipe(showCooldown)

    frame.Icon.Cooldown:SetShown(BetterBlizzCCDB.showCooldownOnLoC or iconOnlyMode)
    frame.RedLineTop:SetShown(not BetterBlizzCCDB.hideLossOfControlFrameLines)
    frame.RedLineBottom:SetShown(not BetterBlizzCCDB.hideLossOfControlFrameLines)
    frame.blackBg:SetShown(not BetterBlizzCCDB.hideLossOfControlFrameBg)

    --Og
    if not LossOfControlFrame then return end
    LossOfControlFrame:SetScale(BetterBlizzCCDB.lossOfControlScale or 1)
    if InCombatLockdown() then return end
    LossOfControlFrame:ClearAllPoints()
    LossOfControlFrame:SetPoint("CENTER", UIParent, "CENTER", BetterBlizzCCDB.xPos or 0, BetterBlizzCCDB.yPos or 0)
end

local testTicker

function ToggleLossOfControlTestMode()
    local frame = BBLossOfControlFrame
    if not frame then return end

    UpdateLoCFrame()

    if testTicker then
        testTicker:Cancel()
        testTicker = nil
    end

    frame.returnEarly = true
    BBLossOfControlParentFrame:SetParent(UIParent)

    local now = GetTime()
    local duration = 8

    frame.mainCC = {
        icon = 136071,
        type = "Polymorphed",
        duration = duration,
        expiration = now + duration,
        spellID = 408,
    }
    frame.secondaryCC = nil
    frame.lockedBy = 408
    frame.expiration = now + duration
    frame.duration = duration

    frame.Icon:SetTexture(136071)
    if frame.Icon.Cooldown then
        frame.Icon.Cooldown:SetCooldown(now, duration)
    end

    frame.AbilityName:SetText("Polymorphed")
    frame.AbilityName:SetTextColor(1, 0.819, 0)
    frame.Icon.SchoolText:SetText("")
    frame.SecondaryIcon:Hide()
    frame.SecondaryIcon.SchoolText:SetText("")

    frame:SetAlpha(0)
    frame:SetScale(0.85)
    frame:Show()
    frame.fadeInScale:Stop()
    frame.fadeInScale:Play()

    frame.TimeLeft.NumberText:SetText(string.format("%.1f seconds", duration))
    testTicker = C_Timer.NewTicker(0.1, function()
        local remaining = frame.expiration and (frame.expiration - GetTime()) or 0
        if remaining > 0 then
            frame.TimeLeft.NumberText:SetText(string.format("%.1f seconds", remaining))
        else
            frame.returnEarly = false

            frame.TimeLeft.NumberText:SetText("")
            frame.fadeOutShrink:Stop()
            frame.fadeOutShrink:Play()

            if testTicker then
                testTicker:Cancel()
                testTicker = nil
            end
        end
    end)

    UpdateLoCFrame()
end

local function CreateTooltip(frame, title, description)
    frame:HookScript("OnEnter", function()
        GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
        GameTooltip:AddLine(title)
        if description then
            GameTooltip:AddLine(description, 1, 1, 1, true)
        end
        GameTooltip:Show()
    end)
    frame:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

local function CreateSlider(parent, label, minValue, maxValue, stepValue, element, axis)
    local slider = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
    slider:SetOrientation('HORIZONTAL')
    slider:SetMinMaxValues(minValue, maxValue)
    slider:SetValueStep(stepValue)
    slider:SetObeyStepOnDrag(true)

    slider.Low:SetText(" ")
    slider.High:SetText(" ")

    local title = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    title:SetTextColor(1, 0.81, 0, 1)
    title:SetText(label)

    local editBox = CreateFrame("EditBox", nil, slider)
    editBox:SetAutoFocus(false)
    editBox:SetSize(37, 12)
    editBox:SetFontObject(GameFontHighlightSmall)
    editBox:SetJustifyH("CENTER")
    editBox:SetTextInsets(2, 2, 1, 1)
    editBox.bg = editBox:CreateTexture(nil, "BACKGROUND")
    editBox.bg:SetAllPoints()
    editBox.bg:SetColorTexture(0, 0, 0, 0.4)
    editBox.border = CreateFrame("Frame", nil, editBox, "BackdropTemplate")
    editBox.border:SetPoint("TOPLEFT", -1, 1)
    editBox.border:SetPoint("BOTTOMRIGHT", 1, -1)
    editBox.border:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1,
    })
    editBox.border:SetBackdropBorderColor(1, 1, 1, 0.6)
    title:SetPoint("BOTTOMRIGHT", slider, "TOP", -4, 2)
    editBox:SetPoint("LEFT", title, "RIGHT", 6, 0)

    local function RoundTwoDecimals(value)
        return tonumber(string.format("%.2f", value))
    end

    local function UpdateSlider(value)
        value = tonumber(value)
        if not value then
            editBox:SetText(string.format("%.2f", slider:GetValue()))
            return
        end

        if not axis and value <= 0 then
            value = 0.1
        end

        local min, max = slider:GetMinMaxValues()

        -- Expand range if needed
        if value < min or value > max then
            min = math.min(min, value)
            max = math.max(max, value)
            slider:SetMinMaxValues(min, max)
        end

        value = RoundTwoDecimals(value)
        BetterBlizzCCDB[element] = value
        slider:SetValue(value)
        editBox:SetText(value)
    end

    local dbValue = tonumber(BetterBlizzCCDB[element])
    local initialValue = RoundTwoDecimals(dbValue or (axis and 0 or 1))
    slider:SetValue(initialValue)

    local testModeCooldown = false
    slider:SetScript("OnValueChanged", function(self, value)
        value = RoundTwoDecimals(value)
        BetterBlizzCCDB[element] = value
        editBox:SetText(value)

        if not testModeCooldown then
            testModeCooldown = true
            ToggleLossOfControlTestMode()
            C_Timer.After(0.28, function()
                testModeCooldown = false
            end)
        end
    end)
    slider:SetScript("OnMouseUp", function()
        ToggleLossOfControlTestMode()
    end)
    slider:SetScript("OnMouseDown", function()
        ToggleLossOfControlTestMode()
    end)

    editBox:SetScript("OnEnterPressed", function(self)
        UpdateSlider(self:GetText())
        self:ClearFocus()
    end)
    editBox:SetScript("OnEscapePressed", function(self)
        self:SetText(string.format("%.1f", slider:GetValue()))
        self:ClearFocus()
    end)
    editBox:SetScript("OnShow", function(self)
        local dbValue = tonumber(BetterBlizzCCDB[element])
        local initialValue = RoundTwoDecimals(dbValue or (axis and 0 or 1))
        self:SetText("")
        self:SetText(tostring(initialValue))
    end)

    return slider
end


local function CreateCheckbox(option, label, parent)
    local checkBox = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    checkBox.Text:SetText(label)
    checkBox.text = checkBox.Text
    checkBox:SetSize(23, 23)
    checkBox:SetChecked(BetterBlizzCCDB[option])
    checkBox:HookScript("OnClick", function(self)
        BetterBlizzCCDB[option] = self:GetChecked()
        ToggleLossOfControlTestMode()
    end)
    return checkBox
end

function CC:CreateGUI()
    local optionsPanel = CreateFrame("Frame")
    optionsPanel.name = "Better|cff00c0ffBlizz|rCC |A:gmchat-icon-blizz:16:16|a"
    local category = Settings.RegisterCanvasLayoutCategory(optionsPanel, optionsPanel.name, optionsPanel.name)
    category.ID = optionsPanel.name
    Settings.RegisterAddOnCategory(category)

    local currentVersion = C_AddOns.GetAddOnMetadata("BetterBlizzCC", "Version")
    local addonNameText = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    addonNameText:SetPoint("TOPLEFT", -5.5, 32)
    addonNameText:SetText("BetterBlizzCC")
    local addonNameIcon = optionsPanel:CreateTexture(nil, "ARTWORK")
    addonNameIcon:SetAtlas("gmchat-icon-blizz")
    addonNameIcon:SetSize(22, 22)
    addonNameIcon:SetPoint("LEFT", addonNameText, "RIGHT", -2, -1)
    local verNumber = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    verNumber:SetPoint("LEFT", addonNameText, "RIGHT", 25, 0)
    verNumber:SetText("v" .. currentVersion)

    SLASH_BBCC1 = "/BBCC"
    SlashCmdList["BBCC"] = function()
        Settings.OpenToCategory(category.ID)
    end

    local lossOfControlIconOnly = CreateCheckbox("lossOfControlIconOnly", "Icon Only Mode", optionsPanel)
    lossOfControlIconOnly:SetPoint("TOPLEFT", addonNameText, "BOTTOMLEFT", 0, -20)
    CreateTooltip(lossOfControlIconOnly, "Icon Only Mode", "Hide the ability name and duration text.")

    local showCooldownOnLoC = CreateCheckbox("showCooldownOnLoC", "Show Cooldown Spiral", optionsPanel)
    showCooldownOnLoC:SetPoint("TOPLEFT", lossOfControlIconOnly, "BOTTOMLEFT", 0, 3)
    CreateTooltip(showCooldownOnLoC, "Show Cooldown Spiral", "Show cooldown spiral on the main CC icon on Loss of Control.")

    local hideLossOfControlFrameBg = CreateCheckbox("hideLossOfControlFrameBg", "Hide CC Background", optionsPanel)
    hideLossOfControlFrameBg:SetPoint("TOPLEFT", showCooldownOnLoC, "BOTTOMLEFT", 0, 3)
    CreateTooltip(hideLossOfControlFrameBg, "Hide CC Background", "Hide the dark background on the Loss of Control frame (displaying CC on you)")
    hideLossOfControlFrameBg:HookScript("OnClick", ToggleLossOfControlTestMode)

    local hideLossOfControlFrameLines = CreateCheckbox("hideLossOfControlFrameLines", "Hide CC Red Lines", optionsPanel)
    hideLossOfControlFrameLines:SetPoint("TOPLEFT", hideLossOfControlFrameBg, "BOTTOMLEFT", 0, 3)
    CreateTooltip(hideLossOfControlFrameLines, "Hide CC Red Lines", "Hide the red lines on top and bottom of the Loss of Control frame (displaying CC on you)")
    hideLossOfControlFrameLines:HookScript("OnClick", ToggleLossOfControlTestMode)

    local lossOfControlInterruptsOnly = CreateCheckbox("lossOfControlInterruptsOnly", "Interrupts Only", optionsPanel)
    lossOfControlInterruptsOnly:SetPoint("TOPLEFT", hideLossOfControlFrameLines, "BOTTOMLEFT", 0, 3)
    CreateTooltip(lossOfControlInterruptsOnly, "Interrupts Only", "Show for Interrupts only")
    lossOfControlInterruptsOnly:HookScript("OnClick", function()
        if CC.RegisterEvent then
            CC:RegisterEvent()
        end
    end)

    local lossOfControlScale = CreateSlider(optionsPanel, "Scale", 0.4, 1.5, 0.01, "lossOfControlScale")
    lossOfControlScale:SetPoint("LEFT", lossOfControlIconOnly.text, "RIGHT", 45, -6)
    CreateTooltip(lossOfControlScale, "Loss of Control Scale", "Adjust the scale of the CC Frame.")

    local xPos = CreateSlider(optionsPanel, "xPos", -400, 400, 1, "xPos", true)
    xPos:SetPoint("TOP", lossOfControlScale, "BOTTOM", 0, -20)
    CreateTooltip(xPos, "Horizontal Position", "Adjust the horizontal position of the CC Frame.")

    local yPos = CreateSlider(optionsPanel, "yPos", -400, 400, 1, "yPos", true)
    yPos:SetPoint("TOP", xPos, "BOTTOM", 0, -20)
    CreateTooltip(yPos, "Vertical Position", "Adjust the vertical position of the CC Frame.")
end