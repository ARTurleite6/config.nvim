vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
  keymap = {
    preset = "default",
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },

    -- Scroll documentation
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    -- Accept completion
    ["<C-y>"] = { "select_and_accept", "fallback" },

    -- Manually trigger completion
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

    -- LuaSnip jump / expand
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
    -- ["<C-e>"] = { "hide" },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal",
  },

  completion = {
    ghost_text = {
      enabled = true,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = true,
      }
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    }
  },

  cmdline = {
    keymap = {
      preset = 'inherit',
      ['<CR>'] = { 'accept_and_enter', 'fallback' },
    },
  },

  sources = { default = { "lsp" } }
})
