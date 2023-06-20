tmux_init()
{
#tmux new-session -s "kumu" -d -n "local"    # 开启一个会话
#tmux new-window -n "other"                  # 开启一个窗口
#tmux split-window -h                        # 开启一个竖屏
#tmux split-window -v "top"                  # 开启一个横屏,并执行top命令
#tmux -2 attach-session -d                   # tmux -2强制启用256color，连接已开启的tmux
   tmux
}

# 判断是否已有开启的tmux会话，没有则开启
#if which tmux 2>&1 >/dev/null; then
#    test -z "$TMUX" && (tmux attach || tmux_init)
#fi

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

PS1="[\[\e[1;35m\]\u\[\e[0;31m\](KNL-7250)\[\e[1;34m\]\w\[\e[0;33m\]] \[\e[0m\]\[\e[1;36m\]\$(git_branch)\[\e[0;33m\]\$"
