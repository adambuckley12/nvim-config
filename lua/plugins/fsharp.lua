-- F#: hover without the VS Code-only "Open the documentation" link, and gK to open real .NET docs.

local function hover_text(cb)
  local client = vim.lsp.get_clients({ bufnr = 0, name = "fsautocomplete" })[1]
  if not client then return end
  local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
  client:request("textDocument/hover", params, function(err, result)
    if err or not result or not result.contents then return end
    cb(table.concat(vim.lsp.util.convert_input_to_markdown_lines(result.contents), "\n"))
  end, 0)
end

local function clean(text)
  text = text:gsub("<a href='command:[^']*'>[^<]*</a>", "")
  return vim.tbl_filter(function(l) return l:match("%S") end, vim.split(text, "\n"))
end

local function doc_url(full)
  full = (vim.trim(full):gsub("%*+$", "")) -- footer is italic: *Full name: X*
  if not (full:match("^System%.") or full:match("^Microsoft%.") or full:match("^FSharp%.")) then
    return nil -- your own code has no external docs
  end
  if full:match("^Microsoft%.FSharp%.") or full:match("^FSharp%.") then
    return "https://learn.microsoft.com/search/?terms=" .. full:gsub("<.*", "")
  end
  -- System.Collections.Generic.List<'T>  ->  system.collections.generic.list-1
  local base, generics = full:match("^([^<]+)<(.*)>$")
  base = (base or full):gsub("`(%d+)", "-%1")
  if generics then
    local _, commas = generics:gsub(",", "")
    base = base .. "-" .. (commas + 1)
  end
  base = base:gsub("%(.*", "") -- drop method parameter lists
  return "https://learn.microsoft.com/dotnet/api/" .. base:lower()
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        fsautocomplete = {
          settings = { FSharp = { TooltipMode = "full" } }, -- gK needs the "Full name:" footer
          keys = {
            {
              "K",
              function()
                hover_text(function(text)
                  vim.lsp.util.open_floating_preview(clean(text), "markdown",
                    { border = "rounded", focus_id = "fsharp_hover" })
                end)
              end,
              desc = "Hover (F#)",
            },
            {
              "gK",
              function()
                hover_text(function(text)
                  local full = text:match("Full name:%s*([^\n]+)")
                  if not full then return vim.notify("No full name in hover", vim.log.levels.WARN) end
                  local url = doc_url(full)
                  if not url then return vim.notify(full .. " is your own code, so it has no external docs") end
                  vim.ui.open(url)
                end)
              end,
              desc = "Open .NET docs",
            },
          },
        },
      },
    },
  },
}
