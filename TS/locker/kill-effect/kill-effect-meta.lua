local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v6 = {
    [v5.NONE] = {
        ["name"] = "None"
    },
    [v5.EXPLODE] = {
        ["name"] = "Explode"
    },
    [v5.SHARK] = {
        ["name"] = "Shark Bite",
        ["image"] = v2.SHARK_BITE_KILL_EFFECT_RENDER,
        ["preview"] = {
            ["offset"] = Vector3.new(0, 1.5, 0)
        }
    },
    [v5.STATUE] = {
        ["name"] = "Statue"
    },
    [v5.CONFETTI] = {
        ["name"] = "Confetti"
    },
    [v5.ASCEND] = {
        ["name"] = "Ascend"
    },
    [v5.HEART] = {
        ["name"] = "Heart"
    },
    [v5.NUKE] = {
        ["name"] = "Nuke"
    },
    [v5.JELLY] = {
        ["name"] = "Jelly",
        ["image"] = "rbxassetid://8273432599"
    },
    [v5.BLIMP] = {
        ["name"] = "Blimp",
        ["image"] = "rbxassetid://8274922323",
        ["preview"] = {
            ["offset"] = Vector3.new(0, 1.5, 0)
        }
    },
    [v5.GIFT] = {
        ["name"] = "Gift",
        ["image"] = "rbxassetid://8273441274"
    },
    [v5.SNOWMAN] = {
        ["name"] = "Snowman",
        ["image"] = "rbxassetid://8274283485"
    },
    [v5.ABDUCTION] = {
        ["name"] = "Abduction",
        ["image"] = "rbxassetid://8326939283",
        ["preview"] = {
            ["offset"] = Vector3.new(0, 1.5, 0)
        }
    },
    [v5.COFFIN] = {
        ["name"] = "Coffin",
        ["image"] = "rbxassetid://8326939567"
    },
    [v5.LANTERN] = {
        ["name"] = "Lantern",
        ["image"] = "rbxassetid://8666448528"
    },
    [v5.ROCKET] = {
        ["name"] = "Rocket",
        ["image"] = "rbxassetid://9135930424",
        ["preview"] = {
            ["offset"] = Vector3.new(0, 3, 0)
        }
    },
    [v5.BIRD] = {
        ["name"] = "Bird",
        ["image"] = "rbxassetid://9136110528"
    },
    [v5.BLACKHOLE] = {
        ["name"] = "Blackhole",
        ["image"] = "rbxassetid://7976208473"
    },
    [v5.GLITCH] = {
        ["name"] = "Glitch",
        ["image"] = "rbxassetid://9872298649"
    },
    [v5.LIFE_RING] = {
        ["name"] = "Life Ring",
        ["image"] = "rbxassetid://9872222447"
    },
    [v5.BEACH_BALL] = {
        ["name"] = "Beach Ball",
        ["image"] = "rbxassetid://9872222228"
    },
    [v5.PIRATE_SHIP_ATTACK] = {
        ["name"] = "Pirate Ship Attack",
        ["image"] = "rbxassetid://10717445476"
    },
    [v5.GHOST] = {
        ["name"] = "Ghost",
        ["image"] = "rbxassetid://10736244575"
    },
    [v5.KNIFE_RAIN] = {
        ["name"] = "Knife Rain",
        ["image"] = v2.KNIFE_RAIN
    },
    [v5.MIRROR] = {
        ["name"] = "Mirror Dimension",
        ["image"] = v2.MIRROR_KILL_EFFECT
    },
    [v5.BUTTERFLY] = {
        ["name"] = "Spirit Orbs Attack",
        ["image"] = "rbxassetid://11003553825"
    },
    [v5.GRAVESTONE] = {
        ["name"] = "Gravestone",
        ["image"] = "rbxassetid://11403413424",
        ["preview"] = {
            ["floorVisible"] = true
        }
    },
    [v5.RIBBON] = {
        ["name"] = "Wrapped Up"
    },
    [v5.SNOWBALL] = {
        ["name"] = "Snowball Fight",
        ["image"] = v3(v4.SNOWBALL).image
    },
    [v5.ICE_BLOCK] = {
        ["name"] = "Ice Block"
    },
    [v5.FIREWORK] = {
        ["name"] = "Firework"
    },
    [v5.RAVE] = {
        ["name"] = "Rave",
        ["image"] = "rbxassetid://12520374271"
    },
    [v5.ATOMIC] = {
        ["name"] = "Atomic",
        ["image"] = "rbxassetid://12519723125"
    },
    [v5.SWORD] = {
        ["name"] = "Luminous Sword",
        ["image"] = "rbxassetid://12519722637"
    },
    [v5.BOXING_GLOVE] = {
        ["name"] = "Boxing Glove",
        ["image"] = "rbxassetid://13839928576"
    },
    [v5.BUBBLES] = {
        ["name"] = "Bubbles",
        ["image"] = "rbxassetid://5169099229"
    },
    [v5.STARS] = {
        ["name"] = "Stars",
        ["image"] = v2.STAR_SOLID
    },
    [v5.SKULL_DROP] = {
        ["name"] = "Skull Drop",
        ["image"] = ""
    },
    [v5.RAGE_BLADE] = {
        ["name"] = "Rage Blade",
        ["image"] = "rbxassetid://14568425448"
    },
    [v5.SOUL_LEAVE] = {
        ["name"] = "Soul Leave",
        ["image"] = "rbxassetid://15056421946"
    },
    [v5.SKELETON] = {
        ["name"] = "Skeleton",
        ["image"] = "rbxassetid://15056426905"
    },
    [v5.GIANT_GLOVE] = {
        ["name"] = "Giant Glove",
        ["image"] = "rbxassetid://15364456745",
        ["preview"] = {
            ["offset"] = Vector3.new(0, 0.5, 0)
        }
    },
    [v5.BROOM] = {
        ["name"] = "Broom Sweep",
        ["image"] = "rbxassetid://15373469283"
    },
    [v5.PORTAL] = {
        ["name"] = "Portal",
        ["image"] = "rbxassetid://15374644585"
    },
    [v5.PENGUIN_CRUSH] = {
        ["name"] = "Penguin Crush",
        ["image"] = v2.PENGUIN_CRUSH
    },
    [v5.ELK] = {
        ["name"] = "Antler Strike",
        ["image"] = v2.ELK_KILL_EFFECT
    },
    [v5.SPIRIT_ASSASSIN] = {
        ["name"] = "Dragged Under",
        ["image"] = "rbxassetid://16390556030",
        ["preview"] = {
            ["floorVisible"] = true,
            ["offset"] = Vector3.new(0, 1.5, 0)
        }
    },
    [v5.LUNAR_DRAGON] = {
        ["name"] = "Lunar Dragon",
        ["image"] = "rbxassetid://16214613731"
    },
    [v5.BLASTING_OFF] = {
        ["name"] = "Blasting Off Again",
        ["image"] = "rbxassetid://17025835579"
    }
}
local v7 = v5.TOILET
local v8 = {
    ["name"] = "Toilet Flush",
    ["image"] = "rbxassetid://17013072610",
    ["preview"] = {
        ["offset"] = Vector3.new(0, 0.5, 0),
        ["customAngle"] = CFrame.Angles(0, 4.101523742186674, 0)
    }
}
v6[v7] = v8
v6[v5.BLESSED_HEAVEN] = {
    ["name"] = "Blessed Heaven",
    ["image"] = "rbxassetid://17025290596"
}
v6[v5.FLOAT_AWAY] = {
    ["name"] = "Float Away",
    ["image"] = "rbxassetid://17600465541"
}
v6[v5.JUDGEMENT_DAY] = {
    ["name"] = "Judgement Day",
    ["image"] = "rbxassetid://17762370793"
}
v6[v5.SUMMER_PET_DANCE] = {
    ["name"] = "Summer Pet Dance",
    ["image"] = "rbxassetid://18251034658"
}
v6[v5.DISMANTLE] = {
    ["name"] = "Dismantling Slash",
    ["image"] = "rbxassetid://94074658188909"
}
v6[v5.RAVEN_EXPLOSION] = {
    ["name"] = "Dark Omen",
    ["image"] = "rbxassetid://18961511194"
}
v6[v5.ALCHEMY_CIRCLE] = {
    ["name"] = "Transmutation",
    ["image"] = "rbxassetid://18961510854"
}
v6[v5.WEBBED_UP] = {
    ["name"] = "Webbed Up",
    ["image"] = "rbxassetid://128729689652891"
}
v6[v5.GINGERBREADDED] = {
    ["name"] = "Gingerbread Man",
    ["image"] = "rbxassetid://130117969775883"
}
v6[v5.SNOWGLOBE] = {
    ["name"] = "Snowglobe",
    ["image"] = "rbxassetid://140373861399327"
}
local v9 = v5.TUCK_IN
local v10 = {
    ["name"] = "Tuck In",
    ["image"] = v2.TUCK_INTO_BED_KILL_EFFECT_RENDER,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.6108652381980153, 0)
    }
}
v6[v9] = v10
v6[v5.DYNAMITE] = {
    ["name"] = "Dynamite",
    ["image"] = "rbxassetid://121770197575734"
}
v6[v5.PAPER] = {
    ["name"] = "Paperize",
    ["image"] = v2.PAPER_KILL_EFFECT_RENDER
}
v6[v5.YUZI_BLADE_STORM] = {
    ["name"] = "Yuzi Blade Storm",
    ["image"] = "rbxassetid://132350964648969"
}
local v11 = v5.SARCOPHAGUS
local v12 = {
    ["name"] = "Sarcophagus",
    ["image"] = "rbxassetid://76751887221325",
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.6108652381980153, 0)
    }
}
v6[v11] = v12
v6[v5.MUMMY] = {
    ["name"] = "Mummy",
    ["image"] = v2.MUMMY_KILL_EFFECT_RENDER
}
v6[v5.GENIE_LAMP] = {
    ["name"] = "Genie Lamp",
    ["image"] = v2.GENIE_LAMP_KILL_EFFECT_RENDER
}
v6[v5.PILLOW_KILL_EFFECT] = {
    ["name"] = "Pillow",
    ["image"] = "rbxassetid://134628536593359"
}
v6[v5.FROZEN] = {
    ["name"] = "Frozen",
    ["image"] = v2.FROZEN_KILL_EFFECT_RENDER
}
v6[v5.BUTTERFLY_EXPLOSION] = {
    ["name"] = "Butterfly Explosion",
    ["image"] = v2.BUTTERFLY_EXPLOSION_KILL_EFFECT_RENDER
}
v6[v5.ELECTROCUTED] = {
    ["name"] = "Electrocuted",
    ["image"] = v2.ELECTROCUTED_KILL_EFFECT_RENDER
}
v6[v5.JELLYFISH] = {
    ["name"] = "Jellyfish",
    ["image"] = v2.JELLYFISH_KILL_EFFECT_RENDER
}
v6[v5.BLOCK_TRANSFORMATION] = {
    ["name"] = "Block Transformation",
    ["image"] = v2.BLOCK_TRANSFORMATION_KILL_EFFECT_RENDER
}
v6[v5.DRAGON_INCINERATE] = {
    ["name"] = "Dragon Incinerate",
    ["image"] = v2.DRAGON_INCINERATE_KILL_EFFECT_RENDER,
    ["preview"] = {
        ["offset"] = Vector3.new(0, 1.5, 0)
    }
}
v6[v5.BAT] = {
    ["name"] = "Bat-Splode",
    ["image"] = "rbxassetid://98170484841099"
}
v6[v5.POLYMORPH] = {
    ["name"] = "Witch Polymorph",
    ["image"] = v2.MOUSE_GRAY
}
v6[v5.METEOR] = {
    ["name"] = "Meteor",
    ["image"] = v2.METEOR
}
v6[v5.SLEIGH_RAN_OVER] = {
    ["name"] = "Sleigh Ran Over",
    ["image"] = "rbxassetid://99857605333058"
}
local v13 = v5.SNOWBALL_RAN_OVER
local v14 = {
    ["name"] = "Rolling Snowball",
    ["image"] = "rbxassetid://79475547224176",
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, -1.5707963267948966, 0)
    }
}
v6[v13] = v14
v6[v5.AURORA_BLAST] = {
    ["name"] = "Aurora Blast",
    ["image"] = "rbxassetid://132019646839294"
}
v6[v5.FIRE_CRACKERS] = {
    ["name"] = "Fire Crackers",
    ["image"] = "rbxassetid://109740119059975"
}
v6[v5.SHOT_BY_CUPID] = {
    ["name"] = "Shot by Cupid",
    ["image"] = "rbxassetid://137713672420640"
}
v6[v5.VOID_KNIGHT] = {
    ["name"] = "Voidify"
}
v6[v5.EGG_HATCH] = {
    ["name"] = "Egg Hatch",
    ["image"] = "rbxassetid://127643787666554"
}
v6[v5.BEE_STING] = {
    ["name"] = "Bee Sting",
    ["image"] = v2.BEE_STING_KILL_EFFECT_RENDER
}
v6[v5.FLOWER_SPLOSION] = {
    ["name"] = "Flower-Splosion",
    ["image"] = "rbxassetid://94838294213760"
}
v6[v5.CARROT_SPLOSION] = {
    ["name"] = "Carrot-Splosion",
    ["image"] = "rbxassetid://112056185927548"
}
v6[v5.POP] = {
    ["name"] = "Pop",
    ["image"] = v2.POP_KILL_EFFECT_RENDER
}
return {
    ["KillEffectMeta"] = v6
}