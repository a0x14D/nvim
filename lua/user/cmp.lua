local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local lspkind = require('lspkind')

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
      { name = 'luasnip', group_index = 2 },
        {
      name = "buffer",
      group_index = 2,
      filter = function(entry, ctx)
        if not contains(buffer_fts, ctx.prev_context.filetype) then
          return true
        end
      end,
    },      { name = 'path' ,  group_index = 2 },
      { name = 'nvim_lua', group_index = 2 },
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'emoji', group_index = 2 },
      { name = 'nerdfont', group_index = 2 },
    },
   formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
    end
  },

}

--lsp
require('cmp_nvim_lsp').default_capabilities()
