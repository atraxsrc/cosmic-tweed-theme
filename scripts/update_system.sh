#!/bin/bash
set -eo pipefail

# ─────────────────────────────────────────────
#  Tweed palette (dark terminal)
#  bg:      #292B31   fg:      #D6D1C9
#  tan:     #BDA07F   salmon:  #F28B7C
#  brick:   #E77D6C   moss:    #919E85
#  cream:   #F3E9BD   olive:   #A8B49D
#  muted:   #9F9A91   dim:     #6B6B6E
# ─────────────────────────────────────────────

# Tweed - using $'...' so escape bytes are stored at assignment time
# and work correctly with both echo -e and printf "%s"
EDGE=$'\033[38;2;189;160;127m'      # #BDA07F  - section headers, logo rule (tan)
CONTROL=$'\033[38;2;168;180;157m'    # #A8B49D  - info / commands (olive)
HIGH=$'\033[38;2;145;158;133m'      # #919E85  - success, logo rule (moss)
ACCENT=$'\033[38;2;242;139;124m'    # #F28B7C  - warnings (salmon)
MUTE=$'\033[38;2;159;154;145m'      # #9F9A91  - skipped (muted)
HIGHER=$'\033[38;2;231;125;108m'    # #E77D6C  - errors (brick)
DIM=$'\033[38;2;107;107;110m'      # #6B6B6E  - comments / dim text
BOLD=$'\033[1m'
RESET=$'\033[0m'

# ── Helpers ────────────────────────────────────────────────────────────────────

print_header() {
    echo
    echo -e "${EDGE}${BOLD}┌─ $1 ${DIM}──────────────────────────────────────${RESET}"
}

print_success() { echo -e "  ${HIGH}✓ $1${RESET}"; }
print_info()    { echo -e "  ${CONTROL}→ $1${RESET}"; }
print_warn()    { echo -e "  ${ACCENT}⚠ $1${RESET}"; }
print_skip()    { echo -e "  ${MUTE}⊘ $1${RESET}"; }
print_error()   { echo -e "  ${HIGHER}✗ $1${RESET}"; }
print_dim()     { echo -e "  ${DIM}$1${RESET}"; }

command_exists() { command -v "$1" >/dev/null 2>&1; }

# ── Config ─────────────────────────────────────────────────────────────────────

# Phased updates: Ubuntu staggers non-security updates so a bad one only hits a
# fraction of machines first. Setting this to "true" opts out of that - you pull
# every update immediately and become an early tester. Security updates are never
# phased, so they always install regardless of this setting.
#   true  = always pull phased updates now (early-adopter)
#   false = honor the rollout, install when it reaches you (safer default)
INCLUDE_PHASED=true

# Built once and passed to apt/nala. Empty when INCLUDE_PHASED=false.
PHASED_OPT=()
if [ "$INCLUDE_PHASED" = true ]; then
    PHASED_OPT=(-o APT::Get::Always-Include-Phased-Updates=true)
fi

# ── Update functions ───────────────────────────────────────────────────────────

update_system() {
    print_header "System Packages"

    if [ "$INCLUDE_PHASED" = true ]; then
        print_dim "Including phased updates (early-adopter mode)"
    fi

    if command_exists nala; then
        print_info "Package manager: nala"
        sudo nala update
        sudo nala upgrade --full -y "${PHASED_OPT[@]}"
#        sudo nala autoremove -y
        sudo nala clean
        print_success "Nala system update complete"

    elif command_exists apt; then
        print_info "Package manager: apt (nala not found)"
        sudo apt update
        sudo apt full-upgrade -y "${PHASED_OPT[@]}"
#        sudo apt autoremove -y
        sudo apt autoclean
        print_success "APT system update complete"

    else
        print_error "No supported package manager found - skipping"
        return 1
    fi
}

update_flatpak() {
    print_header "Flatpak"
    if ! command_exists flatpak; then
        print_skip "Flatpak not installed - skipping"
        return 0
    fi

    print_info "Running flatpak update..."
    if flatpak update -y; then
        print_success "Flatpak updates applied"
    else
        print_warn "Flatpak finished with some warnings"
    fi
}

update_snap() {
    print_header "Snap"

    if ! command_exists snap; then
        print_skip "Snap not installed - skipping"
        return 0
    fi

    print_info "Running snap refresh..."
    local output
    output=$(sudo snap refresh 2>&1) || true
    while IFS= read -r line; do
        echo -e "  ${DIM}${line}${RESET}"
    done <<< "$output"

    if echo "$output" | grep -q "All snaps up to date"; then
        print_success "All snaps are already up to date"
    else
        print_success "Snap updates applied"
    fi
}

# ── Logo ───────────────────────────────────────────────────────────────────────

# Banner rows, ANSI Shadow figlet font. All 46 columns wide; keep them that way
# or the gradient below will drift out of alignment with the letterforms.
LOGO_ROWS=(
    ' ██████╗ ██╗  ██╗██████╗ ███████╗██╗   ██╗ ██╗'
    '██╔═████╗╚██╗██╔╝██╔══██╗██╔════╝██║   ██║███║'
    '██║██╔██║ ╚███╔╝ ██║  ██║█████╗  ██║   ██║╚██║'
    '████╔╝██║ ██╔██╗ ██║  ██║██╔══╝  ╚██╗ ██╔╝ ██║'
    '╚██████╔╝██╔╝ ██╗██████╔╝███████╗ ╚████╔╝  ██║'
    ' ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝  ╚═══╝   ╚═╝'
)

# Per-column colours for the banner: moss #919E85 to cream #F3E9BD, left to
# right, blended in Oklab. The letters stay calm; the rule below runs tan
# into moss, the two colours Tweed is built on.
# One entry per column, 46 total.
LOGO_GRAD=(
    "145;158;133" "147;160;134" "149;161;135" "151;163;137" "153;164;138" "156;166;139"
    "158;168;140" "160;169;142" "162;171;143" "164;173;144" "166;174;145" "168;176;146"
    "170;178;148" "173;179;149" "175;181;150" "177;182;151" "179;184;153" "181;186;154"
    "183;187;155" "185;189;156" "188;191;158" "190;192;159" "192;194;160" "194;196;161"
    "196;197;162" "199;199;164" "201;201;165" "203;202;166" "205;204;167" "207;206;169"
    "210;207;170" "212;209;171" "214;211;173" "216;213;174" "218;214;175" "221;216;176"
    "223;218;178" "225;219;179" "227;221;180" "230;223;181" "232;224;183" "234;226;184"
    "236;228;185" "238;230;186" "241;231;188" "243;233;189"
)

# Draw the banner one character at a time, colouring by column index so the
# gradient runs horizontally across the whole word. Every glyph gets the ramp,
# including the box-drawing bevel characters (╔ ═ ╗ ║ ╚ ╝) - colouring those
# separately puts stray marks inside the 0, the D bowl and the e, which reads
# as noise sitting on top of the letters rather than as depth.
print_logo() {
    # figlet rows are multibyte; force a UTF-8 locale so ${row:i:1} steps by
    # character instead of by byte. Local to this function only.
    local LC_ALL=C.UTF-8
    local row ch out i

    echo
    for row in "${LOGO_ROWS[@]}"; do
        out=""
        for (( i = 0; i < ${#row}; i++ )); do
            ch="${row:i:1}"
            if [ "$ch" = " " ]; then
                out+=" "
            else
                out+=$'\033[1;38;2;'"${LOGO_GRAD[i]}"$'m'"$ch"
            fi
        done
        printf '  %s%s\n' "$out" "$RESET"
    done

    echo
    printf "  ${EDGE}━━━━━━━━━━━━━━━━━━━━━━━${HIGH}━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
    printf "  ${DIM}  Pop!_OS · COSMIC DE · System Update${RESET}\n"
    printf "  ${DIM}  %s${RESET}\n" "$(date '+%A %d %B %Y  %H:%M:%S')"
    echo
}

# ── Main ───────────────────────────────────────────────────────────────────────

main() {
    local start_time end_time duration

    print_logo

    start_time=$(date +%s)

    update_system || {
        print_error "System package update failed - continuing with remaining tasks"
    }

    update_flatpak
#    update_snap

    end_time=$(date +%s)
    duration=$((end_time - start_time))

    echo
    echo -e "${EDGE}${BOLD}└─ All done ${DIM}──────────────────────────────────${RESET}"
    printf "   ${HIGH}✓ Completed in ${BOLD}%dm %ds${RESET}\n" \
        $((duration / 60)) $((duration % 60))
    echo
}

main
