local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "TaserController"
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
    p9.Name = "TaserController"
end
function u6.KnitStart(u10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.KnitStart(u10)
    u5.Client:OnEvent("Tase", function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:taseSelf(p11.duration)
    end)
end
function u6.taseSelf(_, p12) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local u13 = u3.LocalPlayer.Character
    if u13 then
        u13.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        local v14 = u13.HumanoidRootPart
        local v15 = math.random(-30, 30)
        local v16 = math.random(-30, 30)
        local v17 = math.random
        v14:ApplyAngularImpulse(Vector3.new(v15, v16, v17(-30, 30)) * u13.HumanoidRootPart.AssemblyMass)
        task.delay(p12, function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end)
    end
end
v2.CreateController(u6.new())
return nil