[
  {
    key = "ctrl+t";
    command = "-git.sync";
  }
  {
    key = "ctrl+t";
    command = "-workspace.action.showAllSymbols";
  }
  {
    key = "ctrl+t";
    command = "workbench.action.terminal.toggleTerminal";
    when = "terminal.active";
  }
  {
      key = "ctrl+q";
      command = "-extension.vim_winCtrlQ";
      when = "editorTextFocus && vim.active && vim.use<C-q> && !inDebugRepl";
  }
  {
      key = "ctrl+q";
      command = "-workbench.action.quickOpenNavigateNextInViewPicker";
      when = "inQuickOpen && inViewsPicker";
  }
  {
      key = "ctrl+q";
      command = "-workbench.action.quickOpenView";
  }
  {
      key = "alt+h";
      command = "-testing.toggleTestingPeekHistory";
      when = "testing.isPeekVisible";
  }
  {
      key = "alt+h";
      command = "workbench.action.previousEditor";
  }
  {
      key = "alt+l";
      command = "-toggleSearchEditorContextLines";
      when = "inSearchEditor";
  }
  {
      key = "alt+l";
      command = "-toggleFindInSelection";
      when = "editorFocus";
  }
  {
      key = "alt+l";
      command = "workbench.action.nextEditor";
  }
  {
      key = "ctrl+alt+o";
      command = "-workbench.action.remote.showMenu";
  }
  {
      key = "ctrl+p";
      command = "-extension.vim_ctrl+p";
      when = "editorTextFocus && vim.active && vim.use<C-p> && !inDebugRepl || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'SearchInProgressMode'";
  }
  {
      key = "ctrl+p";
      command = "-workbench.action.quickOpenNavigateNextInFilePicker";
      when = "inFilesPicker && inQuickOpen";
  }
  {
      key = "ctrl+p";
      command = "-editor.action.triggerParameterHints";
      when = "editorHasSignatureHelpProvider && editorTextFocus";
  }
]
