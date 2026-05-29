local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.PrefabBlockHandler
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkins
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "CannonBlockHandler"
    end,
    ["__index"] = u4
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(u12, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u7
    --]]
    u4.constructor(u12, ...)
    function u12.getBlockSkin(p13) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
            [3] = u7
        --]]
        local v14 = u6.Assets.Blocks:FindFirstChild(p13)
        if v14 ~= nil then
            v14 = v14:FindFirstChild("Root")
            if v14 ~= nil then
                v14 = v14:Clone()
            end
        end
        if v14 then
            v14.Name = u12:getBlockType()
            if u7:IsServer() and u7:IsRunning() then
                v14.CollisionGroup = "Blocks"
            end
            return v14
        end
    end
end
function u9.createNewInstance(p15, p16, _) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    local v17 = nil
    local v18 = u8(p15.blockType)
    if v18 ~= nil then
        v18 = v18[p16 - 1 + 1]
    end
    if v18 then
        v17 = p15.getBlockSkin(v18)
    end
    return v17 or u4.createNewInstance(p15, p16)
end
function u9.place(p19, p20, p21) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v22 = u4.place(p19, p20, p21)
    v22.CanCollide = false
    for _, v23 in v22:GetDescendants() do
        if v23:IsA("BasePart") then
            v23.CanCollide = false
        end
    end
    return v22
end
function u9.getContainedPositions(_, p24) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return { (u3:getBlockPosition(p24.Position)) }
end
return {
    ["CannonBlockHandler"] = u9
}