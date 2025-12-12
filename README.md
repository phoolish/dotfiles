# Dotfiles

## Install
`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply phoolish`

Likely need to run `chezmoi apply` afterwards to apply all changes

### Mac Specific

* After initial install, close and reopen terminal to use the bash shell.
* **Optional:** For accessibility/zoom features (scroll-to-zoom with Ctrl), grant Accessibility permissions to your terminal app in **System Settings > Privacy & Security > Accessibility**

## SSH Configuration

The SSH configuration uses 1Password as the SSH agent on macOS. The socket path is automatically detected to handle different Team IDs across machines.

**How it works:**
- Automatically searches for the 1Password SSH agent socket in `~/Library/Group Containers/`
- Detects the correct path regardless of the Team ID
- Falls back gracefully if 1Password SSH agent is not found

**Manual Override:**
If you need to specify a custom socket path, add this to `~/.config/chezmoi/chezmoi.toml`:
```toml
[data]
  onePasswordSocket = "/path/to/your/agent.sock"
```
