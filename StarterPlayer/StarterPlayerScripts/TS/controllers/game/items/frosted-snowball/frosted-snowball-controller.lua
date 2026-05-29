local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "FrostedSnowballController"
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
    --]]
    u5.constructor(p11)
    p11.Name = "FrostedSnowballController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u4
        [5] = u3
        [6] = u2
    --]]
    u5.KnitStart(p12)
    u6.On(function(p13, _, _, _, _, _, _, p14, _, _, _, _, _, _) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u3
            [4] = u2
        --]]
        local v15
        if p14 == nil then
            v15 = p14
        else
            v15 = p14.projectileData
            if v15 ~= nil then
                v15 = v15.projectileType
            end
        end
        if v15 ~= 0 and (v15 == v15 and (v15 and (u7(p14.projectileData.projectileType) == "frosted_snowball" and p13 == u4.LocalPlayer.Character))) then
            local u16 = u3.new()
            u16:GiveTask(u2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = 0.6
            }))
            task.delay(1, function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end)
        end
    end)
end
u2.CreateController(u8.new())
return nil