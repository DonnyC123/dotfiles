-- Verible tooling for (System)Verilog: formatter (conform) + language server (LSP).
-- Both binaries are expected on PATH in ~/.local/bin.
return {
  -- Language server: diagnostics, hover, go-to-symbol, document outline.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          -- lspconfig's built-in `verible` config already sets
          -- filetypes = { "verilog", "systemverilog" } and root detection.
          -- The LS always lints (surfacing diagnostics) and auto-discovers a
          -- .rules.verible_lint file walking up from the source. Hover docs are
          -- off by default, so enable them explicitly.
          cmd = {
            "verible-verilog-ls",
            "--lsp_enable_hover",
            -- Allow ALL_CAPS localparam names (e.g. GOOD_W) in addition to the
            -- default CamelCase. Mirrors verible's default parameter_style.
            "--rules=parameter-name-style=localparam_style:CamelCase|ALL_CAPS",
          },
        },
      },
    },
  },

  -- Formatter.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        verilog = { "verible" },
        systemverilog = { "verible" },
      },
      formatters = {
        verible = {
          -- Absolute path to the locally-built binary, NOT the bare name:
          -- conform resolves bare names via Mason first, and Mason's release
          -- predates the --compact_dimensions flag developed in this repo.
          command = vim.fn.expand("~/.local/bin/verible-verilog-format"),
          args = {
            "--column_limit=100",
            "--indentation_spaces=4",
            "--port_declarations_indentation=indent",
            "--formal_parameters_indentation=indent",
            "--port_declarations_alignment=align",
            "--formal_parameters_alignment=align",
            "--parameter_declarations_alignment=align",
            "--module_net_variable_alignment=align",
            "--class_member_variable_alignment=align",
            "--struct_union_members_alignment=align",
            "--modport_ports_alignment=align",
            "--indent_module_body=false",
            "--alignment_group_boundary=double-blank-lines",
            "--compact_dimensions=true",
            "-", -- read from stdin, write to stdout
          },
          stdin = true,
        },
      },
    },
  },
}
