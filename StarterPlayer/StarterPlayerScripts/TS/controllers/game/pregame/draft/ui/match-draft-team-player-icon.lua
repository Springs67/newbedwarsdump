local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.GetTarmacAsset
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u12 = v11.BWPlayerRender
local u13 = v11.PlayerRenderFallbackMode
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u15 = v1.import(script, script.Parent, "player-vote-stroke").PlayerVoteStroke
return {
    ["MatchDraftTeamPlayerIcon"] = v9.new(u8)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u6
            [4] = u14
            [5] = u5
            [6] = u8
            [7] = u12
            [8] = u13
            [9] = u3
            [10] = u15
            [11] = u4
        --]]
        local v18 = p17.useEffect
        local v19, u20 = p17.useState(nil)
        v18(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u10
                [3] = u16
                [4] = u6
                [5] = u14
                [6] = u5
                [7] = u20
            --]]
            local u21 = u7.new()
            u21:GiveTask(task.spawn(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u16
                    [3] = u6
                    [4] = u14
                    [5] = u5
                    [6] = u20
                --]]
                if not u10:GetPlayerByUserId(u16.Player.userId) then
                    return nil
                end
                u6.Controllers.RankController:getRanks({ u16.Player.userId }):andThen(function(p22) --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u14
                        [3] = u5
                        [4] = u20
                    --]]
                    local v23 = nil
                    for v24, v25 in p22 do
                        local _ = v24 - 1
                        if v25.userId == u16.Player.userId == true then
                            v23 = v25
                            break
                        end
                    end
                    if not v23 then
                        return nil
                    end
                    local v26
                    if v23.rankDivision == nil then
                        v26 = u5("NoImage").Image
                    else
                        v26 = u14[v23.rankDivision].image
                    end
                    u20(v26)
                end)
            end))
            return function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, { u16.Player.userId })
        local v27 = {
            ["Size"] = UDim2.fromScale(1, 1 / u16.TeamSize - 0.02)
        }
        local v28 = {}
        local v29 = u8.createElement("UIListLayout", {
            ["HorizontalFlex"] = "SpaceBetween",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
        local v30 = u8.createElement
        local v31 = u12
        local v32 = {
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 1,
            ["FallbackMode"] = u13.NONE,
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["PlayerUserId"] = u16.Player.userId,
            ["BackgroundColor3"] = u3.BLACK
        }
        local v33 = {}
        local v34 = u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        })
        local v35 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v36 = u8.createElement
        local v37 = u15
        local v38 = {
            ["Blink"] = not u16.DidPlayerVote
        }
        local v39
        if u16.DidPlayerVote then
            v39 = Color3.fromRGB(42, 113, 52)
        else
            v39 = u3.darken(u3.WHITE, 0.8)
        end
        v38.Color = v39
        __set_list(v33, 1, {v34, v35, v36(v37, v38)})
        __set_list(v28, 1, {v29, v30(v31, v32, v33)})
        local v40 = #v28
        local v41
        if v19 == nil then
            v41 = false
        else
            v41 = u8.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1.3, 1.3),
                ["Image"] = v19,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, { u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v41 then
            v28[v40 + 1] = v41
        end
        return u8.createElement(u4, v27, v28)
    end)
}