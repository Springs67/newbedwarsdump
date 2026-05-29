local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "LunarVenomStatusEffectController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p15)
    p15.Name = "LunarVenomStatusEffectController"
    p15.entityInstanceMaid = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u7
        [4] = u8
        [5] = u11
        [6] = u6
    --]]
    u10.KnitStart(u16)
    u9.ProjectileHit:connect(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
        --]]
        if p17:isCancelled() then
            return nil
        end
        if p17.projectileType == "villain_magical_girl_scepter_projectile" or p17.projectileType == "villain_magical_girl_scepter_multi_projectile" then
            local u18 = u7.Assets.Effects.LunarVenomHit:Clone()
            u18.CFrame = p17.hitData.hitCFrame
            u18.Parent = u8
            for _, v19 in u18:GetDescendants() do
                if v19:IsA("ParticleEmitter") then
                    v19:Emit(10)
                end
            end
            task.delay(5, function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:Destroy()
            end)
        end
    end)
    u9.StatusEffectAdded:connect(function(p20) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
        --]]
        if p20.statusEffect == u11.LUNAR_VENOM then
            local v21 = p20.entityInstance:GetPrimaryPartCFrame().Position
            u16.entityInstanceMaid[p20.entityInstance] = u16:setEffects(v21, p20.entityInstance)
        end
    end)
    u9.StatusEffectRemoved:connect(function(p22) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
        --]]
        if p22.statusEffect == u11.LUNAR_VENOM then
            u16:removeEffects(p22.entityInstance)
        end
    end)
    u6:GetInstanceRemovedSignal("entity"):Connect(function(p23) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:removeEffects(p23)
    end)
end
function u12.removeEffects(p24, p25) --[[ Line: 72 ]]
    local v26 = p24.entityInstanceMaid[p25]
    if v26 then
        v26:DoCleaning()
        p24.entityInstanceMaid[p25] = nil
    end
end
function u12.setEffects(_, p27, p28) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u4
        [4] = u6
    --]]
    local v29 = u3.new()
    local v30 = u7.Assets.Effects.LunarVenom:Clone()
    v30.Parent = p28
    v30.Position = p27
    u4("WeldConstraint", {
        ["Part0"] = v30,
        ["Part1"] = p28.PrimaryPart,
        ["Parent"] = p28
    })
    u6:AddTag(v30, "FirstPersonHidden")
    v29:GiveTask(v30)
    return v29
end
v2.CreateController(u12.new())
return nil