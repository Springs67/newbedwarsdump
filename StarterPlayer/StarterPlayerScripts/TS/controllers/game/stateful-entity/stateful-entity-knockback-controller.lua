local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "StatefulEntityKnockbackController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "StatefulEntityKnockbackController"
    p10.lastImpulseTime = 0
end
function u7.KnitStart(u11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
        [4] = u5
    --]]
    u4.KnitStart(u11)
    u6.Client:WaitFor("StatefulEntityPlayerKnockbackRequest"):expect():Connect(function(p12) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
            [3] = u5
        --]]
        local v13 = time()
        local v14 = v13 - u11.lastImpulseTime
        u11.lastImpulseTime = v13
        if v14 >= 0.016 then
            local v15 = u3.LocalPlayer.Character
            if v15 ~= nil then
                v15 = v15.PrimaryPart
            end
            if not v15 then
                return nil
            end
            u5.applyKnockbackPlatformStand(v15)
            v15:ApplyImpulse(p12)
        end
    end)
end
v2.CreateController(u7.new())
return nil