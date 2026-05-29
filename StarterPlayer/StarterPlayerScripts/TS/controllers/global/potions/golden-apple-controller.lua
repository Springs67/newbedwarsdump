local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.ReplicatedStorage
local u9 = v5.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GoldenAppleController"
    end,
    ["__index"] = u11
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p17)
    p17.Name = "GoldenAppleController"
    p17.entityInstanceMaid = {}
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u13
        [4] = u6
    --]]
    u11.KnitStart(u18)
    u10.StatusEffectAdded:connect(function(p19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u18
        --]]
        if p19.statusEffect == u13.GOLDEN_APPLE then
            u18.entityInstanceMaid[p19.entityInstance] = u18:setEffectsOnCharacter(p19.entityInstance)
        end
    end)
    u10.StatusEffectRemoved:connect(function(p20) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u18
        --]]
        if p20.statusEffect == u13.GOLDEN_APPLE then
            u18:removeEffects(p20.entityInstance)
        end
    end)
    u6:GetInstanceRemovedSignal("entity"):Connect(function(p21) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:removeEffects(p21)
    end)
end
function u14.removeEffects(p22, p23) --[[ Line: 55 ]]
    local v24 = p22.entityInstanceMaid[p23]
    if v24 then
        v24:DoCleaning()
        p22.entityInstanceMaid[p23] = nil
    end
end
function u14.setEffectsOnCharacter(_, u25) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u7
        [4] = u4
        [5] = u8
        [6] = u9
        [7] = u6
    --]]
    if u25.PrimaryPart then
        local v26 = u2
        local v27 = u12.FIREWORK_EXPLODE_3
        local v28 = {}
        local v29
        if u7.LocalPlayer.Character == u25 then
            v29 = nil
        else
            v29 = u25.PrimaryPart.Position
        end
        v28.position = v29
        v26:playSound(v27, v28)
    end
    local u30 = u4.new()
    local v31 = u8.Assets.Effects.SparklingAppleJuiceEffect:Clone()
    v31.Parent = u9
    u30:GiveTask(v31)
    local v32 = v31.Trail
    v32.Parent = u25
    v32.Attachment0 = u25.LowerTorso.WaistCenterAttachment
    v32.Attachment1 = u25.UpperTorso.NeckAttachment
    u6:AddTag(v32, "FirstPersonHidden")
    u30:GiveTask(v32)
    local v33 = v31.Sparkles
    v33.Parent = u25.UpperTorso
    u6:AddTag(v33, "FirstPersonHidden")
    u30:GiveTask(v33)
    local v34 = u8.Assets.Effects.GoldenAppleRays:Clone()
    v34.Parent = u9
    u30:GiveTask(v34)
    local v35 = v34:GetChildren()
    local function v37(p36) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u7
            [3] = u30
        --]]
        if p36:IsA("ParticleEmitter") then
            p36.Parent = u25.Head.FaceCenterAttachment
            p36.Enabled = true
            p36.Transparency = NumberSequence.new(0.5, 1)
            if u7.LocalPlayer.Character == u25 then
                p36.Transparency = NumberSequence.new(1)
            end
            u30:GiveTask(p36)
        end
    end
    for v38, v39 in v35 do
        v37(v39, v38 - 1, v35)
    end
    return u30
end
v3.CreateController(u14.new())
return nil