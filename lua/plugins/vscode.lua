-- Plugin adjustments for the vscode-neovim environment

return {
  -- VSCode has its own bracket auto-closing; enabling both inserts double pairs
  {
    "nvim-mini/mini.pairs",
    cond = not vim.g.vscode,
  },
}
