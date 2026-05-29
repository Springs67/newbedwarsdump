local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "HeldItemAnimationController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.constructor(p11)
    p11.Name = "HeldItemAnimationController"
    p11.maid = u3.new()
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p12)
end
function u8.isRelevantItem(_, p13) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v14 = u7(p13.itemType).thirdPerson
    if v14 ~= nil then
        v14 = v14.holdAnimation
    end
    return v14 ~= nil
end
function u8.onEnable(u15, p16, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u4
    --]]
    local u17 = u7(p16.itemType).thirdPerson.holdAnimation
    u15:setupYield(function() --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u17
            [4] = u15
        --]]
        local u18 = u6:playAnimation(u4.LocalPlayer, u17)
        u15.maid:GiveTask(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            local v19 = u18
            if v19 ~= nil then
                v19:Stop()
            end
        end)
        return function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            local v20 = u18
            if v20 ~= nil then
                v20:Stop()
            end
        end
    end)
end
function u8.onDisable(p21) --[[ Line: 56 ]]
    p21.maid:DoCleaning()
end
v2.CreateController(u8.new())
return nil