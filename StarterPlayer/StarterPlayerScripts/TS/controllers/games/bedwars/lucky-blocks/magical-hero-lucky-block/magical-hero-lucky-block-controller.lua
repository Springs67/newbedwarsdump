local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.ReplicatedStorage
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = { u19.MAGICAL_HERO_LB_HIT_1, u19.MAGICAL_HERO_LB_HIT_2, u19.MAGICAL_HERO_LB_HIT_3 }
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "MagicalHeroLuckyBlockController"
    end,
    ["__index"] = u14
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p24)
    p24.Name = "MagicalHeroLuckyBlockController"
    p24.effectMaidMap = {}
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u16
        [4] = u19
        [5] = u20
        [6] = u13
        [7] = u5
        [8] = u4
        [9] = u2
        [10] = u15
        [11] = u18
        [12] = u17
    --]]
    u14.KnitStart(u25)
    local v26 = u6.Controllers.PreloadController
    local v27 = u16.MAGICAL_HERO_LUCKY_BLOCK
    local v28 = {}
    local v29 = { u19.MAGICAL_HERO_LB_BREAK, u19.MAGICAL_VILLAIN_LB_SPAWN }
    local v30 = #v29
    table.move(u20, 1, #u20, v30 + 1, v29)
    v28.sounds = v29
    v26:preloadForItemType(v27, v28)
    u13.DamageBlock:connect(function(p31) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u5
            [3] = u4
            [4] = u20
            [5] = u2
        --]]
        if p31.blockType ~= u16.MAGICAL_HERO_LUCKY_BLOCK then
            return nil
        end
        local v32 = u20
        u5:playSound(u4.fromList(unpack(v32)), {
            ["position"] = u2:getWorldPosition(p31.blockPosition)
        })
    end)
    u15.On(function(p33, p34, _, _, _) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u2
            [3] = u5
            [4] = u19
            [5] = u25
        --]]
        if p34 ~= u16.MAGICAL_HERO_LUCKY_BLOCK then
            return nil
        end
        local v35 = u2:getWorldPosition(p33)
        u5:playSound(u19.MAGICAL_HERO_LB_BREAK, {
            ["position"] = v35
        })
        local v36 = u25.effectMaidMap[v35]
        if v36 ~= nil then
            v36:DoCleaning()
        end
    end)
    u18.Client:Get("HeroLuckyBlockSpawn"):Connect(function(p37) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u16
            [3] = u6
            [4] = u17
        --]]
        u25:spawnMagicalHeroLuckyBlock(u16.MAGICAL_HERO_LUCKY_BLOCK, p37.initialSpawnPosition, p37.targetPosition, p37.arriveTime)
        local v38 = u25:applySpawnEffects(u6.Controllers.HeroVillainAssignmentController:getLocalHeroVillainAssignment() or u17.HERO, p37.targetPosition)
        u25.effectMaidMap[p37.targetPosition] = v38
    end)
end
function u21.applySpawnEffects(_, p39, p40) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u17
        [3] = u5
        [4] = u19
        [5] = u10
        [6] = u12
        [7] = u9
    --]]
    local v41 = u7.new()
    if p39 == u17.VILLAIN then
        u5:playSound(u19.MAGICAL_VILLAIN_LB_SPAWN, {
            ["position"] = p40
        })
        local v42 = u10.Assets.Effects.VillainLuckyBlock:Clone()
        v42.Parent = u12
        local v43 = p40.X
        local v44 = p40.Y + 2.65
        local v45 = p40.Z
        v42:MoveTo((Vector3.new(v43, v44, v45)))
        v41:GiveTask(v42)
        local v46 = v42.Moon
        v46:PivotTo(CFrame.new(p40.X, p40.Y + 9, p40.Z))
        v46:SetAttribute("RotationSpeed", 50)
        u9:AddTag(v46, "RotatingObject")
        return v41
    else
        u5:playSound(u19.MAGICAL_HERO_LB_SPAWN, {
            ["position"] = p40
        })
        local v47 = u10.Assets.Effects.HeroLuckyBlock:Clone()
        v47.Parent = u12
        local v48 = p40.X
        local v49 = p40.Y + 2.65
        local v50 = p40.Z
        v47:MoveTo((Vector3.new(v48, v49, v50)))
        v41:GiveTask(v47)
        local v51 = v47.Star
        v51:PivotTo(CFrame.new(p40.X, p40.Y + 9, p40.Z))
        v51:SetAttribute("RotationSpeed", 50)
        u9:AddTag(v51, "RotatingObject")
        return v41
    end
end
function u21.spawnMagicalHeroLuckyBlock(_, p52, p53, p54, p55) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u5
        [4] = u19
        [5] = u11
    --]]
    local u56 = u10.Assets.Blocks:FindFirstChild(p52)
    if u56 ~= nil then
        u56 = u56:Clone()
    end
    u56.Parent = u12
    u5:playSound(u19.COSMIC_LUCKY_BLOCK_BOUNCE_2, {
        ["rollOffMaxDistance"] = 120,
        ["rollOffMinDistance"] = 10,
        ["parent"] = u56.PrimaryPart
    })
    u56.PrimaryPart:PivotTo(CFrame.new(p53))
    local v57 = TweenInfo.new(p55, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
    u11:Create(u56.PrimaryPart, v57, {
        ["CFrame"] = CFrame.new(p54)
    }):Play()
    task.delay(p55, function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56:Destroy()
    end)
end
u6.CreateController(u21.new())
return nil