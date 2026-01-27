--if mods["quality"] then require("__quality__.data-updates") end
-- okay i saw ppl on the forums saying this was how you regenerate recycling recipes DO NOT DO THIS

local glass_per_reinforced_glass = settings.startup["rgug-glass-per-reinforced-glass"].value
local reinforced_glass_per_craft = settings.startup["rgug-reinforced-glass-per-craft"].value

local glass_return = (glass_per_reinforced_glass * 0.25) / reinforced_glass_per_craft
local limestone_return = 0.25 / reinforced_glass_per_craft
local salt_return = 0.5 / reinforced_glass_per_craft

data.raw["recipe"]["maraxsis-glass-panes-recycling"].results = {
    {type = "item", name = "glass", amount = math.floor(glass_return), extra_count_fraction = glass_return - math.floor(glass_return)},
    {type = "item", name = "limestone", amount = math.floor(limestone_return), extra_count_fraction = limestone_return - math.floor(limestone_return)},
    {type = "item", name = "salt", amount = math.floor(salt_return), extra_count_fraction = salt_return - math.floor(salt_return)}
}