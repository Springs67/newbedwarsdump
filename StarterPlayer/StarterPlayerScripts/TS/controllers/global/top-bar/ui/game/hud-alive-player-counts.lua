local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v56 = v7.new(u6)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u1
        [3] = u9
        [4] = u13
        [5] = u5
        [6] = u14
        [7] = u10
        [8] = u6
        [9] = u12
        [10] = u3
        [11] = u4
    --]]
    local v17 = p16.useState
    local v18 = p16.useEffect
    local v19, u20 = v17(0)
    local v21
    if p15.QueueType then
        v21 = u11[p15.QueueType]
    else
        v21 = nil
    end
    local function v27(p22) --[[ Line: 30 ]]
        local v23 = p22.teams
        local v24 = 0
        for v25 = 1, #v23 do
            local v26 = v23[v25]
            local _ = v25 - 1
            v24 = v24 + v26.maxPlayers
        end
        return v24
    end
    v18(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u9
            [3] = u13
            [4] = u20
            [5] = u5
            [6] = u14
            [7] = u10
        --]]
        local function u39(p28) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u9
                [3] = u13
                [4] = u20
                [5] = u5
            --]]
            u1.Promise.retryWithDelay(function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u9
                    [3] = u13
                --]]
                return u1.Promise.new(function(p29, p30) --[[ Line: 48 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u13
                    --]]
                    local v31 = true
                    for v32, v33 in u9:GetPlayers() do
                        local _ = v32 - 1
                        if not u13.getGamePlayer(v33):isReady() then
                            v31 = false
                            break
                        end
                    end
                    if not v31 then
                        return p30()
                    end
                    local v34 = 0
                    local v35 = {}
                    for v36, v37 in u9:GetPlayers() do
                        local _ = v36 - 1
                        if u13.getGamePlayer(v37):isInGame() == true then
                            v34 = v34 + 1
                            v35[v34] = v37
                        end
                    end
                    return p29(#v35)
                end)
            end, p28, 3.5):andThen(function(p38) --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20(p38)
            end):catch(function(_) --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u5
                --]]
                return u5.Info("Failed to update player alive count")
            end)
        end
        u39(3)
        local u40 = nil
        task.spawn(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u14
                [3] = u10
                [4] = u39
            --]]
            u40 = u14.Client:Get("EntityDeathEvent"):Connect(function(p41) --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u39
                --]]
                local v42 = u10:getEntity(p41.entityInstance)
                if v42 ~= nil then
                    v42 = v42:getPlayer()
                end
                if v42 then
                    v42 = p41.finalKill
                end
                if v42 then
                    u39(1)
                end
            end)
        end)
        local u43 = u9.PlayerAdded:Connect(function(_) --[[ Line: 113 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39(1)
        end)
        local u44 = u9.PlayerRemoving:Connect(function() --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39(1)
        end)
        return function() --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u43
                [3] = u44
            --]]
            local v45 = u40
            if v45 ~= nil then
                v45:Disconnect()
            end
            u43:Disconnect()
            u44:Disconnect()
        end
    end, {})
    local v46 = {
        ["LayoutOrder"] = p15.LayoutOrder
    }
    local v47 = { u6.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u12.USERS_SOLID,
            ["Size"] = UDim2.new(0, 16, 0, 16)
        }) }
    local v48 = #v47
    local v49 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0, 0, 1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }
    local v50 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v51 = #v50
    if v21 then
        local v52 = u6.createElement
        local v53 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 16
        }
        local v54 = tostring(v19)
        local v55 = v27(v21)
        v53.Text = v54 .. " / " .. tostring(v55)
        v53.AutomaticSize = Enum.AutomaticSize.X
        v53.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v53.TextXAlignment = Enum.TextXAlignment.Left
        v53.TextColor3 = u3.WHITE
        v21 = v52("TextLabel", v53)
    end
    if v21 then
        v50[v51 + 1] = v21
    end
    v47[v48 + 1] = u6.createElement("Frame", v49, v50)
    return u6.createElement(u4, v46, v47)
end)
return {
    ["HudAlivePlayerCounts"] = v8.connect(function(p57, p58) --[[ Line: 174 ]]
        local v59 = {}
        for v60, v61 in p58 do
            v59[v60] = v61
        end
        v59.QueueType = p57.Game.queueType
        return v59
    end)(v56)
}