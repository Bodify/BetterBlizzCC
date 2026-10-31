-- Spanish (Spain) localization for BetterBlizzCC
-- Localización al español (España) de BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "esES" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Probar"
L["Common.Okay"] = "Aceptar"
L["Common.Cancel"] = "Cancelar"
L["Common.Delete"] = "Eliminar"
L["Common.Reset"] = "Restablecer"
L["Common.ReloadUI"] = "Reiniciar IU"
L["Common.Yes"] = "Sí"
L["Common.No"] = "No"
L["Common.Default"] = "Predeterminada"
L["Common.Scale"] = "Escala"
L["Common.HorizontalPosition"] = "Posición horizontal"
L["Common.VerticalPosition"] = "Posición vertical"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Ajustes"
L["Section.PositionScale"] = "Posición y escala"
L["Section.TimerText"] = "Texto del temporizador"
L["Section.Colors"] = "Colores"
L["Section.Sizes"] = "Tamaños"
L["Section.Misc"] = "Miscelánea"
L["Section.Profiles"] = "Perfiles"
L["Section.Share"] = "Compartir"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Perfiles"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Izquierda"
L["Anchor.Right"] = "Derecha"
L["Anchor.Top"] = "Arriba"
L["Anchor.Bottom"] = "Abajo"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Mostrar solo icono"
L["Tweaks.IconOnly.Desc"] = "Oculta el nombre del CC y el temporizador."
L["Tweaks.HideFrameBg"] = "Ocultar fondo de CC"
L["Tweaks.HideFrameBg.Desc"] = "Oculta el fondo oscuro."
L["Tweaks.HideFrameLines"] = "Ocultar líneas rojas de CC"
L["Tweaks.HideFrameLines.Desc"] = "Oculta las líneas rojas de arriba y abajo."
L["Tweaks.InterruptsOnly"] = "Solo interrupciones"
L["Tweaks.InterruptsOnly.Desc"] = "Muestra solo interrupciones."
L["Tweaks.ShowSecondIcon"] = "Mostrar segundo icono"
L["Tweaks.ShowSecondIcon.Desc"] = "Muestra un segundo icono para un segundo CC que también te afecte. Especialmente útil cuando te interrumpen y te controlan a la vez."
L["Tweaks.SecondIconInterruptsOnly"] = "Solo para interrupciones"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Muestra el segundo icono solo para interrupciones."
L["Tweaks.ShowSchool"] = "Mostrar escuela interrumpida"
L["Tweaks.ShowSchool.Desc"] = "Muestra la escuela en la que te interrumpieron."
L["Tweaks.ShowCooldown"] = "Mostrar barrido de reutilización en el icono"
L["Tweaks.ShowCooldown.Desc"] = "Muestra el barrido de reutilización en el icono."
L["Tweaks.ReverseSwipe"] = "Barrido inverso"
L["Tweaks.ReverseSwipe.Desc"] = "Invierte la animación para que el icono empiece totalmente visible."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Posición del texto de CC"
L["Position.SecondaryPosition"] = "Posición del segundo icono"
L["Position.SecondIconScale"] = "Escala del segundo icono"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Mostrar cuenta atrás"
L["Timer.Countdown.Desc"] = "Muestra el tiempo restante en números sobre el icono."
L["Timer.Milliseconds"] = "Mostrar decimales"
L["Timer.Milliseconds.Desc"] = "Muestra decimales cuando empieza el color de aviso."
L["Timer.HideTimer"] = "Ocultar texto del temporizador"
L["Timer.HideTimer.Desc"] = "Oculta el temporizador junto al texto del CC."
L["Timer.HideName"] = "Ocultar texto del CC"
L["Timer.HideName.Desc"] = "Oculta el nombre del CC junto al temporizador."
L["Timer.Font"] = "Fuente del texto"
L["Timer.NumberFont"] = "Fuente del temporizador de CD"
L["Timer.LowColor"] = "Color de aviso"
L["Timer.BaseColor"] = "Color normal"
L["Timer.HighColor"] = "Color de tiempo largo"
L["Timer.TextScale"] = "Escala del texto de CC"
L["Timer.TimerScale"] = "Tamaño del texto del temporizador"
L["Timer.CountdownScale"] = "Tamaño del texto del temporizador de CD"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Forzar texto de ajustes en inglés"
L["Misc.ForceEnglish.Desc"] = "Muestra los ajustes de BetterBlizzCC en inglés.\n\nRequiere recargar."
L["Misc.ReloadPrompt"] = "¿Recargar la IU para aplicar el cambio?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Perfil activo"
L["Profiles.New"] = "Nuevo"
L["Profiles.New.Desc"] = "Crear un perfil nuevo"
L["Profiles.Copy"] = "Copiar"
L["Profiles.Copy.Desc"] = "Copiar el perfil activo en uno nuevo"
L["Profiles.CopyName"] = "Copia de %s"
L["Profiles.Rename"] = "Renombrar"
L["Profiles.Rename.Desc"] = "Renombrar el perfil activo"
L["Profiles.Delete"] = "Borrar"
L["Profiles.Delete.Desc"] = "Borrar el perfil activo"
L["Profiles.Reset"] = "Restab."
L["Profiles.Reset.Desc"] = "Restablecer el perfil activo"
L["Profiles.ExportBox"] = "Exporta y copia el texto con Ctrl+C"
L["Profiles.Export"] = "Exportar"
L["Profiles.ImportBox"] = "Importar: pega un texto de perfil con Ctrl+V"
L["Profiles.Import"] = "Importar"
L["Profiles.ImportedName"] = "Importado"
L["Profiles.NewPrompt"] = "Nombre del perfil nuevo:"
L["Profiles.Create"] = "Crear"
L["Profiles.RenamePrompt"] = "Renombrar este perfil a:"
L["Profiles.ImportPrompt"] = "Importar este perfil como:"
L["Profiles.DeleteConfirm"] = "¿Borrar el perfil \"%s\"? No se puede deshacer."
L["Profiles.ResetConfirm"] = "¿Restablecer el perfil \"%s\" a los valores predeterminados?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Cegado"
L["Loc.Gouged"] = "Incapacitado"
L["Loc.Hexed"] = "Maleficiado"
L["Loc.MindControlled"] = "Controlado mentalmente"
L["Loc.Seduced"] = "Seducido"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Ninguno"
L["Gui.All"] = "Todo"
L["Gui.ClickToChangeColor"] = "Haz clic para cambiar el color"
L["Gui.SpecsUseProfile"] = "%d de %d especializaciones de %s usan este perfil."
L["Gui.ToggleClassSpecs"] = "Haz clic para alternar todas las especializaciones de %s."
L["Gui.ToggleWholeClass"] = "Haz clic para alternar toda la clase."
L["Gui.CurrentSpec"] = "Esta es tu especialización actual."
L["Gui.SpecUsesProfile"] = "Esta especialización usa el perfil \"|cff00c0ff%s|r\". Haz clic para que use \"|cff00c0ff%s|r\" en su lugar."
L["Gui.SliderHint"] = "Consejo sobre los deslizadores:\n\nPuedes introducir valores por encima o por debajo del rango predeterminado en la casilla a la derecha de cada deslizador."
L["Gui.SliderTypo"] = "El valor %s parece una errata, ¿seguro que quieres introducir este valor?"
L["Gui.ResetSlider"] = "¿Seguro que quieres restablecer %s a su valor predeterminado?"
L["Gui.ResetSliderTip"] = "Consejo: Mantén Mayús al hacer clic derecho para restablecer al instante sin esta ventana"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "No se ha podido crear ese perfil."
L["Msg.Overwriting"] = "Sobrescribiendo el perfil \"%s\"."
L["Msg.ProfileNameEmpty"] = "El nombre del perfil no puede estar vacío."
L["Msg.ProfileExists"] = "Ya existe un perfil llamado \"%s\"."
L["Msg.ProfileMissing"] = "Ese perfil ya no existe."
L["Msg.DefaultCannotRename"] = "El perfil Default no se puede renombrar."
L["Msg.DefaultCannotDelete"] = "El perfil Default no se puede borrar."
L["Msg.CompressFailed"] = "No se ha podido comprimir el perfil."
L["Msg.NothingToImport"] = "No hay nada que importar."
L["Msg.NotProfileString"] = "No es un perfil de BetterBlizzCC."
L["Msg.StringDamaged"] = "El texto del perfil está dañado."
L["Msg.IncompatibleVersion"] = "Este perfil es de una versión incompatible."
