### Custom themes
set fish_greeting ""

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/tokyonight_storm.omp.json)"

### Auto activate conda ###
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
