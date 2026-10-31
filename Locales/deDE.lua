-- German localization for BetterBlizzCC
-- Deutsche Lokalisierung für BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "deDE" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Test"
L["Common.Okay"] = "OK"
L["Common.Cancel"] = "Abbrechen"
L["Common.Delete"] = "Löschen"
L["Common.Reset"] = "Rücksetzen"
L["Common.ReloadUI"] = "Neu laden"
L["Common.Yes"] = "Ja"
L["Common.No"] = "Nein"
L["Common.Default"] = "Standard"
L["Common.Scale"] = "Skalierung"
L["Common.HorizontalPosition"] = "Horizontale Position"
L["Common.VerticalPosition"] = "Vertikale Position"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Anpassungen"
L["Section.PositionScale"] = "Position & Skalierung"
L["Section.TimerText"] = "Timertext"
L["Section.Colors"] = "Farben"
L["Section.Sizes"] = "Größen"
L["Section.Misc"] = "Verschiedenes"
L["Section.Profiles"] = "Profile"
L["Section.Share"] = "Teilen"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Profile"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Links"
L["Anchor.Right"] = "Rechts"
L["Anchor.Top"] = "Oben"
L["Anchor.Bottom"] = "Unten"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Nur Symbol anzeigen"
L["Tweaks.IconOnly.Desc"] = "Blendet CC-Namen und Timer aus."
L["Tweaks.HideFrameBg"] = "CC-Hintergrund ausblenden"
L["Tweaks.HideFrameBg.Desc"] = "Blendet den dunklen Hintergrund aus."
L["Tweaks.HideFrameLines"] = "Rote CC-Linien ausblenden"
L["Tweaks.HideFrameLines.Desc"] = "Blendet die roten Linien oben und unten aus."
L["Tweaks.InterruptsOnly"] = "Nur Unterbrechungen"
L["Tweaks.InterruptsOnly.Desc"] = "Zeigt nur Unterbrechungen."
L["Tweaks.ShowSecondIcon"] = "Zweites Symbol anzeigen"
L["Tweaks.ShowSecondIcon.Desc"] = "Zeigt ein zweites Symbol für einen zweiten CC, der dich ebenfalls betrifft. Besonders nützlich, wenn du gleichzeitig unterbrochen und kontrolliert wirst."
L["Tweaks.SecondIconInterruptsOnly"] = "Nur für Unterbrechungen"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Zweites Symbol nur für Unterbrechungen anzeigen."
L["Tweaks.ShowSchool"] = "Unterbrochene Schule zeigen"
L["Tweaks.ShowSchool.Desc"] = "Zeigt die Zauberschule, auf der du unterbrochen wurdest."
L["Tweaks.ShowCooldown"] = "Abklingzeit-Animation auf Symbol anzeigen"
L["Tweaks.ShowCooldown.Desc"] = "Zeigt die Abklingzeit-Animation auf dem Symbol."
L["Tweaks.ReverseSwipe"] = "Umgekehrter Verlauf"
L["Tweaks.ReverseSwipe.Desc"] = "Kehrt den Verlauf um, sodass das Symbol zuerst ganz sichtbar ist."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Position des CC-Texts"
L["Position.SecondaryPosition"] = "Position des zweiten Symbols"
L["Position.SecondIconScale"] = "Größe des zweiten Symbols"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Countdown-Zahlen anzeigen"
L["Timer.Countdown.Desc"] = "Zeigt die Restzeit als Zahl auf dem Symbol."
L["Timer.Milliseconds"] = "Dezimalstellen anzeigen"
L["Timer.Milliseconds.Desc"] = "Zeigt Dezimalstellen, sobald die Warnfarbe beginnt."
L["Timer.HideTimer"] = "Timertext ausblenden"
L["Timer.HideTimer.Desc"] = "Blendet den Timer neben dem CC-Text aus."
L["Timer.HideName"] = "CC-Text ausblenden"
L["Timer.HideName.Desc"] = "Blendet den CC-Namen neben dem Timer aus."
L["Timer.Font"] = "Textschriftart"
L["Timer.NumberFont"] = "CD-Timer-Schriftart"
L["Timer.LowColor"] = "Warnfarbe"
L["Timer.BaseColor"] = "Normale Farbe"
L["Timer.HighColor"] = "Farbe für lange Zeiten"
L["Timer.TextScale"] = "Skalierung des CC-Texts"
L["Timer.TimerScale"] = "Timer-Textgröße"
L["Timer.CountdownScale"] = "CD-Timer-Textgröße"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Einstellungstext auf Englisch erzwingen"
L["Misc.ForceEnglish.Desc"] = "Zeigt die BetterBlizzCC-Einstellungen auf Englisch.\n\nErfordert ein Neuladen."
L["Misc.ReloadPrompt"] = "Interface neu laden, um die Änderung zu übernehmen?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Aktives Profil"
L["Profiles.New"] = "Neu"
L["Profiles.New.Desc"] = "Neues Profil erstellen"
L["Profiles.Copy"] = "Kopieren"
L["Profiles.Copy.Desc"] = "Aktives Profil in ein neues kopieren"
L["Profiles.CopyName"] = "%s Kopie"
L["Profiles.Rename"] = "Umbenennen"
L["Profiles.Rename.Desc"] = "Aktives Profil umbenennen"
L["Profiles.Delete"] = "Löschen"
L["Profiles.Delete.Desc"] = "Aktives Profil löschen"
L["Profiles.Reset"] = "Reset"
L["Profiles.Reset.Desc"] = "Aktives Profil auf Standard zurücksetzen"
L["Profiles.ExportBox"] = "Exportieren, dann den Text mit Strg+C kopieren"
L["Profiles.Export"] = "Export"
L["Profiles.ImportBox"] = "Import: Profiltext mit Strg+V einfügen"
L["Profiles.Import"] = "Import"
L["Profiles.ImportedName"] = "Importiert"
L["Profiles.NewPrompt"] = "Name für das neue Profil:"
L["Profiles.Create"] = "Erstellen"
L["Profiles.RenamePrompt"] = "Profil umbenennen in:"
L["Profiles.ImportPrompt"] = "Profil importieren als:"
L["Profiles.DeleteConfirm"] = "Profil „%s“ löschen? Das kann nicht rückgängig gemacht werden."
L["Profiles.ResetConfirm"] = "Profil „%s“ auf Standard zurücksetzen?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Geblendet"
L["Loc.Gouged"] = "Außer Gefecht"
L["Loc.Hexed"] = "Verhext"
L["Loc.MindControlled"] = "Gedankenkontrolliert"
L["Loc.Seduced"] = "Verführt"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Nichts"
L["Gui.All"] = "Alle"
L["Gui.ClickToChangeColor"] = "Klicken, um die Farbe zu ändern"
L["Gui.SpecsUseProfile"] = "%d von %d %s-Spezialisierungen nutzen dieses Profil."
L["Gui.ToggleClassSpecs"] = "Klicken, um jede %s-Spezialisierung umzuschalten."
L["Gui.ToggleWholeClass"] = "Klicken, um die ganze Klasse umzuschalten."
L["Gui.CurrentSpec"] = "Das ist deine aktuelle Spezialisierung."
L["Gui.SpecUsesProfile"] = "Diese Spezialisierung nutzt das Profil „|cff00c0ff%s|r“. Klicken, um stattdessen „|cff00c0ff%s|r“ zu nutzen."
L["Gui.SliderHint"] = "Tipp zu Schiebereglern:\n\nIm Feld rechts neben den Schiebereglern kannst du auch Werte über oder unter dem Standardbereich eingeben."
L["Gui.SliderTypo"] = "Der Wert %s sieht nach einem Tippfehler aus. Willst du diesen Wert wirklich eingeben?"
L["Gui.ResetSlider"] = "Möchtest du %s wirklich auf den Standardwert zurücksetzen?"
L["Gui.ResetSliderTip"] = "Tipp: Halte Umschalt beim Rechtsklick gedrückt, um ohne dieses Fenster sofort zurückzusetzen"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Das Profil konnte nicht erstellt werden."
L["Msg.Overwriting"] = "Profil „%s“ wird überschrieben."
L["Msg.ProfileNameEmpty"] = "Der Profilname darf nicht leer sein."
L["Msg.ProfileExists"] = "Ein Profil namens „%s“ existiert bereits."
L["Msg.ProfileMissing"] = "Dieses Profil existiert nicht mehr."
L["Msg.DefaultCannotRename"] = "Das Profil Default kann nicht umbenannt werden."
L["Msg.DefaultCannotDelete"] = "Das Profil Default kann nicht gelöscht werden."
L["Msg.CompressFailed"] = "Das Profil konnte nicht komprimiert werden."
L["Msg.NothingToImport"] = "Es gibt nichts zu importieren."
L["Msg.NotProfileString"] = "Kein BetterBlizzCC-Profil."
L["Msg.StringDamaged"] = "Der Profiltext ist beschädigt."
L["Msg.IncompatibleVersion"] = "Dieses Profil stammt aus einer inkompatiblen Version."
