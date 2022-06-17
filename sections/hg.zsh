#
# Mercurial (hg)
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW=true}"
SPACESHIP_HG_ASYNC="${SPACESHIP_HG_ASYNC=true}"
SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX="on "}"
SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HG_SYMBOL="${SPACESHIP_HG_SYMBOL="☿ "}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/hg_branch.zsh"
source "$SPACESHIP_ROOT/sections/hg_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both hg branch and hg status:
#   spaceship_hg_branch
#   spaceship_hg_status
spaceship_hg() {
  [[ $SPACESHIP_HG_SHOW == false ]] && return

  [[ -z $hg_branch ]] && return

  local hg_branch="$(spaceship_hg_branch)"
  local hg_status="$(spaceship_hg_status)"

  local hg_branch_section="$(spaceship::section::render $hg_branch)"
  local hg_status_section="$(spaceship::section::render $hg_status)"

  spaceship::section \
    --color 'white' \
    --prefix "$SPACESHIP_HG_PREFIX" \
    --suffix "$SPACESHIP_HG_SUFFIX" \
    "${hg_branch_section}${hg_status_section}"
}
