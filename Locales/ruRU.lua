-- Russian localization for BetterBlizzCC
-- Русская локализация BetterBlizzCC

local _, CC = ...

if GetLocale() ~= "ruRU" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "Тест"
L["Common.Okay"] = "ОК"
L["Common.Cancel"] = "Отмена"
L["Common.Delete"] = "Удалить"
L["Common.Reset"] = "Сброс"
L["Common.ReloadUI"] = "Перезагрузка"
L["Common.Yes"] = "Да"
L["Common.No"] = "Нет"
L["Common.Default"] = "По умолчанию"
L["Common.Scale"] = "Масштаб"
L["Common.HorizontalPosition"] = "Положение по горизонтали"
L["Common.VerticalPosition"] = "Положение по вертикали"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "Правки"
L["Section.PositionScale"] = "Положение и масштаб"
L["Section.TimerText"] = "Текст таймера"
L["Section.Colors"] = "Цвета"
L["Section.Sizes"] = "Размеры"
L["Section.Misc"] = "Разное"
L["Section.Profiles"] = "Профили"
L["Section.Share"] = "Обмен"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "Профили"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "Слева"
L["Anchor.Right"] = "Справа"
L["Anchor.Top"] = "Сверху"
L["Anchor.Bottom"] = "Снизу"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "Только иконка"
L["Tweaks.IconOnly.Desc"] = "Скрывает название контроля и таймер."
L["Tweaks.HideFrameBg"] = "Скрыть фон КК"
L["Tweaks.HideFrameBg.Desc"] = "Скрывает тёмный фон."
L["Tweaks.HideFrameLines"] = "Скрыть красные линии"
L["Tweaks.HideFrameLines.Desc"] = "Скрывает красные линии сверху и снизу."
L["Tweaks.InterruptsOnly"] = "Только прерывания"
L["Tweaks.InterruptsOnly.Desc"] = "Показывает только прерывания."
L["Tweaks.ShowSecondIcon"] = "Показывать второй значок"
L["Tweaks.ShowSecondIcon.Desc"] = "Показывает второй значок для второго контроля, действующего на вас. Особенно полезно, когда вас одновременно прерывают и контролируют."
L["Tweaks.SecondIconInterruptsOnly"] = "Только прерывания"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "Показывать второй значок только для прерываний."
L["Tweaks.ShowSchool"] = "Показывать прерванную школу"
L["Tweaks.ShowSchool.Desc"] = "Показывает школу, на которой вас прервали."
L["Tweaks.ShowCooldown"] = "Анимация восстановления на иконке"
L["Tweaks.ShowCooldown.Desc"] = "Показывает анимацию восстановления на иконке."
L["Tweaks.ReverseSwipe"] = "Обратная анимация"
L["Tweaks.ReverseSwipe.Desc"] = "Обратная анимация: значок сначала виден полностью."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "Положение текста контроля"
L["Position.SecondaryPosition"] = "Положение второй иконки"
L["Position.SecondIconScale"] = "Масштаб второго значка"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "Цифры отсчёта"
L["Timer.Countdown.Desc"] = "Показывает оставшееся время цифрами на иконке."
L["Timer.Milliseconds"] = "Показывать десятые"
L["Timer.Milliseconds.Desc"] = "Показывает десятые доли, когда начинается цвет предупреждения."
L["Timer.HideTimer"] = "Скрыть текст таймера"
L["Timer.HideTimer.Desc"] = "Скрывает таймер рядом с текстом контроля."
L["Timer.HideName"] = "Скрыть текст контроля"
L["Timer.HideName.Desc"] = "Скрывает название контроля рядом с таймером."
L["Timer.Font"] = "Шрифт текста"
L["Timer.NumberFont"] = "Шрифт таймера КД"
L["Timer.LowColor"] = "Цвет предупреждения"
L["Timer.BaseColor"] = "Обычный цвет"
L["Timer.HighColor"] = "Цвет долгого времени"
L["Timer.TextScale"] = "Масштаб текста контроля"
L["Timer.TimerScale"] = "Размер текста таймера"
L["Timer.CountdownScale"] = "Размер текста таймера КД"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "Настройки на английском"
L["Misc.ForceEnglish.Desc"] = "Показывает настройки BetterBlizzCC на английском.\n\nТребуется перезагрузка."
L["Misc.ReloadPrompt"] = "Перезагрузить интерфейс, чтобы применить изменение?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "Активный профиль"
L["Profiles.New"] = "Создать"
L["Profiles.New.Desc"] = "Создать новый профиль"
L["Profiles.Copy"] = "Копия"
L["Profiles.Copy.Desc"] = "Скопировать активный профиль в новый"
L["Profiles.CopyName"] = "Копия %s"
L["Profiles.Rename"] = "Переимен."
L["Profiles.Rename.Desc"] = "Переименовать активный профиль"
L["Profiles.Delete"] = "Удалить"
L["Profiles.Delete.Desc"] = "Удалить активный профиль"
L["Profiles.Reset"] = "Сброс"
L["Profiles.Reset.Desc"] = "Сбросить активный профиль"
L["Profiles.ExportBox"] = "Экспортируйте и скопируйте строку через Ctrl+C"
L["Profiles.Export"] = "Экспорт"
L["Profiles.ImportBox"] = "Импорт: вставьте строку профиля через Ctrl+V"
L["Profiles.Import"] = "Импорт"
L["Profiles.ImportedName"] = "Импортированный"
L["Profiles.NewPrompt"] = "Название нового профиля:"
L["Profiles.Create"] = "Создать"
L["Profiles.RenamePrompt"] = "Новое название профиля:"
L["Profiles.ImportPrompt"] = "Импортировать профиль как:"
L["Profiles.DeleteConfirm"] = "Удалить профиль «%s»? Это действие нельзя отменить."
L["Profiles.ResetConfirm"] = "Сбросить профиль «%s» к значениям по умолчанию?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "Ослепление"
L["Loc.Gouged"] = "Выведен из строя"
L["Loc.Hexed"] = "Сглаз"
L["Loc.MindControlled"] = "Контроль над разумом"
L["Loc.Seduced"] = "Соблазнение"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "Нет"
L["Gui.All"] = "Все"
L["Gui.ClickToChangeColor"] = "Нажмите, чтобы изменить цвет"
L["Gui.SpecsUseProfile"] = "%d из %d спец. (%s) используют этот профиль."
L["Gui.ToggleClassSpecs"] = "Нажмите, чтобы переключить все специализации (%s)."
L["Gui.ToggleWholeClass"] = "Нажмите, чтобы переключить весь класс."
L["Gui.CurrentSpec"] = "Это ваша текущая специализация."
L["Gui.SpecUsesProfile"] = "Эта специализация использует профиль «|cff00c0ff%s|r». Нажмите, чтобы переключить её на «|cff00c0ff%s|r»."
L["Gui.SliderHint"] = "Совет по ползункам:\n\nВ поле справа от ползунка можно ввести значение за пределами стандартного диапазона."
L["Gui.SliderTypo"] = "Значение %s похоже на опечатку. Вы уверены, что хотите ввести именно его?"
L["Gui.ResetSlider"] = "Сбросить %s до значения по умолчанию?"
L["Gui.ResetSliderTip"] = "Совет: удерживайте Shift при щелчке правой кнопкой, чтобы сбросить сразу без этого окна"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "Не удалось создать профиль."
L["Msg.Overwriting"] = "Перезапись профиля «%s»."
L["Msg.ProfileNameEmpty"] = "Название профиля не может быть пустым."
L["Msg.ProfileExists"] = "Профиль «%s» уже существует."
L["Msg.ProfileMissing"] = "Этого профиля больше нет."
L["Msg.DefaultCannotRename"] = "Профиль Default нельзя переименовать."
L["Msg.DefaultCannotDelete"] = "Профиль Default нельзя удалить."
L["Msg.CompressFailed"] = "Не удалось сжать профиль."
L["Msg.NothingToImport"] = "Нечего импортировать."
L["Msg.NotProfileString"] = "Это не профиль BetterBlizzCC."
L["Msg.StringDamaged"] = "Строка профиля повреждена."
L["Msg.IncompatibleVersion"] = "Этот профиль из несовместимой версии."
