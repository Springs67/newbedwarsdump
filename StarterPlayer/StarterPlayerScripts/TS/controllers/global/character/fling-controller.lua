local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FlingController"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "FlingController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
    --]]
    u4.KnitStart(p10)
    u5.Client:OnEvent("Fling", function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        local u12 = u3.LocalPlayer.Character
        if u12 then
            u12.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            u12.HumanoidRootPart:ApplyImpulse(p11.force)
            task.delay(1, function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end)
        end
    end)
end
v2.CreateController(u6.new())
return nil