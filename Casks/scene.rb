cask "scene" do
  version "0.5.5"
  sha256 "e4f741d48ecdfe2e434ebffbe8886a439b84b6f0a105fcc5eed63f1a0fcf9ddb"

  url "https://github.com/ChiFungHillmanChan/macbook-resizer/releases/download/v#{version}/Scene-#{version}.dmg"
  name "Scene"
  desc "Menu bar workspaces and window layout manager"
  homepage "https://github.com/ChiFungHillmanChan/macbook-resizer"

  depends_on macos: ">= :sonoma"

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
    because v0.5.0 switched from ad-hoc to Developer ID signing. Future
    v0.5.x updates will preserve your grant automatically.
  EOS
end
