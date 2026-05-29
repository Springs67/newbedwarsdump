local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "FishingRodController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p16)
    p16.Name = "FishingRodController"
    p16.animationMaid = u5.new()
    p16.activeFishing = false
end
function u13.KnitStart(p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u12
    --]]
    u8.KnitStart(p17)
    u7.ProjectileDestroy:connect(function(p18) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        if p18.projectileType ~= "fisherman_bobber" then
            return nil
        end
        if p18.projectile:GetAttribute("ProjectileShooter") ~= u6.LocalPlayer.UserId then
            return nil
        end
        u12.Client:Get("PullFishingRod"):SendToServer({
            ["success"] = false
        })
    end)
end
function u13.onEnable(u19, p20, u21) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u12
        [5] = u10
        [6] = u9
        [7] = u4
    --]]
    u8.onEnable(u19, p20, u21)
    u19.maid:GiveTask(u7.ProjectileLaunched:connect(function(p22) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u19
        --]]
        if p22.projectileType ~= "fisherman_bobber" then
            return nil
        end
        if p22.projectile:GetAttribute("ProjectileShooter") ~= u6.LocalPlayer.UserId then
            return nil
        end
        u19.activeFishing = true
    end))
    u19.maid:GiveTask(u7.ProjectileDestroy:connect(function(p23) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u19
        --]]
        if p23.projectileType ~= "fisherman_bobber" then
            return nil
        end
        if p23.projectile:GetAttribute("ProjectileShooter") ~= u6.LocalPlayer.UserId then
            return nil
        end
        u19.animationMaid:DoCleaning()
        u19.activeFishing = false
    end))
    u19.maid:GiveTask(function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
        --]]
        u19.activeFishing = false
        task.spawn(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12.Client:Get("PullFishingRod"):SendToServer({
                ["success"] = false
            })
        end)
    end)
    u19.animationMaid:DoCleaning()
    u19.maid:GiveTask(u19.animationMaid)
    task.spawn(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
            [3] = u21
            [4] = u10
            [5] = u6
            [6] = u9
            [7] = u4
        --]]
        u19.maid:GiveTask(u12.Client:WaitFor("FishFound"):expect():Connect(function(p24) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u19
                [3] = u10
                [4] = u6
                [5] = u9
                [6] = u4
                [7] = u12
            --]]
            if not u21() then
                return nil
            end
            local v25 = u19.idleAnimation
            if v25 ~= nil then
                v25:Stop()
            end
            u19.idleAnimation = u10:playAnimation(u6.LocalPlayer, u9.FISHING_ROD_PULLING, {
                ["looped"] = true
            })
            if u19.idleAnimation then
                u19.animationMaid:GiveTask(function() --[[ Line: 94 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    local v26 = u19.idleAnimation
                    if v26 ~= nil then
                        v26 = v26:Stop()
                    end
                    return v26
                end)
            end
            u4.Controllers.FishingMinigameController:startMinigame(p24.dropData, function(p27) --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u6
                    [3] = u9
                    [4] = u12
                    [5] = u19
                --]]
                local v28
                if p27.win then
                    v28 = u10:playAnimation(u6.LocalPlayer, u9.FISHING_ROD_CATCH_SUCCESS, {
                        ["looped"] = false
                    })
                    u12.Client:Get("PullFishingRod"):SendToServer({
                        ["success"] = true
                    })
                else
                    v28 = u10:playAnimation(u6.LocalPlayer, u9.FISHING_ROD_CATCH_FAIL, {
                        ["looped"] = false
                    })
                    u12.Client:Get("PullFishingRod"):SendToServer({
                        ["success"] = false
                    })
                end
                if v28 then
                    u19.animationMaid:GiveTask(v28)
                end
                local v29 = u19.idleAnimation
                if v29 ~= nil then
                    v29:Stop()
                end
            end)
        end))
    end)
end
function u13.canLaunch(p30) --[[ Line: 131 ]]
    return not p30.activeFishing
end
function u13.onStartCharging(_) --[[ Line: 134 ]] end
function u13.onStopCharging(_) --[[ Line: 136 ]] end
function u13.onLaunch(u31, p32) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u9
    --]]
    u31.animationMaid:DoCleaning()
    u31.idleAnimation = u10:playAnimation(u6.LocalPlayer, u9.FISHING_ROD_IDLE, {
        ["looped"] = true
    })
    if u31.idleAnimation then
        u31.animationMaid:GiveTask(function() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            local v33 = u31.idleAnimation
            if v33 ~= nil then
                v33 = v33:Stop()
            end
            return v33
        end)
    end
    local u34 = u10:playAnimation(u6.LocalPlayer, u9.FISHING_ROD_CAST, {
        ["looped"] = false
    })
    if u34 then
        u31.animationMaid:GiveTask(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            return u34:Stop()
        end)
    end
    if u34 ~= nil then
        u34:GetMarkerReachedSignal("cast"):Wait()
    end
    return p32() and true or false
end
function u13.onStartReload(_, _) --[[ Line: 169 ]] end
function u13.isRelevantItem(_, p35) --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p35.itemType == u11.FISHING_ROD
end
v3.CreateController(u13.new())
return nil