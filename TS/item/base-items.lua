local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds").BlockFootstepSound
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "create-sounds").createSounds
return {
    ["BaseItems"] = {
        ["wool"] = function(p6) --[[ Name: wool, Line 16 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
                [3] = u5
                [4] = u4
            --]]
            local v7 = {}
            local v8
            if p6 == nil then
                v8 = p6
            else
                v8 = p6.displayName
            end
            v7.displayName = v8 == nil and "Wool" or v8
            v7.footstepSound = u3.WOOL
            local v9 = {
                ["health"] = 8,
                ["blastResistance"] = 0.65,
                ["wool"] = true,
                ["breakType"] = u2.WOOL,
                ["hitSound"] = function() --[[ Name: hitSound, Line 32 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u4
                    --]]
                    return u5(u4.WOOL_BREAK)
                end,
                ["placeSound"] = function() --[[ Name: placeSound, Line 35 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u4
                    --]]
                    return u5(u4.GENERIC_BLOCK_PLACE)
                end,
                ["greedyMesh"] = {
                    ["textures"] = {}
                }
            }
            local v10
            if p6 == nil then
                v10 = p6
            else
                v10 = p6.minecraftConversions
            end
            v9.minecraftConversions = v10
            v9.flammable = true
            v9.regenSpeed = 0.05
            v7.block = v9
            local v11
            if p6 == nil then
                v11 = p6
            else
                v11 = p6.image
            end
            if v11 ~= "" and v11 then
                v7.image = p6.image
            end
            local v12
            if p6 == nil then
                v12 = p6
            else
                v12 = p6.description
            end
            if v12 ~= "" and v12 then
                v7.description = p6.description
            end
            return v7
        end
    }
}