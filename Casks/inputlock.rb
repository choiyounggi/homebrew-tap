cask "inputlock" do
  version "1.0.0"
  sha256 "301d22e8e4bd1185306d45f93bd759ac3133a8b986034949b30c63ba07e30494"

  url "https://github.com/choiyounggi/mac-inputlock/releases/download/v#{version}/InputLock-#{version}.zip"
  name "InputLock"
  desc "Lock keyboard and mouse input while keeping the screen on"
  homepage "https://github.com/choiyounggi/mac-inputlock"

  app "InputLock.app"

  caveats <<~EOS
    InputLock 사용 준비:

    1) 손쉬운 사용(Accessibility) 권한 부여
       시스템 설정 > 개인정보 보호 및 보안 > 손쉬운 사용 에서 InputLock 추가 + ON

    2) 로그인 시 자동 상주 등록
       "/Applications/InputLock.app/Contents/MacOS/inputlock" --install-agent

    토글 단축키: Control + Option + Command + L

    ※ ad-hoc 서명 빌드라 첫 실행이 차단되면:
       xattr -dr com.apple.quarantine "/Applications/InputLock.app"
       또는 시스템 설정 > 개인정보 보호 및 보안 에서 "확인 없이 열기".
  EOS
end
