local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.ReplicatedStorage
local u15 = v12.RunService
local u16 = v12.StarterPlayer
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "charge-shield", "charge-shield-util").ChargeShieldUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v21.CHARGE_SHIELD
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "ChargeShieldController"
    end,
    ["__index"] = u17
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u25
    --]]
    u17.constructor(p30)
    p30.Name = "ChargeShieldController"
    p30.maid = u9.new()
    p30.remotes = u25.Client:GetNamespace("ChargeShield")
    p30.chargeShieldUse = p30.remotes:WaitFor("ChargeShieldUse")
    p30.chargeShieldHit = p30.remotes:WaitFor("ChargeShieldHit")
    p30.chargeShieldActivated = p30.remotes:WaitFor("ChargeShieldActivated")
end
function u27.KnitStart(u31) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u13
        [3] = u1
        [4] = u22
    --]]
    u17.KnitStart(u31)
    u31.chargeShieldActivated:andThen(function(p32) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u31
            [3] = u1
            [4] = u22
        --]]
        p32:Connect(function(p33) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u31
                [3] = u1
                [4] = u22
            --]]
            if not p33.player.Character or p33.player == u13.LocalPlayer then
                return nil
            end
            local u34 = u31:attachParticlesToCharacter(p33.player.Character)
            u1.Promise.delay(u22.CHARGE_DURATION):andThen(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u34
                --]]
                u31:cleanupParticles(u34)
            end)
        end)
    end)
end
function u27.useChargeShield(u35) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u26
        [3] = u22
        [4] = u13
        [5] = u8
        [6] = u20
        [7] = u19
        [8] = u10
        [9] = u15
        [10] = u16
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u26) then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u26) < 0.25 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u26, "buffer", function() --[[ Line: 72 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                if u35:isEnabled() then
                    u35:useChargeShield()
                end
            end)
        end
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u26, u22.CHARGE_SHIELD_COOLDOWN_SEC)
    u35.chargeShieldUse:andThen(function(p36) --[[ Line: 82 ]]
        p36:SendToServer()
    end)
    local u37 = u13.LocalPlayer.Character
    local u38 = u37:FindFirstChildOfClass("Humanoid")
    local u39 = u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["moveSpeedMultiplier"] = 2.85
    })
    u35.maid:GiveTask(u39)
    u8.Controllers.JumpHeightController:setJumpHeight(0)
    local u40 = u35:attachParticlesToCharacter(u37)
    local u41 = nil
    local u42 = u35.chargeShieldHit:expect():Connect(function() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41()
        return nil
    end)
    u35.maid:GiveTask(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:Disconnect()
    end)
    local u43 = u20:playAnimation(u13.LocalPlayer, u19.CHARGE_SHIELD_CHARGE, {
        ["looped"] = true
    })
    u35.maid:GiveTask(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v44 = u43
        if v44 ~= nil then
            v44:Stop()
        end
    end)
    local v45 = u37.PrimaryPart
    if v45 ~= nil then
        v45 = v45.AssemblyMass
    end
    local u46 = v45 == nil and 0 or v45
    local u47 = 0
    local u48 = u46 * 110
    local u49 = u10("BodyForce", {
        ["Name"] = "ChargeForce",
        ["Force"] = Vector3.new(),
        ["Parent"] = u37.PrimaryPart
    })
    u15:BindToRenderStep("charge", 300, function(p50) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u22
            [3] = u41
            [4] = u37
            [5] = u48
            [6] = u46
            [7] = u49
            [8] = u38
        --]]
        if u47 >= u22.CHARGE_DURATION then
            u41()
            return nil
        end
        local v51 = u37.PrimaryPart.CFrame.LookVector.X
        local v52 = u37.PrimaryPart.CFrame.LookVector.Z
        local v53 = Vector3.new(v51, 0, v52)
        u48 = u46 * 110
        local v54 = u48
        local v55 = u48
        u49.Force = v53 * Vector3.new(v54, 1, v55)
        u38:Move(Vector3.new(0, 0, -1), true)
        u47 = u47 + p50
    end)
    u35.maid:GiveTask(function() --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41()
    end)
    u41 = function() --[[ Name: cleanUpRenderStepped, Line 162 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u37
            [3] = u40
            [4] = u43
            [5] = u42
            [6] = u39
            [7] = u47
            [8] = u8
            [9] = u16
        --]]
        u15:UnbindFromRenderStep("charge")
        if u37.Parent then
            local v56 = u37.PrimaryPart
            if v56 ~= nil then
                v56 = v56:FindFirstChild("ChargeForce")
            end
            if v56 then
                v56:Destroy()
            end
            for v57, v58 in u40 do
                local _ = v57 - 1
                v58:Destroy()
            end
            u40 = {}
        end
        local v59 = u43
        if v59 ~= nil then
            v59:Stop()
        end
        u42:Disconnect()
        u39.Destroy()
        u47 = 0
        u8.Controllers.JumpHeightController:setJumpHeight(u16.CharacterJumpHeight)
    end
end
function u27.onEnable(u60, _, _) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
        [3] = u26
        [4] = u4
        [5] = u11
        [6] = u5
        [7] = u23
        [8] = u18
        [9] = u13
    --]]
    u60:setupYield(function() --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u2
            [3] = u26
        --]]
        local u61 = u9.new()
        u61:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u26))
        return function() --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u61
            --]]
            u61:DoCleaning()
        end
    end)
    local v63 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-charge-shield",
        ["boundFunction"] = function(_, p62, _) --[[ Name: boundFunction, Line 207 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            if p62 == Enum.UserInputState.Begin then
                u60:useChargeShield()
            end
        end
    })
    u60.maid:GiveTask(v63)
    if u4.isMobileControls() then
        u60:setupYield(function() --[[ Line: 216 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u5
                [3] = u23
                [4] = u18
                [5] = u60
                [6] = u13
            --]]
            local u64 = u11.mount(u11.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u11.createElement(u5, {
                    ["Image"] = u23.SHIELD_OFF_MOBILE,
                    ["Position"] = u18:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 223 ]]
                        --[[
                        Upvalues:
                            [1] = u60
                        --]]
                        u60:useChargeShield()
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 228 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u64
                --]]
                u11.unmount(u64)
            end
        end)
    end
end
function u27.onDisable(p65) --[[ Line: 234 ]]
    p65.maid:DoCleaning()
end
function u27.isRelevantItem(_, p66) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p66.itemType == u24.CHARGE_SHIELD
end
function u27.attachParticlesToCharacter(_, p67) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v68 = {}
    local v69 = u14:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldFireParticle"):FindFirstChildWhichIsA("Attachment"):Clone()
    table.insert(v68, v69)
    v69.Parent = p67.PrimaryPart
    local v70 = u14:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldShoeTrail")
    local v71 = p67:FindFirstChild("LeftFoot")
    local v72 = p67:FindFirstChild("RightFoot")
    for v73, v74 in v70:GetChildren() do
        local _ = v73 - 1
        local v75 = v74:Clone()
        local v76 = v74:Clone()
        table.insert(v68, v75)
        table.insert(v68, v76)
        v75.Parent = v71
        v76.Parent = v72
    end
    v71:FindFirstChild("TrailTop").Attachment0 = v71:FindFirstChild("TrailAttachmentTop")
    v71:FindFirstChild("TrailTop").Attachment1 = v71:FindFirstChild("TrailAttachmentMid")
    v71:FindFirstChild("TrailBottom").Attachment0 = v71:FindFirstChild("TrailAttachmentMid")
    v71:FindFirstChild("TrailBottom").Attachment1 = v71:FindFirstChild("TrailAttachmentBottom")
    v72:FindFirstChild("TrailTop").Attachment0 = v72:FindFirstChild("TrailAttachmentTop")
    v72:FindFirstChild("TrailTop").Attachment1 = v72:FindFirstChild("TrailAttachmentMid")
    v72:FindFirstChild("TrailBottom").Attachment0 = v72:FindFirstChild("TrailAttachmentMid")
    v72:FindFirstChild("TrailBottom").Attachment1 = v72:FindFirstChild("TrailAttachmentBottom")
    return v68
end
function u27.cleanupParticles(_, p77) --[[ Line: 277 ]]
    for v78, v79 in p77 do
        local _ = v78 - 1
        v79:Destroy()
    end
end
v7.CreateController(u27.new())
return nil