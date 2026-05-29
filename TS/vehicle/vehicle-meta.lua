local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u4 = {
    [v3.MINICOPTER] = {
        ["name"] = "Minicopter",
        ["checkOwner"] = true,
        ["helicopter"] = {
            ["attack"] = false
        }
    },
    [v3.ATTACK_HELI] = {
        ["name"] = "Attack Helicopter",
        ["helicopter"] = {
            ["attack"] = true
        }
    },
    [v3.UFO] = {
        ["name"] = "UFO"
    },
    [v3.FLYING_CLOUD] = {
        ["name"] = "Flying Cloud"
    },
    [v3.HOT_AIR_BALLOON] = {
        ["name"] = "Hot Air Balloon"
    },
    [v3.FLYING_BROOM] = {
        ["name"] = "Flying Broom"
    },
    [v3.JELLYFISH_MOUNT] = {
        ["name"] = "Jellyfish Mount"
    },
    [v3.SLEIGH] = {
        ["name"] = "Sleigh"
    },
    [v3.FLYING_CARPET] = {
        ["name"] = "Flying Carpet",
        ["sitAnimation"] = v2.SIT_FLAT
    }
}
return {
    ["getVehicleMeta"] = function(p5) --[[ Name: getVehicleMeta, Line 42 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end,
    ["VehicleMeta"] = u4
}