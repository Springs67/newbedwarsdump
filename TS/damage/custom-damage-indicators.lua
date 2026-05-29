local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.MagicalGirlRapierCrit = 0
v4[0] = "MagicalGirlRapierCrit"
v5.EmeraldShield = 1
v4[1] = "EmeraldShield"
v5.Nyx = 2
v4[2] = "Nyx"
v5.EmpoweredDamage = 3
v4[3] = "EmpoweredDamage"
v5.FrostArrow = 4
v4[4] = "FrostArrow"
v5.FalconEye = 5
v4[5] = "FalconEye"
v5.Crit = 6
v4[6] = "Crit"
v5.HighCrit = 7
v4[7] = "HighCrit"
v5.TrueDamage = 8
v4[8] = "TrueDamage"
v5.FireSheep = 9
v4[9] = "FireSheep"
v5.FrostBite = 10
v4[10] = "FrostBite"
v5.WindWalkerDamage = 11
v4[11] = "WindWalkerDamage"
v5.BlackholdBomb = 12
v4[12] = "BlackholdBomb"
v5.MythicScythe = 13
v4[13] = "MythicScythe"
v5.Rainbow1 = 14
v4[14] = "Rainbow1"
v5.Rainbow2 = 15
v4[15] = "Rainbow2"
v5.Rainbow3 = 16
v4[16] = "Rainbow3"
v5.Rainbow4 = 17
v4[17] = "Rainbow4"
v5.Rainbow5 = 18
v4[18] = "Rainbow5"
v5.Rainbow6 = 19
v4[19] = "Rainbow6"
v5.Rainbow7 = 20
v4[20] = "Rainbow7"
v5.Rainbow8 = 21
v4[21] = "Rainbow8"
v5.LightSwordSwing = 22
v4[22] = "LightSwordSwing"
v5.MediumSwordSwing = 23
v4[23] = "MediumSwordSwing"
v5.HeavySwordSwing = 24
v4[24] = "HeavySwordSwing"
local v6 = {
    [v5.MagicalGirlRapierCrit] = {
        ["gradientRotation"] = 45,
        ["image"] = v3.CARD_CRITICAL_HIT,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 48)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 84)) }),
        ["imageColor"] = Color3.fromRGB(255, 199, 48)
    },
    [v5.EmeraldShield] = {
        ["image"] = "rbxassetid://9611273770",
        ["color"] = Color3.fromRGB(255, 196, 46),
        ["imageColor"] = Color3.fromRGB(255, 196, 46)
    },
    [v5.Nyx] = {
        ["image"] = "rbxassetid://9120422525",
        ["gradientRotation"] = 165,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v2.hexColor(13558527)), ColorSequenceKeypoint.new(1, v2.hexColor(12904703)) })
    },
    [v5.EmpoweredDamage] = {
        ["color"] = Color3.fromRGB(73, 18, 132)
    },
    [v5.FrostArrow] = {
        ["image"] = "rbxassetid://8216841057",
        ["gradientRotation"] = 165,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 181, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 159, 255)) })
    },
    [v5.FalconEye] = {
        ["gradientRotation"] = 45,
        ["image"] = v3.CARD_CRITICAL_HIT,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 48)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 84)) }),
        ["imageColor"] = Color3.fromRGB(255, 199, 48)
    },
    [v5.Crit] = {
        ["image"] = "rbxassetid://9611273770",
        ["color"] = Color3.fromRGB(255, 196, 46),
        ["imageColor"] = Color3.fromRGB(255, 196, 46)
    },
    [v5.HighCrit] = {
        ["image"] = "rbxassetid://9611273671",
        ["color"] = Color3.fromRGB(255, 196, 46),
        ["imageColor"] = Color3.fromRGB(255, 196, 46)
    },
    [v5.TrueDamage] = {
        ["color"] = v2.WHITE
    },
    [v5.FireSheep] = {
        ["color"] = ColorSequence.new(Color3.fromRGB(240, 117, 18), Color3.fromRGB(199, 84, 235))
    },
    [v5.FrostBite] = {
        ["image"] = "rbxassetid://8216841057",
        ["gradientRotation"] = 165,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 181, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 159, 255)) })
    },
    [v5.WindWalkerDamage] = {
        ["image"] = "rbxassetid://9871779816",
        ["color"] = Color3.fromRGB(255, 255, 255)
    },
    [v5.BlackholdBomb] = {
        ["color"] = Color3.fromRGB(55, 55, 55)
    },
    [v5.MythicScythe] = {
        ["image"] = "rbxassetid://9120422525",
        ["gradientRotation"] = 165,
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v2.hexColor(13558527)), ColorSequenceKeypoint.new(1, v2.hexColor(12904703)) })
    },
    [v5.Rainbow1] = {
        ["color"] = Color3.fromRGB(255, 115, 115)
    },
    [v5.Rainbow2] = {
        ["color"] = Color3.fromRGB(255, 188, 105)
    },
    [v5.Rainbow3] = {
        ["color"] = Color3.fromRGB(251, 255, 124)
    },
    [v5.Rainbow4] = {
        ["color"] = Color3.fromRGB(150, 255, 129)
    },
    [v5.Rainbow5] = {
        ["color"] = Color3.fromRGB(101, 201, 255)
    },
    [v5.Rainbow6] = {
        ["color"] = Color3.fromRGB(140, 120, 255)
    },
    [v5.Rainbow7] = {
        ["color"] = Color3.fromRGB(255, 139, 255)
    },
    [v5.Rainbow8] = {
        ["color"] = Color3.fromRGB(255, 255, 255)
    },
    [v5.LightSwordSwing] = {
        ["color"] = Color3.fromRGB(255, 64, 61)
    },
    [v5.MediumSwordSwing] = {
        ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 64, 61)), ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 207, 56)) })
    },
    [v5.HeavySwordSwing] = {
        ["color"] = Color3.fromRGB(255, 115, 54)
    }
}
return {
    ["CustomDamageIndicator"] = v5,
    ["CustomDamageIndicators"] = v6
}