---@diagnostic disable: deprecated
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

require("luasnip/loaders/from_vscode").lazy_load()
local compare = require "cmp.config.compare"

local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

vim.g.cmp_active = true

cmp.setup {
  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" then
      return false
    end
    return vim.g.cmp_active
  end,
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        cmp.complete()
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = 'luasnip',                 group_index = 2 },
    {
      name = "buffer",
      group_index = 2,
      filter = function(entry, ctx)
        if not contains(buffer_fts, ctx.prev_context.filetype) then
          return true
        end
      end,
    },
    { name = 'path',                    group_index = 2 },
    { name = 'nvim_lua',                group_index = 2 },
    { name = 'nvim_lsp',                group_index = 2 },
    { name = 'emoji',                   group_index = 2 },
    { name = 'nerdfont',                group_index = 2 },
    --{ name = 'nvim_lsp_signature_help', group_index = 2 },
    {
      name = "copilot",
      keyword_length = 0,
      max_item_count = 3,
      group_index = 2,
      trigger_characters = { { " ", "\n", ".", "(", ")", "[", "]", "{", "}", ":", ",", "'", '"', "=", "<", ">", "/", "\\" } },
    },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", require("lspkind").presets.default[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "",
        nvim_lsp = "",
        nvim_lua = "",
        luasnip = "",
        emoji = "[]",
        path = "[]",
        copilot = "[Copilot]",
        nvim_lsp_signature_help = "",
        nerdfont = "",
      })[entry.source.name]
      return vim_item
    end,
  },
  --specifi copilot and cmp_tabnine icon
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      require "cmp-under-comparator".under, compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  window = {
    -- documentation = false,
    documentation = {
      border = "rounded",
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
    completion = {
      border = "rounded",
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
  },
  experimental = {
    ghost_text = true,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

}

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
  },
  window = {
    completion = cmp.config.window.bordered {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search",
      col_offset = -3,
      side_padding = 1,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", require("lspkind").presets.default[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  }
})
