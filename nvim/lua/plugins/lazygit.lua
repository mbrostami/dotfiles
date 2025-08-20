-- File: lua/plugins/lazygit.lua
return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "LazyGit",
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
    end,
  },
}
