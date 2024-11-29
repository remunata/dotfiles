{
  programs.nvchad = {
    chadrcConfig = ''
      local M = {}

      M.base46 = {
        theme = "catppuccin",
        transparency = true,
      }

      return M
    '';

    extraConfig = ''
      local lspconfig = require "lspconfig"
      local nvlsp = require "nvchad.configs.lspconfig"
      local util = require "lspconfig/util"

      lspconfig.rust_analyzer.setup{
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        filetypes = {"rust"},
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      }

      lspconfig.pyright.setup{
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        filetypes = {"python"},
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { '*' },
            },
          },
        },
      }

      lspconfig.ruff.setup{
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        filetypes = {"python"},
      }
    '';
  };
}
