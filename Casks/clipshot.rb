cask "clipshot" do
  version "1.1.0"
  sha256 "e3185687a6fd9b304c2f87d7eac0e07a8a168ee67e617929f90a0854c83be017"

  url "https://github.com/egekibar/Clipshot/releases/download/v#{version}/Clipshot-#{version}.dmg"
  name "Clipshot"
  desc "Copy a selected screen region straight to the clipboard"
  homepage "https://github.com/egekibar/Clipshot"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Clipshot.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Clipshot.app"],
        writable_paths: ["Clipshot.app"],
        writable_base:  :appdir
  end

  uninstall launchctl: "com.egekibar.clipshot",
            quit:      "com.egekibar.clipshot"

  zap trash: [
    "~/Library/LaunchAgents/com.egekibar.clipshot.plist",
    "~/Library/Preferences/com.egekibar.clipshot.plist",
  ]
end
