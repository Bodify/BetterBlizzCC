-- Traditional Chinese localization for BetterBlizzCC
-- BetterBlizzCC 繁體中文本地化

local _, CC = ...

if GetLocale() ~= "zhTW" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "測試"
L["Common.Okay"] = "確定"
L["Common.Cancel"] = "取消"
L["Common.Delete"] = "刪除"
L["Common.Reset"] = "重置"
L["Common.ReloadUI"] = "重新載入"
L["Common.Yes"] = "是"
L["Common.No"] = "否"
L["Common.Default"] = "預設"
L["Common.Scale"] = "縮放"
L["Common.HorizontalPosition"] = "水平位置"
L["Common.VerticalPosition"] = "垂直位置"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "調整"
L["Section.PositionScale"] = "位置與縮放"
L["Section.TimerText"] = "計時文字"
L["Section.Colors"] = "顏色"
L["Section.Sizes"] = "尺寸"
L["Section.Misc"] = "雜項"
L["Section.Profiles"] = "設定檔"
L["Section.Share"] = "分享"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "設定檔"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "左"
L["Anchor.Right"] = "右"
L["Anchor.Top"] = "上"
L["Anchor.Bottom"] = "下"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "僅顯示圖示"
L["Tweaks.IconOnly.Desc"] = "隱藏控制名稱和計時器。"
L["Tweaks.HideFrameBg"] = "隱藏控場背景"
L["Tweaks.HideFrameBg.Desc"] = "隱藏深色背景。"
L["Tweaks.HideFrameLines"] = "隱藏控場紅線"
L["Tweaks.HideFrameLines.Desc"] = "隱藏上下的紅線。"
L["Tweaks.InterruptsOnly"] = "僅打斷"
L["Tweaks.InterruptsOnly.Desc"] = "僅顯示打斷。"
L["Tweaks.ShowSecondIcon"] = "顯示第二圖示"
L["Tweaks.ShowSecondIcon.Desc"] = "為同時影響你的第二個控制效果顯示第二個圖示。在你同時被打斷和控制時特別有用。"
L["Tweaks.SecondIconInterruptsOnly"] = "僅限打斷"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "僅為打斷顯示第二個圖示。"
L["Tweaks.ShowSchool"] = "顯示被打斷的系別"
L["Tweaks.ShowSchool.Desc"] = "顯示你被打斷的法術系別。"
L["Tweaks.ShowCooldown"] = "在圖示上顯示冷卻動畫"
L["Tweaks.ShowCooldown.Desc"] = "在圖示上顯示冷卻動畫。"
L["Tweaks.ReverseSwipe"] = "反向轉圈"
L["Tweaks.ReverseSwipe.Desc"] = "反向轉圈，讓圖示一開始完全可見。"

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "控制文字位置"
L["Position.SecondaryPosition"] = "第二圖示位置"
L["Position.SecondIconScale"] = "第二圖示縮放"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "顯示倒數數字"
L["Timer.Countdown.Desc"] = "在圖示上以數字顯示剩餘時間。"
L["Timer.Milliseconds"] = "顯示小數"
L["Timer.Milliseconds.Desc"] = "進入低時間顏色後顯示小數。"
L["Timer.HideTimer"] = "隱藏計時文字"
L["Timer.HideTimer.Desc"] = "隱藏控制文字旁的計時器。"
L["Timer.HideName"] = "隱藏控制文字"
L["Timer.HideName.Desc"] = "隱藏計時器旁的控制名稱。"
L["Timer.Font"] = "文字字型"
L["Timer.NumberFont"] = "冷卻計時字型"
L["Timer.LowColor"] = "低時間顏色"
L["Timer.BaseColor"] = "一般顏色"
L["Timer.HighColor"] = "高時間顏色"
L["Timer.TextScale"] = "控制文字縮放"
L["Timer.TimerScale"] = "計時文字大小"
L["Timer.CountdownScale"] = "冷卻計時文字大小"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "強制英文設定文字"
L["Misc.ForceEnglish.Desc"] = "以英文顯示 BetterBlizzCC 設定。\n\n需要重新載入。"
L["Misc.ReloadPrompt"] = "重新載入介面以套用此變更？"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "目前設定檔"
L["Profiles.New"] = "新建"
L["Profiles.New.Desc"] = "建立新設定檔"
L["Profiles.Copy"] = "複製"
L["Profiles.Copy.Desc"] = "將目前設定檔複製為新設定檔"
L["Profiles.CopyName"] = "%s 副本"
L["Profiles.Rename"] = "重新命名"
L["Profiles.Rename.Desc"] = "重新命名目前設定檔"
L["Profiles.Delete"] = "刪除"
L["Profiles.Delete.Desc"] = "刪除目前設定檔"
L["Profiles.Reset"] = "重置"
L["Profiles.Reset.Desc"] = "將目前設定檔重置為預設"
L["Profiles.ExportBox"] = "匯出後用 Ctrl+C 複製字串"
L["Profiles.Export"] = "匯出"
L["Profiles.ImportBox"] = "匯入：用 Ctrl+V 貼上設定檔字串"
L["Profiles.Import"] = "匯入"
L["Profiles.ImportedName"] = "已匯入"
L["Profiles.NewPrompt"] = "新設定檔名稱："
L["Profiles.Create"] = "建立"
L["Profiles.RenamePrompt"] = "將此設定檔重新命名為："
L["Profiles.ImportPrompt"] = "將此設定檔匯入為："
L["Profiles.DeleteConfirm"] = "刪除設定檔「%s」？此動作無法復原。"
L["Profiles.ResetConfirm"] = "將設定檔「%s」重置為預設值？"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "致盲"
L["Loc.Gouged"] = "鑿擊"
L["Loc.Hexed"] = "妖術"
L["Loc.MindControlled"] = "心靈控制"
L["Loc.Seduced"] = "誘惑"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "無"
L["Gui.All"] = "全部"
L["Gui.ClickToChangeColor"] = "點擊變更顏色"
L["Gui.SpecsUseProfile"] = "%d/%d 個%s專精使用此設定檔。"
L["Gui.ToggleClassSpecs"] = "點擊切換所有%s專精。"
L["Gui.ToggleWholeClass"] = "點擊切換整個職業。"
L["Gui.CurrentSpec"] = "這是你目前的專精。"
L["Gui.SpecUsesProfile"] = "此專精正在使用「|cff00c0ff%s|r」設定檔。點擊改為使用「|cff00c0ff%s|r」。"
L["Gui.SliderHint"] = "滑桿提示：\n\n可以在滑桿右側的輸入框中輸入超出預設範圍的數值。"
L["Gui.SliderTypo"] = "數值 %s 看起來像是打錯字，確定要輸入這個值嗎？"
L["Gui.ResetSlider"] = "確定要將%s重設為預設值嗎？"
L["Gui.ResetSliderTip"] = "提示：按住Shift並右鍵點擊可直接重設，不彈出此視窗"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "無法建立該設定檔。"
L["Msg.Overwriting"] = "正在覆寫設定檔「%s」。"
L["Msg.ProfileNameEmpty"] = "設定檔名稱不能空白。"
L["Msg.ProfileExists"] = "名為「%s」的設定檔已存在。"
L["Msg.ProfileMissing"] = "該設定檔已不存在。"
L["Msg.DefaultCannotRename"] = "Default 設定檔無法重新命名。"
L["Msg.DefaultCannotDelete"] = "Default 設定檔無法刪除。"
L["Msg.CompressFailed"] = "無法壓縮設定檔。"
L["Msg.NothingToImport"] = "沒有可匯入的內容。"
L["Msg.NotProfileString"] = "不是 BetterBlizzCC 的設定檔。"
L["Msg.StringDamaged"] = "設定檔字串已損毀。"
L["Msg.IncompatibleVersion"] = "此設定檔來自不相容的版本。"
