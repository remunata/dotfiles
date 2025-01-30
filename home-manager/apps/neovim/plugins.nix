{
  programs.nvchad = {
    extraPlugins = ''
      return {
        {
          "rust-lang/rust.vim",
          ft = "rust",
          init = function()
            vim.g.rustfmt_autosave = 1
          end
        },
        {
          "saecki/crates.nvim",
          ft = {"rust", "toml"},
          config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
          end
        },
        {
          "nvimtools/none-ls.nvim",
          ft = {"python", "svelte"},
          opts = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local null_ls = require('null-ls')
            null_ls.setup({
              sources = {
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettierd,
              },
              on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                  vim.api.nvim_clear_autocmds({
                    group = augroup,
                    buffer = bufnr,
                  })
                  vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                      vim.lsp.buf.format({ buffer = bufnr })
                    end,
                  })
                end
              end,
            })
          end,
        }
      }
    '';
  };
}
