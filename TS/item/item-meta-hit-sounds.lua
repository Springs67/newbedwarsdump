local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["SetupItemMetaHitSounds"] = function(p6) --[[ Name: SetupItemMetaHitSounds, Line 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
            [4] = u5
        --]]
        for _, v7 in u4.values(p6) do
            if v7.block then
                local v8 = v7.block.breakType
                if v8 == u2.STONE then
                    local v9 = v7.block
                    if v9.placeSound == nil then
                        function v9.placeSound() --[[ Line: 15 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.STONE_BREAK) }
                        end
                    end
                    local v10 = v7.block
                    if v10.hitSound == nil then
                        function v10.hitSound() --[[ Line: 21 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.STONE_BREAK) }
                        end
                    end
                elseif v8 == u2.WOOD then
                    local v11 = v7.block
                    if v11.placeSound == nil then
                        function v11.placeSound() --[[ Line: 30 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.WOOD_BREAK) }
                        end
                    end
                    local v12 = v7.block
                    if v12.hitSound == nil then
                        function v12.hitSound() --[[ Line: 36 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.WOOD_BREAK) }
                        end
                    end
                elseif v8 == u2.DIRT then
                    local v13 = v7.block
                    if v13.placeSound == nil then
                        function v13.placeSound() --[[ Line: 45 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.GENERIC_BLOCK_PLACE) }
                        end
                    end
                    local v14 = v7.block
                    if v14.hitSound == nil then
                        function v14.hitSound() --[[ Line: 51 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.GENERIC_BLOCK_HIT) }
                        end
                    end
                elseif v8 == u2.WOOL then
                    local v15 = v7.block
                    if v15.placeSound == nil then
                        function v15.placeSound() --[[ Line: 60 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.WOOL_BREAK) }
                        end
                    end
                    local v16 = v7.block
                    if v16.hitSound == nil then
                        function v16.hitSound() --[[ Line: 66 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u5
                            --]]
                            return { u3:createSound(u5.WOOL_BREAK) }
                        end
                    end
                end
            end
        end
    end
}