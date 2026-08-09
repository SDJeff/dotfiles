# Applications

The [`Brewfile`](./Brewfile) is the source of truth for everything installable through Homebrew — formulae, casks, fonts and Mac App Store apps. Run it with:

```zsh
brew bundle --file ~/.dotfiles/Brewfile
```

This file documents everything that lives **outside** of the Brewfile: apps that need a licence, apps without a cask, apps deliberately kept out of automation, and the toolchains that manage their own packages.

> To re-check for drift after a while, run `brew bundle check --verbose --file ~/.dotfiles/Brewfile`.

## Commercial licence necessary

Grab the licence keys **before** wiping the old machine, and deregister the apps there first.

| App | Notes |
| --- | --- |
| Carbon Copy Cloner | Installed via cask, licence is separate |
| Parallels Desktop Pro Edition | Cask `parallels` exists; for Homestead also run `vagrant plugin install vagrant-parallels` ([docs](https://laravel.com/docs/11.x/homestead#first-steps)) |
| Laravel Herd Pro | Cask `herd` exists — see [PHP & Node toolchain](#php--node-toolchain) |
| Ioncube Encoder | No cask, direct download |
| MS Office 365 | Cask `microsoft-office` exists, licence via subscription |
| Tinkerwell / Ray / TablePlus | Installed via cask, licence keys separate |

## No Homebrew cask available

These have to be downloaded manually.

| App | Source |
| --- | --- |
| HiDrive Client | <https://static.hidrive.com/macos/0001> |
| Kerio VPN Client | <https://www.gfi.com/products-and-solutions/network-security-solutions/keriocontrol/resources/vpn> |
| ISL Light | Remote support, vendor download |
| Microsoft Defender | Deployed through the company tenant |
| STARFACE | VoIP client, version has to match the PBX |
| Zoiper5 | VoIP softphone, vendor download |
| Polyscope | Universal Robots, vendor download |

## Deliberately managed by hand

A cask exists for each of these, but they stay out of the Brewfile — they are machine-specific (peripherals, customer projects) or update themselves anyway. Listed with their cask name in case that decision is ever revisited.

| App | Cask | Why manual |
| --- | --- | --- |
| Laravel Herd | `herd` | Manages its own PHP/Node versions, see below |
| Ollama | `ollama-app` | Models live outside of Homebrew |
| Microsoft Office / Teams / OneDrive | `microsoft-office`, `microsoft-teams`, `onedrive` | Tenant-managed, auto-updating |
| Nova | `nova` | Rarely used second editor |
| Codex | `codex` | AI tooling, ships fast |
| Wispr Flow | `wispr-flow` | Overlaps with `kitlangton-hex` from the Brewfile |
| iTermAI | `itermai` | iTerm2 add-on |
| Elgato Stream Deck | `elgato-stream-deck` | Peripheral, only on the desk setup |
| Logi Options+ | `logi-options-plus` | Peripheral |
| Insta360 Link Controller | `insta360-link-controller` | Peripheral |
| balenaEtcher | `balenaetcher` | Occasional use |
| Tuxera Disk Manager | `tuxera-ntfs` | NTFS driver, licence bound |
| xTool Studio | `xtool-studio` | Laser cutter, hobby |
| Linphone | `linphone` | VoIP |

## PHP & Node toolchain

Neither PHP nor Node comes from Homebrew in practice:

- **PHP** is provided by **Herd** (`~/Library/Application Support/Herd/bin/php`). The `php` formula in the Brewfile only exists because `composer` and `mago` depend on it — it is never the active CLI binary.
- **Node** is provided by Herd's bundled nvm (`~/Library/Application Support/Herd/config/nvm/versions/node/<version>`). The `node` formula in the Brewfile is pulled in as a dependency of `svgo` / `markdownlint-cli2`.

> ⚠️ [`fresh.sh`](./fresh.sh) sets `npm config set prefix ~/.npm-packages`, which contradicts the Herd-managed setup. Skip or fix that step when setting up a new machine.

Global npm packages are **not** covered by the Brewfile. Reinstall them after Herd is up:

```zsh
npm install -g \
  @openai/codex \
  @google/gemini-cli \
  @earendil-works/pi-coding-agent \
  @ollama/pi-web-search \
  pi-subagents \
  beads-ui \
  hunkdiff
```

## Other things the Brewfile does not cover

- **Beads CLI** — the `bd` binary is not installed; Beads runs through the Claude Code plugin plus `beads-ui` from npm. The tap `gastownhall/beads` stays in the Brewfile in case the CLI is ever wanted.
- **QuickLook plugins** are installed by [`fresh.sh`](./fresh.sh), not by the Brewfile.
- **Zsh plugins** (`zsh-syntax-highlighting`, `zsh-completions`, `zsh-autosuggestions`, `fzf-tab`) are cloned by [`fresh.sh`](./fresh.sh) into `$ZSH_CUSTOM/plugins`.
- **SSH keys** are never restored automatically — transfer them manually, see [`ssh.sh`](./ssh.sh).
