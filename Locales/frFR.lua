-- French localization for BetterBlizzCC
-- Localisation française de BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "frFR" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Test"
L["Common.Okay"] = "OK"
L["Common.Cancel"] = "Annuler"
L["Common.Delete"] = "Suppr."
L["Common.Reset"] = "Réinitialiser"
L["Common.ReloadUI"] = "Recharger"
L["Common.Yes"] = "Oui"
L["Common.No"] = "Non"
L["Common.Default"] = "Par défaut"
L["Common.Scale"] = "Échelle"
L["Common.HorizontalPosition"] = "Position horizontale"
L["Common.VerticalPosition"] = "Position verticale"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Ajustements"
L["Section.PositionScale"] = "Position et échelle"
L["Section.TimerText"] = "Texte du timer"
L["Section.Colors"] = "Couleurs"
L["Section.Sizes"] = "Tailles"
L["Section.Misc"] = "Divers"
L["Section.Profiles"] = "Profils"
L["Section.Share"] = "Partager"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Profils"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Gauche"
L["Anchor.Right"] = "Droite"
L["Anchor.Top"] = "Haut"
L["Anchor.Bottom"] = "Bas"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Afficher l'icône seule"
L["Tweaks.IconOnly.Desc"] = "Masque le nom du CC et le minuteur."
L["Tweaks.HideFrameBg"] = "Masquer fond CC"
L["Tweaks.HideFrameBg.Desc"] = "Masque le fond sombre."
L["Tweaks.HideFrameLines"] = "Masquer les lignes rouges CC"
L["Tweaks.HideFrameLines.Desc"] = "Masque les lignes rouges en haut et en bas."
L["Tweaks.InterruptsOnly"] = "Interruptions uniquement"
L["Tweaks.InterruptsOnly.Desc"] = "Affiche uniquement les interruptions."
L["Tweaks.ShowSecondIcon"] = "Afficher la deuxième icône"
L["Tweaks.ShowSecondIcon.Desc"] = "Affiche une seconde icône pour un second CC qui vous affecte aussi. Particulièrement utile quand vous êtes interrompu et contrôlé en même temps."
L["Tweaks.SecondIconInterruptsOnly"] = "Uniquement les interruptions"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Affiche la seconde icône uniquement pour les interruptions."
L["Tweaks.ShowSchool"] = "Afficher l'école interrompue"
L["Tweaks.ShowSchool.Desc"] = "Affiche l'école sur laquelle vous avez été interrompu."
L["Tweaks.ShowCooldown"] = "Afficher le balayage de recharge sur l'icône"
L["Tweaks.ShowCooldown.Desc"] = "Affiche le balayage du temps de recharge sur l'icône."
L["Tweaks.ReverseSwipe"] = "Balayage inversé"
L["Tweaks.ReverseSwipe.Desc"] = "Inverse le balayage pour que l\'icône commence entièrement visible."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Position du texte CC"
L["Position.SecondaryPosition"] = "Position de la deuxième icône"
L["Position.SecondIconScale"] = "Échelle de la deuxième icône"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Afficher le compte à rebours"
L["Timer.Countdown.Desc"] = "Affiche le temps restant en chiffres sur l'icône."
L["Timer.Milliseconds"] = "Afficher les décimales"
L["Timer.Milliseconds.Desc"] = "Affiche les décimales dès que la couleur basse commence."
L["Timer.HideTimer"] = "Masquer le texte du minuteur"
L["Timer.HideTimer.Desc"] = "Masque le minuteur à côté du texte du CC."
L["Timer.HideName"] = "Masquer le texte du CC"
L["Timer.HideName.Desc"] = "Masque le nom du CC à côté du minuteur."
L["Timer.Font"] = "Police du texte"
L["Timer.NumberFont"] = "Police du minuteur de CD"
L["Timer.LowColor"] = "Couleur basse"
L["Timer.BaseColor"] = "Couleur normale"
L["Timer.HighColor"] = "Couleur haute"
L["Timer.TextScale"] = "Échelle du texte CC"
L["Timer.TimerScale"] = "Taille du texte du minuteur"
L["Timer.CountdownScale"] = "Taille du texte du minuteur de CD"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Forcer les réglages en anglais"
L["Misc.ForceEnglish.Desc"] = "Affiche les réglages de BetterBlizzCC en anglais.\n\nNécessite un rechargement."
L["Misc.ReloadPrompt"] = "Recharger l'interface pour appliquer ce changement ?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Profil actif"
L["Profiles.New"] = "Nouveau"
L["Profiles.New.Desc"] = "Créer un nouveau profil"
L["Profiles.Copy"] = "Copier"
L["Profiles.Copy.Desc"] = "Copier le profil actif dans un nouveau"
L["Profiles.CopyName"] = "Copie de %s"
L["Profiles.Rename"] = "Renommer"
L["Profiles.Rename.Desc"] = "Renommer le profil actif"
L["Profiles.Delete"] = "Supprimer"
L["Profiles.Delete.Desc"] = "Supprimer le profil actif"
L["Profiles.Reset"] = "Réinit."
L["Profiles.Reset.Desc"] = "Réinitialiser le profil actif"
L["Profiles.ExportBox"] = "Exportez, puis copiez le texte avec Ctrl+C"
L["Profiles.Export"] = "Exporter"
L["Profiles.ImportBox"] = "Importer : collez un texte de profil avec Ctrl+V"
L["Profiles.Import"] = "Importer"
L["Profiles.ImportedName"] = "Importé"
L["Profiles.NewPrompt"] = "Nom du nouveau profil :"
L["Profiles.Create"] = "Créer"
L["Profiles.RenamePrompt"] = "Renommer ce profil en :"
L["Profiles.ImportPrompt"] = "Importer ce profil sous le nom :"
L["Profiles.DeleteConfirm"] = "Supprimer le profil \"%s\" ? Action irréversible."
L["Profiles.ResetConfirm"] = "Réinitialiser le profil \"%s\" ?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Aveuglement"
L["Loc.Gouged"] = "Suriner"
L["Loc.Hexed"] = "Maléfice"
L["Loc.MindControlled"] = "Contrôle mental"
L["Loc.Seduced"] = "Séduction"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Aucun"
L["Gui.All"] = "Tous"
L["Gui.ClickToChangeColor"] = "Cliquez pour changer la couleur"
L["Gui.SpecsUseProfile"] = "%d des %d spécialisations %s utilisent ce profil."
L["Gui.ToggleClassSpecs"] = "Cliquez pour activer/désactiver toutes les spécialisations %s."
L["Gui.ToggleWholeClass"] = "Cliquez pour activer/désactiver toute la classe."
L["Gui.CurrentSpec"] = "C'est votre spécialisation actuelle."
L["Gui.SpecUsesProfile"] = "Cette spécialisation utilise le profil \"|cff00c0ff%s|r\". Cliquez pour qu'elle utilise plutôt \"|cff00c0ff%s|r\"."
L["Gui.SliderHint"] = "Astuce pour les curseurs :\n\nVous pouvez saisir des valeurs au-delà des limites par défaut dans la case à droite des curseurs."
L["Gui.SliderTypo"] = "La valeur %s ressemble à une faute de frappe. Voulez-vous vraiment saisir cette valeur ?"
L["Gui.ResetSlider"] = "Voulez-vous vraiment réinitialiser %s à sa valeur par défaut ?"
L["Gui.ResetSliderTip"] = "Astuce : maintenez Maj en faisant un clic droit pour réinitialiser immédiatement sans cette fenêtre"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Impossible de créer ce profil."
L["Msg.Overwriting"] = "Écrasement du profil \"%s\"."
L["Msg.ProfileNameEmpty"] = "Le nom du profil ne peut pas être vide."
L["Msg.ProfileExists"] = "Un profil nommé \"%s\" existe déjà."
L["Msg.ProfileMissing"] = "Ce profil n'existe plus."
L["Msg.DefaultCannotRename"] = "Le profil Default ne peut pas être renommé."
L["Msg.DefaultCannotDelete"] = "Le profil Default ne peut pas être supprimé."
L["Msg.CompressFailed"] = "Impossible de compresser le profil."
L["Msg.NothingToImport"] = "Il n'y a rien à importer."
L["Msg.NotProfileString"] = "Ce n'est pas un profil BetterBlizzCC."
L["Msg.StringDamaged"] = "Le texte du profil est endommagé."
L["Msg.IncompatibleVersion"] = "Ce profil vient d'une version incompatible."
