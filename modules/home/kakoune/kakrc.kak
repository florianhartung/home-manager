# Hello

add-highlighter global/ number-lines -relative -hlcursor

# LSP Snippets: Goto next placeholder with <tab>
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'



# Maybe make completions cancellable?
# This doesn't work: https://github.com/mawww/kakoune/issues/5278#issuecomment-2608632862
