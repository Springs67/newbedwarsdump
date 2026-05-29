local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.ReplicatedStorage
local u6 = v1.import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "FrankensteinCurseClientStatusEffectHandler"
    end,
    ["__index"] = u6
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
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    u6.constructor(p11, ...)
    p11.neckBoltMaid = u2.new()
end
function u8.onApply(p12, p13, _) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u5
    --]]
    if not u4.LocalPlayer.Character or p13 ~= u4.LocalPlayer.Character then
        return nil
    end
    p12.neckBoltMaid:DoCleaning()
    local v14 = u7:getEntity(u4.LocalPlayer)
    local v15 = u5.Assets.Misc.FrankenBolt:Clone()
    if v14 ~= nil then
        local v16 = v14:getHumanoid()
        if v16 ~= nil then
            v16:AddAccessory(v15)
        end
    end
    p12.neckBoltMaid:GiveTask(v15)
end
function u8.onRemove(p17, p18, _) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if not u4.LocalPlayer.Character or p18 ~= u4.LocalPlayer.Character then
        return nil
    end
    p17.neckBoltMaid:DoCleaning()
end
return {
    ["FrankensteinCurseClientStatusEffectHandler"] = u8
}