local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u10 = v1.import(script, script.Parent, "pvp-arena-solo-health-panel").PvPArenaSoloHealthPanel
local u11 = v1.import(script, script.Parent, "pvp-arena-team-health-panel").PvPArenaTeamHealthPanel
local function u17(p12) --[[ Line: 13 ]]
    local v13 = {}
    local v14 = #v13
    table.move(p12, 1, #p12, v14 + 1, v13)
    table.sort(v13, function(p15, p16) --[[ Line: 17 ]]
        return p15.health > p16.health
    end)
    return v13
end
local v63 = v6.new(u5)(function(p18, p19) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u3
        [3] = u9
        [4] = u4
        [5] = u8
        [6] = u5
        [7] = u11
        [8] = u2
        [9] = u10
    --]]
    local v20 = p19.useState
    local v21 = p19.useEffect
    local v22, u23 = v20((u17(p18.PvPArenaTeamHealth)))
    local v24 = u3.Controllers.MatchController:getQueueType() == u9.PVP_ARENA_SOLO
    v21(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u23
            [4] = u17
        --]]
        local u25 = u4.new()
        local u28 = u8.changed:connect(function(p26, p27) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u17
            --]]
            if p26.Game.pvpArenaTeamHealth ~= p27.Game.pvpArenaTeamHealth then
                u23((u17(p26.Game.pvpArenaTeamHealth)))
            end
        end)
        u25:GiveTask(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:disconnect()
        end)
        return function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:DoCleaning()
        end
    end, {})
    if v24 then
        local function v37(p29, p30) --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
            --]]
            local v31 = u5.createFragment
            local v32 = {}
            local v33 = "team-" .. p29.team.id
            local v34 = u5.createElement
            local v35 = u10
            local v36 = {
                ["LayoutOrder"] = p30 + 1,
                ["teamHealth"] = {
                    ["team"] = p29.team,
                    ["health"] = p29.health
                }
            }
            v32[v33] = v34(v35, v36)
            return v31(v32)
        end
        local v38 = table.create(#v22)
        for v39, v40 in v22 do
            v38[v39] = v37(v40, v39 - 1, v22)
        end
        local v41 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v42 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v43 = #v42
        for v44, v45 in v38 do
            v42[v43 + v44] = v45
        end
        return u5.createElement(u2, v41, v42)
    else
        local function v54(p46, p47) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
            --]]
            local v48 = u5.createFragment
            local v49 = {}
            local v50 = "team-" .. p46.team.id
            local v51 = u5.createElement
            local v52 = u11
            local v53 = {
                ["LayoutOrder"] = p47 + 1,
                ["teamHealth"] = {
                    ["team"] = p46.team,
                    ["health"] = p46.health
                }
            }
            v49[v50] = v51(v52, v53)
            return v48(v49)
        end
        local v55 = table.create(#v22)
        for v56, v57 in v22 do
            v55[v56] = v54(v57, v56 - 1, v22)
        end
        local v58 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v59 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v60 = #v59
        for v61, v62 in v55 do
            v59[v60 + v61] = v62
        end
        return u5.createElement(u2, v58, v59)
    end
end)
return {
    ["PvPArenaIntermissionHealthHolder"] = v7.connect(function(p64, p65) --[[ Line: 126 ]]
        local v66 = {}
        for v67, v68 in p65 do
            v66[v67] = v68
        end
        v66.PvPArenaTeamHealth = p64.Game.pvpArenaTeamHealth
        return v66
    end)(v63)
}