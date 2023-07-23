setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

# Use True color (24-bit) if available.
if [[ "${terminfo[colors]}" -ge 256 ]]; then
    dzs_turquoise="%F{73}"
    dzs_orange="%F{179}"
    dzs_red="%F{167}"
    dzs_limegreen="%F{107}"
else
    dzs_turquoise="%F{cyan}"
    dzs_orange="%F{yellow}"
    dzs_red="%F{red}"
    dzs_limegreen="%F{green}"
fi

# Reset color.
dzs_reset_color="%f"

# VCS style formats.
FMT_UNSTAGED="%{$dzs_reset_color%} %{$dzs_orange%}!"
FMT_STAGED="%{$dzs_reset_color%} %{$dzs_limegreen%}↑"
FMT_ACTION="(%{$dzs_limegreen%}%a%{$dzs_reset_color%})"
FMT_VCS_STATUS="on %{$dzs_turquoise%} %b%u%c%{$dzs_reset_color%}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
zstyle ':vcs_info:*' nvcsformats    ""
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files.
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
        hook_com[staged]+="%{$dzs_reset_color%} %{$dzs_red%}?"
    fi
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# dzs prompt style.
PROMPT=$'\n%{$dzs_limegreen%}%~%{$dzs_reset_color%} ${vcs_info_msg_0_}\n%(?.%{$dzs_limegreen%}.%{$dzs_red%})%(!.#.)%{$dzs_reset_color%} '
