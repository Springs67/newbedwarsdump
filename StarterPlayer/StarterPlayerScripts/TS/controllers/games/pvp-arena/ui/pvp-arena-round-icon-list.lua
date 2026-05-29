local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent, "pvp-arena-round-icon-container").PvPArenaRoundIconContainer
return {
    ["PvPArenaRoundIconList"] = v4.new(u3)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u3
            [4] = u6
            [5] = u8
            [6] = u2
        --]]
        local _ = p10.useState
        local _ = p10.useEffect
        local v11 = false
        local v12 = -2
        local v13 = {}
        while true do
            if v11 then
                v12 = v12 + 1
            else
                v11 = true
            end
            if v12 > 2 then
                local v14 = {
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.9, 0.22),
                    ["Position"] = UDim2.fromScale(0.5, 0.79)
                }
                local v15 = {
                    ["IconLine"] = u3.createElement("Frame", {
                        ["BackgroundTransparency"] = 0,
                        ["BorderSizePixel"] = 0,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["BackgroundColor3"] = u7.backgroundSecondary
                    })
                }
                local _ = #v15
                local v16 = {
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }
                local v17 = {}
                local v18 = #v17
                for v19, v20 in v13 do
                    v17[v18 + v19] = v20
                end
                v15.EmptyIconArea = u3.createElement("Frame", v16, v17)
                return u3.createFragment({
                    ["IconArea"] = u3.createElement("Frame", v14, v15)
                })
            end
            local v21 = v12 < 0 and 0.5 or 0
            local v22
            if v12 == 0 then
                v22 = u7.mcYellow
            else
                v22 = u7.textPrimary
            end
            local v23
            if v12 == 0 then
                v23 = UDim2.fromScale(1, 1)
            else
                v23 = UDim2.fromScale(0.9, 0.9)
            end
            local v24 = math.pow(v12, 3) * -0.1 / 6 + v12 * 1.9 / 6 + 0.5
            local v25 = math.clamp(v12, -1, 1)
            local v26 = p9.roundNumber + v25
            if u5.isIntermissionStage(p9.stageNumber) and v25 < 0 then
                v26 = v26 + 1
            end
            local v27 = {
                ["Position"] = UDim2.fromScale(v24, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.1, 1)
            }
            local v28 = {}
            local v29 = #v28
            local v30
            if v12 == 0 then
                v30 = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.3,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(2, 2),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u6.MISSION_TICKET_GLOW
                })
            else
                v30 = false
            end
            if v30 then
                v28[v29 + 1] = v30
            end
            v28[#v28 + 1] = u3.createElement(u8, {
                ["stageNumber"] = p9.stageNumber + v12,
                ["roundNumber"] = v26,
                ["ImageTransparency"] = v21,
                ["ImageColor3"] = v22,
                ["FrameProps"] = {
                    ["ZIndex"] = 3,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = v23
                }
            })
            local v31 = u3.createElement(u2, v27, v28)
            table.insert(v13, v31)
        end
    end)
}