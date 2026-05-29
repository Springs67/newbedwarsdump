local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ModifierController"
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
    p10.Name = "ModifierController"
    p10.airJumpModifierIdMap = {}
    p10.jumpHeightModifierIdMap = {}
    p10.speedModifierIdMap = {}
end
function u7.KnitStart(u11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
    --]]
    u5.KnitStart(u11)
    u6.Client:OnEvent("UpdateScriptJumpModifier", function(p12) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        local v13 = u4.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["airJumps"] = p12.jumps
        })
        u11.airJumpModifierIdMap[p12.id] = {
            ["Destroy"] = v13.Destroy
        }
    end)
    u6.Client:OnEvent("AddScriptJumpHeightModifier", function(p14) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        local v15 = u4.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = p14.multiplier
        })
        u11.jumpHeightModifierIdMap[p14.id] = v15
    end)
    u6.Client:OnEvent("UpdateScriptSpeedModifier", function(p16) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        local v17 = u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = p16.multiplier
        })
        u11.speedModifierIdMap[p16.id] = v17
    end)
    u6.Client:OnEvent("RemoveScriptJumpModifier", function(p18) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v19 = u11.airJumpModifierIdMap[p18.id]
        if v19 ~= nil then
            v19.Destroy()
        end
    end)
    u6.Client:OnEvent("RemoveScriptJumpHeightModifier", function(p20) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v21 = u11.jumpHeightModifierIdMap[p20.id]
        if v21 ~= nil then
            v21.Destroy()
        end
    end)
    u6.Client:OnEvent("RemoveScriptSpeedModifier", function(p22) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v23 = u11.speedModifierIdMap[p22.id]
        if v23 ~= nil then
            v23.Destroy()
        end
    end)
end
v3.CreateController(u7.new())
return nil