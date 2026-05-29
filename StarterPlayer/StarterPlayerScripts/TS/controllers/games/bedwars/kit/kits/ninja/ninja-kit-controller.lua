local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u20 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u21 = { v17.NINJA_SMOKE_1, v17.NINJA_SMOKE_2, v17.NINJA_SMOKE_3 }
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "NinjaKitController"
    end,
    ["__index"] = u20
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u21
        [3] = u13
        [4] = u20
        [5] = u7
    --]]
    local v26 = u15.NINJA
    local v27 = {}
    local v28 = {}
    local v29 = #v28
    table.move(u21, 1, #u21, v29 + 1, v28)
    v27.sounds = v28
    v27.animations = { u13.NINJA_RUN }
    u20.constructor(p25, v26, v27)
    p25.Name = "NinjaKitController"
    p25.animationMaid = u7.new()
end
function u22.KnitStart(p30) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p30)
end
function u22.onKitLocalActivated(_, _) --[[ Line: 53 ]] end
function u22.onKitLocalDeactivated(_) --[[ Line: 55 ]] end
function u22.onKitReplicationActivated(u31, _) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u15
        [4] = u16
        [5] = u12
        [6] = u18
    --]]
    u5(function(p32, p33) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
        --]]
        if not u6.Controllers.KitController:isUsingKit(p32, u15.NINJA) then
            return nil
        end
        local v34 = p33:WaitForChild("Animate")
        if not v34 then
            return nil
        end
        local v35 = v34:WaitForChild("run")
        if not v35 then
            return nil
        end
        if v35 ~= nil then
            v35 = v35:WaitForChild("RunAnim")
        end
        if not v35 then
            return nil
        end
        v35.AnimationId = "http://www.roblox.com/asset/?id=15516100146"
    end)
    u16.Client:OnEvent("NinjaSubstitutionActivated", function(p36) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        if not p36.player then
            return nil
        end
        u31:playerActivateSubstitution(p36.player)
    end)
    u12.StatusEffectRemoved:connect(function(p37) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u31
        --]]
        if p37.statusEffect ~= u18.NINJA_INVISIBLE then
            return nil
        end
        u31:removeInvisibility(p37.entityInstance)
    end)
end
function u22.onKitReplicationDeactivated(_) --[[ Line: 96 ]] end
function u22.onInnateAbilityEnabled(_, _, _) --[[ Line: 98 ]] end
function u22.onAbilityUsed(_, _, _) --[[ Line: 100 ]] end
function u22.playerActivateSubstitution(_, p38) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u19
        [4] = u4
        [5] = u21
        [6] = u9
    --]]
    local v39
    if p38 == nil then
        v39 = p38
    else
        v39 = p38.Character
        if v39 ~= nil then
            v39 = v39.PrimaryPart
        end
    end
    if not v39 then
        return nil
    end
    local v40 = p38.Character.PrimaryPart.Position
    local v41 = CFrame.new(v40)
    local u42 = u10.Assets.Effects.NinjaSmoke:Clone()
    u42.Parent = u11
    u42:PivotTo(v41)
    task.delay(0.5, function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u42
        --]]
        u19:disableEffects(u42:GetDescendants())
    end)
    task.delay(4, function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:Destroy()
    end)
    local u43 = u10.Assets.Misc.NinjaLog:Clone()
    u43.Parent = u11
    local v44 = math.random(-360, 360)
    local v45 = math.random(-360, 360)
    local v46 = math.random
    local v47 = Vector3.new(v44, v45, v46(-360, 360))
    u43.PrimaryPart:PivotTo(v41)
    u43.PrimaryPart.Orientation = v47
    task.delay(8, function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:Destroy()
    end)
    task.delay(0.5, function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43.PrimaryPart.Anchored = false
        local v48 = math.random(-1, 1)
        local v49 = math.random
        local v50 = Vector3.new(v48, 0, v49(-1, 1))
        local v51 = u43.PrimaryPart
        if v51 ~= nil then
            v51:ApplyImpulse(v50 * 5)
        end
    end)
    u4:playSound(u21[math.random(0, #u21 - 1) + 1], {
        ["position"] = v40
    })
    local _ = p38 == u9.LocalPlayer
end
function u22.removeInvisibility(_, p52) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u19
        [4] = u4
        [5] = u21
    --]]
    local v53 = p52:GetPivot()
    if v53 ~= nil then
        v53 = v53.Position
    end
    if not v53 then
        return nil
    end
    local v54 = CFrame.new(v53)
    local u55 = u10.Assets.Effects.NinjaSmoke:Clone()
    u55.Parent = u11
    u55:PivotTo(v54)
    task.delay(0.5, function() --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u55
        --]]
        u19:disableEffects(u55:GetDescendants())
    end)
    task.delay(4, function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55:Destroy()
    end)
    u4:playSound(u21[math.random(0, #u21 - 1) + 1], {
        ["position"] = v53
    })
end
function u22.setUpAnimation(p56, u57, p58) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u14
        [3] = u13
    --]]
    local u59 = p58:WaitForChild("Humanoid")
    if not u59 then
        return nil
    end
    local u60 = nil
    p56.animationMaid:GiveTask(function() --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        local v61 = u60
        if v61 ~= nil then
            v61:Stop()
        end
        local v62 = u60
        if v62 ~= nil then
            v62:Destroy()
        end
    end)
    p56.animationMaid:GiveTask(u59:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u60
            [3] = u3
            [4] = u57
            [5] = u14
            [6] = u13
        --]]
        if u59.WalkSpeed > 14 then
            local v63 = u60
            if v63 ~= nil then
                v63:Stop()
            end
            local v64 = u60
            if v64 ~= nil then
                v64:Destroy()
            end
            u60 = u3:playAnimation(u57, u14:getAssetId(u13.NINJA_RUN), {
                ["looped"] = true
            })
            local v65 = u60
            if v65 ~= nil then
                v65:AdjustSpeed(1)
            end
        end
    end))
    p56.animationMaid:GiveTask(u59.StateChanged:Connect(function(_, _) --[[ Line: 223 ]] end))
end
function u22.cleanUpAnimation(p66) --[[ Line: 225 ]]
    p66.animationMaid:DoCleaning()
end
u6.CreateController(u22.new())
return nil