local autos, auto = pcall(require, "nvim-autopairs")
if not autos then
  return
end

auto.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false, 
  }
})

local cmp_auto_s, cmp_auto = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_auto_s then
  return
end

local cmp_s, cmp = pcall(require, "cmp")
if not cmp_s then
  return
end

cmp.event:on("confirm_done", cmp_auto.on_confirm_done())
