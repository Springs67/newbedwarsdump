local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "fork-trident", "fork-trident-balance").ForkTridentBalance
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "ForkTridentController"
    end,
    ["__index"] = u10
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
        [1] = u10
        [2] = u6
    --]]
    u10.constructor(p20)
    p20.Name = "ForkTridentController"
    p20.swordEventMaid = u6.new()
end
function u17.KnitStart(p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u13
        [4] = u16
        [5] = u11
        [6] = u15
        [7] = u7
        [8] = u2
    --]]
    u10.KnitStart(p21)
    u5.Controllers.PreloadController:preloadForItemType(u13.FORK_TRIDENT, {
        ["sounds"] = { u16.FORK_TRIDENT_THROW, u16.FORK_TRIDENT_STAB, u16.FORK_TRIDENT_RETURN },
        ["animations"] = {
            u11.FP_DAGGER_CHARGE,
            u11.SPEAR_STARTUP,
            u11.FORK_TRIDENT_IDLE,
            u11.FP_DAGGER_SLASH,
            u11.SPEAR_THROW
        }
    })
    u15.Client:Get("ProjectileReturned"):Connect(function(_, p22, p23) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u16
        --]]
        if p22 ~= "fork_trident_projectile" then
            return nil
        end
        local v24 = p23 == u7.LocalPlayer
        local v25
        if v24 then
            v25 = nil
        else
            v25 = p23.Character
            if v25 ~= nil then
                v25 = v25:GetPivot().Position
            end
        end
        if not (v24 or v25) then
            return nil
        end
        u2:playSound(u16.FORK_TRIDENT_RETURN, {
            ["position"] = v25
        })
    end)
end
function u17.isRelevantItem(_, p26) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return p26.itemType == u13.FORK_TRIDENT
end
function u17.onEnable(u27, _) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u14
    --]]
    local v31 = u8.SwordChargedSwing:connect(function(p28) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u27
        --]]
        local v29 = p28.weapon.Name ~= u13.FORK_TRIDENT
        if not v29 then
            local v30 = p28.chargedAttack
            if v30 ~= nil then
                v30 = v30.chargeTime
            end
            if v30 == 0 then
                v30 = false
            elseif v30 ~= v30 then
                v30 = false
            end
            v29 = not v30 or p28.chargedAttack.chargeTime < u14.MIN_CHARGE_TIME
        end
        if v29 then
            return nil
        end
        u27:throwTrident(p28.weapon)
    end)
    u27.swordEventMaid:GiveTask(v31)
end
function u17.onDisable(p32) --[[ Line: 92 ]]
    p32.swordEventMaid:DoCleaning()
end
function u17.throwTrident(_, p33) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u5
        [4] = u9
    --]]
    local v34 = u12(u13.FORK_TRIDENT)
    if not v34 then
        return nil
    end
    local v35 = u5.Controllers.DefaultProjectileSourceController:getProjectileHandler()
    local v36
    if v35 == nil then
        v36 = v35
    else
        v36 = v35.inputInfo
    end
    local v37
    if v35 == nil then
        v37 = v35
    else
        v37 = v35.targetPoint
    end
    if v35 ~= nil then
        v35 = v35.lockedAimPoint
    end
    local v38 = u9.new(1, 1, "fork_trident_projectile", v36, v37, nil, 0, v35)
    u5.Controllers.ProjectileController:launchProjectile(u13.FORK_TRIDENT, u13.FORK_TRIDENT, v38, p33, v34.projectileSource, nil, "fork_trident_projectile")
end
v4.CreateController(u17.new())
return nil