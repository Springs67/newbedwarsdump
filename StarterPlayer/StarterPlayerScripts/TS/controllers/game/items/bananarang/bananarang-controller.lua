local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "BananarangController"
    end,
    ["__index"] = u6
})
u14.__index = u14
function u14.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p17)
    p17.Name = "BananarangController"
    p17.tier = 0
    p17.launchCount = 0
    p17.lastLaunchTime = 0
end
function u14.KnitStart(u18) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u12
        [4] = u13
        [5] = u4
        [6] = u5
        [7] = u3
        [8] = u2
        [9] = u11
        [10] = u9
        [11] = u8
    --]]
    u6.KnitStart(u18)
    u10.Client:Get("ItemUpgraded"):Connect(function(p19) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
        --]]
        if p19.item ~= u12.BANANARANG then
            return nil
        end
        u18.tier = p19.itemTier
    end)
    u10.Client:Get("EntityDeathEvent"):Connect(function(p20) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
            [3] = u18
        --]]
        if u13:getPlayerFromEntityInstance(p20.entityInstance) == u4.LocalPlayer then
            u18.tier = 0
        end
    end)
    u5.ProjectileLaunched:setPriority(u3.HIGH):connect(function(p21) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u18
            [3] = u2
            [4] = u11
            [5] = u9
            [6] = u8
        --]]
        if p21:isCancelled() then
            return nil
        end
        if not p21.shooter then
            return nil
        end
        if p21.projectileType ~= "bananarang" then
            return nil
        end
        local v22 = u4:GetPlayerFromCharacter(p21.shooter)
        local v23
        if v22 == nil then
            v23 = v22
        else
            v23 = v22.Character
        end
        if not v23 then
            return nil
        end
        if v22 == u4.LocalPlayer then
            local v24 = p21.launchData
            if v24 ~= nil then
                v24 = v24.shotId
            end
            if v24 == "" or not v24 then
                p21.projectile:Destroy()
                p21:setCancelled(true)
                return nil
            end
            local v25 = u18.tier >= 2 and 2 or 1
            if u18.lastLaunchTime + 8 < os.time() then
                u18.launchCount = 0
            end
            if u18.launchCount >= v25 then
                p21.projectile:Destroy()
                p21:setCancelled(true)
                return nil
            end
            local v26 = u18
            v26.launchCount = v26.launchCount + 1
            u18.lastLaunchTime = os.time()
        end
        local v27 = u2:createSound(u11.BANANARANG_FLYING_LOOP)
        if v27 then
            v27.Parent = p21.projectile:FindFirstChildWhichIsA("BasePart")
            v27.Looped = true
            v27.Volume = 2
            v27:Play()
        end
        if v22 == u4.LocalPlayer then
            local v28 = u2
            local v29 = u11.BANANARANG_THROW
            local v30 = {}
            local v31 = v22.Character.PrimaryPart
            if v31 ~= nil then
                v31 = v31.Position
            end
            v30.position = v31
            v30.volumeMultiplier = 0.5
            v28:playSound(v29, v30)
            u9:playAnimation(u4.LocalPlayer, u8.BOOMERANG_THROW)
        end
    end)
    u10.Client:Get("ProjectileReturned"):Connect(function(p32, p33, p34) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u18
        --]]
        if p34 == u4.LocalPlayer and (p33 == "bananarang" and p32 ~= nil) then
            local v35 = u18
            v35.launchCount = v35.launchCount - 1
        end
    end)
end
v7.CreateController(u14.new())
return nil