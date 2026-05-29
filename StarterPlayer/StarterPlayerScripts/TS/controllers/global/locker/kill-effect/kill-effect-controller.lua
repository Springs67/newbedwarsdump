local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ContentProvider
local u6 = v4.Players
local u7 = v4.Workspace
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = u1.import(script, script.Parent, "effects", "default-kill-effect")
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "KillEffectController"
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
        [2] = u7
    --]]
    u9.constructor(p20)
    p20.Name = "KillEffectController"
    p20.killEffects = {}
    p20.camera = u7.CurrentCamera
end
function u17.KnitStart(u21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u14
        [3] = u16
        [4] = u15
        [5] = u2
        [6] = u13
        [7] = u6
        [8] = u8
        [9] = u12
        [10] = u1
        [11] = u5
        [12] = u11
        [13] = u10
    --]]
    for _, v22 in u3.values(u14) do
        local v23 = script.Parent
        if v23 ~= nil then
            v23 = v23:FindFirstChild("effects")
            if v23 ~= nil then
                v23 = v23:FindFirstChild(string.gsub(v22, "_", "-") .. "-kill-effect")
            end
        end
        if v23 then
            local v24 = require(v23)
            u21.killEffects[v22] = v24
        else
            local _ = v22 == u14.NONE
            u21.killEffects[v22] = u16
        end
    end
    u15.Client:OnEvent("EntityDeathEvent", function(u25) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
            [3] = u6
            [4] = u8
            [5] = u12
            [6] = u21
            [7] = u16
            [8] = u1
        --]]
        local v26 = u2.Controllers.MatchController:getQueueType()
        if v26 and u13(v26).disableKillEffects then
            return nil
        end
        local v27 = u6:GetPlayerFromCharacter(u25.fromEntity)
        local u28 = u6:GetPlayerFromCharacter(u25.entityInstance)
        if u8.KillEffect:fire(u25.entityInstance, u25.fromEntity):isCancelled() then
            return nil
        end
        if u25.damageType == u12.VOID then
            return nil
        end
        if u28 and u28.Character then
            if u25.finalKill and v27 then
                local v29 = v27:GetAttribute("KillEffectType")
                if v29 and v27 ~= u28 then
                    local v30 = u21.killEffects[v29].new(v27)
                    v30:onKill(u28, u28.Character, u25.cframe)
                    if v30:isPlayDefaultKillEffect() then
                        local u31 = u16.new(v27)
                        u1.try(function() --[[ Line: 84 ]]
                            --[[
                            Upvalues:
                                [1] = u31
                                [2] = u28
                                [3] = u25
                            --]]
                            u31:onKill(u28, u28.Character, u25.cframe)
                        end, function(p32) --[[ Line: 86 ]]
                            warn(p32)
                        end)
                    end
                    return nil
                end
            end
            local u33 = u16.new(v27 or u28)
            u1.try(function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u28
                    [3] = u25
                --]]
                u33:onKill(u28, u28.Character, u25.cframe)
            end, function(p34) --[[ Line: 98 ]]
                warn(p34)
            end)
        end
    end)
    u5:PreloadAsync({ u11:getAnimation(u10.MIRROR_KILL_EFFECT) })
end
function u17.getKillEffects(p35) --[[ Line: 105 ]]
    return p35.killEffects
end
u2.CreateController(u17.new())
return nil