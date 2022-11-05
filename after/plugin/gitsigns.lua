local gits, gitsign = pcall(require, "gitsigns")
if not gits then
  return
end

gitsign.setup()
