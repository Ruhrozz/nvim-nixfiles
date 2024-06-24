{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pyright.enable = true; # python
        lua-ls.enable = true; # lua
        nil-ls.enable = true; # nix
      };
    };

    cmp = {
      enable = true;

      cmdline = {
        "/" = {
          mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
          sources = [{ name = "buffer"; }];
        };
        ":" = {
          mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option = { ignore_cmds = [ "Man" "!" ]; };
            }
          ];
        };
      };

      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            keyword_length = 3;
          }
          { name = "path"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };

    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          pylint.enable = true; # python
          yamllint.enable = true; # yaml
        };
        formatting = {
          black.enable = true; # python
          isort.enable = true; # python
          nixfmt.enable = true; # nix
          yamlfmt.enable = true; # yaml
          yamlfix.enable = true; # yaml
        };
      };
    };
  };

  keymaps = [
    # - Open error in floating windown
    {
      mode = "n";
      key = "<space>e";
      action.__raw = "vim.diagnostic.open_float";
    }
    # - Go to prev error
    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
    }
    # - Go to next error
    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
    }
    # - Activate all formatters to format current file
    {
      mode = "n";
      key = "<leader>fa";
      action = "<cmd>lua vim.lsp.buf.format({async = true})<CR>";
    }
  ];
}
