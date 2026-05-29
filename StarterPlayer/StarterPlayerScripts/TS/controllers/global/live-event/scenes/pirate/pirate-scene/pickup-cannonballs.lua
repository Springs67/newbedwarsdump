local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local u3 = u2.create
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["PickupCannonballs"] = {
        ["name"] = "pickup cannonballs",
        ["event"] = "Heartbeat",
        ["func"] = function(p11, _, _) --[[ Name: func, Line 16 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u5
                [3] = u2
                [4] = u3
                [5] = u6
                [6] = u9
                [7] = u7
                [8] = u8
            --]]
            if p11.elapsedEventTime < u10.ShipReappears then
                return nil
            end
            for _, u12 in u5:GetTagged("CannonballSource") do
                if u12:IsA("Model") and u12.PrimaryPart then
                    u2.portal(u12.PrimaryPart, function() --[[ Line: 22 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u3
                            [3] = u6
                            [4] = u9
                            [5] = u12
                        --]]
                        u2.useInstance(function(p13) --[[ Line: 23 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u6
                                [3] = u9
                                [4] = u12
                            --]]
                            local v16 = u3("ProximityPrompt", {
                                ["ActionText"] = "Collect",
                                ["ObjectText"] = "",
                                ["HoldDuration"] = 1,
                                ["RequiresLineOfSight"] = false,
                                ["Enabled"] = true,
                                ["MaxActivationDistance"] = 8,
                                ["Triggered"] = function(p14) --[[ Name: Triggered, Line 31 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u6
                                        [2] = u9
                                        [3] = u12
                                    --]]
                                    if p14 == u6.LocalPlayer then
                                        local v15 = {
                                            ["model"] = u12
                                        }
                                        u9.Client:GetNamespace("PirateSceneRemotes"):Get("PickupCannonball"):SendToServer(v15)
                                    end
                                end
                            })
                            p13.instance = v16
                            return v16
                        end)
                    end)
                end
            end
            local v17 = u7:getState().Inventory.observedInventory.inventory.hand
            if v17 ~= nil then
                v17 = v17.itemType
            end
            if v17 == u8.CANNON_BALL then
                for _, u18 in u5:GetTagged("LobbyCannon") do
                    if u18:IsA("Model") and u18.PrimaryPart then
                        u2.portal(u18.PrimaryPart, function() --[[ Line: 53 ]]
                            --[[
                            Upvalues:
                                [1] = u2
                                [2] = u3
                                [3] = u6
                                [4] = u9
                                [5] = u18
                            --]]
                            u2.useInstance(function(p19) --[[ Line: 54 ]]
                                --[[
                                Upvalues:
                                    [1] = u3
                                    [2] = u6
                                    [3] = u9
                                    [4] = u18
                                --]]
                                local v22 = u3("ProximityPrompt", {
                                    ["ActionText"] = "Insert",
                                    ["ObjectText"] = "",
                                    ["HoldDuration"] = 1,
                                    ["RequiresLineOfSight"] = false,
                                    ["Enabled"] = true,
                                    ["MaxActivationDistance"] = 8,
                                    ["Triggered"] = function(p20) --[[ Name: Triggered, Line 62 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u6
                                            [2] = u9
                                            [3] = u18
                                        --]]
                                        if p20 == u6.LocalPlayer then
                                            local v21 = {
                                                ["cannon"] = u18
                                            }
                                            u9.Client:GetNamespace("PirateSceneRemotes"):Get("InsertCannonball"):SendToServer(v21)
                                        end
                                    end
                                })
                                p19.instance = v22
                                return v22
                            end)
                        end)
                    end
                end
            end
        end
    }
}