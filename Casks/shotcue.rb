cask "shotcue" do
  version "1.3.0"
  sha256 "169e6ccf66fb57e4d545e19cca397ca299f7993fd01e1226bfdcddecb6f24fd7"

  url "https://github.com/egekibar/Shotcue/releases/download/v#{version}/Shotcue-#{version}.dmg"
  name "Shotcue"
  desc "Turn screenshots and voice notes into Claude Code tasks"
  homepage "https://github.com/egekibar/Shotcue"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Shotcue.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Shotcue.app"],
        writable_paths: ["Shotcue.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.shotcue.app"

  zap trash: [
    "~/Library/Application Support/Shotcue",
    "~/Library/Caches/com.shotcue.app",
    "~/Library/Preferences/com.shotcue.app.plist",
  ]
end
