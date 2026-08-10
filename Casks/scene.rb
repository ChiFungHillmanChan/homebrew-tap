cask "scene" do
  version "0.7.5"
  sha256 "27ecacc970f53a27c170071a6f0d704e48d06bceafa159b39299616f7a7edf69"

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

    macOS 26 (Tahoe) users: v0.7.5 restores the Settings toolbar buttons
    (new / duplicate / delete / restore defaults on Layouts and Workspaces),
    which were missing in v0.7.2 through v0.7.4. macOS 14 and 15 were
    unaffected.
  EOS
end
