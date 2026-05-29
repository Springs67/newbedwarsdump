local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.VisualTopAttachment = "VisualTopAttachment"
v1.VisualTopAttachment = "VisualTopAttachment"
v2.VisualMiddleAttachment = "VisualMiddleAttachment"
v1.VisualMiddleAttachment = "VisualMiddleAttachment"
v2.VisualBottomAttachment = "VisualBottomAttachment"
v1.VisualBottomAttachment = "VisualBottomAttachment"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.Fire = "Fire"
v3.Fire = "Fire"
v4.LifeSteal = "LifeSteal"
v3.LifeSteal = "LifeSteal"
v4.Static = "Static"
v3.Static = "Static"
v4.ComboMaster = "ComboMaster"
v3.ComboMaster = "ComboMaster"
v4.Fortune = "Fortune"
v3.Fortune = "Fortune"
v4.DamageStatUpgrade = "DamageStatUpgrade"
v3.DamageStatUpgrade = "DamageStatUpgrade"
v4.ToolEnchantEfficiency = "ToolEnchantEfficiency"
v3.ToolEnchantEfficiency = "ToolEnchantEfficiency"
v4.Cleave = "Cleave"
v3.Cleave = "Cleave"
v4.Berserker = "Berserker"
v3.Berserker = "Berserker"
v4.SoulReaver = "SoulReaver"
v3.SoulReaver = "SoulReaver"
return {
    ["VisualizerAttachments"] = v2,
    ["VisualizerCategory"] = v4
}