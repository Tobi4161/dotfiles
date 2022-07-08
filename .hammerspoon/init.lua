-- require "TerminalPalette"

local fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)

-- require "init.fnl"

fennel.dofile("init.fnl", { allowdGlobals = false })

hs.notify.show("Hammerspoon", "", "Hammespoon config loaded")
hs.alert("Current layout: " .. hs.keycodes.currentLayout())
