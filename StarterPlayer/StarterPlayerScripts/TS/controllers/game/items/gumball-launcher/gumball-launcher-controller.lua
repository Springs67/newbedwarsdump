local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.UserInputService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GumballLauncherController"
    end
})
u15.__index = u15
function u15.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    p18.jumpStuckSounds = { u13.GUMBALL_LAUNCHER_JUMP_STUCK_1, u13.GUMBALL_LAUNCHER_JUMP_STUCK_2, u13.GUMBALL_LAUNCHER_JUMP_STUCK_3 }
    p18.rng = Random.new()
    p18.denyJumpMaid = u6.new()
end
function u15.onStart(u19) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u13
        [4] = u11
        [5] = u10
        [6] = u9
        [7] = u3
    --]]
    local v20 = u4.Controllers.PreloadController
    local v21 = u12.GUMBALL_LAUNCHER
    local v22 = {}
    local v23 = {}
    local v24 = #v23
    local v25 = u19.jumpStuckSounds
    local v26 = #v25
    table.move(v25, 1, v26, v24 + 1, v23)
    local v27 = v24 + v26
    v23[v27 + 1] = u13.GUMBALL_LAUNCHER_SPLATTER_1
    v23[v27 + 2] = u13.GUMBALL_LAUNCHER_SPLATTER_2
    v23[v27 + 3] = u13.GUMBALL_LAUNCHER_SPLATTER_3
    v23[v27 + 4] = u13.GUMBALL_LAUNCHER_SHOT_1
    v23[v27 + 5] = u13.GUMBALL_LAUNCHER_SHOT_2
    v23[v27 + 6] = u13.GUMBALL_LAUNCHER_SHOT_3
    v23[v27 + 7] = u13.GUM_FOOTSTEP_1
    v23[v27 + 8] = u13.GUM_FOOTSTEP_2
    v23[v27 + 9] = u13.GUM_FOOTSTEP_3
    v23[v27 + 10] = u13.GUM_FOOTSTEP_4
    v22.sounds = v23
    v22.animations = { u11.ROCKET_LAUNCHER_IDLE }
    v20:preloadForItemType(v21, v22)
    u10.StatusEffectAdded:connect(function(p28) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u9
            [3] = u3
        --]]
        if u19:isInvalidStatusEffectEvent(p28.entityInstance, p28.statusEffect) then
            return nil
        end
        u19.denyJumpMaid:GiveTask(u9.JumpRequest:Connect(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u3
            --]]
            local v29 = u19.rng:NextNumber() * #u19.jumpStuckSounds
            local v30 = math.floor(v29)
            u3:playSound(u19.jumpStuckSounds[v30 + 1])
        end))
    end)
    u10.StatusEffectRemoved:connect(function(p31) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if u19:isInvalidStatusEffectEvent(p31.entityInstance, p31.statusEffect) then
            return nil
        end
        u19.denyJumpMaid:DoCleaning()
    end)
end
function u15.isInvalidStatusEffectEvent(_, p32, p33) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
    --]]
    return p32 ~= u8.LocalPlayer.Character and true or p33 ~= u14.STICKY_BOOTS
end
v2.defineMetadata(u15, "identifier", "client/controllers/game/items/gumball-launcher/gumball-launcher-controller@GumballLauncherController")
v2.defineMetadata(u15, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u15, "$:flamework@Controller", v5, {
    {}
})
return {
    ["default"] = u15
}