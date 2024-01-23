# Conda-autoactivate-env
Add autoactivate functionality on Conda by cding into a directory. (Only fish shell)


## Instructions

Add the code to ~/.config/fish/config.fish file and thats it!

This script will run every time you launch the cd command and it will search for a .conda_config file in the directory your cding into.

The .conda_config file has to contain the name of the env you want to activate, and only that.

## Good to know

When you'll cd out of the directory the env will automatically deactivate.

## Script

As the script is really short I'll add it there also, so you can copy and paste.

```bash
set -x CONDACONFIGDIR ""
function cd
    builtin cd $argv
    if test -f $PWD/.conda_config
        set -x CONDACONFIGDIR $PWD
        conda activate (cat .conda_config)
    else if test "$CONDACONFIGDIR"
        if not string match -q "*$CONDACONFIGDIR*" $PWD
            set -x CONDACONFIGDIR ""
            conda deactivate
        end
    end
end
```
