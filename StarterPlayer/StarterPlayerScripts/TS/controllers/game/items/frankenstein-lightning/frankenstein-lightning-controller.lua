local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = v1.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "frankenstein-curse-client-status-effect-handler").FrankensteinCurseClientStatusEffectHandler
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "FrankensteinLightningController"
    end
})
u20.__index = u20
function u20.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    p23.lightning_strike_sounds = { u16.FRANKEN_LIGHTNING_STRIKE_1, u16.FRANKEN_LIGHTNING_STRIKE_2, u16.FRANKEN_LIGHTNING_STRIKE_3 }
    p23.lightning_hit_player_sounds = { u16.FRANKEN_LIGHTNING_HIT_PLAYER_1, u16.FRANKEN_LIGHTNING_HIT_PLAYER_2, u16.FRANKEN_LIGHTNING_HIT_PLAYER_3 }
end
function u20.onStart(u24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u16
        [4] = u13
        [5] = u15
        [6] = u5
        [7] = u4
        [8] = u17
        [9] = u19
    --]]
    local v25, v26 = u6.Controllers.MatchController:getQueueTypeAsync():await()
    if v25 and u14(v26).luckyBlock ~= nil then
        local v27 = u6.Controllers.PreloadController
        local v28 = {}
        local v29 = { u16.FRANKEN_LIGHTNING_CHARGE }
        local v30 = #v29
        local v31 = u24.lightning_strike_sounds
        local v32 = #v31
        table.move(v31, 1, v32, v30 + 1, v29)
        local v33 = v30 + v32
        local v34 = u24.lightning_hit_player_sounds
        table.move(v34, 1, #v34, v33 + 1, v29)
        v28.sounds = v29
        v28.loadOnGameTypes = { u13.BEDWARS }
        v27:runPreload(v28)
    end
    u15.Client:Get("LightningDischarge"):Connect(function(u35) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u5
            [3] = u4
        --]]
        local u36 = u35.sourcePlayer and true or false
        for v37, v38 in u35.struckInstances do
            local _ = v37 - 1
            u24:shockCharacter(v38)
        end
        local v39 = u35.struckInstances
        local function v51(p40) --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u35
                [3] = u5
                [4] = u4
                [5] = u24
            --]]
            local v41 = u36
            if v41 then
                v41 = u35.sourcePlayer
                if v41 ~= nil then
                    v41 = v41.Character
                end
            end
            if v41 then
                local v42 = u5
                local v43 = u4.fromList
                local v44 = u24.lightning_hit_player_sounds
                v42:playSound(v43(unpack(v44)), {
                    ["rollOffMinDistance"] = 10,
                    ["rollOffMaxDistance"] = 80,
                    ["volumeMultiplier"] = 0.4,
                    ["position"] = u24:getSoundPosition(p40)
                })
                u24:charactersConnectedShock(u35.sourcePlayer.Character, p40)
            else
                local v45 = u5
                local v46 = u4.fromList
                local v47 = u24.lightning_strike_sounds
                local v48 = v46(unpack(v47))
                local v49 = {}
                local v50 = u35.sourceBlock
                if v50 ~= nil then
                    v50 = v50.Position
                end
                v49.position = v50
                v49.rollOffMinDistance = 10
                v49.rollOffMaxDistance = 80
                v49.volumeMultiplier = 0.4
                v45:playSound(v48, v49)
                u24:coilConnectedShock(u35.sourceBlock, p40)
            end
        end
        for v52, v53 in v39 do
            v51(v53, v52 - 1, v39)
        end
    end)
    u15.Client:Get("LightningChargeUp"):Connect(function(p54) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u16
            [3] = u24
        --]]
        if not p54.source then
            return nil
        end
        local v55 = nil
        for v56, v57 in p54.source.Humanoid:GetAccessories() do
            local _ = v56 - 1
            if v57.Name == "FrankenBolt" == true then
                v55 = v57
                break
            end
        end
        if v55 then
            local u58 = v55:FindFirstChild("Handle")
            if u58 ~= nil then
                u58 = u58:FindFirstChild("Lightning")
            end
            if u58 then
                u58.Enabled = true
                u5:playSound(u16.FRANKEN_LIGHTNING_CHARGE, {
                    ["rollOffMinDistance"] = 10,
                    ["rollOffMaxDistance"] = 80,
                    ["volumeMultiplier"] = 0.4,
                    ["position"] = u24:getSoundPosition(p54.source)
                })
                task.delay(1, function() --[[ Line: 139 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                    --]]
                    u58.Enabled = false
                    return u58.Enabled
                end)
            end
        end
    end)
    u6.Controllers.StatusEffectController:setHandler(u17.FRANKENSTEIN_MONSTER, u19)
end
function u20.charactersConnectedShock(p59, p60, p61) --[[ Line: 148 ]]
    local v62 = p59:getShockAttachment(p60)
    local v63 = p59:getShockAttachment(p61)
    if v62 and v63 then
        p59:spawnConnectedShocks(v62, v63)
    end
end
function u20.coilConnectedShock(p64, p65, p66) --[[ Line: 155 ]]
    local v67 = p64:getLightningCoilAttachment(p65)
    local v68 = p64:getShockAttachment(p66)
    p64:activateCoilParticles(p65)
    if v67 and v68 then
        p64:spawnConnectedShocks(v67, v68)
    end
end
function u20.activateCoilParticles(_, p69) --[[ Line: 163 ]]
    local u70 = p69:GetRootPart():FindFirstChild("pSphere1")
    local u71
    if u70 == nil then
        u71 = u70
    else
        u71 = u70:FindFirstChild("Lightning")
    end
    if u70 ~= nil then
        u70 = u70:FindFirstChild("z")
    end
    local v72
    if u71 == nil then
        v72 = u71
    else
        v72 = u71.Enabled
    end
    if v72 then
        if u70 == nil then
            v72 = u70
        else
            v72 = u70.Enabled
        end
    end
    if u71 and (u70 and not v72) then
        u71.Enabled = true
        u70.Enabled = true
        task.delay(1.2, function() --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u70
            --]]
            u71.Enabled = false
            u70.Enabled = false
        end)
    end
end
function u20.spawnConnectedShocks(_, p73, p74) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    local v75 = u10.Assets.Effects.StaticConnection
    local u76 = v75.Beam1:Clone()
    local u77 = v75.Beam2:Clone()
    local u78 = v75.PointLight:Clone()
    u76.Parent = p73
    u76.Attachment0 = p73
    u76.Attachment1 = p74
    u77.Parent = p73
    u77.Attachment0 = p73
    u77.Attachment1 = p74
    u78.Parent = p73
    task.delay(0.24, function() --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u76
            [3] = u77
            [4] = u78
        --]]
        u11:Create(u76, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        u11:Create(u77, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        task.wait(0.12)
        u76:Destroy()
        u77:Destroy()
        u78:Destroy()
    end)
end
function u20.shockCharacter(_, p79) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u18
    --]]
    local v80 = p79:FindFirstChild("UpperTorso")
    if not v80 then
        return nil
    end
    local u81 = u10.Assets.Effects.StaticHit:Clone()
    u81.Parent = u12
    u81.Anchored = false
    u81.CFrame = v80.CFrame
    u81.Lightning.Anchored = false
    u81.Lightning.CFrame = v80.CFrame
    u18:playEffects(u81:GetChildren(), p79)
    task.delay(0.2, function() --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        u81.Attachment.PointLight.Enabled = false
    end)
    task.delay(5, function() --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        u81:Destroy()
    end)
end
function u20.getShockAttachment(_, p82) --[[ Line: 243 ]]
    local v83 = p82:FindFirstChild("UpperTorso")
    if v83 ~= nil then
        v83 = v83:FindFirstChild("BodyFrontAttachment")
    end
    return v83
end
function u20.getLightningCoilAttachment(_, p84) --[[ Line: 250 ]]
    local v85 = p84:GetRootPart():FindFirstChild("Glow")
    if v85 ~= nil then
        v85 = v85:FindFirstChild("GlowAttachment")
    end
    return v85
end
function u20.getSoundPosition(_, p86) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if u9.LocalPlayer.Character == p86 then
        return nil
    end
    local v87 = p86.PrimaryPart
    if v87 ~= nil then
        v87 = v87.Position
    end
    return v87
end
v2.defineMetadata(u20, "identifier", "client/controllers/game/items/frankenstein-lightning/frankenstein-lightning-controller@FrankensteinLightningController")
v2.defineMetadata(u20, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u20, "$:flamework@Controller", v7, {
    {}
})
return {
    ["default"] = u20
}