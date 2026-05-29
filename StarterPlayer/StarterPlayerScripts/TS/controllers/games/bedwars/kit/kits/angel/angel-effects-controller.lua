local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.SoundManager
local u5 = v2.WatchPlayer
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit").AngelType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v3.registerConstants(script, {
    ["P1XRange"] = NumberRange.new(-30, 30),
    ["P1YRange"] = NumberRange.new(-15, 15),
    ["P1ZRange"] = NumberRange.new(-15, 15)
})
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "AngelEffectsController"
    end,
    ["__index"] = u15
})
u21.__index = u21
function u21.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, ...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p24, ...)
    p24.Name = "AngelEffectsController"
    p24.random = Random.new()
    p24.playerOrbTimeMap = {}
    p24.lastOrbSoundTime = 0
    p24.lastHealSoundTime = 0
end
function u21.KnitStart(u25) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
        [3] = u11
        [4] = u13
        [5] = u20
        [6] = u17
        [7] = u12
        [8] = u4
        [9] = u14
        [10] = u9
        [11] = u5
        [12] = u8
    --]]
    u15.KnitStart(u25)
    u18.Client:OnEvent("AngelOrb", function(p26, p27, p28, p29, p30) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u13
            [3] = u25
            [4] = u20
            [5] = u17
            [6] = u12
            [7] = u4
            [8] = u14
            [9] = u9
        --]]
        local v31 = p29 == u11.LocalPlayer
        local v32 = p30 == u11.LocalPlayer
        local v33 = u13:GetServerTimeNow() - p28
        local u34 = p29.Character
        local v35 = p30.Character
        if u34 == nil or (u34.PrimaryPart == nil or (v35 == nil or v35.PrimaryPart == nil)) then
            return nil
        end
        local u36 = v35:GetPrimaryPartCFrame().Position
        local u37 = (v35:GetPrimaryPartCFrame() * CFrame.new(u25.random:NextNumber(u20.P1XRange.Min, u20.P1XRange.Max), u25.random:NextNumber(u20.P1YRange.Min, u20.P1YRange.Max), u25.random:NextNumber(u20.P1ZRange.Min, u20.P1ZRange.Max))):Lerp(u34:GetPrimaryPartCFrame(), 0.5).Position
        local u38
        if p26 == u17.LIGHT then
            u38 = u12.Assets.Effects.AngelLightOrb:Clone()
        else
            u38 = u12.Assets.Effects.AngelVoidOrb:Clone()
        end
        u38.Parent = u13
        u38:ScaleTo(0.6)
        if tick() - u25.lastOrbSoundTime > 0.25 then
            u4:playSound(u25:getOrbCreateSound(p30, p26), {
                ["rollOffMaxDistance"] = 100,
                ["volumeMultiplier"] = 0.5,
                ["position"] = u36
            })
        end
        u14(p27 - v33, u9, function(p39) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u36
                [3] = u37
                [4] = u38
            --]]
            if u34.PrimaryPart == nil then
                return nil
            end
            local v40 = u34:GetPrimaryPartCFrame().Position
            local v41 = u36:Lerp(u37, p39):Lerp(u37:Lerp(v40, p39), p39)
            u38:PivotTo(CFrame.new(v41) * CFrame.Angles(0, 6.283185307179586 * p39, 0))
        end, v33, 1):Wait()
        u38:Destroy()
        local v42
        if p26 == u17.LIGHT then
            v42 = u12.Assets.Effects.AngelLightParticles
        else
            v42 = u12.Assets.Effects.AngelVoidParticles
        end
        if (v31 or v32) and tick() - u25.lastHealSoundTime > 0.25 then
            u4:playSound(u25:getOrbHealSound(p30, p26), {
                ["rollOffMaxDistance"] = 100,
                ["position"] = u34.PrimaryPart.Position
            })
            u25.lastHealSoundTime = tick()
        end
        for _, v43 in v42:GetChildren() do
            if v43:IsA("ParticleEmitter") then
                local u44 = v43:Clone()
                u44.Parent = u34.PrimaryPart
                u44.Enabled = true
                u44.Size = NumberSequence.new(0.1)
                task.delay(0.5, function() --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                    --]]
                    u44.Enabled = false
                    task.wait(3)
                    u44:Destroy()
                end)
            end
        end
    end)
    u18.Client:Get("AngelFirstTransform"):Connect(function(p45) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u25
        --]]
        local v46 = p45.player.Character
        if v46 ~= nil then
            v46 = v46:GetPrimaryPartCFrame().Position
        end
        if v46 == nil then
            return nil
        end
        u4:playSound(u25:getTransformSound(p45.player, p45.angelType), {
            ["rollOffMaxDistance"] = 150,
            ["position"] = v46
        })
    end)
    u5(function(u47, p48) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u25
            [3] = u8
            [4] = u17
            [5] = u12
        --]]
        p48:GiveTask(u47:GetAttributeChangedSignal("AngelType"):Connect(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u4
                [3] = u25
                [4] = u8
                [5] = u17
                [6] = u12
            --]]
            local v49 = u47:GetAttribute("AngelType")
            local v50 = u47.Character
            if v50 ~= nil then
                v50 = v50:GetPrimaryPartCFrame().Position
            end
            if v50 == nil then
                return nil
            end
            if v49 == nil then
                return nil
            end
            u4:playSound(u25:getTransformSound(u47, v49), {
                ["rollOffMaxDistance"] = 150,
                ["position"] = v50
            })
            local v51 = u8.Controllers.FancyExplosionController
            local v52 = {
                ["radius"] = 0.5,
                ["randomSizeOffset"] = 0,
                ["randomPositionOffset"] = 0,
                ["inDuration"] = 0.25,
                ["outDuration"] = 0.4,
                ["position"] = v50
            }
            local v53
            if v49 == u17.LIGHT then
                v53 = u12.Assets.Effects.AngelLightExplosion
            else
                v53 = u12.Assets.Effects.AngelVoidExplosion
            end
            v52.model = v53
            v52.simpleScaleParent = {
                ["startScale"] = 0.7,
                ["endScale"] = 0.9
            }
            v51:createExplosion(v52)
        end))
    end)
end
function u21.getKitSkinMeta(_, p54) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
    --]]
    local v55 = u7.Controllers.KitSkinController:getKitSkin(p54)
    if v55 == nil then
        return nil
    else
        local v56 = u16[v55]
        if v56 == nil then
            return nil
        else
            return v56
        end
    end
end
function u21.getOrbCreateSound(p57, p58, p59) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
    --]]
    local v60 = p57:getKitSkinMeta(p58)
    if v60 ~= nil then
        v60 = v60.trinity
    end
    if v60 then
        if p59 == u17.LIGHT then
            return v60.lightOrbCreateSound
        end
        if p59 == u17.VOID then
            return v60.darkOrbCreateSound
        end
    else
        if p59 == u17.LIGHT then
            return u19.TRINITY_LIGHT_ORB_CREATE
        end
        if p59 == u17.VOID then
            return u19.TRINITY_VOID_ORB_CREATE
        end
    end
    return u19.TRINITY_LIGHT_ORB_CREATE
end
function u21.getOrbHealSound(p61, p62, p63) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
    --]]
    local v64 = p61:getKitSkinMeta(p62)
    if v64 ~= nil then
        v64 = v64.trinity
    end
    if v64 then
        if p63 == u17.LIGHT then
            return v64.lightOrbHealSound
        end
        if p63 == u17.VOID then
            return v64.darkOrbHealSound
        end
    else
        if p63 == u17.LIGHT then
            return u19.TRINITY_LIGHT_ORB_HEAL
        end
        if p63 == u17.VOID then
            return u19.TRINITY_VOID_ORB_HEAL
        end
    end
    return u19.TRINITY_LIGHT_ORB_HEAL
end
function u21.getTransformSound(p65, p66, p67) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
    --]]
    local v68 = p65:getKitSkinMeta(p66)
    if v68 ~= nil then
        v68 = v68.trinity
    end
    if v68 then
        if p67 == u17.LIGHT then
            return v68.lightTransformSound
        end
        if p67 == u17.VOID then
            return v68.darkTransformSound
        end
    else
        if p67 == u17.LIGHT then
            return u19.SPIRIT_EXPLODE
        end
        if p67 == u17.VOID then
            return u19.SPIRIT_EXPLODE
        end
    end
    return u19.SPIRIT_EXPLODE
end
u7.CreateController(u21.new())
return nil