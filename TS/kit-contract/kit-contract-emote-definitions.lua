local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local v4 = {
    [v2.BARBARIAN] = {
        ["imageId"] = v3.barbarian.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.SPIRIT_ASSASSIN] = {
        ["imageId"] = v3.spirit_assassin.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.GRIM_REAPER] = {
        ["imageId"] = v3.grim_reaper.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.DASHER] = {
        ["imageId"] = v3.dasher.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.AERY] = {
        ["imageId"] = v3.aery.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.BAKER] = {
        ["imageId"] = v3.baker.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.OWL] = {
        ["imageId"] = v3.owl.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.COWGIRL] = {
        ["imageId"] = v3.cowgirl.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.AIRBENDER] = {
        ["imageId"] = v3.airbender.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.JELLYFISH] = {
        ["imageId"] = v3.jellyfish.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.SUMMONER] = {
        ["imageId"] = v3.summoner.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.ELEKTRA] = {
        ["imageId"] = v3.elektra.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.MIMIC] = {
        ["imageId"] = v3.mimic.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.FROSTY_HAMMER] = {
        ["imageId"] = v3.frost_hammer_kit.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    },
    [v2.VOID_KNIGHT] = {
        ["imageId"] = v3.void_knight.renderImage,
        ["imageLabelOffset"] = UDim2.new(0, 5, 0, -5)
    }
}
return {
    ["KitContractEmoteDefinitions"] = v4
}