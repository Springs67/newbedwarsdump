local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Action
local v2 = {}
local u3 = {
    "KitPrimary",
    "KitSecondary",
    "KitTertiary",
    "ItemPrimary",
    "ItemSecondary",
    "MiscPrimary",
    "MiscSecondary",
    "Recall",
    "Ping",
    "Interact",
    "Inventory",
    "Attack",
    "DropItem",
    "Emote",
    "HotbarSlot1",
    "HotbarSlot2",
    "HotbarSlot3",
    "HotbarSlot4",
    "HotbarSlot5",
    "HotbarSlot6",
    "HotbarSlot7",
    "HotbarSlot8",
    "HotbarSlot9"
}
function v2.getInvalidActions(p4) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    local v5 = 0
    local v6 = {}
    local v7 = {}
    local u8 = {}
    for v9, v10 in u1.AbilityActions do
        local _ = v9 - 1
        if table.find(u3, v10) ~= nil == true then
            v5 = v5 + 1
            v6[v5] = v10
        end
    end
    for v11, v12 in v6 do
        local _ = v11 - 1
        local v13 = v7[p4.abilityActions[v12].Name] or {}
        table.insert(v13, v12)
        v7[p4.abilityActions[v12].Name] = v13
    end
    local v14 = 0
    local v15 = {}
    for v16, v17 in u1.KeyboardControlActions do
        local _ = v16 - 1
        if table.find(u3, v17) ~= nil == true then
            v14 = v14 + 1
            v15[v14] = v17
        end
    end
    for v18, v19 in v15 do
        local _ = v18 - 1
        local v20 = v7[p4.controlActions[v19].Name] or {}
        table.insert(v20, v19)
        v7[p4.controlActions[v19].Name] = v20
    end
    local function v32(u21) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if #u21 > 1 then
            local function v29(p22) --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u8
                --]]
                local v23 = 0
                local v24 = {}
                local v25 = {
                    ["inputAction"] = p22
                }
                for v26, v27 in u21 do
                    local _ = v26 - 1
                    if v27 ~= p22 == true then
                        v23 = v23 + 1
                        v24[v23] = v27
                    end
                end
                v25.overlappingActions = v24
                local v28 = u8
                table.insert(v28, v25)
                return #u8
            end
            for v30, v31 in u21 do
                v29(v31, v30 - 1, u21)
            end
        end
    end
    for v33, v34 in v7 do
        v32(v34, v33, v7)
    end
    return u8
end
function v2.requiresUniqueAction(p35) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return table.find(u3, p35) ~= nil
end
return {
    ["KeybindValidator"] = v2
}