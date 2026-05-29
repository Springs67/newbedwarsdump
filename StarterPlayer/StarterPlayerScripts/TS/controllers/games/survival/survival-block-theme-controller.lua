local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "block-handlers", "studded-block-handler").StuddedBlockHandler
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SurvivalBlockThemeController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "SurvivalBlockThemeController"
end
function u12.KnitStart(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u4
        [4] = u11
        [5] = u6
        [6] = u2
        [7] = u10
        [8] = u9
    --]]
    local v16, v17 = u5.Controllers.MatchController:getQueueTypeAsync():await()
    if v16 and u8(v17).classicTexture then
        local v18 = u4.Controllers.MapController:getMapName()
        local v19 = u11.STUDDED_MAP_BLOCKS[v18]
        if not v19 then
            error(print("Studded map blocks not found"))
        end
        local v20 = {}
        local v21 = #v20
        local v22 = u6.entries(v19)
        local v23 = #v22
        table.move(v22, 1, v23, v21 + 1, v20)
        local v24 = v21 + v23
        local v25 = u6.entries(u11.STUDDED_SHOP_BLOCKS)
        table.move(v25, 1, #v25, v24 + 1, v20)
        for _, v26 in v20 do
            local v27 = v26[1]
            local v28 = v26[2]
            u2:registerHandler(u10.new(v27, -1, u9(v27).block, v28.color, v28.surfaces))
        end
    end
    return nil
end
u4.CreateController(u12.new())
return nil