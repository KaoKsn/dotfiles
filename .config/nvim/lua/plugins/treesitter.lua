-- sudo pacman -S tree-sitter-cli
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Ensure parsers are installed
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "python",
      "javascript",
      "rust",
      "lua",
      "java",
      "markdown",
      "markdown_inline"
    })

    -- Enable built-in highlighting and indentation for all files
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
