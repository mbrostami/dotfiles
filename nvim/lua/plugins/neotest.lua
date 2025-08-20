-- File: lua/plugins/neotest.lua
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            experimental = { use_dap = false },
          }),
        },
      })
    end,
  },
}
