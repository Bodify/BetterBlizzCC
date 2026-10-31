-- Korean localization for BetterBlizzCC
-- BetterBlizzCC 한국어 현지화

local _, CC = ...

if GetLocale() ~= "koKR" then return end

local L = CC.L_native

---------------------------------------
-- Common
---------------------------------------

L["Common.Test"] = "테스트"
L["Common.Okay"] = "확인"
L["Common.Cancel"] = "취소"
L["Common.Delete"] = "삭제"
L["Common.Reset"] = "새로고침"
L["Common.ReloadUI"] = "UI 재시작"
L["Common.Yes"] = "예"
L["Common.No"] = "아니요"
L["Common.Default"] = "기본값"
L["Common.Scale"] = "크기"
L["Common.HorizontalPosition"] = "가로 위치"
L["Common.VerticalPosition"] = "세로 위치"

---------------------------------------
-- Section titles
---------------------------------------

L["Section.Tweaks"] = "세부 설정"
L["Section.PositionScale"] = "위치 및 크기"
L["Section.TimerText"] = "타이머 텍스트"
L["Section.Colors"] = "색상"
L["Section.Sizes"] = "크기"
L["Section.Misc"] = "기타"
L["Section.Profiles"] = "프로필"
L["Section.Share"] = "공유"

---------------------------------------
-- Pages
---------------------------------------

L["Page.Profiles"] = "프로필"

---------------------------------------
-- Anchors
---------------------------------------

L["Anchor.Left"] = "왼쪽"
L["Anchor.Right"] = "오른쪽"
L["Anchor.Top"] = "위"
L["Anchor.Bottom"] = "아래"

---------------------------------------
-- Tweaks
---------------------------------------

L["Tweaks.IconOnly"] = "아이콘만 표시"
L["Tweaks.IconOnly.Desc"] = "군중 제어 이름과 타이머를 숨깁니다."
L["Tweaks.HideFrameBg"] = "CC 배경 숨기기"
L["Tweaks.HideFrameBg.Desc"] = "어두운 배경을 숨깁니다."
L["Tweaks.HideFrameLines"] = "CC 빨간 선 숨기기"
L["Tweaks.HideFrameLines.Desc"] = "위아래 빨간 선을 숨깁니다."
L["Tweaks.InterruptsOnly"] = "차단만"
L["Tweaks.InterruptsOnly.Desc"] = "차단만 표시합니다."
L["Tweaks.ShowSecondIcon"] = "두 번째 아이콘 표시"
L["Tweaks.ShowSecondIcon.Desc"] = "함께 걸린 두 번째 군중 제어를 두 번째 아이콘으로 표시합니다. 차단과 군중 제어를 동시에 당했을 때 특히 유용합니다."
L["Tweaks.SecondIconInterruptsOnly"] = "차단만"
L["Tweaks.SecondIconInterruptsOnly.Desc"] = "두 번째 아이콘을 차단에만 표시합니다."
L["Tweaks.ShowSchool"] = "차단된 계열 표시"
L["Tweaks.ShowSchool.Desc"] = "차단당한 주문 계열을 표시합니다."
L["Tweaks.ShowCooldown"] = "아이콘에 재사용 대기시간 애니메이션 표시"
L["Tweaks.ShowCooldown.Desc"] = "아이콘에 재사용 대기시간 애니메이션을 표시합니다."
L["Tweaks.ReverseSwipe"] = "역방향 쓸기"
L["Tweaks.ReverseSwipe.Desc"] = "쓸기 효과를 반대로 하여 아이콘이 처음에 완전히 보이게 합니다."

---------------------------------------
-- Position & Scale
---------------------------------------

L["Position.TextPosition"] = "군중 제어 텍스트 위치"
L["Position.SecondaryPosition"] = "두 번째 아이콘 위치"
L["Position.SecondIconScale"] = "두 번째 아이콘 크기"

---------------------------------------
-- Timer Text
---------------------------------------

L["Timer.Countdown"] = "카운트다운 숫자 표시"
L["Timer.Countdown.Desc"] = "남은 시간을 아이콘에 숫자로 표시합니다."
L["Timer.Milliseconds"] = "소수점 표시"
L["Timer.Milliseconds.Desc"] = "낮은 시간 색상이 시작되면 소수점을 표시합니다."
L["Timer.HideTimer"] = "타이머 텍스트 숨기기"
L["Timer.HideTimer.Desc"] = "군중 제어 텍스트 옆의 타이머를 숨깁니다."
L["Timer.HideName"] = "군중 제어 텍스트 숨기기"
L["Timer.HideName.Desc"] = "타이머 옆의 군중 제어 이름을 숨깁니다."
L["Timer.Font"] = "텍스트 글꼴"
L["Timer.NumberFont"] = "쿨다운 타이머 글꼴"
L["Timer.LowColor"] = "낮은 시간 색상"
L["Timer.BaseColor"] = "보통 색상"
L["Timer.HighColor"] = "높은 시간 색상"
L["Timer.TextScale"] = "군중 제어 텍스트 크기"
L["Timer.TimerScale"] = "타이머 텍스트 크기"
L["Timer.CountdownScale"] = "쿨다운 타이머 글자 크기"

---------------------------------------
-- Misc
---------------------------------------

L["Misc.ForceEnglish"] = "설정 텍스트 영어로 강제"
L["Misc.ForceEnglish.Desc"] = "BetterBlizzCC 설정을 영어로 표시합니다.\n\nUI 재시작이 필요합니다."
L["Misc.ReloadPrompt"] = "변경 사항을 적용하려면 UI를 재시작할까요?"

---------------------------------------
-- Profiles
---------------------------------------

L["Profiles.Active"] = "활성 프로필"
L["Profiles.New"] = "새로 만들기"
L["Profiles.New.Desc"] = "새 프로필 만들기"
L["Profiles.Copy"] = "복사"
L["Profiles.Copy.Desc"] = "활성 프로필을 새 프로필로 복사"
L["Profiles.CopyName"] = "%s 복사본"
L["Profiles.Rename"] = "이름 변경"
L["Profiles.Rename.Desc"] = "활성 프로필 이름 변경"
L["Profiles.Delete"] = "삭제"
L["Profiles.Delete.Desc"] = "활성 프로필 삭제"
L["Profiles.Reset"] = "초기화"
L["Profiles.Reset.Desc"] = "활성 프로필을 기본값으로 초기화"
L["Profiles.ExportBox"] = "내보낸 뒤 Ctrl+C로 문자열 복사"
L["Profiles.Export"] = "내보내기"
L["Profiles.ImportBox"] = "가져오기: Ctrl+V로 프로필 문자열 붙여넣기"
L["Profiles.Import"] = "가져오기"
L["Profiles.ImportedName"] = "가져온 프로필"
L["Profiles.NewPrompt"] = "새 프로필 이름:"
L["Profiles.Create"] = "만들기"
L["Profiles.RenamePrompt"] = "새 프로필 이름:"
L["Profiles.ImportPrompt"] = "가져올 프로필 이름:"
L["Profiles.DeleteConfirm"] = "\"%s\" 프로필을 삭제할까요? 되돌릴 수 없습니다."
L["Profiles.ResetConfirm"] = "\"%s\" 프로필을 기본값으로 초기화할까요?"

---------------------------------------
-- Loss of Control frame
---------------------------------------

L["Loc.Blinded"] = "실명"
L["Loc.Gouged"] = "행동 불가"
L["Loc.Hexed"] = "사술"
L["Loc.MindControlled"] = "정신 지배"
L["Loc.Seduced"] = "유혹"

---------------------------------------
-- Settings widgets
---------------------------------------

L["Gui.None"] = "없음"
L["Gui.All"] = "전체"
L["Gui.ClickToChangeColor"] = "클릭하여 색상 변경"
L["Gui.SpecsUseProfile"] = "%d/%d개의 %s 전문화가 이 프로필을 사용합니다."
L["Gui.ToggleClassSpecs"] = "클릭하여 %s 전문화를 모두 전환합니다."
L["Gui.ToggleWholeClass"] = "클릭하여 직업 전체를 전환합니다."
L["Gui.CurrentSpec"] = "현재 전문화입니다."
L["Gui.SpecUsesProfile"] = "이 전문화는 \"|cff00c0ff%s|r\" 프로필을 사용 중입니다. 클릭하면 \"|cff00c0ff%s|r\" 프로필로 바꿉니다."
L["Gui.SliderHint"] = "슬라이더 팁:\n\n슬라이더 오른쪽 입력란에 기본 범위를 벗어난 값을 입력할 수 있습니다."
L["Gui.SliderTypo"] = "%s 값은 오타처럼 보입니다. 정말 이 값을 입력할까요?"
L["Gui.ResetSlider"] = "%s 값을 기본값으로 초기화하시겠습니까?"
L["Gui.ResetSliderTip"] = "팁: Shift를 누른 채 오른쪽 클릭하면 이 창 없이 바로 초기화됩니다"

---------------------------------------
-- Chat messages
---------------------------------------

L["Msg.CreateFailed"] = "프로필을 만들 수 없습니다."
L["Msg.Overwriting"] = "\"%s\" 프로필을 덮어씁니다."
L["Msg.ProfileNameEmpty"] = "프로필 이름은 비워 둘 수 없습니다."
L["Msg.ProfileExists"] = "\"%s\" 프로필이 이미 있습니다."
L["Msg.ProfileMissing"] = "해당 프로필이 더 이상 없습니다."
L["Msg.DefaultCannotRename"] = "Default 프로필은 이름을 바꿀 수 없습니다."
L["Msg.DefaultCannotDelete"] = "Default 프로필은 삭제할 수 없습니다."
L["Msg.CompressFailed"] = "프로필을 압축할 수 없습니다."
L["Msg.NothingToImport"] = "가져올 내용이 없습니다."
L["Msg.NotProfileString"] = "BetterBlizzCC 프로필이 아닙니다."
L["Msg.StringDamaged"] = "프로필 문자열이 손상되었습니다."
L["Msg.IncompatibleVersion"] = "호환되지 않는 버전의 프로필입니다."
