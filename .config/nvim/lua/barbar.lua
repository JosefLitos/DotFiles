vim.cmd([[
let bufferline.animation = v:false
let bufferline.maximum_padding = 0
let bufferline.icon_close_tab = ''
]])
hi('BufferCurrent', colors.light[2])
hi('BufferCurrentMod', colors.red[2])
hi('BufferCurrentSign', colors.hi[2])
hi('BufferVisible', colors.light[1], colors.dark[2])
hi('BufferVisibleMod', colors.magenta[1], colors.dark[2])
hi('BufferVisibleSign', colors.cyan[2], colors.dark[2])
hi('BufferInactive', colors.light[1])
hi('BufferInactiveMod', colors.orange[1])
hi('BufferInactiveSign', colors.light[1])
