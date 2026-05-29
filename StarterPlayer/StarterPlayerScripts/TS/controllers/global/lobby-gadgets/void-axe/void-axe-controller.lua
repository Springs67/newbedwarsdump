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
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "VoidAxeController"
    end,
    ["__index"] = u15
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
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
    --]]
    u15.constructor(p31)
    p31.Name = "VoidAxeController"
    p31.maid = u10.new()
end
function u28.KnitStart(p32) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u26
        [3] = u13
        [4] = u6
        [5] = u27
        [6] = u16
        [7] = u22
    --]]
    u15.KnitStart(p32)
    u26.Client:OnEvent("VoidAxeLeap", function(p33) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
            [3] = u27
        --]]
        if p33.entity.PrimaryPart then
            if p33.entity == u13.LocalPlayer.Character then
                return nil
            end
            u6:playSound(u27.VOID_AXE_LEAP, {
                ["position"] = p33.entity.PrimaryPart.Position,
                ["parent"] = p33.entity.PrimaryPart
            })
        end
    end)
    u16.On(function(p34, _, p35, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u13
            [3] = u6
            [4] = u27
        --]]
        if p35 == u22.VOID_AXE_SLASH then
            local v36 = u13.LocalPlayer.Character == p34
            local v37 = u6
            local v38 = u27.VOID_AXE_HIT
            local v39 = {}
            local v40
            if v36 then
                v40 = nil
            else
                v40 = p34.PrimaryPart
                if v40 ~= nil then
                    v40 = v40.Position
                end
            end
            v39.position = v40
            v37:playSound(v38, v39)
        end
    end)
end
function u28.useVoidAxe(u41) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u18
        [4] = u6
        [5] = u27
        [6] = u9
        [7] = u13
        [8] = u14
        [9] = u8
        [10] = u19
        [11] = u20
        [12] = u23
        [13] = u25
        [14] = u26
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u21.VOID_AXE) then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u21.VOID_AXE) < 0.25 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u21.VOID_AXE, "buffer", function() --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                if u41:isEnabled() then
                    u41:useVoidAxe()
                end
            end)
        end
        return nil
    end
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u18.VOID_AXE_JUMP) then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.VOID_AXE_JUMP)
    u6:playSound(u27.VOID_AXE_LEAP)
    local u42 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0,
        ["blockSprint"] = true
    })
    u41.maid:GiveTask(u42)
    local v43 = u13.LocalPlayer.Character
    local u44 = v43.PrimaryPart
    local v45 = v43:FindFirstChildOfClass("Humanoid")
    v45.JumpHeight = 3
    v45:ChangeState(Enum.HumanoidStateType.Jumping)
    local u46 = nil
    u46 = v45.Jumping:Connect(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u46
            [3] = u9
            [4] = u14
        --]]
        local v47 = u44.CFrame
        local v48 = CFrame.new(Vector3.new(0, 0, -5))
        local v49 = u44.Position
        u44:ApplyImpulse((v47 * v48 - v49).Position * 13 * u44.AssemblyMass)
        u46:Disconnect()
        u9.Controllers.JumpHeightController:setJumpHeight(u14.CharacterJumpHeight)
    end)
    u41.maid:GiveTask(u46)
    u41.maid:GiveTask(function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
        --]]
        u9.Controllers.JumpHeightController:setJumpHeight(u14.CharacterJumpHeight)
    end)
    u8.Controllers.ViewmodelController:playAnimation(u19.FP_USE_ITEM)
    local u50 = u20:playAnimation(u13.LocalPlayer, u19.JADE_HAMMER_SLAM)
    u41.maid:GiveTask(function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v51 = u50
        if v51 ~= nil then
            v51:Stop()
        end
    end)
    if u50 ~= nil then
        u50.Stopped:Connect(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u25
                [3] = u26
                [4] = u42
            --]]
            local v52 = u23:getLocalPlayerEntity()
            if v52 ~= nil then
                v52 = v52:getItemTypeInHand()
            end
            if v52 == u25.VOID_AXE then
                u26.Client:Get("UseVoidAxeSlash"):SendToServer()
            end
            u42.Destroy()
        end)
    end
end
function u28.onEnable(u53, _, u54) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u20
        [4] = u13
        [5] = u19
        [6] = u4
        [7] = u17
        [8] = u11
        [9] = u5
        [10] = u24
    --]]
    u53:setupDestroyableYield(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.VOID_AXE_JUMP, nil):expect()
    end)
    task.spawn(function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u13
            [3] = u19
            [4] = u54
            [5] = u53
        --]]
        local u55 = u20:playAnimation(u13.LocalPlayer, u19.JADE_HAMMER_IDLE, {
            ["looped"] = true
        })
        if u54() then
            u53.maid:GiveTask(function() --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u55
                --]]
                local v56 = u55
                if v56 ~= nil then
                    v56:Stop()
                end
            end)
        elseif u55 ~= nil then
            u55:Stop()
        end
    end)
    local v58 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-void-axe",
        ["boundFunction"] = function(_, p57, _) --[[ Name: boundFunction, Line 175 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            if p57 == Enum.UserInputState.Begin then
                u53:useVoidAxe()
            end
        end
    })
    u53.maid:GiveTask(v58)
    if u4.isMobileControls() then
        local u59 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("ItemPrimary") or u17:getActionMobileButtonPosition()
        local u60 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("ItemPrimary")
        u53:setupYield(function() --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u5
                [3] = u24
                [4] = u59
                [5] = u60
                [6] = u53
                [7] = u13
            --]]
            local u61 = u11.mount(u11.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u11.createElement(u5, {
                    ["Image"] = u24.SHOOT_MOBILE,
                    ["Position"] = u59,
                    ["Size"] = u60,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 193 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                        --]]
                        u53:useVoidAxe()
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u61
                --]]
                u11.unmount(u61)
            end
        end)
    end
end
function u28.onDisable(p62) --[[ Line: 204 ]]
    p62.maid:DoCleaning()
end
function u28.isRelevantItem(_, p63) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    return p63.itemType == u25.VOID_AXE
end
u8.CreateController(u28.new())
return nil