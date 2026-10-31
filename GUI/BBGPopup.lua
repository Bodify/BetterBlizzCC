local addonName, addonTable = ...
local BBG = addonTable.BBG

local CONTENT_X      = 2
local PAD_X          = 22
local BTN_HEIGHT     = 24
local BTN_GAP        = 8
local ELEMENT_GAP    = 12
local ALERT_SIZE     = 26
local ALERT_GAP      = 10
local EDITBOX_HEIGHT = 22
local BASE_LEVEL     = 200

local branding = {
    title     = "BetterBlizzGUI",
    icon      = nil,
    showSound = SOUNDKIT.IG_MAINMENU_OPEN,
    hideSound = SOUNDKIT.IG_MAINMENU_CLOSE,
}

local pool  = {}
local shown = {}

local RepositionPopups

local function SetButtonDesaturated(btn, desaturated)
    local shade = desaturated and 0.5 or 1
    for _, region in ipairs({ btn:GetRegions() }) do
        if region.SetDesaturated then
            region:SetDesaturated(desaturated)
            region:SetVertexColor(shade, shade, shade)
        end
    end
end

local function TextWidth(btn)
    local fontString = btn:GetFontString()
    return fontString and math.ceil(fontString:GetStringWidth()) or 0
end

local function DelayText(btn, count)
    if btn.timerOnly then return tostring(count) end
    return string.format("%s (%d)", btn.baseText, count)
end

local function ReleaseButtonDelay(btn)
    btn.remaining  = nil
    btn.shownCount = nil
    btn.timerOnly  = nil
    btn:SetText(btn.baseText or "")
    btn:Enable()
    SetButtonDesaturated(btn, false)
end

local function SetCloseLocked(popup, locked)
    local close = popup.ClosePanelButton
    close:SetEnabled(not locked)
    SetButtonDesaturated(close, locked)
end

local function PopupOnUpdate(popup, elapsed)
    local ticking = false

    for _, btn in ipairs(popup.buttons) do
        if btn:IsShown() and btn.remaining then
            btn.remaining = btn.remaining - elapsed
            if btn.remaining <= 0 then
                ReleaseButtonDelay(btn)
            else
                ticking = true
                local count = math.ceil(btn.remaining)
                if count ~= btn.shownCount then
                    btn.shownCount = count
                    btn:SetText(DelayText(btn, count))
                end
            end
        end
    end

    if popup.lockRemaining then
        popup.lockRemaining = popup.lockRemaining - elapsed
        if popup.lockRemaining <= 0 then
            popup.lockRemaining = nil
            SetCloseLocked(popup, false)
        else
            ticking = true
        end
    end

    if popup.timeleft then
        popup.timeleft = popup.timeleft - elapsed
        if popup.timeleft <= 0 then
            popup.timeleft = nil
            popup:Hide()
            return
        end
        ticking = true
    end

    if not ticking then
        popup:SetScript("OnUpdate", nil)
    end
end

local function ButtonClicked(popup, btn)
    local entry = btn.entry
    if not entry then return end

    if entry.onClick then
        popup.cancelled = false
        entry.onClick(popup, popup.data)
    end

    if not entry.keepOpen then
        popup:Hide()
    end
end

local function BrandingTitle()
    local title = branding.title or ""
    local icon  = branding.icon
    if not icon then return title end

    local size = icon.size or 16
    if icon.atlas then
        return string.format("|A:%s:%d:%d|a %s", icon.atlas, size, size, title)
    elseif icon.texture then
        return string.format("|T%s:%d:%d|t %s", icon.texture, size, size, title)
    end
    return title
end

local function ApplyBranding(popup)
    popup.NineSlice.Text:SetText(BrandingTitle())
end

local function PopupOnHide(popup)
    local config, data = popup.config, popup.data
    popup.config = nil
    popup.data   = nil
    popup.key    = nil
    popup.timeleft = nil
    popup.lockRemaining = nil
    popup:SetScript("OnUpdate", nil)
    popup.EditBox:ClearFocus()

    for i = #shown, 1, -1 do
        if shown[i] == popup then
            table.remove(shown, i)
        end
    end
    RepositionPopups()

    if config then
        PlaySound(config.hideSound or branding.hideSound)
        if popup.cancelled and config.OnCancel then config.OnCancel(popup, data) end
        if config.OnHide then config.OnHide(popup, data) end
    end

    popup.inUse = false
end

local function PopupOnKeyDown(popup, key)
    local handled = false

    if key == "ESCAPE" then
        if popup.lockRemaining then
            handled = true
        elseif popup.hideOnEscape then
            popup:Hide()
            handled = true
        end
    elseif key == "ENTER" then
        local btn = popup.buttons[1]
        if btn and btn:IsShown() and btn:IsEnabled() then
            ButtonClicked(popup, btn)
            handled = true
        end
    end

    popup:SetPropagateKeyboardInput(not handled)
end

local function PopupClick(popup, index)
    local btn = popup.buttons[index]
    if btn and btn:IsShown() and btn:IsEnabled() then
        ButtonClicked(popup, btn)
    end
end

local function PopupGetEditBoxText(popup)
    return popup.EditBox:GetText()
end

local function EditBoxConfig(popup)
    return popup.config and popup.config.editBox
end

local function ApplyGlowTexture(glow)
    local info = C_Texture.GetAtlasInfo("shop-card-small-frame-selected")
    if not info then
        glow:Hide()
        return
    end

    local left, right  = info.leftTexCoord, info.rightTexCoord
    local top,  bottom = info.topTexCoord,  info.bottomTexCoord

    glow:SetTexture(info.file or info.filename)
    glow:SetTexCoord(left, bottom, right, bottom, left, top, right, top)
    glow:Show()
end

local function CreatePopupFrame(index)
    local popup = CreateFrame("Frame", addonName .. "_BBGPopup" .. index, UIParent, "SettingsFrameTemplate")
    popup:SetFrameStrata("FULLSCREEN_DIALOG")
    popup:SetFrameLevel(BASE_LEVEL)
    popup:EnableMouse(true)
    popup:EnableKeyboard(true)
    popup:SetClampedToScreen(true)
    popup:Hide()

    popup.ClosePanelButton:SetScript("OnClick", function(self) self:GetParent():Hide() end)

    local glowHolder = CreateFrame("Frame", nil, popup)
    glowHolder:SetAllPoints(popup)
    popup.GlowHolder = glowHolder

    local glow = glowHolder:CreateTexture(nil, "BACKGROUND")
    glow:SetPoint("TOPLEFT",     popup, "TOPLEFT",     -10.5,   9)
    glow:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT",  14.5, -10)
    glow:SetDesaturated(true)
    glow:SetVertexColor(0, 0.75, 1, 1)
    ApplyGlowTexture(glow)
    popup.Glow = glow

    for _, key in ipairs({ "TopSection", "BottomLeft", "BottomRight", "BottomEdge" }) do
        local texture = popup.Bg and popup.Bg[key]
        if texture then
            texture:SetVertexColor(1, 1, 1, 1)
            texture:SetColorTexture(0.09, 0.09, 0.09, 1)
        end
    end

    for _, key in ipairs({ "TopLeftCorner", "TopRightCorner", "TopEdge", "LeftEdge",
                           "RightEdge", "BottomLeftCorner", "BottomRightCorner", "BottomEdge" }) do
        local piece = popup.NineSlice[key]
        if piece then piece:SetVertexColor(0.83, 0.83, 0.83) end
    end

    for key, nudge in pairs({ TopRightCorner    = { x = -1, y = 0 },
                              BottomRightCorner = { x = -1, y = 0 } }) do
        local piece = popup.NineSlice[key]
        if piece and piece.GetNumPoints then
            local anchors = {}
            for i = 1, piece:GetNumPoints() do
                local point, relativeTo, relativePoint, x, y = piece:GetPoint(i)
                anchors[i] = { point, relativeTo or popup.NineSlice, relativePoint,
                               (x or 0) + (nudge.x or 0), (y or 0) + (nudge.y or 0) }
            end
            if #anchors > 0 then
                piece:ClearAllPoints()
                for _, anchor in ipairs(anchors) do piece:SetPoint(unpack(anchor)) end
            end
        end
    end

    popup:SetMovable(true)
    popup:RegisterForDrag("LeftButton")
    popup:SetScript("OnDragStart", function(self) self:StartMoving() end)
    popup:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        self:SetUserPlaced(false)
        self.moved = true
    end)

    local alert = popup:CreateTexture(nil, "ARTWORK")
    alert:SetSize(ALERT_SIZE, ALERT_SIZE)
    alert:SetTexture("Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew")
    alert:Hide()
    popup.Alert = alert

    local text = popup:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetJustifyH("CENTER")
    popup.Text = text

    local subText = popup:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    subText:SetJustifyH("CENTER")
    subText:SetTextColor(0.7, 0.7, 0.7)
    subText:Hide()
    popup.SubText = subText

    local editBox = CreateFrame("EditBox", nil, popup, "InputBoxTemplate")
    editBox:SetHeight(EDITBOX_HEIGHT)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(ChatFontNormal)
    editBox:Hide()
    popup.EditBox = editBox

    editBox:SetScript("OnEnterPressed", function(self)
        local owner = self:GetParent()
        local edit  = EditBoxConfig(owner)
        if edit and edit.onEnter then
            edit.onEnter(owner, owner.data)
        else
            owner:Click(1)
        end
    end)
    editBox:SetScript("OnEscapePressed", function(self)
        local owner = self:GetParent()
        local edit  = EditBoxConfig(owner)
        self:ClearFocus()
        if edit and edit.onEscape then
            edit.onEscape(owner, owner.data)
        elseif owner.hideOnEscape and not owner.lockRemaining then
            owner:Hide()
        end
    end)
    editBox:SetScript("OnTextChanged", function(self)
        local owner = self:GetParent()
        local edit  = EditBoxConfig(owner)
        if edit and edit.onTextChanged then
            edit.onTextChanged(owner, self:GetText(), owner.data)
        end
    end)

    popup.buttons = {}
    popup.Click          = PopupClick
    popup.GetEditBoxText = PopupGetEditBoxText

    popup:SetScript("OnHide", PopupOnHide)
    popup:SetScript("OnKeyDown", PopupOnKeyDown)

    return popup
end

local function AcquireButton(popup, index)
    local btn = popup.buttons[index]
    if not btn then
        btn = CreateFrame("Button", nil, popup, "SharedButtonTemplate")
        btn:SetHeight(BTN_HEIGHT)
        btn:SetScript("OnClick", function(self) ButtonClicked(self:GetParent(), self) end)

        if btn.UpdateButton then
            hooksecurefunc(btn, "UpdateButton", function(self)
                if self.remaining then SetButtonDesaturated(self, true) end
            end)
        end

        popup.buttons[index] = btn
    end
    return btn
end

local function AcquirePopup()
    for _, popup in ipairs(pool) do
        if not popup.inUse then return popup end
    end
    local popup = CreatePopupFrame(#pool + 1)
    pool[#pool + 1] = popup
    return popup
end

local function LayoutPopup(popup)
    local config = popup.config
    local alert  = config.alert and true or false
    local extra  = alert and (ALERT_SIZE + ALERT_GAP) or 0
    local width  = config.width or 330
    local maxTextWidth = width - PAD_X * 2 - extra

    popup.Text:SetWidth(0)
    local contentWidth = math.min(math.ceil(popup.Text:GetStringWidth()) + 1, maxTextWidth)

    if popup.SubText:IsShown() then
        popup.SubText:SetWidth(0)
        contentWidth = math.max(contentWidth,
            math.min(math.ceil(popup.SubText:GetStringWidth()) + 1, maxTextWidth))
    end

    popup.Text:SetWidth(contentWidth)
    if popup.SubText:IsShown() then popup.SubText:SetWidth(contentWidth) end

    local rowWidth, count = 0, 0
    for _, btn in ipairs(popup.buttons) do
        if btn:IsShown() then
            count = count + 1
            rowWidth = rowWidth + btn:GetWidth() + (count > 1 and BTN_GAP or 0)
        end
    end

    local y = -34

    popup.Text:ClearAllPoints()
    popup.Text:SetPoint("TOP", popup, "TOP", CONTENT_X + extra / 2, y)

    if alert then
        popup.Alert:ClearAllPoints()
        popup.Alert:SetPoint("RIGHT", popup.Text, "LEFT", -ALERT_GAP, 0)
    end

    y = y - math.max(popup.Text:GetStringHeight(), alert and ALERT_SIZE or 0)

    if popup.SubText:IsShown() then
        y = y - 6
        popup.SubText:ClearAllPoints()
        popup.SubText:SetPoint("TOP", popup, "TOP", CONTENT_X + extra / 2, y)
        y = y - popup.SubText:GetStringHeight()
    end

    if popup.EditBox:IsShown() then
        y = y - ELEMENT_GAP
        popup.EditBox:SetWidth(width - PAD_X * 2 - 12)
        popup.EditBox:ClearAllPoints()
        popup.EditBox:SetPoint("TOP", popup, "TOP", CONTENT_X, y)
        y = y - EDITBOX_HEIGHT
    end

    if count > 0 then
        y = y - ELEMENT_GAP
        local x = CONTENT_X - rowWidth / 2
        for _, btn in ipairs(popup.buttons) do
            if btn:IsShown() then
                btn:ClearAllPoints()
                btn:SetPoint("TOPLEFT", popup, "TOP", x, y)
                x = x + btn:GetWidth() + BTN_GAP
            end
        end
        y = y - BTN_HEIGHT
    end

    popup:SetSize(width, math.abs(y) + 16)
end

function RepositionPopups()
    local previous
    for i, popup in ipairs(shown) do
        if not popup.moved then
            popup:ClearAllPoints()
            if previous then
                popup:SetPoint("TOP", previous, "BOTTOM", 0, -14)
            else
                popup:SetPoint("TOP", UIParent, "TOP", 0, -135)
            end
        end

        local level = BASE_LEVEL + i * 10
        popup:SetFrameLevel(level)
        if popup.Bg then popup.Bg:SetFrameLevel(level - 1) end
        if popup.GlowHolder then popup.GlowHolder:SetFrameLevel(level - 2) end

        previous = popup
    end
end

function BBG.SetPopupBranding(config)
    for key, value in pairs(config or {}) do
        branding[key] = value
    end
    for _, popup in ipairs(pool) do
        if popup.inUse then ApplyBranding(popup) end
    end
end

function BBG.IsPopupShown(key)
    if not key then return nil end
    for _, popup in ipairs(shown) do
        if popup.key == key then return popup end
    end
end

function BBG.HidePopup(key)
    if not key then return end
    for i = #shown, 1, -1 do
        if shown[i].key == key then shown[i]:Hide() end
    end
end

function BBG.HideAllPopups()
    for i = #shown, 1, -1 do
        shown[i]:Hide()
    end
end

function BBG.ShowPopup(config)
    if type(config) ~= "table" then return nil end

    BBG.HidePopup(config.key)

    local popup = AcquirePopup()
    popup.inUse        = true
    popup.config       = config
    popup.data         = config.data
    popup.key          = config.key
    popup.cancelled    = true
    popup.moved        = nil
    popup.hideOnEscape = config.hideOnEscape ~= false
    popup.timeleft     = (config.timeout and config.timeout > 0) and config.timeout or nil
    popup.lockRemaining = (config.lockDuration and config.lockDuration > 0) and config.lockDuration or nil

    ApplyBranding(popup)

    popup.Text:SetText(config.text or "")
    popup.Text:SetJustifyH(config.textJustify or "CENTER")
    popup.SubText:SetText(config.subText or "")
    popup.SubText:SetJustifyH(config.subTextJustify or "CENTER")
    popup.SubText:SetShown((config.subText or "") ~= "")
    popup.Alert:SetShown(config.alert and true or false)
    popup.ClosePanelButton:SetShown(config.closeButton ~= false)
    SetCloseLocked(popup, popup.lockRemaining ~= nil)

    local edit = config.editBox
    popup.EditBox:SetShown(edit ~= nil)
    if edit then
        popup.EditBox:SetMaxLetters(edit.maxLetters or 0)
        popup.EditBox:SetNumeric(edit.numeric and true or false)
        popup.EditBox:SetText(edit.text or "")
    else
        popup.EditBox:SetText("")
    end

    local ticking = popup.timeleft ~= nil or popup.lockRemaining ~= nil
    local entries = config.buttons or { { text = OKAY } }

    for i, entry in ipairs(entries) do
        local btn = AcquireButton(popup, i)
        btn.entry    = entry
        btn.baseText = entry.text or ""

        btn:SetText(btn.baseText)
        local btnWidth = math.max(90, TextWidth(btn) + 30)

        local delay = math.max(entry.delay or 0, popup.lockRemaining or 0)
        if delay > 0 then
            btn.remaining  = delay
            btn.shownCount = math.ceil(delay)
            btn.timerOnly  = popup.lockRemaining ~= nil
            btn:SetText(DelayText(btn, btn.shownCount))
            btnWidth = math.max(btnWidth, TextWidth(btn) + 30)
            btn:Disable()
            SetButtonDesaturated(btn, true)
            ticking = true
        else
            ReleaseButtonDelay(btn)
        end

        btn:SetWidth(btnWidth)
        btn:Show()
    end

    for i = #entries + 1, #popup.buttons do
        popup.buttons[i].entry = nil
        popup.buttons[i]:Hide()
    end

    LayoutPopup(popup)

    shown[#shown + 1] = popup
    popup:Show()
    RepositionPopups()
    popup:SetScript("OnUpdate", ticking and PopupOnUpdate or nil)

    if edit and edit.autoFocus ~= false then
        popup.EditBox:SetFocus()
        if edit.highlight ~= false then popup.EditBox:HighlightText() end
    end

    PlaySound(config.showSound or branding.showSound)

    if config.OnShow then config.OnShow(popup, popup.data) end
    return popup
end
