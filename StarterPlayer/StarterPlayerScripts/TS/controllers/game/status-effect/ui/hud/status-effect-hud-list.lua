local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-category").StatusEffectCategory
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u13 = v1.import(script, script.Parent, "status-effect-hud-enchant-tile").StatusEffectHudEnchantTile
local u14 = v1.import(script, script.Parent, "status-effect-hud-tile").StatusEffectHudTile
local u44 = v7.new(u6)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u8
        [4] = u12
        [5] = u11
        [6] = u9
        [7] = u10
        [8] = u6
        [9] = u13
        [10] = u14
        [11] = u4
    --]]
    local v17 = p16.useState
    local v18 = p16.useEffect
    local _ = p16.useMemo
    local v19, u20 = v17(p15.StatusEffects or {})
    v18(function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u8
            [4] = u12
            [5] = u11
            [6] = u20
            [7] = u9
        --]]
        if u3.isHoarceKat() then
            return nil
        end
        local v21 = u5.new()
        local function u26() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u12
                [3] = u11
                [4] = u20
            --]]
            if u8.LocalPlayer.Character then
                local v22 = 0
                local v23 = {}
                for v24, v25 in u12:getAllActive(u8.LocalPlayer.Character) do
                    local _ = v24 - 1
                    if not u11[v25.statusEffect].noDisplay == true then
                        v22 = v22 + 1
                        v23[v22] = v25
                    end
                end
                u20(v23)
            else
                u20({})
            end
        end
        v21:GiveTask(u8.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26()
        end))
        v21:GiveTask(u9.StatusEffectAdded:connect(function(p27) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u26
            --]]
            if p27.entityInstance == u8.LocalPlayer.Character then
                task.spawn(function() --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26()
                end)
            end
        end))
        v21:GiveTask(u9.StatusEffectRemoved:connect(function(p28) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u26
            --]]
            if p28.entityInstance == u8.LocalPlayer.Character then
                task.spawn(function() --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26()
                end)
            end
        end))
        v21:GiveTask(u9.StatusEffectChanged:connect(function(p29) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u26
            --]]
            if p29.entityInstance == u8.LocalPlayer.Character then
                task.spawn(function() --[[ Line: 69 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26()
                end)
            end
        end))
    end, {})
    local function v35(p30, _) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u6
            [4] = u13
            [5] = u14
        --]]
        if u11[p30.statusEffect].category == u10.ENCHANT then
            local v31 = u6.createFragment
            local v32 = {
                [u11[p30.statusEffect].displayName] = u6.createElement(u13, {
                    ["ActiveStatusEffect"] = p30
                })
            }
            return v31(v32)
        else
            local v33 = u6.createFragment
            local v34 = {
                [u11[p30.statusEffect].displayName] = u6.createElement(u14, {
                    ["ActiveStatusEffect"] = p30
                })
            }
            return v33(v34)
        end
    end
    local v36 = table.create(#v19)
    for v37, v38 in v19 do
        v36[v37] = v35(v38, v37 - 1, v19)
    end
    local v39 = {
        ["Size"] = UDim2.new(0.7, 0, 0.06, 0),
        ["Position"] = p15.Position or UDim2.new(0.5, 0, 0, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v40 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.012, 0)
        }) }
    local v41 = #v40
    for v42, v43 in v36 do
        v40[v41 + v42] = v43
    end
    return u6.createFragment({
        ["StatusEffectHud"] = u6.createElement(u4, v39, v40)
    })
end)
return {
    ["StatusEffectHudList"] = u44,
    ["StatusEffectHudListScreen"] = function(p45) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u44
        --]]
        local v46 = {}
        local v47 = #v46
        local v48 = {}
        local v49 = {
            ["ResetOnSpawn"] = false
        }
        for v50, v51 in p45 do
            v48[v50] = v51
        end
        v46[v47 + 1] = u6.createElement(u44, v48)
        return u6.createFragment({
            ["StatusEffectHudScreen"] = u6.createElement("ScreenGui", v49, v46)
        })
    end
}