local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.MobileTouchType
local u7 = v3.RandomUtil
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ContextActionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = { v26.IMPULSE_GUN_FIRE_1, v26.IMPULSE_GUN_FIRE_2, v26.IMPULSE_GUN_FIRE_3 }
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "ImpulseGunController"
    end,
    ["__index"] = u17
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
        [1] = u17
        [2] = u10
    --]]
    u17.constructor(p31)
    p31.Name = "ImpulseGunController"
    p31.abilityMaid = u10.new()
end
function u28.isRelevantItem(_, p32) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p32.itemType == u24.IMPULSE_GUN
end
function u28.onEnable(p33, _, _) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u6
        [4] = u5
        [5] = u23
    --]]
    local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v36 = {
        ["action"] = "Attack",
        ["actionId"] = "Impulse Gun Fire",
        ["boundFunction"] = function(_, p35, _) --[[ Name: boundFunction, Line 56 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u18
            --]]
            if p35 ~= Enum.UserInputState.Begin then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.IMPULSE_GUN)
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 64 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u18
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.IMPULSE_GUN)
            end
        }
    }
    local v37 = v34:bindAction(v36)
    p33.abilityMaid:GiveTask(v37)
    if u5.isMobileControls() then
        local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v39 = u18.IMPULSE_GUN
        local v40 = {
            ["abilityType"] = "ItemPrimary",
            ["abilityButton"] = {
                ["icon"] = u23.IMPULSE_GUN_RENDER
            }
        }
        local u41 = v38:enableAbility(v39, v40):expect()
        p33.abilityMaid:GiveTask(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41.Destroy()
        end)
    end
end
function u28.onDisable(p42) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12:UnbindAction("Impulse Gun Fire")
    p42.abilityMaid:DoCleaning()
end
function u28.KnitStart(u43) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u24
        [4] = u27
        [5] = u16
        [6] = u13
        [7] = u18
        [8] = u25
        [9] = u4
        [10] = u20
        [11] = u19
        [12] = u7
        [13] = u8
    --]]
    u17.KnitStart(u43)
    local v44 = {
        ["sounds"] = u27
    }
    u9.Controllers.PreloadController:preloadForItemType(u24.IMPULSE_GUN, v44)
    u16.AbilityUsed:connect(function(p45) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u18
            [3] = u43
        --]]
        if p45.userCharacter == u13.LocalPlayer.Character and p45.ability == u18.IMPULSE_GUN then
            u43:fire()
        end
    end)
    u25.Client:Get("ImpulseGunEffect"):Connect(function(p46) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
            [3] = u20
            [4] = u19
            [5] = u43
            [6] = u7
            [7] = u27
            [8] = u8
        --]]
        if p46.player ~= u13.LocalPlayer then
            u4:playAnimation(p46.player, u20:getAssetId(u19.TORNADO_LAUNCHER_SHOOT), {
                ["looped"] = false
            })
            u43:playImpulseEffect(p46.player, p46.direction)
            local v47 = p46.player.Character
            if v47 ~= nil then
                v47 = v47.PrimaryPart
                if v47 ~= nil then
                    v47 = v47.Position
                end
            end
            if not v47 then
                return nil
            end
            local v48 = u27
            u8:playSound(u7.fromList(unpack(v48)), {
                ["position"] = v47
            })
        end
    end)
end
function u28.fire(p49) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u25
        [4] = u4
        [5] = u20
        [6] = u19
        [7] = u7
        [8] = u27
        [9] = u8
        [10] = u21
    --]]
    local v50 = u15.CurrentCamera
    local v51
    if v50 == nil then
        v51 = v50
    else
        v51 = v50.CFrame.LookVector.Unit
    end
    if not v51 then
        return nil
    end
    local v52 = u13.LocalPlayer.Character
    if v52 ~= nil then
        v52 = v52.PrimaryPart
    end
    if not v52 then
        return nil
    end
    local v53 = v52.AssemblyMass
    if not u25.Client:Get("ImpulseGunFire"):CallServer({
        ["velocity"] = v51,
        ["lookVector"] = v51
    }) then
        return nil
    end
    u4:playAnimation(u13.LocalPlayer, u20:getAssetId(u19.TORNADO_LAUNCHER_SHOOT), {
        ["looped"] = false
    })
    p49:playImpulseEffect(u13.LocalPlayer, v51)
    local v54 = u27
    u8:playSound((u7.fromList(unpack(v54))))
    local v55 = v52.Position
    local v56 = v52.Position
    local v57 = v50.CFrame.LookVector
    v52.CFrame = CFrame.new(v55, v56 + v57 * Vector3.new(1, 0, 1))
    u21.applyKnockbackPlatformStand(v52)
    v52:ApplyImpulse(v51 * (v53 * 120 * -1))
end
function u28.playImpulseEffect(_, p58, p59) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u15
    --]]
    if not u22:getEntity(p58) then
        return nil
    end
    local u60 = u14.Assets.Effects.ImpulseGunEffect:Clone()
    u60.Parent = u15
    local v61 = p58.Character
    if v61 ~= nil then
        v61 = v61.PrimaryPart
        if v61 ~= nil then
            v61 = v61.Position
        end
    end
    if not v61 then
        return false
    end
    local v62 = p59.Unit * 10
    u60.CFrame = CFrame.new(v61, v61 + v62)
    for v63, v64 in u60:WaitForChild("particleAttachment"):GetChildren() do
        local _ = v63 - 1
        if v64:IsA("ParticleEmitter") then
            v64:Emit(15)
        end
    end
    task.delay(1, function() --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:Destroy()
    end)
end
u9.CreateController(u28.new())
return nil