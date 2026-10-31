-- Italian localization for BetterBlizzCC
-- Localizzazione italiana di BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "itIT" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Test"
L["Common.Okay"] = "OK"
L["Common.Cancel"] = "Annulla"
L["Common.Delete"] = "Elimina"
L["Common.Reset"] = "Reimposta"
L["Common.ReloadUI"] = "Riavvio IU"
L["Common.Yes"] = "Sì"
L["Common.No"] = "No"
L["Common.Default"] = "Predefinito"
L["Common.Scale"] = "Scala"
L["Common.HorizontalPosition"] = "Posizione orizzontale"
L["Common.VerticalPosition"] = "Posizione verticale"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Modifiche"
L["Section.PositionScale"] = "Posizione e scala"
L["Section.TimerText"] = "Testo timer"
L["Section.Colors"] = "Colori"
L["Section.Sizes"] = "Dimensioni"
L["Section.Misc"] = "Varie"
L["Section.Profiles"] = "Profili"
L["Section.Share"] = "Condividi"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Profili"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "A sinistra"
L["Anchor.Right"] = "A destra"
L["Anchor.Top"] = "In alto"
L["Anchor.Bottom"] = "In basso"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Mostra solo icona"
L["Tweaks.IconOnly.Desc"] = "Nasconde il nome del CC e il timer."
L["Tweaks.HideFrameBg"] = "Nascondi sfondo CC"
L["Tweaks.HideFrameBg.Desc"] = "Nasconde lo sfondo scuro."
L["Tweaks.HideFrameLines"] = "Nascondi linee rosse CC"
L["Tweaks.HideFrameLines.Desc"] = "Nasconde le linee rosse sopra e sotto."
L["Tweaks.InterruptsOnly"] = "Solo interruzioni"
L["Tweaks.InterruptsOnly.Desc"] = "Mostra solo le interruzioni."
L["Tweaks.ShowSecondIcon"] = "Mostra seconda icona"
L["Tweaks.ShowSecondIcon.Desc"] = "Mostra una seconda icona per un secondo CC che ti colpisce. Particolarmente utile quando vieni interrotto e controllato nello stesso momento."
L["Tweaks.SecondIconInterruptsOnly"] = "Solo per interruzioni"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Mostra la seconda icona solo per le interruzioni."
L["Tweaks.ShowSchool"] = "Mostra scuola interrotta"
L["Tweaks.ShowSchool.Desc"] = "Mostra la scuola su cui sei stato interrotto."
L["Tweaks.ShowCooldown"] = "Mostra animazione di recupero sull'icona"
L["Tweaks.ShowCooldown.Desc"] = "Mostra l'animazione del recupero sull'icona."
L["Tweaks.ReverseSwipe"] = "Scorrimento inverso"
L["Tweaks.ReverseSwipe.Desc"] = "Inverte l\'animazione così l\'icona parte completamente visibile."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Posizione del testo CC"
L["Position.SecondaryPosition"] = "Posizione seconda icona"
L["Position.SecondIconScale"] = "Scala della seconda icona"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Mostra conto alla rovescia"
L["Timer.Countdown.Desc"] = "Mostra il tempo rimanente in numeri sull'icona."
L["Timer.Milliseconds"] = "Mostra decimali"
L["Timer.Milliseconds.Desc"] = "Mostra i decimali quando inizia il colore di avviso."
L["Timer.HideTimer"] = "Nascondi testo del timer"
L["Timer.HideTimer.Desc"] = "Nasconde il timer accanto al testo del CC."
L["Timer.HideName"] = "Nascondi testo del CC"
L["Timer.HideName.Desc"] = "Nasconde il nome del CC accanto al timer."
L["Timer.Font"] = "Carattere del testo"
L["Timer.NumberFont"] = "Carattere timer CD"
L["Timer.LowColor"] = "Colore di avviso"
L["Timer.BaseColor"] = "Colore normale"
L["Timer.HighColor"] = "Colore tempo lungo"
L["Timer.TextScale"] = "Scala del testo CC"
L["Timer.TimerScale"] = "Dimensione testo timer"
L["Timer.CountdownScale"] = "Dimensione testo timer CD"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Forza testo impostazioni in inglese"
L["Misc.ForceEnglish.Desc"] = "Mostra le impostazioni di BetterBlizzCC in inglese.\n\nRichiede un ricaricamento."
L["Misc.ReloadPrompt"] = "Ricaricare l'interfaccia per applicare la modifica?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Profilo attivo"
L["Profiles.New"] = "Nuovo"
L["Profiles.New.Desc"] = "Crea un nuovo profilo"
L["Profiles.Copy"] = "Copia"
L["Profiles.Copy.Desc"] = "Copia il profilo attivo in uno nuovo"
L["Profiles.CopyName"] = "Copia di %s"
L["Profiles.Rename"] = "Rinomina"
L["Profiles.Rename.Desc"] = "Rinomina il profilo attivo"
L["Profiles.Delete"] = "Elimina"
L["Profiles.Delete.Desc"] = "Elimina il profilo attivo"
L["Profiles.Reset"] = "Ripristina"
L["Profiles.Reset.Desc"] = "Ripristina il profilo attivo"
L["Profiles.ExportBox"] = "Esporta, poi copia il testo con Ctrl+C"
L["Profiles.Export"] = "Esporta"
L["Profiles.ImportBox"] = "Importa: incolla un testo di profilo con Ctrl+V"
L["Profiles.Import"] = "Importa"
L["Profiles.ImportedName"] = "Importato"
L["Profiles.NewPrompt"] = "Nome del nuovo profilo:"
L["Profiles.Create"] = "Crea"
L["Profiles.RenamePrompt"] = "Rinomina questo profilo in:"
L["Profiles.ImportPrompt"] = "Importa questo profilo come:"
L["Profiles.DeleteConfirm"] = "Eliminare il profilo \"%s\"? L'operazione non si può annullare."
L["Profiles.ResetConfirm"] = "Ripristinare il profilo \"%s\" ai valori predefiniti?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Accecato"
L["Loc.Gouged"] = "Inabilitato"
L["Loc.Hexed"] = "Maledetto"
L["Loc.MindControlled"] = "Controllato mentalmente"
L["Loc.Seduced"] = "Sedotto"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Nessuno"
L["Gui.All"] = "Tutto"
L["Gui.ClickToChangeColor"] = "Clicca per cambiare colore"
L["Gui.SpecsUseProfile"] = "%d di %d specializzazioni %s usano questo profilo."
L["Gui.ToggleClassSpecs"] = "Clicca per attivare o disattivare ogni specializzazione %s."
L["Gui.ToggleWholeClass"] = "Clicca per attivare o disattivare l'intera classe."
L["Gui.CurrentSpec"] = "Questa è la tua specializzazione attuale."
L["Gui.SpecUsesProfile"] = "Questa specializzazione usa il profilo \"|cff00c0ff%s|r\". Clicca per farle usare \"|cff00c0ff%s|r\"."
L["Gui.SliderHint"] = "Suggerimento per i cursori:\n\nNella casella a destra dei cursori puoi inserire valori oltre i limiti predefiniti."
L["Gui.SliderTypo"] = "Il valore %s sembra un errore di battitura, sei sicuro di voler inserire questo valore?"
L["Gui.ResetSlider"] = "Vuoi davvero ripristinare %s al valore predefinito?"
L["Gui.ResetSliderTip"] = "Suggerimento: tieni premuto Maiusc mentre fai clic destro per ripristinare subito senza questa finestra"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Impossibile creare il profilo."
L["Msg.Overwriting"] = "Sovrascrittura del profilo \"%s\"."
L["Msg.ProfileNameEmpty"] = "Il nome del profilo non può essere vuoto."
L["Msg.ProfileExists"] = "Esiste già un profilo chiamato \"%s\"."
L["Msg.ProfileMissing"] = "Quel profilo non esiste più."
L["Msg.DefaultCannotRename"] = "Il profilo Default non può essere rinominato."
L["Msg.DefaultCannotDelete"] = "Il profilo Default non può essere eliminato."
L["Msg.CompressFailed"] = "Impossibile comprimere il profilo."
L["Msg.NothingToImport"] = "Non c'è niente da importare."
L["Msg.NotProfileString"] = "Non è un profilo di BetterBlizzCC."
L["Msg.StringDamaged"] = "Il testo del profilo è danneggiato."
L["Msg.IncompatibleVersion"] = "Questo profilo proviene da una versione incompatibile."
