local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "ghost-orb-balance").GhostOrbBalance
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "GhostOrbController"
    end,
    ["__index"] = u9
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p20)
    p20.Name = "GhostOrbController"
end
function u17.KnitStart(u21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u10
        [4] = u7
        [5] = u8
        [6] = u16
        [7] = u2
        [8] = u15
        [9] = u13
        [10] = u11
        [11] = u1
        [12] = u12
    --]]
    u9.KnitStart(u21)
    u14.Client:OnEvent("GhostOrbStartGravity", function(p22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:startGravity(p22.player, p22.primaryPart)
    end)
    u10.On(function(p23, _, p24, _, _, _, _, _) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u16
            [4] = u2
            [5] = u15
            [6] = u13
            [7] = u11
            [8] = u1
            [9] = u12
            [10] = u21
        --]]
        if p24.Name ~= "ghost_orb" then
            return nil
        end
        local v25 = u7.Assets.Effects.GhostOrbEffect:Clone()
        v25.CFrame = CFrame.new(p23)
        v25.Parent = u8
        u16:playEffects({ v25 }, nil, {
            ["destroyAfterSec"] = 2.5
        })
        u2:playSound(u15.GLITCHED_LUCKY_BLOCK_TELEPORT, {
            ["position"] = p23
        })
        for _, v26 in u13:getEntitiesNearPosition(p23, u11.GHOST_ORB_SPLASH_RADIUS) do
            local v27 = u13:getEntity(v26)
            if not u1.instanceof(v27, u12) then
                return nil
            end
            local v28 = v27:getPlayer()
            local v29 = v28.Character
            if v29 ~= nil then
                v29 = v29.PrimaryPart
            end
            if not v29 then
                return nil
            end
            local u30 = u13:getEntity(v28)
            if not u30 then
                return nil
            end
            u21:changeTransparency(u30, u11.GHOST_ORB_TARGET_TRANSPARENCY)
            task.delay(u11.GHOST_ORB_DURATION, function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u30
                --]]
                u21:changeTransparency(u30, 0)
            end)
        end
    end)
end
function u17.startGravity(_, p31, u32) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u11
        [4] = u8
        [5] = u2
        [6] = u15
    --]]
    local u33 = u4.new()
    local u34 = true
    local v35 = p31.Character
    if v35 ~= nil then
        v35 = v35:FindFirstChild("Humanoid")
    end
    local v36 = u5
    local v37 = {
        ["Parent"] = u32
    }
    local v38 = u11.GRAVITY_MULTIPLIER * u8.Gravity * u32.AssemblyMass
    v37.Force = Vector3.new(0, v38, 0)
    local u39 = v36("BodyForce", v37)
    local v40 = u11.GRAVITY_UPWARD_VELOCITY
    u32.AssemblyLinearVelocity = Vector3.new(0, v40, 0)
    local u41 = u2:playModifiableSound(u15.GHOST_ORB_ACTIVE_LOOPED, {})
    task.delay(u11.GHOST_ORB_TIME_TO_BOBBING, function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u11
            [3] = u32
        --]]
        while u34 do
            local v42 = u11.GRAVITY_BOBBLE_AMPLITUDE
            local v43 = u11.GRAVITY_BOBBLE_FREQUENCY * tick()
            local v44 = v42 * math.sin(v43)
            local v45 = -u11.GRAVITY_BOBBLE_AMPLITUDE
            local v46 = u11.GRAVITY_BOBBLE_AMPLITUDE
            local v47 = math.clamp(v44, v45, v46)
            u32.AssemblyLinearVelocity = Vector3.new(0, v47, 0)
            task.wait(0.1)
        end
    end)
    u33:GiveTask(function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u39
            [3] = u41
            [4] = u32
        --]]
        u34 = false
        u39:Destroy()
        if u41 then
            u41:Pause()
        end
        u32.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end)
    task.delay(u11.GHOST_ORB_DURATION, function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:DoCleaning()
    end)
end
function u17.changeTransparency(_, u48, u49) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v50 = u48:getInstance():GetAttribute("Transparency")
    local u51 = v50 == nil and 0 or v50
    local u52 = tick()
    local function u56() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u11
            [3] = u51
            [4] = u49
            [5] = u48
            [6] = u56
        --]]
        local v53 = (tick() - u52) / u11.GHOST_ORB_TRANSPARENCY_TIME
        local v54 = math.clamp(v53, 0, 1)
        local v55 = u51 + (u49 - u51) * v54
        u48:getInstance():SetAttribute("Transparency", v55)
        if v54 < 1 then
            task.wait(0.03)
            u56()
        end
    end
    u56()
end
v3.CreateController(u17.new())
return nil