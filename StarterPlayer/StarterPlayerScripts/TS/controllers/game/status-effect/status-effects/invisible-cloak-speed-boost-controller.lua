local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "InvisibleCloakSpeedBoostController"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p9)
    p9.Name = "InvisibleCloakSpeedBoostController"
    p9.speedMaid = u4.new()
end
function u6.KnitStart(u10) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u3
    --]]
    u5.KnitStart(u10)
    u2(function(_, u11, p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
        --]]
        p12:GiveTask(u11:GetAttributeChangedSignal("CloakUpgradeSpeedBoost"):Connect(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u10
                [3] = u3
            --]]
            if u11:GetAttribute("CloakUpgradeSpeedBoost") == nil then
                u10.speedMaid:DoCleaning()
            else
                u10.speedMaid:GiveTask(u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = false,
                    ["moveSpeedMultiplier"] = u11:GetAttribute("CloakUpgradeSpeedBoost")
                }))
            end
        end))
        p12:GiveTask(u10.speedMaid)
    end)
end
u3.CreateController(u6.new())
return nil