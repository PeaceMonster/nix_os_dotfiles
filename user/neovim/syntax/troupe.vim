if exists("b:current_syntax")
  finish
endif

syn keyword Boolean true false
syn keyword Conditional if else then
syn keyword Keyword let fun val in and
syn keyword Delimiter end

syn match Identifier '\(\sval\s\)\@<=\w\+'
syn match Function '\(fun\s\+\)\@<=\w\+'
syn match Constant '\<\u[A-Z_]\+'

syn region Comment start='(\*' end='\*)'

syn match Number '\(\w\)\@<![\-+]\?\d\+\(\.\d*\)\?'
syn region String start='"' end='"'

let b:current_syntax = "troupe"
