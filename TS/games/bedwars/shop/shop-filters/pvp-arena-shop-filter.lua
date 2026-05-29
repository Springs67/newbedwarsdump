local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.RunService
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "PvPArenaShopFilter"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, ...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p13, ...)
end
function u10.apply(p14, p15, p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    local v17 = u7:GetAttribute("GameType")
    if not v17 or v17 ~= u8.PVP_ARENA then
        return p16
    end
    local v18 = p14:getInvalidItems(p16, p15)
    local v19 = 0
    local v20 = {}
    for v21, v22 in p16 do
        local _ = v21 - 1
        local v23 = v22.itemType
        if table.find(v18, v23) == nil == true then
            v19 = v19 + 1
            v20[v19] = v22
        end
    end
    return v20
end
function u10.getInvalidItems(_, p24, p25) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u3
    --]]
    local v26 = {}
    local u27
    if u6:IsServer() then
        local v28 = u4.Services.PvpArenaAugmentSelectionService:getPlayerAugmentSelectionMap()[p25]
        u27 = {}
        for _, v29 in v28 == nil and {} or v28 do
            u27[v29] = true
        end
    else
        u27 = nil
    end
    if u6:IsClient() then
        u27 = u3.Controllers.PvpArenaAugmentSelectionController:getLocalPlayerAugmentSelections()
    end
    if u27 then
        v26 = {}
        local v30 = #v26
        local function v36(p31) --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            local v32 = false
            local v33 = v32
            for v34 in u27 do
                local v35 = p31.ignoreByPlayerAugment
                if v35 ~= nil then
                    v35 = table.find(v35, v34) ~= nil
                end
                if v35 then
                    v32 = true
                    v33 = v32
                end
            end
            return v33
        end
        local v37 = 0
        local v38 = {}
        for v39, v40 in p24 do
            if v36(v40, v39 - 1, p24) == true then
                v37 = v37 + 1
                v38[v37] = v40
            end
        end
        local v41 = table.create(#v38)
        for v42, v43 in v38 do
            local _ = v42 - 1
            v41[v42] = v43.itemType
        end
        table.move(v41, 1, #v41, v30 + 1, v26)
    end
    return v26
end
return {
    ["PvPArenaShopFilter"] = u10,
    ["default"] = u10.new()
}