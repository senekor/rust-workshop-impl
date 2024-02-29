_default:
    just --list --unsorted

@_setup-slides:
    command -v npm > /dev/null || (echo "npm must be installed" && exit 1)
    cd slides && [ -d node_modules ] || npm install

# render slides on a dev server
slides day: _setup-slides
    cd slides && npm run slidev -- --port 304{{day}} day/{{day}}/index.md

zellij:
    zellij --layout dev/zellij.kdl

_demo day name:
    #!/bin/bash
    set -euo pipefail
    cd demos/day_{{ day }}/{{ name }}
    alacritty --option 'font.size=18' --command zellij --layout ../../../dev/demo.zellij.kdl

demo-1-mutable_references:
    @just _demo "1" mutable_references
demo-1-destructors:
    @just _demo "1" destructors

demo-2-declare_mod:
    @just _demo "2" declare_mod
demo-2-error_handling:
    @just _demo "2" error_handling
demo-2-exhaustiveness:
    @just _demo "2" exhaustiveness

demo-3-adaptors:
    @just _demo "3" adaptors
demo-3-for_loops:
    #!/bin/bash
    set -euo pipefail
    cd demos/day_3/for_loops
    just zellij-window

demo-4-cargo_deny:
    @just _demo "4" cargo_deny
demo-4-divan:
    @just _demo "4" divan
demo-4-itertools:
    @just _demo "4" itertools
demo-4-serde:
    @just _demo "4" serde
demo-4-use_lib:
    @just _demo "4" use_lib
