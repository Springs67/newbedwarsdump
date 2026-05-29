local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out")
local u13 = v12.scaleModel
local u14 = v12.scalePart
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Debris
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.RunService
local u20 = v15.UserInputService
local u21 = v15.Workspace
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "shielder", "shield-mobile-ui").ShieldMobileUI
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "GlitchShieldController"
    end,
    ["__index"] = u23
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u28
        [3] = u9
    --]]
    u23.constructor(p34)
    p34.Name = "GlitchShieldController"
    p34.infernalShieldState = u28.Client:Get("UseGlitchShield")
    p34.maid = u9.new()
    p34.raisedMaid = u9.new()
    p34.lastShieldRaised = 0
end
function u31.isRelevantItem(_, p35) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    return p35.itemType == u27.GLITCH_INFERNAL_SHIELD
end
function u31.onEnable(u36, _, _) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u2
        [3] = u11
        [4] = u22
        [5] = u17
    --]]
    if u20.KeyboardEnabled or u20.GamepadEnabled then
        local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            ["action"] = "Attack",
            ["actionId"] = "glitch-infernal-shield-click",
            ["boundFunction"] = function(_, p37, _) --[[ Name: boundFunction, Line 63 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                if p37 == Enum.UserInputState.Begin then
                    u36:raiseShield()
                elseif p37 == Enum.UserInputState.End then
                    u36:lowerShield()
                end
            end
        })
        u36.maid:GiveTask(v38)
    end
    if u20.TouchEnabled then
        u36:setupYield(function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u22
                [3] = u36
                [4] = u17
            --]]
            local v39 = u11.mount
            local v40 = u11.createElement
            local v41 = {}
            local v43 = {
                ["OnChange"] = function(p42) --[[ Name: OnChange, Line 79 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    if p42 then
                        u36:raiseShield()
                    else
                        u36:lowerShield()
                    end
                end
            }
            __set_list(v41, 1, {u11.createElement(u22, v43)})
            local u44 = v39(v40("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, v41), u17.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u44
                --]]
                u11.unmount(u44)
            end
        end)
    end
end
function u31.onDisable(p45) --[[ Line: 94 ]]
    p45:lowerShield()
    p45.maid:DoCleaning()
end
function u31.KnitStart(u46) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u28
        [3] = u18
        [4] = u21
        [5] = u4
        [6] = u14
        [7] = u16
        [8] = u5
        [9] = u29
        [10] = u17
    --]]
    u23.KnitStart(u46)
    u28.Client:OnEvent("ReflectGlitchProjectileEffects", function(p47) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46:playEffects(p47.player)
    end)
    u28.Client:OnEvent("GlitchProjectileDeflected", function(p48) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u21
            [3] = u4
            [4] = u14
            [5] = u16
            [6] = u5
            [7] = u29
            [8] = u17
        --]]
        local v49 = u18.Assets.Effects.GlitchExplosion:Clone()
        v49.Position = p48.position
        v49.Parent = u21
        u4:setQueryIgnored(v49, true)
        u14(v49, 0.2)
        for v50, v51 in v49:GetDescendants() do
            local _ = v50 - 1
            if v51:IsA("ParticleEmitter") then
                v51:Emit(30)
            end
        end
        u16:AddItem(v49, 1)
        local v52 = u5
        local v53 = u29.SHIELD_BLOCKED
        local v54 = {}
        local v55
        if p48.deflector == u17.LocalPlayer then
            v55 = nil
        else
            v55 = p48.position
        end
        v54.position = v55
        v52:playSound(v53, v54)
    end)
end
function u31.raiseShield(u56) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u25
        [3] = u24
        [4] = u17
        [5] = u6
    --]]
    if os.clock() - u56.lastShieldRaised < 0.2 then
        return nil
    end
    u56.lastShieldRaised = os.clock()
    u56.infernalShieldState:SendToServer({
        ["raised"] = true
    })
    u56.raisedMaid:GiveTask(function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56.infernalShieldState:SendToServer({
            ["raised"] = false
        })
    end)
    local v57 = u10("Animation", {
        ["AnimationId"] = u25:getAssetId(u24.KNIGHT_SHIELD_RAISE_SHIELD)
    })
    local v58 = u17.LocalPlayer.Character
    if v58 ~= nil then
        v58 = v58:FindFirstChild("Humanoid")
    end
    local v59
    if v58 == nil then
        v59 = v58
    else
        v59 = v58:FindFirstChild("Animator")
    end
    if v58 and v59 then
        local u60 = v59:LoadAnimation(v57)
        u60.Looped = true
        u60:Play()
        u56.raisedMaid:GiveTask(function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            u60:Stop()
            u60:Destroy()
        end)
        local u61 = u6.Controllers.ViewmodelController:playAnimation(u24.FP_SHIELD_USE, {
            ["looped"] = true
        })
        u56.raisedMaid:GiveTask(function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u61
            --]]
            local v62 = u61
            if v62 ~= nil then
                v62:Stop()
            end
        end)
        u56.raisedMaid:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = 0.9
        }))
    end
end
function u31.lowerShield(p63) --[[ Line: 172 ]]
    p63.raisedMaid:DoCleaning()
end
function u31.playEffects(u64, p65) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u9
        [3] = u18
        [4] = u13
        [5] = u21
        [6] = u4
        [7] = u30
        [8] = u7
        [9] = u19
        [10] = u8
    --]]
    local u66 = u26:getEntity(p65)
    if u66 == nil then
        return nil
    end
    local u67 = u9.new()
    local u68 = u18.Assets.Effects.GlitchInfernalShields:Clone()
    u68:PivotTo(u66:getInstance():GetPrimaryPartCFrame())
    u13(u68, 0.06)
    u68.Parent = u21
    for _, v69 in u68:GetChildren() do
        if v69:IsA("BasePart") then
            u4:setQueryIgnored(v69, true)
        end
    end
    u30.tweenModelSize(u68, 0, u7, 10)
    local u70 = 0
    local u75 = u19.Heartbeat:Connect(function(p71) --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u70
            [3] = u68
            [4] = u64
            [5] = u67
            [6] = u8
        --]]
        local v72 = u66:getInstance():GetPrimaryPartCFrame()
        local v73 = CFrame.new(v72.Position)
        local v74 = CFrame.Angles(0, u70 * 0.8, 0)
        u68.Shields.CFrame = (v73 + Vector3.new(0, -0.25, 0)) * v74
        if not u64:validPlayerConditions(u66) then
            u67:DoCleaning()
            return nil
        end
        u70 = u70 + p71
        if u68.PrimaryPart == nil then
            u8.Error("Shield effect has no primary part")
            return nil
        end
    end)
    u67:GiveTask(function() --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u68
        --]]
        u75:Disconnect()
        u68:Destroy()
    end)
end
function u31.validPlayerConditions(_, p76) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    if p76:isAlive() then
        if p76:getInstance():GetAttribute("GlitchShieldRaised") == true then
            local v77 = p76:getItemInHand()
            if v77 ~= nil then
                v77 = v77.Name
            end
            if v77 == u27.GLITCH_INFERNAL_SHIELD then
                return p76:getInstance().PrimaryPart ~= nil
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end
u6.CreateController(u31.new())
return nil