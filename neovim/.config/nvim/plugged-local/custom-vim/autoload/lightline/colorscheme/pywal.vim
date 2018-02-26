let s:base00 = [ '#181818',  0 ] " black
let s:base01 = [ '#282828',  1 ]
let s:base02 = [ '#383838',  2 ]
let s:base03 = [ '#585858',  3 ]
let s:base04 = [ '#B8B8B8',  4 ]
let s:base05 = [ '#D8D8D8',  5 ]
let s:base06 = [ '#E8E8E8',  6 ]
let s:base07 = [ '#F8F8F8',  7 ] " white

let s:base08 = [ '#AB4642',  8 ] " red
let s:base09 = [ '#DC9656',  9 ] " orange
let s:base0A = [ '#F7CA88', 10 ] " yellow
let s:base0B = [ '#A1B56C', 11 ] " green
let s:base0C = [ '#86C1B9', 12 ] " teal
let s:base0D = [ '#7CAFC2', 13 ] " blue
let s:base0E = [ '#BA8BAF', 14 ] " pink
let s:base0F = [ '#A16946', 15 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base01, s:base00 ], [ s:base00, s:base01 ] ]
let s:p.insert.left     = [ [ s:base01, s:base00 ], [ s:base00, s:base01 ] ]
let s:p.visual.left     = [ [ s:base01, s:base00 ], [ s:base00, s:base01 ] ]
let s:p.replace.left    = [ [ s:base01, s:base00 ], [ s:base00, s:base01 ] ]
let s:p.inactive.left   = [ [ s:base01, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base01, s:base00 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base00, s:base01 ], [ s:base00, s:base01 ] ]
let s:p.inactive.right  = [ [ s:base00, s:base01 ] ]

let s:p.normal.error    = [ [ s:base00, s:base01 ] ]
let s:p.normal.warning  = [ [ s:base00, s:base01 ] ]

let s:p.tabline.left    = [ [ s:base00, s:base01 ] ]
let s:p.tabline.middle  = [ [ s:base00, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base00, s:base01 ] ]
let s:p.tabline.tabsel  = [ [ s:base00, s:base01 ] ]

let g:lightline#colorscheme#pywal#palette = lightline#colorscheme#flatten(s:p)
