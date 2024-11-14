### Setup
I followed [The fastest and easiest way to install Ruby on a Mac in 2022](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#start-here-if-you-choose-the-long-and-manual-route) to update Ruby.

*June, 23rd 2022*

*Update: Nov 2024: Commenting out aliases as I haven't used ruby locally in a long while.*

### How to [install different version of Ruby](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#how-to-install-different-versions-of-ruby-and-switch-between-them) and switch between them.

#### Install:
1. To install an additional version, run ruby-install followed by ruby- and the desired version. For example:

	```zsh
	ruby-install ruby-2.7.5
	```
2. You should run `chruby` followed by the desired version before you start any new project to make sure you’re using the correct version of Ruby.

#### Auto switch between versions (like `.nvmrc`)
Automatically switch between versions by adding a `.ruby-version` file in your Ruby project with the version number prefixed with ruby-, such as `ruby-2.7.5`.

### Reminder:
Whenever installing gems in any version of Ruby, make sure to use `gem install` followed by the name of the gem. [Never use sudo to install gems](https://www.moncefbelyamani.com/why-you-should-never-use-sudo-to-install-ruby-gems/).