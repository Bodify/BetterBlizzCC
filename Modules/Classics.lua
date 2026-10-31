local addonName, CC = ...

local interruptSpells = CC.LoCInterrupts or {}

-- Buffs that reduce interrupt duration
local spellLockReducer = {
    --[317920] = 0.7, -- Concentration Aura
    --[234084] = 0.5, -- Moon and Stars
    --[383020] = 0.5, -- Tranquil Air
}

-- Items with equip: reduces silence/interrupt duration (Data/Spells, TBC only)
local silenceReductionItems = CC.LoCSilenceReductionItems

local silenceReduction = 1

local function UpdateSilenceReduction()
    local headItem = GetInventoryItemID("player", 1) -- slot 1 = head
    local neckItem = GetInventoryItemID("player", 2) -- slot 2 = neck
    -- Does not stack; apply once if either slot has a matching item
    silenceReduction = (headItem and silenceReductionItems[headItem]) or (neckItem and silenceReductionItems[neckItem]) or 1
end

local interruptEvents = {
    ["SPELL_INTERRUPT"] = true,
    ["SPELL_CAST_SUCCESS"] = true,
    ["SPELL_AURA_APPLIED"] = true, -- For Deadly Throw
}

local spellList = CC.LoCSpells or {}

local hardCCSet = {
    ["Stunned"] = true,
    ["Feared"] = true,
    ["Horrified"] = true,
    ["Cycloned"] = true,
    ["Incapacitated"] = true,
    ["Mind Controlled"] = true,
    ["Disoriented"] = true,
    ["Polymorphed"] = true,
    ["Hexed"] = true,
    ["Frozen"] = true,
    ["Blinded"] = true,
    ["Seduced"] = true,
    ["Asleep"] = true,
    ["Shackled"] = true,
    ["Gouged"] = true,
    ["Sapped"] = true,
}

local function isHardCC(type)
    return hardCCSet[type]
end

local function SetupLoCFrame()
    if BBLossOfControlFrame or not CC.DB().enableLoCFrame or CC.LoC.Supported() then return end

    local f = CreateFrame("Frame")

    local parentFrame = CreateFrame("Frame", "BBLossOfControlParentFrame", UIParent)

    local iconOnlyMode = CC.DB().lossOfControlIconOnly

    local frame = CreateFrame("Frame", "BBLossOfControlFrame", parentFrame, "BackdropTemplate")
    frame:SetSize(256, 58)
    frame:SetFrameStrata("MEDIUM")
    frame:SetToplevel(true)
    frame:Hide()

    frame.fadeInScale = frame:CreateAnimationGroup()

    frame.fadeIn = frame.fadeInScale:CreateAnimation("Alpha")
    frame.fadeIn:SetFromAlpha(0)
    frame.fadeIn:SetToAlpha(1)
    frame.fadeIn:SetDuration(0.10)
    frame.fadeIn:SetOrder(1)
    frame.fadeIn:SetSmoothing("OUT")

    frame.scaleOvershoot = frame.fadeInScale:CreateAnimation("Scale")
    frame.scaleOvershoot:SetScaleFrom(0.85, 0.85)
    frame.scaleOvershoot:SetScaleTo(1.1, 1.1)
    frame.scaleOvershoot:SetDuration(0.08)
    frame.scaleOvershoot:SetOrder(1)
    frame.scaleOvershoot:SetSmoothing("OUT")

    frame.scaleSettle = frame.fadeInScale:CreateAnimation("Scale")
    frame.scaleSettle:SetScaleFrom(1.1, 1.1)
    frame.scaleSettle:SetScaleTo(1, 1)
    frame.scaleSettle:SetDuration(0.07)
    frame.scaleSettle:SetOrder(2)
    frame.scaleSettle:SetSmoothing("IN")

    frame.fadeInScale:SetToFinalAlpha(true)

    frame.fadeOutShrink = frame:CreateAnimationGroup()

    frame.fadeOut = frame.fadeOutShrink:CreateAnimation("Alpha")
    frame.fadeOut:SetFromAlpha(1)
    frame.fadeOut:SetToAlpha(0)
    frame.fadeOut:SetDuration(0.07)
    frame.fadeOut:SetOrder(1)
    frame.fadeOut:SetSmoothing("IN")

    frame.scaleDown = frame.fadeOutShrink:CreateAnimation("Scale")
    frame.scaleDown:SetScaleFrom(1, 1)
    frame.scaleDown:SetScaleTo(0.85, 0.85)
    frame.scaleDown:SetDuration(0.07)
    frame.scaleDown:SetOrder(1)
    frame.scaleDown:SetSmoothing("IN")

    frame.fadeOutShrink:SetToFinalAlpha(false)

    frame.fadeOutShrink:SetScript("OnFinished", function()
        frame:Hide()
        frame:SetAlpha(1)
        frame:SetScale(1)
        frame.duration = nil
        frame.expiration = nil
        frame.lockedBy = nil
        frame.returnEarly = nil
    end)

    frame.RedLineTop = frame:CreateTexture(nil, "BACKGROUND")
    frame.RedLineTop:SetTexture("Interface\\Cooldown\\Loc-RedLine")
    frame.RedLineTop:SetSize(iconOnlyMode and 70 or 236, 27)
    frame.RedLineTop:SetPoint("BOTTOM", frame, "TOP")

    frame.RedLineBottom = frame:CreateTexture(nil, "BACKGROUND")
    frame.RedLineBottom:SetTexture("Interface\\Cooldown\\Loc-RedLine")
    frame.RedLineBottom:SetSize(iconOnlyMode and 70 or 236, 27)
    frame.RedLineBottom:SetPoint("TOP", frame, "BOTTOM")
    frame.RedLineBottom:SetTexCoord(0, 1, 1, 0)

    frame.blackBg = frame:CreateTexture(nil, "BACKGROUND")
    frame.blackBg:SetTexture("Interface\\Cooldown\\loc-shadowbg")
    frame.blackBg:SetPoint("TOPLEFT", frame.RedLineTop, "BOTTOMLEFT")
    frame.blackBg:SetPoint("BOTTOMRIGHT", frame.RedLineBottom, "TOPRIGHT")

    frame.Icon = frame:CreateTexture(nil, "ARTWORK")
    frame.Icon:SetSize(48, 48)
    frame.Icon:SetPoint("CENTER", frame, "CENTER", iconOnlyMode and 0 or -70, 0)

    frame.Icon.Cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
    frame.Icon.Cooldown:SetAllPoints(frame.Icon)

    frame.SecondaryIcon = CreateFrame("Frame", nil, frame)
    frame.SecondaryIcon:SetSize(48, 48)
    frame.SecondaryIcon:SetPoint("RIGHT", frame.Icon, "LEFT", -4, 0)

    frame.SecondaryIcon.Cooldown = CreateFrame("Cooldown", nil, frame.SecondaryIcon, "CooldownFrameTemplate")
    frame.SecondaryIcon.Cooldown:SetAllPoints(frame.SecondaryIcon)

    local cooldownSwipe = frame.SecondaryIcon:GetRegions()
    if cooldownSwipe then
        cooldownSwipe:SetAllPoints(frame.SecondaryIcon)
    end

    frame.SecondaryIcon.icon = frame.SecondaryIcon:CreateTexture(nil, "ARTWORK")
    frame.SecondaryIcon.icon:SetAllPoints()
    frame.SecondaryIcon.icon:SetTexture(nil)

    frame.Icon.SchoolText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.Icon.SchoolText:SetPoint("BOTTOM", frame.Icon, "BOTTOM", 0, 1)
    frame.Icon.SchoolText:SetJustifyH("CENTER")
    frame.Icon.SchoolText:SetTextColor(1, 1, 1)
    frame.Icon.SchoolText:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")

    frame.SecondaryIcon.SchoolText = frame.SecondaryIcon:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.SecondaryIcon.SchoolText:SetPoint("BOTTOM", frame.SecondaryIcon, "BOTTOM", 0, 1)
    frame.SecondaryIcon.SchoolText:SetJustifyH("CENTER")
    frame.SecondaryIcon.SchoolText:SetTextColor(1, 1, 1)
    frame.SecondaryIcon.SchoolText:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
    frame.SecondaryIcon.SchoolText:SetDrawLayer("OVERLAY", 7) -- ensures it's above cooldown

    frame.AbilityName = frame:CreateFontString(nil, "ARTWORK", "MovieSubtitleFont")
    frame.AbilityName:SetPoint("TOPLEFT", frame.Icon, "TOPRIGHT", 5, -4)
    frame.AbilityName:SetSize(0, 20)

    frame.TimeLeft = CreateFrame("Frame", nil, frame)
    frame.TimeLeft:SetSize(200, 20)
    frame.TimeLeft:SetPoint("TOPLEFT", frame.AbilityName, "BOTTOMLEFT")

    frame.TimeLeft.NumberText = frame.TimeLeft:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    frame.TimeLeft.NumberText:SetPoint("LEFT", frame.TimeLeft, "LEFT", 0, -3)
    frame.TimeLeft.NumberText:SetShadowOffset(2, -2)
    frame.TimeLeft.NumberText:SetTextColor(1, 1, 1)

    CC.LoC.ApplyOwnLayout(frame)

    local function GetSchoolInfo(school)
        local schoolNames = {
            -- Single schools
            [1]   = {"Physical",     0.85, 0.65, 0.45},
            [2]   = {"Holy",         1.00, 0.95, 0.60},
            [4]   = {"Fire",         1.00, 0.35, 0.10},
            [8]   = {"Nature",       0.30, 0.85, 0.30},
            [16]  = {"Frost",        0.45, 0.70, 1.00},
            [32]  = {"Shadow",       0.50, 0.25, 0.75},
            [64]  = {"Arcane",       0.80, 0.60, 1.00},

            -- Dual/multi schools
            [3]   = {"Holystrike",   1.00, 0.85, 0.50}, -- Holy + Physical
            [5]   = {"Flamestrike",  1.00, 0.45, 0.10}, -- Fire + Physical
            [6]   = {"Holyfire",     1.00, 0.65, 0.30}, -- Holy + Fire
            [9]   = {"Stormstrike",  0.40, 0.80, 1.00}, -- Nature + Physical
            [10]  = {"Holystorm",    0.90, 0.90, 0.60}, -- Holy + Nature
            [12]  = {"Firestorm",    1.00, 0.55, 0.10}, -- Fire + Nature
            [17]  = {"Froststrike",  0.50, 0.75, 1.00}, -- Frost + Physical
            [18]  = {"Holyfrost",    0.80, 0.90, 1.00}, -- Holy + Frost
            [20]  = {"Frostfire",    0.80, 0.45, 1.00}, -- Fire + Frost
            [24]  = {"Froststorm",   0.50, 0.80, 1.00}, -- Frost + Nature
            [28]  = {"Spellfrost",   0.60, 0.70, 1.00}, -- Arcane + Frost
            [33]  = {"Shadowstrike", 0.65, 0.25, 0.60}, -- Shadow + Physical
            [34]  = {"Twilight",     0.70, 0.40, 0.85}, -- Shadow + Holy
            [36]  = {"Shadowflame",  0.80, 0.30, 0.60}, -- Shadow + Fire
            [40]  = {"Shadowstorm",  0.50, 0.30, 0.85}, -- Shadow + Nature
            [48]  = {"Shadowfrost",  0.55, 0.40, 0.85}, -- Shadow + Frost
            [65]  = {"Spellstrike",  0.90, 0.60, 1.00}, -- Arcane + Physical
            [66]  = {"Divine",       1.00, 0.85, 0.55}, -- Holy + Arcane
            [96]  = {"Spellshadow",  0.75, 0.45, 0.85}, -- Arcane + Shadow
            [124] = {"Elemental",    0.95, 0.60, 0.20}, -- Fire + Frost + Nature
            [126] = {"Chromatic",    0.95, 0.95, 1.00}, -- All elemental schools
            [127] = {"Magic",        0.90, 0.90, 1.00}, -- Generic catch-all magic

            -- Extra
            [200] = {"Astral",       0.50, 0.85, 1.00}, -- Arcane + Nature
            [201] = {"Chaos",        1.00, 0.15, 0.15}, -- All schools incl. Physical
            [202] = {"Chimeric",     0.95, 0.55, 0.85}, -- Arcane + Fire + Frost
            [203] = {"Cosmic",       0.80, 0.80, 1.00}, -- Arcane + Holy + Nature + Shadow
            [204] = {"Radiant",      1.00, 0.70, 0.40}, -- Fire + Holy
            [205] = {"Volcanic",     1.00, 0.40, 0.20}, -- Fire + Nature
            [206] = {"Plague",       0.55, 0.80, 0.40}, -- Shadow + Nature
        }

        return unpack(schoolNames[school] or {"Interrupted", 1, 1, 1})
    end

    local function checkAuras()
        local mainHardCC, secondHardCC, silence, disarm, root
        local interrupt = frame.interruptData
        local now = GetTime()

        if CC.DB().lossOfControlInterruptsOnly then
            local main = interrupt
            local secondary = nil

            if main and main.expiration <= now then
                frame.interruptData = nil
                main = nil
            end

            frame.mainCC = main
            frame.secondaryCC = secondary

            if main then
                if frame.fadeOutShrink:IsPlaying() then
                    frame.fadeOutShrink:Stop()
                end

                frame.Icon:SetTexture(main.icon)
                if frame.Icon.Cooldown then
                    frame.Icon.Cooldown:SetCooldown(main.expiration - main.duration, main.duration)
                end

                local name, r, g, b = GetSchoolInfo(main.school)
                frame.AbilityName:SetText("Interrupted")
                frame.AbilityName:SetTextColor(r, g, b)

                frame.duration = main.duration
                frame.expiration = main.expiration
                frame.lockedBy = main.spellID

                if not frame:IsShown() then
                    frame:SetAlpha(0)
                    frame:SetScale(0.85)
                    frame:Show()
                    frame.fadeInScale:Stop()
                    frame.fadeInScale:Play()
                end

                frame.Icon.SchoolText:SetText(name)
                frame.Icon.SchoolText:SetTextColor(r, g, b)

                frame.SecondaryIcon:Hide()
                frame.SecondaryIcon.SchoolText:SetText("")
            else
                if not frame.fadeOutShrink:IsPlaying() then
                    frame.fadeOutShrink:Stop()
                    frame.fadeOutShrink:Play()
                end
                frame.Icon.SchoolText:SetText("")
            end

            return
        end

        local function getAuraData()
            for i = 1, 40 do
                local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HARMFUL")
                if not aura then break end

                local spellID = aura.spellId
                local ccType = spellList[spellID]
                local remaining = aura.expirationTime and (aura.expirationTime - now) or 0
                local duration = aura.duration or 0

                if ccType == "Silenced" and duration == 0 then
                    frame.silenceFallbacks = frame.silenceFallbacks or {}

                    local fallback = frame.silenceFallbacks[spellID]
                    if not fallback or fallback.expirationTime <= now then
                        local solarBeamDuration = 8.1  -- Only Solar Beam afaik. Leeway of 0.1
                        fallback = {
                            startTime = now,
                            duration = solarBeamDuration,
                            expirationTime = now + solarBeamDuration,
                        }
                        frame.silenceFallbacks[spellID] = fallback
                    end

                    duration = fallback.duration
                    aura.expirationTime = fallback.expirationTime
                    remaining = fallback.expirationTime - now
                end


                if remaining > 0 then
                    local auraData = {
                        icon = aura.icon,
                        type = ccType,
                        duration = duration,
                        expiration = aura.expirationTime,
                        remaining = remaining,
                        spellID = spellID
                    }

                    if isHardCC(ccType) then
                        if ccType == "Stunned" or ccType == "Horrified" then
                            -- Always prefer stuns and horrify as primary
                            local isSameType = (mainHardCC and mainHardCC.type == ccType)
                            if not mainHardCC or not isSameType or remaining > mainHardCC.remaining then
                                if mainHardCC and not (mainHardCC.type == "Stunned" or mainHardCC.type == "Horrified") then
                                    secondHardCC = mainHardCC
                                end
                                mainHardCC = auraData
                            end
                        elseif not mainHardCC then
                            mainHardCC = auraData
                        elseif auraData.spellID ~= mainHardCC.spellID then
                            if not secondHardCC or auraData.remaining > secondHardCC.remaining then
                                secondHardCC = auraData
                            end
                        end
                    elseif ccType == "Silenced" or ccType == "Silenced+" then
                        if not silence or remaining > silence.remaining then
                            silence = auraData
                        end
                    elseif ccType == "Disarmed" then
                        if not disarm or remaining > disarm.remaining then
                            disarm = auraData
                        end
                    elseif ccType == "Rooted" then
                        if not root or remaining > root.remaining then
                            root = auraData
                        end
                    end
                end
            end
        end

        getAuraData()

        if interrupt and interrupt.expiration <= now then
            frame.interruptData = nil
            interrupt = nil
        end

        local main, secondary
        local fullCC = mainHardCC

        if fullCC then
            main = fullCC
            if interrupt and silence then
                secondary = (silence.remaining > interrupt.remaining) and silence or interrupt
            elseif interrupt then
                secondary = interrupt
            elseif secondHardCC then
                secondary = secondHardCC
            else
                secondary = interrupt or silence or disarm or root
            end
        elseif interrupt and silence then
            if silence.remaining > interrupt.remaining then
                main = silence
                secondary = interrupt
            else
                main = interrupt
                secondary = silence
            end
        elseif interrupt then
            main = interrupt
            secondary = silence or disarm or root
        elseif silence then
            main = silence
            secondary = disarm or root
        elseif disarm then
            main = disarm
            secondary = root
        elseif root then
            main = root
            secondary = nil
        end

        if secondary and secondary ~= interrupt and CC.DB().lossOfControlSecondIconInterruptsOnly then
            secondary = nil
        end

        frame.mainCC = main
        frame.secondaryCC = secondary

        if main then
            if frame.fadeOutShrink:IsPlaying() then
                frame.fadeOutShrink:Stop()
            end

            frame.Icon:SetTexture(main.icon)
            if frame.Icon.Cooldown then
                frame.Icon.Cooldown:SetCooldown(main.expiration - main.duration, main.duration)
            end

            local name, r, g, b = nil, 1, 0.819, 0
            if main.type == "Silenced" and interrupt then
                frame.AbilityName:SetText("Silenced+")
                _, r, g, b = GetSchoolInfo(interrupt.school)
            elseif main == interrupt then
                frame.AbilityName:SetText("Interrupted")
                _, r, g, b = GetSchoolInfo(interrupt.school)
            else
                frame.AbilityName:SetText(main.type or "unknown")
            end
            frame.AbilityName:SetTextColor(r, g, b)

            frame.duration = main.duration
            frame.expiration = main.expiration
            frame.lockedBy = main.spellID

            if not frame:IsShown() then
                frame:SetAlpha(0)
                frame:SetScale(0.85)
                frame:Show()
                frame.fadeInScale:Stop()
                frame.fadeInScale:Play()
            end

            if main == interrupt or (main.type == "Silenced" and interrupt) then
                local name, r, g, b = GetSchoolInfo(interrupt.school)
                frame.Icon.SchoolText:SetText(name)
                frame.Icon.SchoolText:SetTextColor(r, g, b)
            else
                frame.Icon.SchoolText:SetText("")
            end
        else
            -- Leeway check: don't hide too early if interrupt about to become main
            if interrupt and (interrupt.expiration - now) > 0.2 then
                -- wait
            else
                if not frame.fadeOutShrink:IsPlaying() then
                    frame.fadeOutShrink:Stop()
                    frame.fadeOutShrink:Play()
                end
            end
            frame.Icon.SchoolText:SetText("")
        end

        if secondary then
            frame.SecondaryIcon.icon:SetTexture(secondary.icon)
            frame.SecondaryIcon.Cooldown:SetCooldown(secondary.expiration - secondary.duration, secondary.duration)
            frame.SecondaryIcon:Show()

            if interrupt and (secondary == interrupt or secondary == silence) then
                local name, r, g, b = GetSchoolInfo(interrupt.school)
                frame.SecondaryIcon.SchoolText:SetText(name)
                frame.SecondaryIcon.SchoolText:SetTextColor(r, g, b)
            else
                frame.SecondaryIcon.SchoolText:SetText("")
            end
        else
            frame.SecondaryIcon:Hide()
            frame.SecondaryIcon.SchoolText:SetText("")
        end

        if frame.silenceFallbacks then
            for spellID, fallback in pairs(frame.silenceFallbacks) do
                if fallback.expirationTime <= now then
                    frame.silenceFallbacks[spellID] = nil
                end
            end
        end
    end

    f:SetScript("OnEvent", function()
        if frame.returnEarly then return end
        checkAuras()
    end)

    function CC.UpdateLoCFrame()
        CC.LoC.ApplyOwnLayout(frame)
        if CC.DB().lossOfControlInterruptsOnly then
            f:UnregisterEvent("UNIT_AURA")
        else
            f:RegisterUnitEvent("UNIT_AURA", "player")
        end
        CC.LoC.RefreshOwnTest()
    end
    CC.UpdateLoCFrame()

    -- Timer Update
    frame:SetScript("OnUpdate", function(self)
        local now = GetTime()
        if self.expiration and not self.returnEarly then
            local timeLeft = self.expiration - now

            if timeLeft <= 0 then
                checkAuras()
            else
                self.TimeLeft.NumberText:SetText(string.format("%.1f seconds", timeLeft))

                -- Check if secondary interrupt has expired
                if self.interruptData and self.secondaryCC == self.interruptData and self.interruptData.expiration <= now then
                    self.interruptData = nil
                    checkAuras()
                end
            end
        end
    end)

    if silenceReductionItems then
        local equipWatcher = CreateFrame("Frame")
        equipWatcher:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
        equipWatcher:SetScript("OnEvent", function(_, _, slotID)
            if slotID == 1 or slotID == 2 then -- head or neck slot
                UpdateSilenceReduction()
            end
        end)
    end

    frame.interruptWatcher = CreateFrame("Frame")
    frame.interruptWatcher:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    frame.interruptWatcher:SetScript("OnEvent", function()
        local _, event, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID, spellName, _, _, _, school = C_CombatLog.GetCurrentEventInfo()

        if not interruptEvents[event] then return end
        if destGUID ~= UnitGUID("player") then return end

        local duration = interruptSpells[spellID]
        if not duration then return end

        if event ~= "SPELL_INTERRUPT" then
            -- Check if the unit was casting or channeling AND if it was interruptible
            local _, _, _, _, _, _, notInterruptibleChannel = UnitChannelInfo("player")

            local ccData
            local schoolName = GetSchoolInfo(school) or ""
            if schoolName == "Interrupted" then
                for i = 1, C_LossOfControl.GetActiveLossOfControlDataCount() do
                    local cc = C_LossOfControl.GetActiveLossOfControlData(i)
                    if cc and cc.locType == "SCHOOL_INTERRUPT" then
                        ccData = cc
                        break
                    end
                end
                if ccData then
                    school = ccData.lockoutSchool
                    duration = ccData.duration
                else
                    return
                end
            end -- avoid showing on casts like first aid etc
            if not ccData and notInterruptibleChannel ~= false then -- nil when not channeling
                return
            end
        end

        -- Reduce duration based on active buffs
        for i = 1, 40 do
            local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
            if not aura then break end
            local mult = spellLockReducer[aura.spellId]
            if mult then
                duration = duration * mult
            end
        end

        duration = duration * silenceReduction

        local schoolName = GetSchoolInfo(school)
        local now = GetTime()
        local expirationTime = now + duration
        local remaining = expirationTime - now

        frame.interruptData = {
            icon = C_Spell.GetSpellTexture(spellID),
            type = schoolName or "Interrupted",
            duration = duration,
            expiration = expirationTime,
            expirationTime = expirationTime,
            remaining = remaining,
            spellID = spellID,
            school = school
        }


        checkAuras()

    end)
end


table.insert(CC.EnableCallbacks, function()
    SetupLoCFrame()
    if silenceReductionItems then
        CC.On("PLAYER_ENTERING_WORLD", UpdateSilenceReduction)
    end
end)
