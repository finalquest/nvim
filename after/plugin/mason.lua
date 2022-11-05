local msetup, mason = pcall(require, "mason")
if not msetup then
  return
end

local mcsetup, mason_config = pcall(require, "mason-lspconfig")
if not mcsetup then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_config.setup({
  ensure_installed = {
    'tsserver',
   'rust_analyzer',
  }
})

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint"
  }
})


