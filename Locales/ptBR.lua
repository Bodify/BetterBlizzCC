-- Portuguese (Brazil) localization for BetterBlizzCC
-- Localização em português (Brasil) do BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "ptBR" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Teste"
L["Common.Okay"] = "Ok"
L["Common.Cancel"] = "Cancelar"
L["Common.Delete"] = "Excluir"
L["Common.Reset"] = "Reiniciar"
L["Common.ReloadUI"] = "Recarregar IU"
L["Common.Yes"] = "Sim"
L["Common.No"] = "Não"
L["Common.Default"] = "Padrão"
L["Common.Scale"] = "Escala"
L["Common.HorizontalPosition"] = "Posição horizontal"
L["Common.VerticalPosition"] = "Posição vertical"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Ajustes"
L["Section.PositionScale"] = "Posição e escala"
L["Section.TimerText"] = "Texto do cronômetro"
L["Section.Colors"] = "Cores"
L["Section.Sizes"] = "Tamanhos"
L["Section.Misc"] = "Diversos"
L["Section.Profiles"] = "Perfis"
L["Section.Share"] = "Compartilhar"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Perfis"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Esquerda"
L["Anchor.Right"] = "Direita"
L["Anchor.Top"] = "Superior"
L["Anchor.Bottom"] = "Inferior"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Mostrar só o ícone"
L["Tweaks.IconOnly.Desc"] = "Oculta o nome do CC e o cronômetro."
L["Tweaks.HideFrameBg"] = "Ocultar fundo de CC"
L["Tweaks.HideFrameBg.Desc"] = "Oculta o fundo escuro."
L["Tweaks.HideFrameLines"] = "Ocultar linhas vermelhas de CC"
L["Tweaks.HideFrameLines.Desc"] = "Oculta as linhas vermelhas acima e abaixo."
L["Tweaks.InterruptsOnly"] = "Só interrupções"
L["Tweaks.InterruptsOnly.Desc"] = "Mostra só interrupções."
L["Tweaks.ShowSecondIcon"] = "Mostrar segundo ícone"
L["Tweaks.ShowSecondIcon.Desc"] = "Mostra um segundo ícone para um segundo CC que também te afeta. Especialmente útil quando você é interrompido e controlado ao mesmo tempo."
L["Tweaks.SecondIconInterruptsOnly"] = "Somente para interrupções"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Mostra o segundo ícone somente para interrupções."
L["Tweaks.ShowSchool"] = "Mostrar escola interrompida"
L["Tweaks.ShowSchool.Desc"] = "Mostra a escola em que você foi interrompido."
L["Tweaks.ShowCooldown"] = "Mostrar animação de recarga no ícone"
L["Tweaks.ShowCooldown.Desc"] = "Mostra a animação de recarga no ícone."
L["Tweaks.ReverseSwipe"] = "Varredura invertida"
L["Tweaks.ReverseSwipe.Desc"] = "Inverte a varredura para o ícone começar totalmente visível."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Posição do texto de CC"
L["Position.SecondaryPosition"] = "Posição do segundo ícone"
L["Position.SecondIconScale"] = "Escala do segundo ícone"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Mostrar contagem regressiva"
L["Timer.Countdown.Desc"] = "Mostra o tempo restante em números no ícone."
L["Timer.Milliseconds"] = "Mostrar decimais"
L["Timer.Milliseconds.Desc"] = "Mostra decimais quando a cor de alerta começa."
L["Timer.HideTimer"] = "Ocultar texto do temporizador"
L["Timer.HideTimer.Desc"] = "Oculta o temporizador ao lado do texto do CC."
L["Timer.HideName"] = "Ocultar texto do CC"
L["Timer.HideName.Desc"] = "Oculta o nome do CC ao lado do temporizador."
L["Timer.Font"] = "Fonte do texto"
L["Timer.NumberFont"] = "Fonte do temporizador de CD"
L["Timer.LowColor"] = "Cor de alerta"
L["Timer.BaseColor"] = "Cor normal"
L["Timer.HighColor"] = "Cor de tempo longo"
L["Timer.TextScale"] = "Escala do texto de CC"
L["Timer.TimerScale"] = "Tamanho do texto do cronômetro"
L["Timer.CountdownScale"] = "Tamanho do texto do temporizador de CD"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Forçar configurações em inglês"
L["Misc.ForceEnglish.Desc"] = "Mostra as configurações do BetterBlizzCC em inglês.\n\nRequer recarregar."
L["Misc.ReloadPrompt"] = "Recarregar a interface para aplicar a mudança?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Perfil ativo"
L["Profiles.New"] = "Novo"
L["Profiles.New.Desc"] = "Criar um novo perfil"
L["Profiles.Copy"] = "Copiar"
L["Profiles.Copy.Desc"] = "Copiar o perfil ativo para um novo"
L["Profiles.CopyName"] = "%s (cópia)"
L["Profiles.Rename"] = "Renomear"
L["Profiles.Rename.Desc"] = "Renomear o perfil ativo"
L["Profiles.Delete"] = "Excluir"
L["Profiles.Delete.Desc"] = "Excluir o perfil ativo"
L["Profiles.Reset"] = "Redefinir"
L["Profiles.Reset.Desc"] = "Redefinir o perfil ativo"
L["Profiles.ExportBox"] = "Exporte e copie o texto com Ctrl+C"
L["Profiles.Export"] = "Exportar"
L["Profiles.ImportBox"] = "Importar: cole um texto de perfil com Ctrl+V"
L["Profiles.Import"] = "Importar"
L["Profiles.ImportedName"] = "Importado"
L["Profiles.NewPrompt"] = "Nome do novo perfil:"
L["Profiles.Create"] = "Criar"
L["Profiles.RenamePrompt"] = "Renomear este perfil para:"
L["Profiles.ImportPrompt"] = "Importar este perfil como:"
L["Profiles.DeleteConfirm"] = "Excluir o perfil \"%s\"? Isso não pode ser desfeito."
L["Profiles.ResetConfirm"] = "Redefinir o perfil \"%s\" para o padrão?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Cegado"
L["Loc.Gouged"] = "Incapacitado"
L["Loc.Hexed"] = "Enfeitiçado"
L["Loc.MindControlled"] = "Controlado mentalmente"
L["Loc.Seduced"] = "Seduzido"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Nenhum"
L["Gui.All"] = "Tudo"
L["Gui.ClickToChangeColor"] = "Clique para mudar a cor"
L["Gui.SpecsUseProfile"] = "%d de %d especializações de %s usam este perfil."
L["Gui.ToggleClassSpecs"] = "Clique para alternar todas as especializações de %s."
L["Gui.ToggleWholeClass"] = "Clique para alternar a classe inteira."
L["Gui.CurrentSpec"] = "Esta é a sua especialização atual."
L["Gui.SpecUsesProfile"] = "Esta especialização usa o perfil \"|cff00c0ff%s|r\". Clique para usar \"|cff00c0ff%s|r\" em vez disso."
L["Gui.SliderHint"] = "Dica sobre os controles deslizantes:\n\nNa caixa à direita dos controles você pode digitar valores acima ou abaixo da faixa padrão."
L["Gui.SliderTypo"] = "O valor %s parece um erro de digitação. Tem certeza de que quer usar este valor?"
L["Gui.ResetSlider"] = "Tem certeza de que deseja redefinir %s para o valor padrão?"
L["Gui.ResetSliderTip"] = "Dica: segure Shift ao clicar com o botão direito para redefinir imediatamente sem esta janela"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Não foi possível criar esse perfil."
L["Msg.Overwriting"] = "Sobrescrevendo o perfil \"%s\"."
L["Msg.ProfileNameEmpty"] = "O nome do perfil não pode ficar vazio."
L["Msg.ProfileExists"] = "Já existe um perfil chamado \"%s\"."
L["Msg.ProfileMissing"] = "Esse perfil não existe mais."
L["Msg.DefaultCannotRename"] = "O perfil Default não pode ser renomeado."
L["Msg.DefaultCannotDelete"] = "O perfil Default não pode ser excluído."
L["Msg.CompressFailed"] = "Não foi possível compactar o perfil."
L["Msg.NothingToImport"] = "Não há nada para importar."
L["Msg.NotProfileString"] = "Não é um perfil do BetterBlizzCC."
L["Msg.StringDamaged"] = "O texto do perfil está danificado."
L["Msg.IncompatibleVersion"] = "Este perfil é de uma versão incompatível."
