local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u4 = {}
local v5 = v3.DODO_BIRD
local v7 = {
    ["model"] = "dodo_bird",
    ["displayName"] = "Dodo Bird",
    ["animations"] = {
        ["jump"] = v2.DODO_BIRD_FLUTTER,
        ["fall"] = v2.DODO_BIRD_FALL,
        ["walk"] = v2.DODO_BIRD_WALK,
        ["idle"] = v2.DODO_BIRD_IDLE
    },
    ["controlBoneCallback"] = function(p6) --[[ Name: controlBoneCallback, Line 15 ]]
        return p6.RootPart.master.torso["torso.001"]
    end
}
u4[v5] = v7
local v8 = v3.DINO
local v10 = {
    ["model"] = "dino",
    ["displayName"] = "Dino",
    ["animations"] = {
        ["jump"] = v2.DINO_JUMP,
        ["fall"] = v2.DINO_FALLING,
        ["walk"] = v2.DINO_WALKING,
        ["idle"] = v2.DINO_IDLE
    },
    ["controlBoneCallback"] = function(p9) --[[ Name: controlBoneCallback, Line 29 ]]
        return p9.HumanoidRootPart.master_bone.torso["torso.001"]
    end
}
u4[v8] = v10
local v11 = v3.ELK
local v13 = {
    ["model"] = "elk",
    ["displayName"] = "Elk",
    ["mountHipYOffset"] = 2,
    ["playerMountOffset"] = Vector3.new(0, -1.75, 1),
    ["animations"] = {
        ["jump"] = v2.ELK_JUMP,
        ["fall"] = v2.ELK_FALLING,
        ["walk"] = v2.ELK_WALKING,
        ["idle"] = v2.ELK_IDLE
    },
    ["controlBoneCallback"] = function(p12) --[[ Name: controlBoneCallback, Line 43 ]]
        return p12.RootPart["master bone"].root.spine1
    end
}
u4[v11] = v13
local v14 = v3.TINKER
local v16 = {
    ["model"] = "tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p15) --[[ Name: controlBoneCallback, Line 59 ]]
        return p15.RootPart.root.torso.seat
    end
}
u4[v14] = v16
local v17 = v3.IRON_TINKER
local v19 = {
    ["model"] = "iron_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p18) --[[ Name: controlBoneCallback, Line 74 ]]
        return p18.RootPart.root.torso.seat
    end
}
u4[v17] = v19
local v20 = v3.DIAMOND_TINKER
local v22 = {
    ["model"] = "diamond_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p21) --[[ Name: controlBoneCallback, Line 89 ]]
        return p21.RootPart.root.torso.seat
    end
}
u4[v20] = v22
local v23 = v3.EMERALD_TINKER
local v25 = {
    ["model"] = "emerald_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p24) --[[ Name: controlBoneCallback, Line 104 ]]
        return p24.RootPart.root.torso.seat
    end
}
u4[v23] = v25
local v26 = v3.VOID_TINKER
local v28 = {
    ["model"] = "void_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p27) --[[ Name: controlBoneCallback, Line 119 ]]
        return p27.RootPart.root.torso.seat
    end
}
u4[v26] = v28
local v29 = v3.FISH_TANK_TINKER
local v31 = {
    ["model"] = "fish_tank_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p30) --[[ Name: controlBoneCallback, Line 134 ]]
        return p30.RootPart.root.torso.seat
    end
}
u4[v29] = v31
local v32 = v3.FISH_TANK_IRON_TINKER
local v34 = {
    ["model"] = "fish_tank_iron_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p33) --[[ Name: controlBoneCallback, Line 149 ]]
        return p33.RootPart.root.torso.seat
    end
}
u4[v32] = v34
local v35 = v3.FISH_TANK_DIAMOND_TINKER
local v37 = {
    ["model"] = "fish_tank_diamond_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p36) --[[ Name: controlBoneCallback, Line 164 ]]
        return p36.RootPart.root.torso.seat
    end
}
u4[v35] = v37
local v38 = v3.FISH_TANK_EMERALD_TINKER
local v40 = {
    ["model"] = "fish_tank_emerald_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p39) --[[ Name: controlBoneCallback, Line 179 ]]
        return p39.RootPart.root.torso.seat
    end
}
u4[v38] = v40
local v41 = v3.FISH_TANK_VOID_TINKER
local v43 = {
    ["model"] = "fish_tank_void_tinker",
    ["displayName"] = "Tinker",
    ["mountHipYOffset"] = 0.5,
    ["animations"] = {
        ["jump"] = v2.TINKER_JUMP,
        ["fall"] = v2.TINKER_FALL,
        ["walk"] = v2.TINKER_RUN,
        ["idle"] = v2.TINKER_IDLE
    },
    ["controlBoneCallback"] = function(p42) --[[ Name: controlBoneCallback, Line 194 ]]
        return p42.RootPart.root.torso.seat
    end
}
u4[v41] = v43
local v44 = v3.CHAMELEON
local v46 = {
    ["model"] = "chameleon",
    ["displayName"] = "Chameleon",
    ["playerMountOffset"] = Vector3.new(0, -2.2, 0),
    ["playerMountRotationOffsetDegrees"] = Vector3.new(-80, 0, 0),
    ["animations"] = {
        ["jump"] = v2.DINO_JUMP,
        ["fall"] = v2.DINO_FALLING,
        ["walk"] = v2.CHAMELEON_WALK,
        ["idle"] = v2.CHAMELEON_IDLE
    },
    ["controlBoneCallback"] = function(p45) --[[ Name: controlBoneCallback, Line 209 ]]
        return p45.body.master_bone.torso
    end
}
u4[v44] = v46
return {
    ["getMountMeta"] = function(p47) --[[ Name: getMountMeta, Line 217 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p47]
    end,
    ["MountMeta"] = u4
}