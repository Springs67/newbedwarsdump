local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.StarterPlayer
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "AgniController"
    end,
    ["__index"] = u20
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u16
        [3] = u6
    --]]
    u20.constructor(p24, u16.AGNI)
    p24.Name = "AgniController"
    p24.maid = u6.new()
end
function u21.onKitLocalActivated(_, p25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u4
        [4] = u16
        [5] = u13
        [6] = u12
    --]]
    p25:GiveTask(u11.CanUseLocalAbility:connect(function(p26) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u16
            [4] = u13
            [5] = u12
        --]]
        if p26.userCharacter ~= u9.LocalPlayer.Character then
            return nil
        end
        if not u4.Controllers.KitController:isUsingKit(u9.LocalPlayer, u16.AGNI) then
            return nil
        end
        local v27 = u13:getEntity(u9.LocalPlayer)
        if not v27 then
            return nil
        end
        if p26.ability == u12.ROCKET_DETONATE then
            if v27 ~= nil then
                v27 = v27:isAlive()
            end
            if not v27 then
                p26:setCancelled(true)
                return nil
            end
            local v28 = u9.LocalPlayer.Character
            if v28 ~= nil then
                v28 = v28:FindFirstChildWhichIsA("Humanoid")
            end
            if not v28 then
                p26:setCancelled(true)
                return nil
            end
            if u9.LocalPlayer.Character:HasTag("zipline-attached") then
                p26:setCancelled(true)
                return nil
            end
        end
    end))
end
function u21.onKitLocalDeactivated(_) --[[ Line: 78 ]] end
function u21.onKitReplicationActivated(u29, u30) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u8
        [3] = u17
        [4] = u5
        [5] = u10
        [6] = u13
        [7] = u14
        [8] = u15
        [9] = u19
        [10] = u2
        [11] = u9
    --]]
    u18.Client:OnEvent("RocketDetonateEvent", function(p31) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u8
            [3] = u17
            [4] = u5
            [5] = u10
            [6] = u13
            [7] = u14
            [8] = u15
            [9] = u19
            [10] = u2
            [11] = u9
        --]]
        if p31.player then
            u29:detonateRocketAbility()
            local v32 = p31.player.Character
            if not v32 then
                return nil
            end
            local u33 = v32.PrimaryPart
            if not u33 then
                return nil
            end
            local v34 = v32:FindFirstChild("Humanoid")
            v34.JumpHeight = 3
            v34:ChangeState(Enum.HumanoidStateType.Jumping)
            local v35 = v32:FindFirstChild("UpperTorso")
            if v35 ~= nil then
                v35 = v35:FindFirstChild("BodyBackAttachment")
            end
            local v36 = 0
            local u37 = {}
            for v38, v39 in v35:GetChildren() do
                local _ = v38 - 1
                if v39:IsA("ParticleEmitter") == true then
                    v36 = v36 + 1
                    u37[v36] = v39
                end
            end
            for v40, v41 in u37 do
                local _ = v40 - 1
                u8:AddTag(v41, "FirstPersonHidden")
            end
            local u42 = nil
            u42 = v34.Jumping:Connect(function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u17
                    [3] = u42
                    [4] = u5
                    [5] = u10
                --]]
                u33:ApplyImpulse(u17.ROCKET_UPDRAFT_IMPULSE * u33.AssemblyMass)
                u42:Disconnect()
                u5.Controllers.JumpHeightController:setJumpHeight(u10.CharacterJumpHeight)
            end)
            u29.maid:GiveTask(u42)
            u29.maid:GiveTask(function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u10
                --]]
                u5.Controllers.JumpHeightController:setJumpHeight(u10.CharacterJumpHeight)
            end)
            local v43 = u13:getEntity(p31.player)
            local v44
            if u5.Controllers.KitSkinController:getKitSkin(p31.player) == u14.SPIRIT_AGNI then
                v44 = u15[u14.SPIRIT_AGNI].agni.satchelSound
            else
                v44 = u19.PYRO_ROCKET
            end
            local v45 = u2
            local v46 = {}
            if p31.player == u9.LocalPlayer then
                v43 = nil
            elseif v43 ~= nil then
                v43 = v43:getInstance():GetPrimaryPartCFrame().Position
            end
            v46.position = v43
            v46.rollOffMaxDistance = 100
            local u47 = v45:playSound(v44, v46)
            task.delay(1.5, function() --[[ Line: 154 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u8
                    [3] = u37
                --]]
                u47:Destroy()
                for v48, v49 in u37 do
                    local _ = v48 - 1
                    u8:RemoveTag(v49, "FirstPersonHidden")
                end
            end)
        end
    end):andThen(function(p50) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:GiveTask(p50)
    end)
end
function u21.onKitReplicationDeactivated(_) --[[ Line: 170 ]] end
function u21.onInnateAbilityEnabled(_, _, _) --[[ Line: 172 ]] end
function u21.onAbilityUsed(_, _, _) --[[ Line: 174 ]] end
function u21.KnitStart(p51) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p51)
end
function u21.detonateRocketAbility(p52) --[[ Line: 179 ]]
    local v53 = p52.activateRocketAbilityMaid
    if v53 ~= nil then
        v53:DoCleaning()
    end
end
u4.CreateController(u21.new())
return nil