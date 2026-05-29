local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "GroundedStatusEffectController"
    end,
    ["__index"] = u12
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p22)
    p22.Name = "GroundedStatusEffectController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u15
        [4] = u14
        [5] = u8
        [6] = u18
        [7] = u17
        [8] = u13
        [9] = u3
        [10] = u16
        [11] = u4
        [12] = u9
        [13] = u10
        [14] = u6
    --]]
    u12.KnitStart(p23)
    u11.BeginProjectileTargeting:connect(function(p24) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u14
            [3] = u8
            [4] = u18
            [5] = u17
        --]]
        if p24.handItem.itemType == u15.TELEPEARL then
            local v25 = u14:getEntity(u8.LocalPlayer)
            if v25 ~= nil then
                v25 = v25:getInstance()
            end
            if v25 and u18:isActive(v25, u17.GROUNDED) then
                p24:setCancelled(true)
            end
        end
    end)
    u13.On(function(p26, _, _, _, p27, _, _, _, _, _, _, _, _, _) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u17
            [3] = u3
            [4] = u16
            [5] = u4
        --]]
        if p27 and u18:isActive(p27, u17.GROUNDED_ENCHANT) then
            local v28 = u3.fromList(u16.GLUE_ENCHANT_01, u16.GLUE_ENCHANT_02)
            local v29 = u4
            local v30 = {}
            local v31 = p26.PrimaryPart
            if v31 ~= nil then
                v31 = v31.Position
            end
            v30.position = v31
            v29:playSound(v28, v30)
        end
    end)
    u11.ProjectileHit:connect(function(p32) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
        --]]
        if p32:isCancelled() then
            return nil
        end
        if p32.projectileType == "glue_trap" or p32.projectileType == "glue_trap_charging" then
            local u33 = u9.Assets.Effects.GlueHit:Clone()
            u33.CFrame = p32.hitData.hitCFrame
            u33.Parent = u10
            for _, v34 in u33:GetDescendants() do
                if v34:IsA("ParticleEmitter") then
                    v34:Emit(30)
                end
            end
            task.delay(1, function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:Destroy()
            end)
        end
    end)
    u11.StatusEffectAdded:connect(function(p35) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u9
            [3] = u10
            [4] = u6
        --]]
        if p35.statusEffect == u17.GROUNDED then
            local u36 = u9.Assets.Effects.GlueHit:Clone()
            local v37 = p35.entityInstance:GetPrimaryPartCFrame().Position
            u36.Position = v37
            u36.Parent = u10
            for _, v38 in u36:GetDescendants() do
                if v38:IsA("ParticleEmitter") then
                    v38:Emit(30)
                end
            end
            task.delay(1, function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:Destroy()
            end)
            local v39 = u9.Assets.Effects.GlueStatus:Clone()
            v39.Parent = p35.entityInstance
            v39.Position = v37
            u6("WeldConstraint", {
                ["Part0"] = v39,
                ["Part1"] = p35.entityInstance.PrimaryPart,
                ["Parent"] = p35.entityInstance
            })
        end
    end)
    u11.StatusEffectRemoved:connect(function(p40) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        if p40.statusEffect == u17.GROUNDED then
            for _, v41 in p40.entityInstance:GetChildren() do
                if v41.Name == "GlueStatus" then
                    v41:Destroy()
                end
            end
        end
    end)
end
v5.CreateController(u19.new())
return nil