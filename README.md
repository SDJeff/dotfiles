## A Fresh macOS Setup

These instructions are for setting up new Mac devices. Instead, if you want to get started building your own dotfiles, you can [find those instructions below](#your-own-dotfiles).

### Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/SDJeff/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive https://github.com/SDJeff/dotfiles.git ~/.dotfiles
    ```

> ☝🏼 Install Command Line Tools for Xcode if you haven't already. Otherwise you have no git command line tools.

4. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```
6. Restart your computer to finalize the process

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the reference in the [`.zshrc`](./.zshrc#L2) file.


### Cleaning your old Mac (optionally)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to [backup your data](#backup-your-data) first!

## Your Own Dotfiles

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

### Stack

This setup uses the following tools:

- **[Starship](https://starship.rs/)** as the shell prompt — configured in [`.config/starship.toml`](./.config/starship.toml)
- **[fzf](https://github.com/junegunn/fzf)** for fuzzy finding with **[fzf-tab](https://github.com/Aloxaf/fzf-tab)** for tab completion
- **[zsh-completions](https://github.com/zsh-users/zsh-completions)** for additional shell completions
- **zstyle** configuration for fine-tuned completion behavior

### Customizing

Go through the [`macos/set-defaults.sh`](./macos/set-defaults.sh) file and adjust the settings you want to change. You can find many more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://formulae.brew.sh/cask/) to check if the app you want to install is available.

Check out the [`zsh/`](./zsh) folder to customize your shell aliases and functions. The [`.zshrc`](./.zshrc) file sources everything from this directory automatically.

To customize the prompt, edit [`.config/starship.toml`](./.config/starship.toml). See the [Starship docs](https://starship.rs/config/) for all available options.

Enjoy your own Dotfiles!
