return {
  -- disable neo tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory" ,
    },
    },
  }
}
