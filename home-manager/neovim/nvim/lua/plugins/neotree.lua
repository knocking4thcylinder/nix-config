return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      default_component_config = {
        indent = {
          padding = 0,
        },
      },
      window = {
        position = "right",
        width = 35,
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal<CR>", {})
  end,
}
