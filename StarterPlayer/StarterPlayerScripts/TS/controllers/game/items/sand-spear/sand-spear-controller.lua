local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "SandSpearController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "SandSpearController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u7
        [5] = u6
    --]]
    u4.KnitStart(p12)
    u3.LocalPlayer:GetAttributeChangedSignal("RecentSpearBounce"):Connect(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u7
            [4] = u6
        --]]
        local v13 = u3.LocalPlayer
        local v14 = v13:GetAttribute("RecentSpearBounce")
        local v15 = v13:GetAttribute("SandSpearBounceStrength")
        if v14 == 0 or (v14 ~= v14 or (v14 == "" or not v14)) then
            return nil
        end
        local v16 = u5:getLocalPlayerEntity()
        local v17 = v13.Character
        if not v17 then
            return nil
        end
        if v16 and u7:isActive(v16:getInstance(), u6.GROUNDED) then
            return nil
        end
        if v16 and u7:isActive(v16:getInstance(), u6.FROSTED) then
            return nil
        end
        v17.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        local v18 = v17.PrimaryPart
        local v19 = v17.PrimaryPart.AssemblyMass * 125 * (v15 == nil and 1 or v15)
        v18:ApplyImpulse((Vector3.new(0, v19, 0)))
    end)
end
v2.CreateController(u8.new())
return nil