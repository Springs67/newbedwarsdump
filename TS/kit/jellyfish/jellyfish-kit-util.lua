local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.Bell_Inner = "Bell_Inner"
v2.Bell_Inner = "Bell_Inner"
v3.Bell_Outer = "Bell_Outer"
v2.Bell_Outer = "Bell_Outer"
v3.Bell_Under = "Bell_Under"
v2.Bell_Under = "Bell_Under"
v3.Detail_Ring = "Detail_Ring"
v2.Detail_Ring = "Detail_Ring"
v3.Tentacles_1 = "Tentacles_1"
v2.Tentacles_1 = "Tentacles_1"
v3.Tentacles_2 = "Tentacles_2"
v2.Tentacles_2 = "Tentacles_2"
v3.Tentacles_3 = "Tentacles_3"
v2.Tentacles_3 = "Tentacles_3"
return {
    ["JellyfishBalance"] = {
        ["DistanceFromGround"] = Vector3.new(0, 4, 0),
        ["DistancePlayerCanPlaceJellyfish"] = 21,
        ["JellyfishAnimationDistance"] = 30,
        ["JellyfishMobileAnimationDistance"] = 20,
        ["JellyfishMinDistance"] = 18,
        ["MaxReplicationRadius"] = 36,
        ["AdditionalRangeForPlayer"] = 9,
        ["MaxJellyfishPlaced"] = 4,
        ["MaxJellyfishOwned"] = 4,
        ["GetJellyfishTime"] = 35,
        ["MaxTargetsPerJellyfish"] = 3,
        ["ShockArmorMultiplier"] = 0.6,
        ["BaseDamagePerShock"] = 14,
        ["JellyfishShockScaling"] = 0.1,
        ["BaseRangeForShock"] = 30,
        ["JellyfishRangeScaling"] = 5,
        ["JellyfishHealth"] = 70
    },
    ["JellyfishPlacement"] = {
        ["jellyfishHasBlockOverlap"] = function(p4) --[[ Name: jellyfishHasBlockOverlap, Line 76 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v5 = u1:getBlockPosition(p4)
            local v6 = u1:getStore()
            local v7 = v5 - Vector3.new(0, 1, 0)
            return next(v6:getBlocksInRegion3(Region3.new(v7, v5 + Vector3.new(0, 1, 0)))) ~= nil
        end
    },
    ["JellyfishParts"] = v3,
    ["SelfJellyfishColors"] = {
        [v3.Bell_Inner] = Color3.fromRGB(71, 109, 165),
        [v3.Bell_Outer] = Color3.fromRGB(87, 109, 255),
        [v3.Bell_Under] = Color3.fromRGB(109, 122, 165),
        [v3.Detail_Ring] = Color3.fromRGB(110, 152, 165),
        [v3.Tentacles_1] = Color3.fromRGB(87, 121, 171),
        [v3.Tentacles_2] = Color3.fromRGB(93, 136, 170),
        [v3.Tentacles_3] = Color3.fromRGB(122, 146, 165)
    },
    ["EnemyJellyfishColors"] = {
        [v3.Bell_Inner] = Color3.fromRGB(165, 71, 71),
        [v3.Bell_Outer] = Color3.fromRGB(255, 87, 87),
        [v3.Bell_Under] = Color3.fromRGB(255, 89, 89),
        [v3.Detail_Ring] = Color3.fromRGB(175, 161, 155),
        [v3.Tentacles_1] = Color3.fromRGB(158, 79, 79),
        [v3.Tentacles_2] = Color3.fromRGB(255, 80, 80),
        [v3.Tentacles_3] = Color3.fromRGB(185, 115, 115)
    },
    ["TeamJellyfishColors"] = {
        [v3.Bell_Inner] = Color3.fromRGB(135, 135, 135),
        [v3.Bell_Outer] = Color3.fromRGB(145, 145, 145),
        [v3.Bell_Under] = Color3.fromRGB(151, 154, 165),
        [v3.Detail_Ring] = Color3.fromRGB(169, 170, 175),
        [v3.Tentacles_1] = Color3.fromRGB(137, 145, 154),
        [v3.Tentacles_2] = Color3.fromRGB(154, 159, 170),
        [v3.Tentacles_3] = Color3.fromRGB(165, 165, 165)
    },
    ["PrismaticMarinaColors"] = {
        Color3.fromRGB(206, 15, 0),
        Color3.fromRGB(206, 79, 0),
        Color3.fromRGB(48, 160, 0),
        Color3.fromRGB(0, 142, 169),
        Color3.fromRGB(0, 16, 242),
        Color3.fromRGB(181, 37, 112)
    },
    ["PrismaticJellyfishColors"] = {
        Color3.fromRGB(206, 15, 0),
        Color3.fromRGB(206, 79, 0),
        Color3.fromRGB(48, 160, 0),
        Color3.fromRGB(0, 142, 169),
        Color3.fromRGB(0, 16, 242),
        Color3.fromRGB(181, 37, 112)
    }
}