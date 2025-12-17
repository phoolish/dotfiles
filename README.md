# Dotfiles

## Install
`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply phoolish`

Likely need to run `chezmoi apply` afterwards to apply all changes

### Mac Specific

* After initial install, close and reopen terminal to use the bash shell.

## Package Management

This dotfiles repo includes a cleaned-up Brewfile with only explicitly-wanted packages (no auto-dependencies).

### Adding New Packages

Use the `dotfiles-brew` helper script to add packages:

```bash
# Add a formula
dotfiles-brew add kubectl

# Add a cask
dotfiles-brew add visual-studio-code
```

**What it does:**
- Auto-detects if the package is a formula or cask
- Adds it alphabetically to the correct section in `dot_Brewfile`
- Commits the change to git
- Applies chezmoi changes
- Installs the package

### Manual Installation

To install all packages from the Brewfile:

```bash
brew bundle --file=~/.Brewfile
```

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
