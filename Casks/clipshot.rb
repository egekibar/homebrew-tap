cask "clipshot" do
  version "1.1.1"
  sha256 "b9a7970225af26dc5d929d234d1249fa0c590f904405b52448237fb28366938a"

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
