## Manual installs

Maybe I'll figure out how to automate these later, but just keeping track of them in the same place at the current moment.

### App Store

Previously I used mas and Brewfile, but I'm opting to manually load these:
 - In Your Face
 - Xcode
 - Magnet
 - CopyClip
 - Red Lines Tools
 - Hand Mirror
 - LittleIpsum
 - Tailscale

### Alfred
- Turn off Spotlight shortcut (System Preferences > Spotlight > Keyboard Shortcuts)
- Update Alfred shortcut

**Workflows:**
- [Audio Switcher](https://github.com/beet/alfred_audio_switcher/releases)

### Switch Hosts
- Ad Blockers:
		- Ad Server List
		- Someone Who Cares
		- Malware Domain List
		- YouTube Ads

### Set Up Google Assistant Commands

1. In the [Google API Manager][google-api], choose "Mac Terminal".
2. Go to the Credentials tab and select "Google Assistant on Mac"
3. Download Client Secret to `~/.dotfiles/google-assistant/.nocommit.client-secret.json`
4. After running install, copy the Authorization code when asked and paste into the terminal.

### [Keyboard Shortcuts][shortcuts]:
- App Shortcuts ➡ All Applications ➡ "Lock Screen" = `shift + command + down`

### Git & SSH
- Make sure you [set up verified git commits](../git/README.md)
- and [set up ssh keys](../ssh/README.md)

[shortcuts]:https://github.com/tbalthazar-archives/dotfiles-mac
[google-project]:https://console.cloud.google.com/project
[google-api]:https://console.cloud.google.com/apis/library
[actions-console]:https://console.actions.google.com/

<!--
1. In the [Google Google Actions Console][actions-console], choose the "Mac Terminal" Project.
2. Go to the Develop tab > Device Registration and select My MacBook.
  -->