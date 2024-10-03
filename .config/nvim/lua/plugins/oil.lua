return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    {
      "<leader>-",
      "<cmd>Oil<cr>",
      desc = "Open parent directory [oil]",
    },
  },
  config = function()
    require("oil").setup({
      columns = {
        "icon"
      }
    })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
