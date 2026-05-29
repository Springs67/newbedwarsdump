local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "TitanBlessingStatusEffectController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "TitanBlessingStatusEffectController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u10
    --]]
    u8.KnitStart(u16)
    u7.StatusEffectAdded:connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
        --]]
        if p17.statusEffect == u10.TITANS_BLESSING or (p17.statusEffect == u10.SPIRIT_TITANS_BLESSING or p17.statusEffect == u10.VOID_TITANS_BLESSING) then
            u16:createWingEffect(p17.entityInstance, p17.statusEffect)
        end
    end)
    u7.StatusEffectRemoved:connect(function(p18) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
        --]]
        if p18.statusEffect == u10.TITANS_BLESSING or (p18.statusEffect == u10.SPIRIT_TITANS_BLESSING or p18.statusEffect == u10.VOID_TITANS_BLESSING) then
            u16:removeWings(p18.entityInstance)
        end
    end)
end
function u12.createWingEffect(_, p19, p20) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u11
        [4] = u2
        [5] = u9
        [6] = u6
    --]]
    if p19:FindFirstChild("BossWings") or (p19:FindFirstChild("BossWingsSpirit") or p19:FindFirstChild("BossWingsVoid")) then
        return nil
    end
    local v21
    if p20 == u10.TITANS_BLESSING then
        v21 = u5.Assets.Effects.BossWings:Clone()
    elseif p20 == u10.SPIRIT_TITANS_BLESSING then
        v21 = u5.Assets.Effects.BossWingsSpirit:Clone()
    else
        if p20 ~= u10.VOID_TITANS_BLESSING then
            u5.Assets.Effects.BossWings:Clone()
            return nil
        end
        v21 = u5.Assets.Effects.BossWingsVoid:Clone()
    end
    local v22 = v21 or u5.Assets.Effects.BossWings:Clone()
    v22.Parent = p19
    local v23 = p19:WaitForChild("UpperTorso")
    if v23 ~= nil then
        v23 = v23:WaitForChild("BodyBackAttachment")
    end
    if v23 then
        u11:weldAccessory(p19, v22)
        local v24 = u2
        local v25 = u9.FROST_STORM_START
        local v26 = {}
        local v27 = p19.PrimaryPart
        if v27 ~= nil then
            v27 = v27.Position
        end
        v26.position = v27
        v26.rollOffMaxDistance = 220
        v24:playSound(v25, v26)
        local u28 = {}
        for v29, v30 in v22:GetDescendants() do
            local _ = v29 - 1
            if (v30.Name == "grey" or v30.Name == "neon") and v30:IsA("MeshPart") then
                table.insert(u28, v30)
            end
            if v30:IsA("ParticleEmitter") then
                v30:Emit(30)
            end
        end
        local u31 = 0
        local u32 = nil
        u32 = u6.Heartbeat:Connect(function(p33) --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u32
                [3] = u28
            --]]
            u31 = u31 + p33
            if u31 >= 1 then
                u32:Disconnect()
            end
            local v34 = u28
            local function v38(p35) --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                p35.Transparency = 1 - u31
                if p35.Name == "grey" then
                    for v36, v37 in p35:GetDescendants() do
                        local _ = v36 - 1
                        if v37:IsA("ParticleEmitter") and v37.Enabled == false then
                            v37.Enabled = true
                        end
                    end
                end
            end
            for v39, v40 in v34 do
                v38(v40, v39 - 1, v34)
            end
        end)
    end
end
function u12.removeWings(_, p41) --[[ Line: 132 ]]
    local v42 = p41:FindFirstChild("BossWings")
    if v42 then
        v42:Destroy()
    end
    local v43 = p41:FindFirstChild("BossWingsSpirit")
    if v43 then
        v43:Destroy()
    end
    local v44 = p41:FindFirstChild("BossWingsVoid")
    if v44 then
        v44:Destroy()
    end
end
v3.CreateController(u12.new())
return nil