local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ExpireList
local u5 = v3.SoundManager
local u6 = v3.WatchCharacterAnimation
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "carrot-cannon", "carrot-cannon-constants").CarrotCannonConstants
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "CarrotCannonEffectsController"
    end,
    ["__index"] = u16
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p29)
    p29.Name = "CarrotCannonEffectsController"
    p29.hitMarkerOverflow = 0
    p29.effectCooldown = {}
end
function u26.KnitStart(u30) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u23
        [3] = u11
        [4] = u15
        [5] = u6
        [6] = u19
        [7] = u18
        [8] = u21
        [9] = u2
        [10] = u4
        [11] = u20
        [12] = u17
        [13] = u13
        [14] = u5
        [15] = u24
    --]]
    u16.KnitStart(u30)
    u23.Client:WaitFor("CarrotRocketExplode"):andThen(function(p31) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u30
        --]]
        p31:Connect(function(p32) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u30
            --]]
            if p32.shooter ~= u11.LocalPlayer then
                u30:playExplosion(p32.position)
            end
        end)
    end)
    u15.LocalProjectileImpact:connect(function(p33) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        if p33.projectile.Name == "carrot_rocket" then
            u30:playExplosion(p33.hitPosition)
        end
    end)
    u6({ u19:getAssetId(u18.CARROT_CANNON_SHOOT) }, function(p34, _) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u2
            [3] = u30
            [4] = u4
            [5] = u20
        --]]
        local v35 = p34.Character
        if not v35 then
            return nil
        end
        local v36 = u21.getInventory(p34).hand
        if v36 ~= nil then
            v36 = v36.tool
        end
        if v36 then
            local v37 = u2.getOrCreate(u30.effectCooldown, p34.UserId, u4.new(u20.COOLDOWN * 0.9))
            if #v37:getValues() >= 4 then
                return nil
            end
            v37:add(math.random())
            u30:playFireEffect(v35)
        end
    end)
    u17.On(function(p38, _, _, _, p39, _, _, p40, _, _, _, _, _, _) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u30
        --]]
        if p38.PrimaryPart and (p39 and p38 ~= u11.LocalPlayer.Character) then
            local v41 = u11:GetPlayerFromCharacter(p39) == u11.LocalPlayer
            if v41 then
                if p40 ~= nil then
                    p40 = p40.paintBlast
                end
            else
                p40 = v41
            end
            if p40 then
                local v42 = u30
                local v43 = u30.hitMarkerOverflow + 1
                v42.hitMarkerOverflow = math.min(v43, 3)
            end
        end
    end)
    local u44 = 0
    u13.Heartbeat:Connect(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u30
            [3] = u5
            [4] = u24
        --]]
        if tick() - u44 < 0.1 then
            return nil
        end
        if u30.hitMarkerOverflow > 0 then
            local v45 = u30
            v45.hitMarkerOverflow = v45.hitMarkerOverflow - 1
            u5:playSound(u24.ARROW_HIT, {
                ["volumeMultiplier"] = 0.2
            })
            u44 = tick()
        end
    end)
end
function u26.playFireEffect(_, p46) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u9
        [4] = u22
        [5] = u25
    --]]
    local v47 = u14.CurrentCamera
    if v47 ~= nil then
        v47 = v47.CFrame.Position
    end
    if not v47 or (p46:GetPrimaryPartCFrame().Position - v47).Magnitude > 300 then
        return nil
    end
    if p46 == u11.LocalPlayer.Character and u9.Controllers.ViewmodelController:isVisible() then
        p46 = u9.Controllers.ViewmodelController:getViewModel() or p46
    end
    local v48 = p46:FindFirstChild(u22.CARROT_CANNON)
    if not v48 then
        return nil
    end
    u25:playEffects(v48:GetDescendants(), nil)
end
function u26.playExplosion(_, p49) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u24
        [4] = u14
        [5] = u25
    --]]
    local u50 = u12.Assets.Effects.Explosion:Clone()
    u5:playSound(u24.TNT_EXPLODE_1, {
        ["rollOffMaxDistance"] = 200,
        ["position"] = p49
    })
    u5:playSound(u24.CARROT_LAUNCHER_IMPACT, {
        ["rollOffMaxDistance"] = 200,
        ["position"] = p49
    })
    u50.Parent = u14
    u25:playEffects({ u50 }, nil, {
        ["sizeMultiplier"] = 0.75
    })
    u50.CFrame = CFrame.new(p49)
    task.delay(2, function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50:Destroy()
    end)
end
v8.CreateController(u26.new())
return nil