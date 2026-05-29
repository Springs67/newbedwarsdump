local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "tournament-team-recommended-player").TorunamentTeamRecommendedPlayer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
return {
    ["TournamentOutboundRecommendations"] = v3.new(u2)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u5
            [4] = u2
            [5] = u7
            [6] = u4
        --]]
        local v11 = p10.useEffect
        local v12, u13 = p10.useState({})
        v11(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u8
                [3] = u5
                [4] = u13
            --]]
            u6.Client:GetNamespace("Tournament"):Get("FetchRecommendedPlayersToInvite"):CallServerAsync():andThen(function(p14) --[[ Line: 15 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u5
                    [3] = u13
                --]]
                local v15 = u8:getState().Friends.friends
                local v16 = table.create(#v15)
                for v17, v18 in v15 do
                    local _ = v17 - 1
                    v16[v17] = v18.userId
                end
                local v19 = {}
                local v20 = #v19
                local v21 = #p14
                table.move(p14, 1, v21, v20 + 1, v19)
                local v22 = v20 + v21
                table.move(v16, 1, #v16, v22 + 1, v19)
                local v23 = 0
                local v24 = {}
                for v25, v26 in v19 do
                    local _ = v25 - 1
                    local v27 = u8:getState().Tournament.myTeamMembers or {}
                    if table.find(v27, v26) == nil == true then
                        v23 = v23 + 1
                        v24[v23] = v26
                    end
                end
                u5.getOfflinePlayersByUserIds(v24):andThen(function(p28) --[[ Line: 49 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    u13(p28)
                end)
            end)
        end, {})
        local v29 = {}
        local v30 = p9.LayoutOrder
        v29.LayoutOrder = v30 == nil and 2 or v30
        v29.Size = UDim2.fromScale(1, 0.95)
        v29.BackgroundTransparency = 1
        local v31
        if #v12 == 0 then
            v31 = u2.createElement("TextLabel", {
                ["Text"] = "<b>No recommended invites.</b>",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["TextColor3"] = u4.textPrimary,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }, { u2.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        else
            v31 = table.create(#v12)
            for v32, v33 in v12 do
                local v34 = {
                    ["DisplayPlayer"] = v33,
                    ["LayoutOrder"] = v32 - 1
                }
                v31[v32] = u2.createElement(u7, v34)
            end
        end
        local v35 = { u2.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v36 = #v35
        if v31.elements == nil and (v31.props == nil or v31.component == nil) then
            for v37, v38 in v31 do
                v35[v36 + v37] = v38
            end
        else
            v35[v36 + 1] = v31
        end
        return u2.createElement("Frame", v29, v35)
    end)
}