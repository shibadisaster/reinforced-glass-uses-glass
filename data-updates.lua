local glass_per_reinforced_glass = math.floor(settings.startup["rgug-glass-per-reinforced-glass"].value + 0.5)
local reinforced_glass_per_craft = math.floor(settings.startup["rgug-reinforced-glass-per-craft"].value + 0.5)
-- insane that lua has no built-in round

-- data.raw["recipe"]["maraxsis-glass-panes"].ingredients = {
--     {type = "item", name = "glass", amount = glass_per_reinforced_glass},
--     {type = "item", name = "limestone", amount = 1},
--     {type = "item", name = "salt", amount = 2}
-- }

for _, ing in ipairs(data.raw["recipe"]["maraxsis-glass-panes"].ingredients) do
    if ing.name == "sand" then 
        ing.name = "glass"
        ing.amount = glass_per_reinforced_glass
    end
end

data.raw["recipe"]["maraxsis-glass-panes"].results = {
    {type = "item", name = "maraxsis-glass-panes", amount = reinforced_glass_per_craft}
}

if settings.startup["rgug-include-glass-in-maraxsis-glassworking-tech"].value then
    table.insert(data.raw["technology"]["maraxsis-glassworking"].effects,
        {
            type = "unlock-recipe",
            recipe = "glass"
        }
    )
end

