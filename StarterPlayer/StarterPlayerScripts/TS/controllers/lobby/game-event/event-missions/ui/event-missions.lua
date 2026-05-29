local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u13 = v1.import(script, script.Parent, "event-missions-generator-section").EventMissionsGeneratorSection
local u14 = nil
local function v47(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u7
        [4] = u12
        [5] = u8
        [6] = u11
        [7] = u9
        [8] = u13
        [9] = u6
        [10] = u3
        [11] = u5
    --]]
    local v17 = p16.useState
    local v18 = p16.useEffect
    local u19, u20 = v17(nil)
    v18(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
            [3] = u14
            [4] = u15
            [5] = u7
        --]]
        if u4.isHoarceKat() then
            u20(u14(u15.EventType, u15.MissionsMap))
        else
            u7.Controllers.MissionsController:getMissionData():andThen(function(p21) --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20(p21)
            end)
        end
    end, {})
    local v22 = #u12[u15.EventType].missionGenerators ~= 0 and u19
    if v22 then
        local v23 = u8.entries(u15.MissionsMap)
        local function v33(p24, p25) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u15
                [3] = u19
                [4] = u12
                [5] = u9
                [6] = u13
            --]]
            local v26 = p24[1]
            local v27 = p24[2]
            if not u11.includes(string.lower(v27[1].id), string.lower(u15.EventType)) then
                return nil
            end
            local v28 = {
                ["GeneratorId"] = v26,
                ["Missions"] = v27,
                ["PlayerMissionData"] = u19,
                ["ClaimedMissions"] = u15.ClaimedMissions,
                ["EventType"] = u15.EventType
            }
            local v29 = {}
            local v30 = nil
            for v31, v32 in u12[u15.EventType].missionGenerators do
                local _ = v31 - 1
                if v32.id == v26 == true then
                    v30 = v32
                    break
                end
            end
            if v30 ~= nil then
                v30 = v30.layoutOrder
            end
            if v30 ~= nil then
                p25 = v30
            end
            v29.LayoutOrder = p25
            v28.FrameProps = v29
            return u9.createElement(u13, v28)
        end
        local v34 = 0
        local v35 = {}
        for v36, v37 in v23 do
            local v38 = v33(v37, v36 - 1, v23)
            if v38 ~= nil then
                v34 = v34 + 1
                v35[v34] = v38
            end
        end
        local v39 = {
            ["AdditionalSpace"] = 200,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Selectable"] = false,
                ["Size"] = UDim2.fromScale(1, 1)
            }
        }
        local v40 = { u9.createElement(u6, {
                ["Padding"] = {
                    ["Vertical"] = 2,
                    ["Horizontal"] = 2
                }
            }), u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v41 = #v40
        for v42, v43 in v35 do
            v40[v41 + v42] = v43
        end
        v22 = u9.createFragment({
            ["MissionsList"] = u9.createElement(u3, v39, v40)
        })
    end
    local v44 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v45 = {}
    local v46 = #v45
    if v22 then
        v45[v46 + 1] = v22
    end
    return u9.createFragment({
        ["EventMissions"] = u9.createElement(u5, v44, v45)
    })
end
local v48 = v10.new(u9)(v47)
u14 = function(_, p49) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local u50 = {}
    local u51 = {}
    local u52 = Random.new()
    local v53 = u8.entries(p49)
    local function v60(p54) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u50
            [3] = u51
        --]]
        local _ = p54[1]
        local v55 = p54[2]
        local function v57(p56) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u50
                [3] = u51
            --]]
            u50[p56.id] = {
                [p56.stages[1].type] = u52:NextInteger(0, p56.stages[1].progress)
            }
            u51[p56.id] = u52:NextInteger(0, #p56.stages - 1)
        end
        for v58, v59 in v55 do
            v57(v59, v58 - 1, v55)
        end
    end
    for v61, v62 in v53 do
        v60(v62, v61 - 1, v53)
    end
    return {
        ["progress"] = u50,
        ["stages"] = u51
    }
end
return {
    ["EventMissions"] = v48
}