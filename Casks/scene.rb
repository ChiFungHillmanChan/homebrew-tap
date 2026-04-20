cask "scene" do
  version "0.4.2"
  sha256 "f6980b8b809bcc93784bf48a06731b4acf8ea30901e4eadf0484fd21ba793636"

  url "https://github.com/ChiFungHillmanChan/macbook-resizer/releases/download/v#{version}/Scene-#{version}.dmg"
  name "Scene"
  desc "Menu bar workspaces and window layout manager"
  homepage "https://github.com/ChiFungHillmanChan/macbook-resizer"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "Scene.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Scene.app"],
                   sudo: false
  end

  uninstall quit: "com.hillman.SceneApp"

  zap trash: [
    "~/Library/Application Support/Scene",
    "~/Library/Caches/com.hillman.SceneApp",
    "~/Library/HTTPStorages/com.hillman.SceneApp",
    "~/Library/Preferences/com.hillman.SceneApp.plist",
    "~/Library/Saved Application State/com.hillman.SceneApp.savedState",
  ]

  caveats <<~EOS
    Scene is ad-hoc signed (no Apple Developer ID). The postflight step removes
    the quarantine flag so the app opens without a Gatekeeper warning.

    On first launch, grant Accessibility access:
      System Settings -> Privacy & Security -> Accessibility -> enable "Scene"

    If you rebuild and reinstall, you may need to re-grant Accessibility —
    every ad-hoc build produces a new code hash, which macOS treats as a new app.
  EOS
end
