"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.1
"
" Overridding
" ========================
" To override a highlight group, simply add something like
" this to your .vimrc:
"
"     highlight xitCheckboxObsolete ctermfg=240
"
" This example makes obsolete checkboxes really light gray
" (instead of the default brightblack).

if exists("b:current_syntax")
  finish
endif

" -- Title
syntax match xitTitle "\v^[a-zA-Z0-9]+.*$"

" -- Checkbox description
" syntax match xitCheckboxOpenDescription "\(\[x\] \)\@<=.*$"
" syntax match xitCheckboxCheckedDescription "\(\[x\] \)\@<=.*$"
" syntax match xitCheckboxCheckedDescription "\(\[x\] .*$\)\@<=^\s{4}.*$"
" syntax match xitCheckboxObsoleteDescription "\(\[\~\] \)\@<=.*$"

" -- Checkboxes
syntax match xitCheckboxOpen "\v^\[ \]"
syntax match xitCheckboxChecked "\v^\[x\]"
syntax match xitCheckboxOngoing "\v^\[\@\]"
syntax match xitCheckboxObsolete "\v^\[\~\]"

" -- NOT Checkboxes

" doesn't have " ", @, x, or ~ in checkbox
syntax match xitNotCheckbox "\v^\[[^x|\~|\@| ]\].*"
" wrong spacing after checkbox.
syntax match xitNotCheckbox "\v^\[[x|\~|\@| ]\][^ ].*"
" too many spaces inside of open checkbox
syntax match xitNotCheckbox "\v^\[\s{2,}\].*"

syntax match xitTag "\v#[a-zA-Z0-9\-]+"

" -- Highlighting
" For items that make sense to put to a existing
" highlight group (i.e. Keyword), it'll use that.
" For others, this will simply use colors defined
" in your terminal (like priority will use BrightRed).

highlight xitTitle cterm=bold,underline

highlight xitCheckboxOpen ctermfg=6
highlight xitCheckboxChecked ctermfg=2
highlight link xitCheckboxObsolete Normal
highlight link xitCheckboxOngoing Keyword

highlight link xitTag Constant

" highlight link xitCheckboxOpenDescription Normal
" highlight xitCheckboxCheckedDescription ctermfg=8
" highlight xitCheckboxObsoleteDescription ctermfg=8

highlight link xitNotCheckbox Error

let b:current_syntax = "xit"
