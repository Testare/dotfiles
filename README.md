A central repo for my dot configuration files.

Will use "stow" to have these available wherever necessary.

* GNU Stow website: https://www.gnu.org/software/stow/
* YouTube video about this: https://www.youtube.com/watch?v=y6XCebnB9gs

Install it using whatever way is idiomatic for your environment. Then clone this repo into the home directory, cd in and run `stow .` to load stow configuration.

If configuration files already exist conflicts will arise. You can delete them, merge them and then delete them, or move them to "<X>.local" if you have configurations that you want locally.

Things I plan to configure that are common to all environments
* zshrc / zshenv and the like for common shell configurations
* zsh_aliases for aliases I like to use
* .config/nvim
* .config/kitty

Since different environments might have specific changes, I'll try to have these files include links to `<X>.local` files to import local configurations?

If I want to start stowing a new file, I can create it/move it to this directory and rerun `stow .`


I also have things I should stow that aren't common to all environments, but that I want saved to my repository. So I have the "local" folder in this repo which is ignored by stow. You can create a subfolder for your specific environment if it doesn't exist, add a ".stow" file and whatever configuration you want. It should work to just run `stow . -t ~` while you're in the appropriate subdirectory for your environment after that point.

And example of this is i3. I want to preserve my i3 configuration, but I only use i3 on my laptop "Samwise" as of the time of this writing, so that configuration would go in `dotfiles/local/samwise/.config/i3`, and I would have to run that separately.

For work, I have configurations I probably should not save to github, so I'll have another stow repo for those.
