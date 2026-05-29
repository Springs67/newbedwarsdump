local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ForceAnimationController"
    end,
    ["__index"] = u5
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
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "ForceAnimationController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u4
    --]]
    u5.KnitStart(p11)
    u6.Client:OnEvent("ForcePlayAnimation", function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local u13 = u2:playAnimation(u4.LocalPlayer, p12.animation, {
            ["looped"] = p12.looped ~= nil
        })
        if p12.priority and u13 then
            u13.Priority = p12.priority
        end
        if p12.adjustWeight and u13 then
            u13:AdjustWeight(p12.adjustWeight.weight, p12.adjustWeight.fadeTime)
        end
        local v14
        if p12.looped == nil then
            v14 = false
        else
            v14 = p12.looped ~= true
        end
        if v14 then
            v14 = p12.looped
            if v14 ~= nil then
                v14 = v14.duration
            end
        end
        if v14 ~= 0 and (v14 == v14 and v14) then
            task.delay(p12.looped.duration, function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                local v15 = u13
                if v15 ~= nil then
                    v15:Stop()
                end
            end)
        end
    end)
end
v3.CreateController(u7.new())
return nil