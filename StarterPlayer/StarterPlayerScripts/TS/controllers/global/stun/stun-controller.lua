local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "StunController"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14)
    p14.Name = "StunController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u8
        [4] = u6
        [5] = u4
        [6] = u9
        [7] = u5
    --]]
    u10.KnitStart(u15)
    u2(function(p16, u17, p18) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u4
            [4] = u9
            [5] = u5
            [6] = u15
        --]]
        if p16 == u8.LocalPlayer then
            local u19 = u6.new()
            p18:GiveTask(u19)
            u17:GetAttributeChangedSignal("SnaredUntilTime"):Connect(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u17
                    [3] = u4
                    [4] = u9
                    [5] = u5
                --]]
                u19:DoCleaning()
                if u17:GetAttribute("SnaredUntilTime") ~= -1 then
                    u19:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        ["moveSpeedMultiplier"] = 0
                    }))
                    u19:GiveTask(u9.PlaceBlock:connect(function(p20) --[[ Line: 43 ]]
                        p20:setCancelled(true)
                    end))
                    u19:GiveTask(u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
                        ["jumpHeightMultiplier"] = 0
                    }))
                end
            end)
            local u21 = u6.new()
            p18:GiveTask(u21)
            u17:GetAttributeChangedSignal("StunnedUntilTime"):Connect(function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u17
                    [3] = u9
                    [4] = u4
                    [5] = u5
                --]]
                u21:DoCleaning()
                if u17:GetAttribute("StunnedUntilTime") ~= -1 then
                    u21:GiveTask(u9.SwordSwing:connect(function(p22) --[[ Line: 57 ]]
                        p22:setCancelled(true)
                    end))
                    u21:GiveTask(u9.SwordChargedSwing:connect(function(p23) --[[ Line: 60 ]]
                        p23:setCancelled(true)
                    end))
                    u21:GiveTask(u9.AbilityUsed:connect(function(p24) --[[ Line: 63 ]]
                        p24:setCancelled(true)
                    end))
                    u21:GiveTask(u9.PlaceBlock:connect(function(p25) --[[ Line: 66 ]]
                        p25:setCancelled(true)
                    end))
                    u21:GiveTask(u9.BeginProjectileTargeting:connect(function(p26) --[[ Line: 69 ]]
                        p26:setCancelled(true)
                    end))
                    u21:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        ["moveSpeedMultiplier"] = 0
                    }))
                    u21:GiveTask(u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
                        ["jumpHeightMultiplier"] = 0
                    }))
                end
            end)
            local u27 = u6.new()
            p18:GiveTask(u27)
            u17:GetAttributeChangedSignal("Locked"):Connect(function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u17
                    [3] = u27
                --]]
                u15:lockUpdate(u17, u27)
            end)
            local v28 = u17:GetAttribute("Locked")
            if v28 ~= 0 and (v28 == v28 and (v28 ~= "" and v28)) then
                u15:lockUpdate(u17, u27)
            end
        end
    end)
end
function u11.showStatusBubble(_, p29, p30) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v31 = u6.new()
    local v32 = p29:FindFirstChild("Head")
    if v32 then
        local v33 = u7
        local v34 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.5, 0),
            ["LightInfluence"] = 0,
            ["Parent"] = v32,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Adornee"] = v32,
            ["Children"] = { u7("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = p30,
                    ["Size"] = UDim2.fromScale(1, 1)
                }) }
        }
        local u35 = v33("BillboardGui", v34)
        v31:GiveTask(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35:Destroy()
        end)
    end
    return v31
end
function u11.lockUpdate(_, p36, p37) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u5
    --]]
    p37:DoCleaning()
    local v38 = p36:GetAttribute("Locked")
    if v38 ~= 0 and (v38 == v38 and (v38 ~= "" and v38)) then
        p37:GiveTask(u9.DamageBlock:connect(function(p39) --[[ Line: 119 ]]
            p39:setCancelled(true)
        end))
        p37:GiveTask(u9.PlaceBlock:connect(function(p40) --[[ Line: 122 ]]
            p40:setCancelled(true)
        end))
        p37:GiveTask(u9.SwordSwing:connect(function(p41) --[[ Line: 125 ]]
            p41:setCancelled(true)
        end))
        p37:GiveTask(u9.BeginProjectileTargeting:connect(function(p42) --[[ Line: 128 ]]
            p42:setCancelled(true)
        end))
        p37:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = 0
        }))
        p37:GiveTask(u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = 0
        }))
    end
end
u4.CreateController(u11.new())
return nil