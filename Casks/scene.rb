cask "scene" do
  version "0.7.6"
  sha256 "e570369e7f0f6c00d93ba25aedb70fde9e4fb3000176e87be7db34d1a3a97c33"

  url "https://github.com/ChiFungHillmanChan/scene-macos/releases/download/v#{version}/Scene-#{version}.dmg"
  name "Scene"
  desc "Menu bar workspaces and window layout manager"
  homepage "https://github.com/ChiFungHillmanChan/scene-macos"

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

    Downgrading below v0.7.6? Delete
    ~/Library/Application Support/Scene/settings.json first — v0.7.6 upgrades
    it to a schema older releases refuse to open, and they will not launch.
    Scene reseeds it with defaults. Upgrades are unaffected.
  EOS
end
