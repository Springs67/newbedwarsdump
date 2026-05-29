local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local v2 = {
    [v1.KIT] = {
        ["name"] = "Kit",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(255, 48, 48),
        ["backgroundColor"] = Color3.fromRGB(240, 15, 15),
        ["frameSize"] = UDim2.new(0, 115, 0, 115)
    },
    [v1.KILL_EFFECT] = {
        ["name"] = "Kill Effect",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(66, 235, 204),
        ["backgroundColor"] = Color3.fromRGB(0, 204, 158),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.LOBBY_GADGET] = {
        ["name"] = "Lobby Gadget",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(237, 66, 122),
        ["backgroundColor"] = Color3.fromRGB(242, 48, 112),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.KIT_SKIN] = {
        ["name"] = "Kit Skin",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(237, 66, 166),
        ["backgroundColor"] = Color3.fromRGB(237, 66, 186),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.BED_BREAK_EFFECT] = {
        ["name"] = "Bed Break Effect",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(161, 66, 237),
        ["backgroundColor"] = Color3.fromRGB(135, 3, 209),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.WIN_EFFECT] = {
        ["name"] = "Win Effect",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(235, 28, 69),
        ["backgroundColor"] = Color3.fromRGB(237, 66, 66),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.BED_SKIN] = {
        ["name"] = "Bed Skin",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(28, 235, 235),
        ["backgroundColor"] = Color3.fromRGB(94, 242, 230),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.ITEM_SKIN] = {
        ["name"] = "Item Skin",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(28, 235, 235),
        ["backgroundColor"] = Color3.fromRGB(94, 242, 230),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.EMOTE] = {
        ["name"] = "Animated Emote",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(66, 107, 237),
        ["backgroundColor"] = Color3.fromRGB(66, 140, 237),
        ["frameSize"] = UDim2.new(0, 95, 0, 95)
    },
    [v1.CRATE] = {
        ["name"] = "Crate",
        ["gradient"] = true,
        ["frameShine"] = true,
        ["borderColor"] = Color3.fromRGB(255, 214, 79),
        ["backgroundColor"] = Color3.fromRGB(255, 207, 10),
        ["frameSize"] = UDim2.new(0, 75, 0, 75)
    },
    [v1.BED_COINS] = {
        ["name"] = "Bed Coins",
        ["gradient"] = true,
        ["borderColor"] = Color3.fromRGB(222, 125, 0),
        ["backgroundColor"] = Color3.fromRGB(204, 99, 0),
        ["frameSize"] = UDim2.new(0, 75, 0, 75)
    }
}
return {
    ["BPRewardDisplayMeta"] = v2
}