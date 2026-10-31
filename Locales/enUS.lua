-- English (default) localization for BetterBlizzCC
-- Always loaded: every other locale falls back to these values

local _, CC = ...
local L = CC.L

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Test"
L["Common.Okay"] = "Okay"
L["Common.Cancel"] = "Cancel"
L["Common.Delete"] = "Delete"
L["Common.Reset"] = "Reset"
L["Common.ReloadUI"] = "Reload UI"
L["Common.Yes"] = "Yes"
L["Common.No"] = "No"
L["Common.Default"] = "Default"
L["Common.Scale"] = "Scale"
L["Common.HorizontalPosition"] = "Horizontal Position"
L["Common.VerticalPosition"] = "Vertical Position"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Tweaks"
L["Section.PositionScale"] = "Position & Scale"
L["Section.TimerText"] = "Timer Text"
L["Section.Colors"] = "Colors"
L["Section.Sizes"] = "Sizes"
L["Section.Misc"] = "Misc"
L["Section.Profiles"] = "Profiles"
L["Section.Share"] = "Share"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Profiles"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Left"
L["Anchor.Right"] = "Right"
L["Anchor.Top"] = "Top"
L["Anchor.Bottom"] = "Bottom"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Show Icon Only"
L["Tweaks.IconOnly.Desc"] = "Hide the CC name and timer."
L["Tweaks.HideFrameBg"] = "Hide CC Background"
L["Tweaks.HideFrameBg.Desc"] = "Hide the dark background."
L["Tweaks.HideFrameLines"] = "Hide CC Red Lines"
L["Tweaks.HideFrameLines.Desc"] = "Hide the red lines above and below."
L["Tweaks.InterruptsOnly"] = "Interrupts Only"
L["Tweaks.InterruptsOnly.Desc"] = "Only show interrupts."
L["Tweaks.ShowSecondIcon"] = "Show Second Icon"
L["Tweaks.ShowSecondIcon.Desc"] = "Show a second icon for a second CC also affecting you. Especially useful for when you get interrupted and CC'd at the same time."
L["Tweaks.SecondIconInterruptsOnly"] = "Only for Interrupts"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Only show the second icon for interrupts."
L["Tweaks.ShowSchool"] = "Show Interrupted School"
L["Tweaks.ShowSchool.Desc"] = "Show the school you got interrupted on."
L["Tweaks.ShowCooldown"] = "Show Cooldown Swipe on Icon"
L["Tweaks.ShowCooldown.Desc"] = "Show the cooldown swipe on the icon."
L["Tweaks.ReverseSwipe"] = "Reverse Swipe"
L["Tweaks.ReverseSwipe.Desc"] = "Reverse swipe so icon starts fully visible instead."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "CC Text Position"
L["Position.SecondaryPosition"] = "Second Icon Position"
L["Position.SecondIconScale"] = "Second Icon Scale"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Show Countdown Numbers"
L["Timer.Countdown.Desc"] = "Show the time left as numbers on the icon."
L["Timer.Milliseconds"] = "Show Decimals"
L["Timer.Milliseconds.Desc"] = "Show decimals once the Low Color starts."
L["Timer.HideTimer"] = "Hide Timer Text"
L["Timer.HideTimer.Desc"] = "Hide the timer next to the CC text."
L["Timer.HideName"] = "Hide CC Text"
L["Timer.HideName.Desc"] = "Hide the CC name next to the timer."
L["Timer.Font"] = "Text Font"
L["Timer.NumberFont"] = "CD Timer Text Font"
L["Timer.LowColor"] = "Low Color"
L["Timer.BaseColor"] = "Medium Color"
L["Timer.HighColor"] = "High Color"
L["Timer.TextScale"] = "CC Text Scale"
L["Timer.TimerScale"] = "Timer Text Size"
L["Timer.CountdownScale"] = "CD Timer Text Size"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Force English Settings Text"
L["Misc.ForceEnglish.Desc"] = "Show BetterBlizzCC settings in English.\n\nRequires a reload."
L["Misc.ReloadPrompt"] = "Reload the UI to apply this change?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Active Profile"
L["Profiles.New"] = "New"
L["Profiles.New.Desc"] = "Create a new profile"
L["Profiles.Copy"] = "Copy"
L["Profiles.Copy.Desc"] = "Copy the active profile into a new one"
L["Profiles.CopyName"] = "%s Copy"
L["Profiles.Rename"] = "Rename"
L["Profiles.Rename.Desc"] = "Rename the active profile"
L["Profiles.Delete"] = "Delete"
L["Profiles.Delete.Desc"] = "Delete the active profile"
L["Profiles.Reset"] = "Reset"
L["Profiles.Reset.Desc"] = "Reset the active profile to defaults"
L["Profiles.ExportBox"] = "Export, then copy the string with Ctrl+C"
L["Profiles.Export"] = "Export"
L["Profiles.ImportBox"] = "Import: paste a profile string with Ctrl+V"
L["Profiles.Import"] = "Import"
L["Profiles.ImportedName"] = "Imported"
L["Profiles.NewPrompt"] = "Name for the new profile:"
L["Profiles.Create"] = "Create"
L["Profiles.RenamePrompt"] = "Rename this profile to:"
L["Profiles.ImportPrompt"] = "Import this profile as:"
L["Profiles.DeleteConfirm"] = "Delete the profile \"%s\"? This cannot be undone."
L["Profiles.ResetConfirm"] = "Reset the profile \"%s\" back to defaults?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Blinded"
L["Loc.Gouged"] = "Gouged"
L["Loc.Hexed"] = "Hexed"
L["Loc.MindControlled"] = "Mind Controlled"
L["Loc.Seduced"] = "Seduced"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "None"
L["Gui.All"] = "All"
L["Gui.ClickToChangeColor"] = "Click to change color"
L["Gui.SpecsUseProfile"] = "%d of %d %s specs use this profile."
L["Gui.ToggleClassSpecs"] = "Click to toggle every %s spec."
L["Gui.ToggleWholeClass"] = "Click to toggle the whole class."
L["Gui.CurrentSpec"] = "This is your current specialization."
L["Gui.SpecUsesProfile"] = "This spec is using \"|cff00c0ff%s|r\" profile. Click to instead make it use \"|cff00c0ff%s|r\"."
L["Gui.SliderHint"] = "Tip for sliders:\n\nYou can input higher/lower values outside of the default slider values in the box on the right of the sliders."
L["Gui.SliderTypo"] = "The value of %s seems like a typo, are you sure this is the value you want to input?"
L["Gui.ResetSlider"] = "Are you sure you want to reset %s to its default value?"
L["Gui.ResetSliderTip"] = "Tip: You can hold shift while right-clicking to reset immediately without this popup"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Could not create that profile."
L["Msg.Overwriting"] = "Overwriting profile \"%s\"."
L["Msg.ProfileNameEmpty"] = "Profile name cannot be empty."
L["Msg.ProfileExists"] = "A profile named \"%s\" already exists."
L["Msg.ProfileMissing"] = "That profile no longer exists."
L["Msg.DefaultCannotRename"] = "The Default profile cannot be renamed."
L["Msg.DefaultCannotDelete"] = "The Default profile cannot be deleted."
L["Msg.CompressFailed"] = "Could not compress the profile."
L["Msg.NothingToImport"] = "Nothing to import."
L["Msg.NotProfileString"] = "Not a BetterBlizzCC profile."
L["Msg.StringDamaged"] = "The profile string is damaged."
L["Msg.IncompatibleVersion"] = "This profile is from an incompatible version."
