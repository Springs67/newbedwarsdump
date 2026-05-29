local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.DeviceUtil
local u5 = v2.ImageId
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard
return {
    ["SocialConnectionsGroup"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u5
            [4] = u8
            [5] = u3
            [6] = u6
            [7] = u10
            [8] = u11
            [9] = u12
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(false)
        local v19, u20 = v15("")
        v16(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u4
                [3] = u7
                [4] = u20
            --]]
            local u21 = true
            if not (u13.store.SocialConnections.supportTasks.joinedGroup or u4.isHoarceKat()) then
                task.spawn(function() --[[ Line: 22 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u21
                        [3] = u20
                    --]]
                    while true do
                        u7.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p22) --[[ Line: 26 ]]
                            --[[
                            Upvalues:
                                [1] = u21
                                [2] = u20
                            --]]
                            if p22 then
                                u21 = false
                                u20("")
                            end
                        end)
                        local v23 = task.wait(10)
                        if v23 ~= 0 and (v23 == v23 and v23) then
                            v23 = u21
                        end
                        if v23 == 0 or (v23 ~= v23 or not v23) then
                            return
                        end
                    end
                end)
            end
            return function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21 = false
            end
        end, {})
        local v24 = {}
        local v25 = #v24
        local v26 = {
            ["Text"] = "<b>Join</b> the Easy.gg Roblox Group",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0, 46),
            ["ImageId"] = u5.USERS_SOLID
        }
        local v27 = {}
        local v28 = #v27
        local v29 = not u13.store.SocialConnections.supportTasks.joinedGroup
        if v29 then
            v29 = u8.createFragment({ u8.createElement(u3, {
                    ["Text"] = "Verify",
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.new(1, -10, 0.5, 0),
                    ["Size"] = UDim2.new(0.25, -10, 0.5, 0),
                    ["Loading"] = v17,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 62 ]]
                        --[[
                        Upvalues:
                            [1] = u18
                            [2] = u7
                            [3] = u6
                            [4] = u10
                            [5] = u20
                        --]]
                        u18(true)
                        u7.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p30) --[[ Line: 65 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                                [2] = u10
                                [3] = u20
                                [4] = u18
                            --]]
                            if p30 then
                                if p30 then
                                    u20("")
                                end
                            else
                                u6:playSound(u10.ERROR_NOTIFICATION)
                                u20("Not joined")
                            end
                            u18(false)
                        end)
                    end
                }), u8.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextSize"] = 12,
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.new(1, -10, 0.87, 0),
                    ["Size"] = UDim2.new(0.25, -10, 0, 12),
                    ["Text"] = v19,
                    ["TextColor3"] = u11.backgroundError,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["Font"] = Enum.Font.Roboto
                }) })
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        v24[v25 + 1] = u8.createElement(u12, v26, v27)
        return u8.createFragment(v24)
    end)
}