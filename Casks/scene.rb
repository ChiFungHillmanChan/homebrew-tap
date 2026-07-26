cask "scene" do
  version "0.7.4"
  sha256 "1af1f340783480d59a5efdb22ab91df06cb6398147c647d683932c9c9d603df8"

  url "https://github.com/ChiFungHillmanChan/macbook-resizer/releases/download/v#{version}/Scene-#{version}.dmg"
  name "Scene"
  desc "Menu bar workspaces and window layout manager"
  homepage "https://github.com/ChiFungHillmanChan/macbook-resizer"

  depends_on macos: :sonoma

  app "Scene.app"

  uninstall quit: "com.hillman.SceneApp"

  zap trash: [
    "~/Library/Application Support/Scene",
    "~/Library/Caches/com.hillman.SceneApp",
    "~/Library/HTTPStorages/com.hillman.SceneApp",
    "~/Library/Preferences/com.hillman.SceneApp.plist",
    "~/Library/Saved Application State/com.hillman.SceneApp.savedState",
  ]

  caveats <<~EOS
    Scene is notarized by Apple — first launch opens without a Gatekeeper warning.

    On first launch, grant Accessibility access:
      System Settings -> Privacy & Security -> Accessibility -> enable "Scene"

    Upgrading from v0.4.3 or earlier? One-time re-authorization is required
    because v0.5.0 switched from ad-hoc to Developer ID signing. Every
    release since then preserves your grant automatically.

    Multi-display users: v0.7.4 reserves the Dock's height on every display
    so that re-applying a layout no longer shifts your windows when the Dock
    moves between monitors. Turn on Dock auto-hide to reclaim that space.
  EOS
end
