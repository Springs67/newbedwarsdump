local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.Players
local u4 = v2.ReplicatedStorage
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u6 = v1.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "WerewolfStatusEffectHandler"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10, ...)
end
function u7.onApply(_, p11, _) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v12 = u4.Assets.Misc.WerewolfEars:Clone()
    p11.Humanoid:AddAccessory(v12)
    local v13 = u4.Assets.Misc.WerewolfTail:Clone()
    p11.Humanoid:AddAccessory(v13)
    u5:weldCharacterAccessories(p11)
end
function u7.onRemove(_, p14, _) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not u3:GetPlayerFromCharacter(p14) then
        return nil
    end
    local v15 = p14:FindFirstChild("WerewolfEars")
    if v15 then
        v15:Destroy()
    end
    local v16 = p14:FindFirstChild("WerewolfTail")
    if v16 then
        v16:Destroy()
    end
end
return {
    ["WerewolfStatusEffectHandler"] = u7
}