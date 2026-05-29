local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "JuggDashAbilityController"
    end,
    ["__index"] = u15
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
        [2] = u9
    --]]
    u15.constructor(p25)
    p25.Name = "JuggDashAbilityController"
    p25.maid = u9.new()
end
function u22.KnitStart(u26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u11
        [3] = u14
        [4] = u16
        [5] = u5
        [6] = u21
    --]]
    u20.Client:Get("NewJuggernaut"):Connect(function(p27) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u26
        --]]
        if p27.player == u11.LocalPlayer then
            u26:mountAbility()
        else
            local v28 = u11.LocalPlayer:GetAttribute("Juggernaut")
            if v28 == 0 or (v28 ~= v28 or (v28 == "" or not v28)) then
                u26:unmountAbility()
            end
        end
    end)
    u20.Client:Get("EntityDeathEvent"):Connect(function(p29) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u26
        --]]
        if u11:GetPlayerFromCharacter(p29.entityInstance) == u11.LocalPlayer then
            u26:unmountAbility()
        end
    end)
    u14.AbilityUsed:connect(function(p30) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u11
            [3] = u20
            [4] = u26
            [5] = u5
            [6] = u21
        --]]
        if p30.ability == u16.JUGGERNAUT_DASH and (p30.userCharacter == u11.LocalPlayer.Character and u20.Client:Get("JuggernautDash"):CallServer()) then
            u26:jump()
            u5:playSound(u21.JUGGERNAUT_LEAP, {
                ["rollOffMaxDistance"] = 45,
                ["volumeMultiplier"] = 1.2,
                ["position"] = p30.userCharacter:GetPrimaryPartCFrame().Position
            })
        end
    end)
    u20.Client:Get("JuggernautLeapEvent"):Connect(function(p31) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:playAnimation(p31.player)
    end)
    u20.Client:Get("JuggernautLandedEvent"):Connect(function(p32) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u5
            [3] = u21
        --]]
        u26:playParticleEffect(p32.player)
        local v33 = u5
        local v34 = u21.STOMPER_HIT
        local v35 = {}
        local v36 = p32.player.Character
        if v36 ~= nil then
            v36 = v36:GetPrimaryPartCFrame().Position
        end
        v35.position = v36
        v35.rollOffMaxDistance = 45
        v35.volumeMultiplier = 0.7
        v33:playSound(v34, v35)
    end)
end
function u22.mountAbility(p37) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u19
    --]]
    local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v39 = u16.JUGGERNAUT_DASH
    local v40 = {
        ["abilityType"] = "MiscPrimary",
        ["abilityButton"] = {
            ["icon"] = u19.JUGG_BARB_LEAP
        }
    }
    local u41 = v38:enableAbility(v39, v40):expect()
    p37.maid:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41.Destroy()
    end)
end
function u22.unmountAbility(p42) --[[ Line: 102 ]]
    p42.maid:DoCleaning()
end
function u22.jump(_) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    local v43 = u11.LocalPlayer.Character
    if v43 ~= nil then
        v43 = v43.PrimaryPart
    end
    local v44 = v43.AssemblyLinearVelocity
    local v45 = u11.LocalPlayer.Character
    if v45 ~= nil then
        v45 = v45:FindFirstChild("Humanoid")
    end
    local v46 = v43.AssemblyMass
    local v47 = v44.Y * v46 * 0.5
    local v48 = u13.CurrentCamera
    if v48 ~= nil then
        v48 = (v48.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
    end
    local v49 = u11.LocalPlayer.Character
    if v49 ~= nil then
        v49 = v49:GetPrimaryPartCFrame()
    end
    if v49 ~= nil then
        v49 = v49.Position
    end
    if v49 and v48 then
        local v50 = u11.LocalPlayer.Character
        if v50 ~= nil then
            v50:PivotTo(CFrame.lookAt(v49, v49 + v48))
        end
    end
    local v51 = u11.LocalPlayer.Character
    if v51 ~= nil then
        v51 = v51:GetPrimaryPartCFrame().LookVector * 100
    end
    local v52
    if v45 == nil then
        v52 = v45
    else
        v52 = v45:GetState()
    end
    local v53 = v52 == Enum.HumanoidStateType.Landed and 0 or v47
    if v43 ~= nil then
        local v54 = v51.X * v46 * 0.75
        local v55 = v46 * 30 - v53
        local v56 = v51.Z * v46 * 0.75
        v43:ApplyImpulse((Vector3.new(v54, v55, v56)))
    end
    if v45 ~= nil then
        v45:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end
function u22.playAnimation(_, p57) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u18
        [3] = u17
        [4] = u11
        [5] = u8
    --]]
    u4:playAnimation(p57, u18:getAssetId(u17.JUGGERNAUT_LEAP_ATTACK))
    if p57 == u11.LocalPlayer then
        u8.Controllers.ViewmodelController:playAnimation(u17.JUGGERNAUT_LEAP_FP)
    end
end
function u22.playParticleEffect(p58, p59) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u11
    --]]
    local v60 = p59.Character
    if v60 ~= nil then
        v60 = v60.PrimaryPart
        if v60 ~= nil then
            v60 = v60.Position
        end
    end
    if not v60 then
        return nil
    end
    local u61 = u12.Assets.Effects.JuggernautStabGround:Clone()
    local u62 = u12.Assets.Effects.GroudCrack:Clone()
    u61.Position = v60
    u61.Parent = u13
    u62.Position = v60
    u62.Parent = u13
    local v63 = u11.LocalPlayer.Character
    if v63 ~= nil then
        v63 = v63.PrimaryPart
        if v63 ~= nil then
            v63 = v63.Position
        end
    end
    if v63 then
        v63 = (v63 - v60).Magnitude <= 20
    end
    if v63 then
        p58:shakeScreen(v60)
    end
    for v64, v65 in u61:GetDescendants() do
        local _ = v64 - 1
        if v65:IsA("ParticleEmitter") then
            v65:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u61
            [2] = u62
        --]]
        u61:Destroy()
        u62:Destroy()
    end)
end
function u22.shakeScreen(_, p66) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
    local v67 = u11.LocalPlayer.Character
    if v67 ~= nil then
        v67 = v67:GetPrimaryPartCFrame()
    end
    if not v67 then
        return nil
    end
    u7.Controllers.ScreenShakeController:shake(p66, v67.LookVector, {
        ["magnitude"] = 5,
        ["cycles"] = 5,
        ["duration"] = 0.4
    })
end
u7.CreateController(u22.new())
return nil