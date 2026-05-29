local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u10 = v1.import(script, script.Parent, "status-effect-tag").StatusEffectTag
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig
local u12 = nil
local function v36(u13, p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u6
        [4] = u9
        [5] = u8
        [6] = u7
        [7] = u4
        [8] = u10
        [9] = u2
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local v17, u18 = v15({})
    v16(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u3
            [3] = u6
            [4] = u9
            [5] = u13
            [6] = u8
            [7] = u18
            [8] = u7
        --]]
        local v19 = u12:getValue()
        local u20 = u3.new()
        if v19 then
            u6:AddTag(v19, "EntityNameTag")
        end
        local function u25() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u13
                [3] = u8
                [4] = u18
            --]]
            local v21 = 0
            local v22 = {}
            for v23, v24 in u9:getAllActive(u13.EntityInstance) do
                local _ = v23 - 1
                if v24.statusEffect ~= u8.INVISIBILITY == true then
                    v21 = v21 + 1
                    v22[v21] = v24
                end
            end
            u18(v22)
        end
        u25()
        u20:GiveTask(u7.StatusEffectAdded:connect(function(p26) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u25
            --]]
            if p26.entityInstance == u13.EntityInstance then
                u25()
            end
        end))
        u20:GiveTask(u7.StatusEffectRemoved:connect(function(p27) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u25
            --]]
            if p27.entityInstance == u13.EntityInstance then
                u25()
            end
        end))
        return function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:DoCleaning()
        end
    end, {})
    local v28 = table.create(#v17)
    for v29, v30 in v17 do
        local _ = v29 - 1
        v28[v29] = u4.createElement(u10, {
            ["ActiveStatusEffect"] = v30,
            ["EntityInstance"] = u13.EntityInstance
        })
    end
    local v31 = {
        ["Size"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v32 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v33 = #v32
    for v34, v35 in v28 do
        v32[v33 + v34] = v35
    end
    return u4.createFragment({
        ["StatusEffectTagList"] = u4.createElement(u2, v31, v32)
    })
end
u12 = u4.createRef()
local u37 = nil
local function v45(p38) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u12
        [4] = u37
    --]]
    local v39 = {
        ["Size"] = UDim2.fromScale(6, 1.25),
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.15, 0),
        ["AlwaysOnTop"] = true,
        ["MaxDistance"] = u11.BillboardMaxDistanceGame,
        ["ResetOnSpawn"] = false,
        ["AutoLocalize"] = false,
        [u4.Ref] = u12
    }
    local v40 = {}
    local v41 = #v40
    local v42 = {}
    for v43, v44 in p38 do
        v42[v43] = v44
    end
    v40[v41 + 1] = u4.createElement(u37, v42)
    return u4.createFragment({
        ["StatusEffectTagBillboard"] = u4.createElement("BillboardGui", v39, v40)
    })
end
u37 = v5.new(u4)(v36)
return {
    ["StatusEffectTagListBillboard"] = v45,
    ["StatusEffectTagList"] = u37
}