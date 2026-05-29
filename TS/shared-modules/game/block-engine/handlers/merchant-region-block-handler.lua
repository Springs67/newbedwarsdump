local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u2 = v1.BlockEngine
local u3 = v1.PrefabBlockHandler
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "MerchantRegionBlockHandler"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, ...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7, ...)
end
function u4.getPlacementPositions(_, p8, _) --[[ Line: 28 ]]
    local v9 = false
    local v10 = 0
    local v11 = {}
    while true do
        if v9 then
            v10 = v10 + 1
        else
            v9 = true
        end
        if v10 >= 7 then
            return v11
        end
        local v12 = false
        local v13 = 0
        while true do
            if true then
                if v12 then
                    v13 = v13 + 1
                else
                    v12 = true
                end
            end
            if v13 >= 5 then
                break
            end
            local v14 = false
            local v15 = 0
            while true do
                if true then
                    if v14 then
                        v15 = v15 + 1
                    else
                        v14 = true
                    end
                end
                if v15 >= 8 then
                    break
                end
                local v16 = p8 + Vector3.new(v10, v13, v15)
                table.insert(v11, v16)
            end
        end
    end
end
function u4.getContainedPositions(_, p17) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v18 = u2:getBlockPosition(p17.Position)
    local v19 = false
    local v20 = 0
    local v21 = {}
    while true do
        if v19 then
            v20 = v20 + 1
        else
            v19 = true
        end
        if v20 >= 7 then
            return v21
        end
        local v22 = false
        local v23 = 0
        while true do
            if true then
                if v22 then
                    v23 = v23 + 1
                else
                    v22 = true
                end
            end
            if v23 >= 5 then
                break
            end
            local v24 = false
            local v25 = 0
            while true do
                if true then
                    if v24 then
                        v25 = v25 + 1
                    else
                        v24 = true
                    end
                end
                if v25 >= 8 then
                    break
                end
                local v26 = v18 + Vector3.new(v20, v23, v25)
                table.insert(v21, v26)
            end
        end
    end
end
return {
    ["MerchantRegionBlockHandler"] = u4
}