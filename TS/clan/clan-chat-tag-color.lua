local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.Default = 0
v2[0] = "Default"
v3.RedBlack = 1
v2[1] = "RedBlack"
v3.Rainbow = 2
v2[2] = "Rainbow"
v3.SolidBlue = 3
v2[3] = "SolidBlue"
v3.SolidOrange = 4
v2[4] = "SolidOrange"
v3.Void = 5
v2[5] = "Void"
v3.RoseGold = 6
v2[6] = "RoseGold"
v3.SolidScarlet = 7
v2[7] = "SolidScarlet"
v3.SolidForest = 8
v2[8] = "SolidForest"
v3.FireIce = 9
v2[9] = "FireIce"
v3.BlackPink = 10
v2[10] = "BlackPink"
v3.SolidGold = 11
v2[11] = "SolidGold"
v3.SolidVoid = 12
v2[12] = "SolidVoid"
v3.Aquamarine = 13
v2[13] = "Aquamarine"
v3.Tropical = 14
v2[14] = "Tropical"
v3.SolidBubblegum = 15
v2[15] = "SolidBubblegum"
v3.SolidAzure = 16
v2[16] = "SolidAzure"
v3.Flame = 17
v2[17] = "Flame"
v3.Electric = 18
v2[18] = "Electric"
local v4 = {
    [v3.Default] = {
        ["kind"] = "Color",
        ["name"] = "White Clan Tag (Default)",
        ["color"] = v1.DEFAULT_CLAN_TAG_COLOR
    },
    [v3.RedBlack] = {
        ["kind"] = "Gradient",
        ["name"] = "Red-Black Gradient Clan Tag",
        ["gradient"] = ColorSequence.new(Color3.fromHex("D31B0D"), Color3.fromHex("0A0908"))
    },
    [v3.Rainbow] = {
        ["kind"] = "Gradient",
        ["name"] = "Rainbow Gradient",
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 2, 234)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 226, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(69, 255, 0)) })
    },
    [v3.SolidBlue] = {
        ["kind"] = "Color",
        ["name"] = "Blue Clan Tag",
        ["color"] = Color3.fromHex("7EC0DD")
    },
    [v3.SolidOrange] = {
        ["kind"] = "Color",
        ["name"] = "Orange Clan Tag",
        ["color"] = Color3.fromHex("DD852C")
    },
    [v3.Void] = {
        ["kind"] = "Gradient",
        ["name"] = "Void Gradient",
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("620278")), ColorSequenceKeypoint.new(1, Color3.fromHex("3D3B30")) })
    },
    [v3.RoseGold] = {
        ["kind"] = "Gradient",
        ["name"] = "Rose-Gold Gradient",
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("E9B449")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("E9B449")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("E4D6A7")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("E0607E")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("E0607E"))
        })
    },
    [v3.SolidScarlet] = {
        ["kind"] = "Color",
        ["name"] = "Scarlet Clan Tag",
        ["color"] = Color3.fromHex("DB4345")
    },
    [v3.SolidForest] = {
        ["kind"] = "Color",
        ["name"] = "Forest Clan Tag",
        ["color"] = Color3.fromHex("008F24")
    },
    [v3.FireIce] = {
        ["kind"] = "Gradient",
        ["name"] = "Fire & Ice Gradient",
        ["rotation"] = 15,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("FF5666")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("FF5666")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFCCC9")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("75DDDD")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("75DDDD"))
        })
    },
    [v3.BlackPink] = {
        ["kind"] = "Gradient",
        ["name"] = "Black-Pink Gradient",
        ["rotation"] = 30,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("FF9999")),
            ColorSequenceKeypoint.new(0.4, Color3.fromHex("2D2E2E")),
            ColorSequenceKeypoint.new(0.6, Color3.fromHex("2D2E2E")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("FF9999"))
        })
    },
    [v3.SolidGold] = {
        ["kind"] = "Color",
        ["name"] = "Gold Clan Tag",
        ["color"] = Color3.fromHex("FFBF48")
    },
    [v3.SolidVoid] = {
        ["kind"] = "Color",
        ["name"] = "Void Clan Tag",
        ["color"] = Color3.fromHex("620278")
    },
    [v3.Aquamarine] = {
        ["kind"] = "Gradient",
        ["name"] = "Aquamarine Gradient",
        ["rotation"] = 15,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("4059AD")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("4059AD")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("6BC7AB")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("6D9CC5")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("6D9CC5"))
        })
    },
    [v3.Tropical] = {
        ["kind"] = "Gradient",
        ["name"] = "Tropical Gradient",
        ["rotation"] = 15,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("0F7173")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("0F7173")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("E7ECEF")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("F05D5E")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("F05D5E"))
        })
    },
    [v3.SolidBubblegum] = {
        ["kind"] = "Color",
        ["name"] = "Bubblegum Clan Tag",
        ["color"] = Color3.fromHex("F76F8E")
    },
    [v3.SolidAzure] = {
        ["kind"] = "Color",
        ["name"] = "Azure Clan Tag",
        ["color"] = Color3.fromHex("084887")
    },
    [v3.Flame] = {
        ["kind"] = "Gradient",
        ["name"] = "Fire Gradient",
        ["rotation"] = 15,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("FF9633")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("FF9633")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFEE33")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("BF211E")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("BF211E"))
        })
    },
    [v3.Electric] = {
        ["kind"] = "Gradient",
        ["name"] = "Electric Gradient",
        ["rotation"] = 25,
        ["gradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("1BE7FF")),
            ColorSequenceKeypoint.new(0.25, Color3.fromHex("1BE7FF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("6EEB83")),
            ColorSequenceKeypoint.new(0.75, Color3.fromHex("E4FF1A")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("E4FF1A"))
        })
    }
}
return {
    ["ClanChatTagColorOptions"] = v3,
    ["ChatTagColorDefinition"] = v4
}