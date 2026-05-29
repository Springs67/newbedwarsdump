local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.StarterPlayer
local u15 = v12.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "jade-balance").JadeBalance
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "JadeHammerController"
    end,
    ["__index"] = u16
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31, ...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
    --]]
    u16.constructor(p31, ...)
    p31.Name = "JadeHammerController"
    p31.maid = u10.new()
    p31.readyTime = -1
    p31.isHoldingAttackButton = false
end
function u28.KnitStart(p32) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p32)
end
function u28.useJadeHammer(u33) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u18
        [4] = u15
        [5] = u9
        [6] = u21
        [7] = u13
        [8] = u14
        [9] = u8
        [10] = u19
        [11] = u20
        [12] = u23
        [13] = u25
        [14] = u26
        [15] = u6
        [16] = u27
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u22.JADE_HAMMER) then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u22.JADE_HAMMER) < 0.25 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u22.JADE_HAMMER, "buffer", function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                if u33:isEnabled() then
                    u33:useJadeHammer()
                end
            end)
        end
        return nil
    end
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u18.JADE_HAMMER_JUMP) then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.JADE_HAMMER_JUMP)
    if u33.readyTime > u15:GetServerTimeNow() then
        return nil
    end
    u33.readyTime = u15:GetServerTimeNow() + 1
    local u34 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["moveSpeedMultiplier"] = u21.MOVE_SPEED_MULTIPLIER
    })
    u33.maid:GiveTask(u34)
    local v35 = u13.LocalPlayer.Character
    local u36 = v35.PrimaryPart
    local v37 = v35:FindFirstChildOfClass("Humanoid")
    v37.JumpHeight = 3
    v37:ChangeState(Enum.HumanoidStateType.Jumping)
    local u38 = nil
    u38 = v37.Jumping:Connect(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u36
            [3] = u38
            [4] = u9
            [5] = u14
        --]]
        local v39 = u21.JUMP_FORCE
        u36:ApplyImpulse(Vector3.new(0, v39, 0) * u36.AssemblyMass)
        u38:Disconnect()
        u9.Controllers.JumpHeightController:setJumpHeight(u14.CharacterJumpHeight)
    end)
    u33.maid:GiveTask(u38)
    u33.maid:GiveTask(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
        --]]
        u9.Controllers.JumpHeightController:setJumpHeight(u14.CharacterJumpHeight)
    end)
    u8.Controllers.ViewmodelController:playAnimation(u19.FP_USE_ITEM)
    local u40 = u20:playAnimation(u13.LocalPlayer, u19.JADE_HAMMER_SLAM)
    u33.maid:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v41 = u40
        if v41 ~= nil then
            v41:Stop()
        end
    end)
    local u42 = nil
    u42 = v37.StateChanged:Connect(function(_, p43) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u25
            [3] = u26
            [4] = u6
            [5] = u27
            [6] = u36
            [7] = u34
            [8] = u42
        --]]
        if p43 == Enum.HumanoidStateType.Landed or p43 == Enum.HumanoidStateType.Running then
            local v44 = u23:getLocalPlayerEntity()
            if v44 ~= nil then
                v44 = v44:getItemTypeInHand()
            end
            if v44 == u25.JADE_HAMMER then
                u26.Client:Get("JadeHammerSlam"):SendToServer({})
                u6:playSound(u27.JADE_HAMMER_THUD, {
                    ["position"] = u36.Position
                })
            end
            u34.Destroy()
            u42:Disconnect()
        end
    end)
end
function u28.onEnable(u45, _, u46) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u20
        [4] = u13
        [5] = u19
        [6] = u4
        [7] = u11
        [8] = u5
        [9] = u24
        [10] = u17
    --]]
    u45:setupDestroyableYield(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.JADE_HAMMER_JUMP, nil):expect()
    end)
    task.spawn(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u13
            [3] = u19
            [4] = u46
            [5] = u45
        --]]
        local u47 = u20:playAnimation(u13.LocalPlayer, u19.JADE_HAMMER_IDLE, {
            ["looped"] = true
        })
        if u46() then
            u45.maid:GiveTask(function() --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                local v48 = u47
                if v48 ~= nil then
                    v48:Stop()
                end
            end)
        elseif u47 ~= nil then
            u47:Stop()
        end
    end)
    local v50 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-jade-hammer",
        ["boundFunction"] = function(_, p49, _) --[[ Name: boundFunction, Line 153 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            if p49 == Enum.UserInputState.Begin then
                u45.isHoldingAttackButton = true
                u45:useJadeHammer()
            end
            if p49 == Enum.UserInputState.End or p49 == Enum.UserInputState.Cancel then
                u45.isHoldingAttackButton = false
            end
        end
    })
    u45.maid:GiveTask(v50)
    if u4.isMobileControls() then
        u45:setupYield(function() --[[ Line: 165 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u5
                [3] = u24
                [4] = u17
                [5] = u45
                [6] = u13
            --]]
            local u51 = u11.mount(u11.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u11.createElement(u5, {
                    ["Image"] = u24.UP_MOBILE,
                    ["Position"] = u17:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 172 ]] end,
                    ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 173 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                        --]]
                        u45.isHoldingAttackButton = true
                        u45:useJadeHammer()
                    end,
                    ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 177 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                        --]]
                        u45.isHoldingAttackButton = false
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u51
                --]]
                u11.unmount(u51)
            end
        end)
    end
end
function u28.onDisable(p52) --[[ Line: 188 ]]
    p52.maid:DoCleaning()
    p52.isHoldingAttackButton = false
end
function u28.isRelevantItem(_, p53) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    return p53.itemType == u25.JADE_HAMMER
end
u8.CreateController(u28.new())
return nil