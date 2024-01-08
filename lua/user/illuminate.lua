local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

illuminate.configure {
  filetypes_denylist = {
    "mason",
    "harpoon",
    "DressingInput",
    "NeogitCommitMessage",
    "qf",
    "dirvish",
    "oil",
    "minifiles",
    "fugitive",
    "alpha",
    "NvimTree",
    "lazy",
    "NeogitStatus",
    "Trouble",
    "netrw",
    "lir",
    "DiffviewFiles",
    "Outline",
    "Jaq",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
}
