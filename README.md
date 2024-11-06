# Dotfiles.

Bootstrapped from [holman/dotfiles][holman] with extra inspiration from the [Sparkbox laptop script][sb-script]

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **Brewfile**: This is a list of applications for [Homebrew](https://brew.sh/) to install.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **manual** - Things I haven't automated yet
## Install

If you haven't yet:
- [Set up SSH keys](ssh/README.md)

Run this:

```sh
git clone git@github.com:rfearing/dotfiles.git ~/.dotfiles
```
Then:
```sh
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

**Errors I ran into:**
- If brew doesn't install try manually running `eval "$(/opt/homebrew/bin/brew shellenv)"`
- You may need to run `script/install` if brew didn't install correctly (see above)

### Manual Setup Steps:
Not everything can be automated. Run these [manual setup steps](manual/README.md):

<!--
TODO
https://tomforb.es/testing-my-dotfiles-with-github-actions/
-->

<!-- LINKS -->
[holman]:https://github.com/holman/dotfiles
[sb-script]:https://github.com/sparkbox/laptop/blob/master/mac
