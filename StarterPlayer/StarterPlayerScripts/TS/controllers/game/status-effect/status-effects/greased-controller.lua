local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "bacon-blade-balance").BaconBladeBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "GreasedController"
    end,
    ["__index"] = u6
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
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p12)
    p12.Name = "GreasedController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u5
        [4] = u4
        [5] = u7
    --]]
    u6.KnitStart(p13)
    u8.Client:OnEvent("GreaseStatusApplied", function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
        --]]
        if p14.player ~= u5.LocalPlayer then
            return nil
        end
        if p14.player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics then
            u4.Controllers.TaserController:taseSelf(u7.MIN_GET_UP_TIME + math.random() * (u7.MAX_GET_UP_TIME - u7.MIN_GET_UP_TIME))
        end
    end)
end
v3.CreateController(u9.new())
return nil