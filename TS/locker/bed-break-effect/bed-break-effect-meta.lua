local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v4 = {
    [v3.NONE] = {
        ["name"] = "None"
    },
    [v3.METEOR] = {
        ["name"] = "Meteor",
        ["image"] = "rbxassetid://95118495480315"
    },
    [v3.LIGHTNING_STRIKE] = {
        ["name"] = "Lightning Strike",
        ["image"] = "rbxassetid://18567011312"
    },
    [v3.VOID_PORTAL] = {
        ["name"] = "Event Horizon",
        ["image"] = "rbxassetid://18963891855"
    },
    [v3.CRYSTALLIZE] = {
        ["name"] = "Crystallized",
        ["image"] = "rbxassetid://18963958790"
    },
    [v3.GHOSTIFY] = {
        ["name"] = "Ghostify",
        ["image"] = "rbxassetid://94969482814798"
    },
    [v3.FIREWOOD] = {
        ["name"] = "Firewood",
        ["image"] = "rbxassetid://81639827268383"
    },
    [v3.CUBE_SPLIT] = {
        ["name"] = "Cube Split",
        ["image"] = v2.CUBE_SPLIT_BED_BREAK_EFFECT_RENDER
    },
    [v3.BUTTERFLY_SWARM] = {
        ["name"] = "Butterfly Swarm",
        ["image"] = v2.BUTTERFLY_SWARM_BED_BREAK_EFFECT_RENDER
    },
    [v3.PET] = {
        ["name"] = "Pet Bed",
        ["image"] = v2.PET_BED_BREAK_EFFECT_RENDER
    },
    [v3.SNAKE] = {
        ["name"] = "Snake",
        ["image"] = "rbxassetid://117347663487455"
    },
    [v3.UFO] = {
        ["name"] = "UFO",
        ["image"] = "rbxassetid://70692766614582",
        ["preview"] = {
            ["offset"] = Vector3.new(0, 1.5, 0)
        }
    },
    [v3.SARCOPHAGUS] = {
        ["name"] = "Sarcophagus",
        ["image"] = "rbxassetid://83346878798270"
    },
    [v3.CONFETTI] = {
        ["name"] = "Confetti",
        ["image"] = v2.CONFETTI_BED_BREAK_EFFECT_RENDER
    },
    [v3.FROZEN] = {
        ["name"] = "Frozen",
        ["image"] = v2.FROST_BED_BREAK_EFFECT_RENDER
    },
    [v3.BUTTERFLY_EXPLOSION] = {
        ["name"] = "Butterfly Explosion",
        ["image"] = v2.AERY_BED_BREAK_EFFECT_RENDER
    },
    [v3.ELECTROCUTED] = {
        ["name"] = "Electrocuted",
        ["image"] = v2.ELEKTRA_BED_BREAK_EFFECT_RENDER
    },
    [v3.JELLYFISH] = {
        ["name"] = "Jellyfish",
        ["image"] = v2.JELLYFISH_BED_BREAK_EFFECT_RENDER
    },
    [v3.DRAGON_INCINERATE] = {
        ["name"] = "Dragon Incinerate",
        ["image"] = v2.DRAGON_INCINERATE_BED_BREAK_EFFECT_RENDER
    },
    [v3.PILLOW] = {
        ["name"] = "Pillow",
        ["image"] = "rbxassetid://139531314537564"
    },
    [v3.BAT] = {
        ["name"] = "Bat-Splode",
        ["image"] = "rbxassetid://98170484841099"
    },
    [v3.CENTIPEDE] = {
        ["name"] = "Centipede",
        ["image"] = "rbxassetid://88471090976239"
    },
    [v3.SNOWBALL] = {
        ["name"] = "Snowball",
        ["image"] = "rbxassetid://78725992714423"
    },
    [v3.ROSE] = {
        ["name"] = "Rose",
        ["image"] = "rbxassetid://130402866445817"
    },
    [v3.FIREWORK] = {
        ["name"] = "Firework",
        ["image"] = "rbxassetid://80975586407417"
    },
    [v3.VOID_CREATURES] = {
        ["name"] = "Void Creature",
        ["image"] = "rbxassetid://113266100407014"
    },
    [v3.POP] = {
        ["name"] = "Pop",
        ["image"] = v2.POP_BED_BREAK_EFFECT_RENDER
    },
    [v3.BALLOONS] = {
        ["name"] = "Float Away",
        ["image"] = "rbxassetid://97597876410162"
    },
    [v3.FLOWER_SPLOSION] = {
        ["name"] = "Flower-Splosion",
        ["image"] = "rbxassetid://94838294213760"
    }
}
return {
    ["BedBreakEffectMeta"] = v4
}