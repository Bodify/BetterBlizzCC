-- Simplified Chinese localization for BetterBlizzCC
-- BetterBlizzCC 简体中文本地化

local _, CC = ...

if GetLocale() ~= "zhCN" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "测试"
L["Common.Okay"] = "确定"
L["Common.Cancel"] = "取消"
L["Common.Delete"] = "删除"
L["Common.Reset"] = "重置"
L["Common.ReloadUI"] = "重新加载UI"
L["Common.Yes"] = "是"
L["Common.No"] = "否"
L["Common.Default"] = "默认"
L["Common.Scale"] = "缩放"
L["Common.HorizontalPosition"] = "水平位置"
L["Common.VerticalPosition"] = "垂直位置"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "调整"
L["Section.PositionScale"] = "位置和缩放"
L["Section.TimerText"] = "计时文字"
L["Section.Colors"] = "颜色"
L["Section.Sizes"] = "尺寸"
L["Section.Misc"] = "杂项"
L["Section.Profiles"] = "配置文件"
L["Section.Share"] = "分享"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "配置文件"

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

L["Tweaks.IconOnly"] = "仅显示图标"
L["Tweaks.IconOnly.Desc"] = "隐藏控制名称和计时器。"
L["Tweaks.HideFrameBg"] = "隐藏控制技能背景"
L["Tweaks.HideFrameBg.Desc"] = "隐藏深色背景。"
L["Tweaks.HideFrameLines"] = "隐藏控制技能红线"
L["Tweaks.HideFrameLines.Desc"] = "隐藏上下的红线。"
L["Tweaks.InterruptsOnly"] = "仅打断"
L["Tweaks.InterruptsOnly.Desc"] = "仅显示打断。"
L["Tweaks.ShowSecondIcon"] = "显示第二图标"
L["Tweaks.ShowSecondIcon.Desc"] = "为同时影响你的第二个控制效果显示第二个图标。在你同时被打断和控制时特别有用。"
L["Tweaks.SecondIconInterruptsOnly"] = "仅限打断"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "仅为打断显示第二个图标。"
L["Tweaks.ShowSchool"] = "显示被打断的系别"
L["Tweaks.ShowSchool.Desc"] = "显示你被打断的法术系别。"
L["Tweaks.ShowCooldown"] = "在图标上显示冷却动画"
L["Tweaks.ShowCooldown.Desc"] = "在图标上显示冷却动画。"
L["Tweaks.ReverseSwipe"] = "反向转圈"
L["Tweaks.ReverseSwipe.Desc"] = "反向转圈，让图标一开始完全可见。"

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "控制文字位置"
L["Position.SecondaryPosition"] = "第二图标位置"
L["Position.SecondIconScale"] = "第二图标缩放"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "显示倒计时数字"
L["Timer.Countdown.Desc"] = "在图标上以数字显示剩余时间。"
L["Timer.Milliseconds"] = "显示小数"
L["Timer.Milliseconds.Desc"] = "进入低时间颜色后显示小数。"
L["Timer.HideTimer"] = "隐藏计时文字"
L["Timer.HideTimer.Desc"] = "隐藏控制文字旁的计时器。"
L["Timer.HideName"] = "隐藏控制文字"
L["Timer.HideName.Desc"] = "隐藏计时器旁的控制名称。"
L["Timer.Font"] = "文字字体"
L["Timer.NumberFont"] = "冷却计时字体"
L["Timer.LowColor"] = "低时间颜色"
L["Timer.BaseColor"] = "普通颜色"
L["Timer.HighColor"] = "高时间颜色"
L["Timer.TextScale"] = "控制文字缩放"
L["Timer.TimerScale"] = "计时文字大小"
L["Timer.CountdownScale"] = "冷却计时文字大小"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "强制英文设置文本"
L["Misc.ForceEnglish.Desc"] = "以英文显示 BetterBlizzCC 设置。\n\n需要重载界面。"
L["Misc.ReloadPrompt"] = "重载界面以应用此更改？"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "当前配置文件"
L["Profiles.New"] = "新建"
L["Profiles.New.Desc"] = "新建配置文件"
L["Profiles.Copy"] = "复制"
L["Profiles.Copy.Desc"] = "将当前配置文件复制为新配置文件"
L["Profiles.CopyName"] = "%s 副本"
L["Profiles.Rename"] = "重命名"
L["Profiles.Rename.Desc"] = "重命名当前配置文件"
L["Profiles.Delete"] = "删除"
L["Profiles.Delete.Desc"] = "删除当前配置文件"
L["Profiles.Reset"] = "重置"
L["Profiles.Reset.Desc"] = "将当前配置文件重置为默认"
L["Profiles.ExportBox"] = "导出后用 Ctrl+C 复制字符串"
L["Profiles.Export"] = "导出"
L["Profiles.ImportBox"] = "导入：用 Ctrl+V 粘贴配置字符串"
L["Profiles.Import"] = "导入"
L["Profiles.ImportedName"] = "已导入"
L["Profiles.NewPrompt"] = "新配置文件名称："
L["Profiles.Create"] = "创建"
L["Profiles.RenamePrompt"] = "将此配置文件重命名为："
L["Profiles.ImportPrompt"] = "将此配置文件导入为："
L["Profiles.DeleteConfirm"] = "删除配置文件“%s”？此操作无法撤销。"
L["Profiles.ResetConfirm"] = "将配置文件“%s”重置为默认？"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "致盲"
L["Loc.Gouged"] = "凿击"
L["Loc.Hexed"] = "妖术"
L["Loc.MindControlled"] = "精神控制"
L["Loc.Seduced"] = "诱惑"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "无"
L["Gui.All"] = "全部"
L["Gui.ClickToChangeColor"] = "点击更改颜色"
L["Gui.SpecsUseProfile"] = "%d/%d 个%s专精使用此配置文件。"
L["Gui.ToggleClassSpecs"] = "点击切换所有%s专精。"
L["Gui.ToggleWholeClass"] = "点击切换整个职业。"
L["Gui.CurrentSpec"] = "这是你当前的专精。"
L["Gui.SpecUsesProfile"] = "此专精正在使用“|cff00c0ff%s|r”配置文件。点击改为使用“|cff00c0ff%s|r”。"
L["Gui.SliderHint"] = "滑块提示：\n\n可以在滑块右侧的输入框中输入超出默认范围的数值。"
L["Gui.SliderTypo"] = "数值 %s 看起来像是输入错误，确定要输入这个值吗？"
L["Gui.ResetSlider"] = "确定要将%s重置为默认值吗？"
L["Gui.ResetSliderTip"] = "提示：按住Shift并右键点击可直接重置，不弹出此窗口"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "无法创建该配置文件。"
L["Msg.Overwriting"] = "正在覆盖配置文件“%s”。"
L["Msg.ProfileNameEmpty"] = "配置文件名称不能为空。"
L["Msg.ProfileExists"] = "名为“%s”的配置文件已存在。"
L["Msg.ProfileMissing"] = "该配置文件已不存在。"
L["Msg.DefaultCannotRename"] = "Default 配置文件无法重命名。"
L["Msg.DefaultCannotDelete"] = "Default 配置文件无法删除。"
L["Msg.CompressFailed"] = "无法压缩配置文件。"
L["Msg.NothingToImport"] = "没有可导入的内容。"
L["Msg.NotProfileString"] = "不是 BetterBlizzCC 的配置文件。"
L["Msg.StringDamaged"] = "配置字符串已损坏。"
L["Msg.IncompatibleVersion"] = "该配置文件来自不兼容的版本。"
