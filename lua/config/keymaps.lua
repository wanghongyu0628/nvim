-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VSCode: delegate editor features to native VSCode commands
if vim.g.vscode then
  local function vscode_action(cmd)
    return function()
      require("vscode").action(cmd)
    end
  end

  -- Buffers
  vim.keymap.set(
    "n",
    "<Leader>bo",
    vscode_action("workbench.action.closeOtherEditors"),
    { desc = "Close Other Editors" }
  )
  vim.keymap.set(
    "n",
    "<Leader>bl",
    vscode_action("workbench.action.closeEditorsToTheLeft"),
    { desc = "Close Left Editors" }
  )
  vim.keymap.set(
    "n",
    "<Leader>br",
    vscode_action("workbench.action.closeEditorsToTheRight"),
    { desc = "Close Right Editors" }
  )

  -- Windows
  vim.keymap.set("n", "<Tab>", vscode_action("workbench.action.focusNextGroup"), { desc = "Next Window" })
  vim.keymap.set("n", "<S-Tab>", vscode_action("workbench.action.focusPreviousGroup"), { desc = "Prev Window" })

  -- LSP jumps
  vim.keymap.set("n", "gy", vscode_action("editor.action.goToTypeDefinition"), { desc = "Go To Type Definition" })
  vim.keymap.set("n", "gr", vscode_action("editor.action.goToReferences"), { desc = "Go To References" })
  vim.keymap.set("n", "gI", vscode_action("editor.action.goToImplementation"), { desc = "Go To Implementations" })

  -- Motion: navigation history
  vim.keymap.set({ "n", "x" }, "<C-o>", vscode_action("workbench.action.navigateBack"), { desc = "Go Back" })
  vim.keymap.set({ "n", "x" }, "<C-i>", vscode_action("workbench.action.navigateForward"), { desc = "Go Forward" })

  -- Git diff
  vim.keymap.set("n", "]h", function()
    require("vscode").action("workbench.action.editor.nextChange")
    require("vscode").action("workbench.action.compareEditor.nextChange")
  end, { desc = "Next Git Diff" })
  vim.keymap.set("n", "[h", function()
    require("vscode").action("workbench.action.editor.previousChange")
    require("vscode").action("workbench.action.compareEditor.previousChange")
  end, { desc = "Prev Git Diff" })

  -- Diagnostics
  vim.keymap.set("n", "]d", vscode_action("editor.action.marker.next"), { desc = "Next Diagnostic" })
  vim.keymap.set("n", "[d", vscode_action("editor.action.marker.prev"), { desc = "Prev Diagnostic" })
end
