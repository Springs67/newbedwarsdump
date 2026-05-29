local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "backpack-knit-controller").BackpackKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "firework-backpack", "firework-backpack-balance").FireworkBackpackBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "FireworkBackpackController"
    end,
    ["__index"] = u7
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    u7.constructor(p19)
    p19.Name = "FireworkBackpackController"
    p19.abilityMaid = u5.new()
end
function u16.KnitStart(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u12
        [4] = u15
        [5] = u14
        [6] = u6
        [7] = u2
        [8] = u9
        [9] = u13
        [10] = u3
        [11] = u10
    --]]
    u7.KnitStart(p20)
    u4.Controllers.PreloadController:preloadForItemType(u12.FIREWORK_BACKPACK, {
        ["sounds"] = { u15.FIREWORK_LAUNCH }
    })
    u14.Client:Get("FireFireworkBackpack"):Connect(function(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u9
            [4] = u13
            [5] = u3
            [6] = u15
            [7] = u4
            [8] = u10
        --]]
        local u22 = p21.player.Character
        if not u22 then
            return nil
        end
        local u23 = u22.PrimaryPart
        if not u23 then
            return nil
        end
        if p21.player == u6.LocalPlayer then
            local v24 = u6.LocalPlayer.Character
            if v24 ~= nil then
                v24 = v24:FindFirstChild("Humanoid")
            end
            local v25 = u23.AssemblyLinearVelocity
            local v26 = u23.AssemblyMass
            local v27 = v25.Y * v26
            if v24 ~= nil then
                v24 = v24:GetState()
            end
            local v28 = v24 == Enum.HumanoidStateType.Landed and 0 or v27
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u9.BACKPACK, u13.COOLDOWN)
            local v29 = p21.power * v26 - v28
            u23:ApplyImpulse((Vector3.new(0, v29, 0)))
            u3:playSound(u15.FIREWORK_LAUNCH)
        else
            u3:playSound(u15.FIREWORK_LAUNCH, {
                ["position"] = u23.Position
            })
        end
        u4.Controllers.ExplosionController:playExplodeEffect(u23.Position, 1, {
            ["disableSound"] = true
        })
        local u30 = p21.player.Character
        if u30 ~= nil then
            u30 = u30:FindFirstChild("firework_backpack")
        end
        if u30 then
            if u30 ~= nil then
                u30 = u30:FindFirstChild("Handle")
                if u30 ~= nil then
                    u30 = u30:FindFirstChild("EffectsAttachment")
                end
            end
            if u30 ~= nil then
                for v31, v32 in u30:GetChildren() do
                    local _ = v31 - 1
                    if v32:IsA("ParticleEmitter") or (v32:IsA("PointLight") or v32:IsA("Trail")) then
                        v32.Enabled = true
                    end
                end
            end
            task.delay(u13.FLIGHT_DURATION, function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u4
                    [3] = u23
                    [4] = u10
                    [5] = u30
                --]]
                if u22.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                    u4.Controllers.FireworkController:playFireworkEffect(u23.Position + Vector3.new(0, 5, 0), u10.NEW_YEARS, {
                        ["sizeMultiplier"] = 0.4,
                        ["volumeMultiplier"] = 1
                    })
                end
                local v33 = u30
                if v33 ~= nil then
                    for v34, v35 in v33:GetChildren() do
                        local _ = v34 - 1
                        if v35:IsA("ParticleEmitter") or (v35:IsA("PointLight") or v35:IsA("Trail")) then
                            v35.Enabled = false
                        end
                    end
                end
            end)
        end
    end)
end
function u16.isRelevantItem(_, p36) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return p36.itemType == u12.FIREWORK_BACKPACK
end
function u16.onEnable(u37, _, _) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u11
        [4] = u12
    --]]
    local u38 = true
    u37.abilityMaid:GiveTask(function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38 = false
        return u38
    end)
    task.spawn(function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u11
            [4] = u12
            [5] = u38
            [6] = u37
        --]]
        local v39 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v40 = u8.FIREWORK_BACKPACK
        local v41 = {}
        local v42 = {}
        local v43 = u11(u12.FIREWORK_BACKPACK).image
        v42.icon = v43 == nil and "" or v43
        v41.abilityButton = v42
        v41.abilityType = "MiscPrimary"
        local v44 = v39:enableAbility(v40, v41):expect()
        if u38 then
            u37.abilityMaid:GiveTask(v44)
        else
            v44.Destroy()
        end
    end)
end
function u16.onDisable(p45) --[[ Line: 162 ]]
    p45.abilityMaid:DoCleaning()
end
u4.CreateController(u16.new())
return nil