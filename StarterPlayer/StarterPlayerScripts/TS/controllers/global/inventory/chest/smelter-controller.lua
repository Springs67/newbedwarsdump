local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local v5 = v3.ConstantManager
local u6 = v3.GameQueryUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block-smelter", "lucky-block-smelter-util").LuckyBlockSmelterUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
v5.registerConstants(script, {
    ["P1XRange"] = NumberRange.new(-30, 30),
    ["P1YRange"] = NumberRange.new(0, 15),
    ["P1ZRange"] = NumberRange.new(-15, 15)
})
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "SmelterController"
    end,
    ["__index"] = u17
})
u25.__index = u25
function u25.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
    --]]
    u17.constructor(p28)
    p28.Name = "SmelterController"
    p28.random = Random.new()
    p28.particleMap = {}
    p28.neonPartMap = {}
    p28.localSmelterChestFolder = nil
    p28.currentRarity = u22.COMMON
end
function u25.KnitStart(u29) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
        [3] = u14
        [4] = u13
        [5] = u21
        [6] = u22
        [7] = u23
        [8] = u2
        [9] = u18
    --]]
    u17.KnitStart(u29)
    u19("smelter-block", function(p30) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u14
            [3] = u13
            [4] = u21
            [5] = u22
        --]]
        local v31 = 0
        local v32 = {}
        for v33, v34 in p30:WaitForChild("Smelter"):WaitForChild("FireAttachment"):GetChildren() do
            local _ = v33 - 1
            if v34:IsA("ParticleEmitter") == true then
                v31 = v31 + 1
                v32[v31] = v34
            end
        end
        local v35 = 0
        local v36 = {}
        for v37, v38 in p30:WaitForChild("Smelter"):WaitForChild("SpiralAttachment"):GetChildren() do
            local _ = v37 - 1
            if v38:IsA("ParticleEmitter") == true then
                v35 = v35 + 1
                v36[v35] = v38
            end
        end
        local v39 = p30:GetAttribute("Team")
        u29.neonPartMap[v39] = p30.Neon
        local v40 = u29.particleMap
        local v41 = {}
        local v42 = #v41
        local v43 = #v32
        table.move(v32, 1, v43, v42 + 1, v41)
        local v44 = v42 + v43
        table.move(v36, 1, #v36, v44 + 1, v41)
        v40[v39] = v41
        u29:recolorSmelterRarityEffects(u29.currentRarity)
        local v45 = u29.localSmelterChestFolder == nil and u14:WaitForChild("Inventories"):FindFirstChild(u13.LocalPlayer.Name .. "_smelter")
        if v45 then
            u29.localSmelterChestFolder = v45
            v45:GetAttributeChangedSignal("SmeltPoints"):Connect(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u21
                    [3] = u22
                --]]
                local v46 = u29.localSmelterChestFolder
                if v46 ~= nil then
                    v46 = v46:GetAttribute("SmeltPoints")
                end
                if v46 == nil then
                    return nil
                end
                local v47 = u21.getGuaranteedLowestRarityFromSmeltPoints(v46)
                if v47 == nil then
                    u29.currentRarity = u22.COMMON
                    u29:recolorSmelterRarityEffects(u22.COMMON)
                    return nil
                end
                if v47 == u29.currentRarity then
                    return nil
                end
                u29.currentRarity = v47
                u29:recolorSmelterRarityEffects(v47)
            end)
        end
    end)
    u23.Client:OnEvent("ChestContentsSmelted", function(p48) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u18
            [4] = u29
            [5] = u22
        --]]
        if p48.player == u13.LocalPlayer then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u18.CHEST_INVENTORY)
        end
        local v49 = p48.player.Character
        if v49 ~= nil then
            v49 = v49.PrimaryPart
            if v49 ~= nil then
                v49 = v49.CFrame.Position
            end
        end
        if not v49 then
            return nil
        end
        local v50 = u29:getNearestSmelter(v49)
        if v50 ~= nil then
            v50 = v50.CFrame
        end
        if not v50 then
            return nil
        end
        local v51 = v50.Position + Vector3.new(0, -0.5, 0)
        u29:playSounds(p48.guaranteedLowestRarity, p48.receivedItemRarity, v51)
        local v52 = CFrame.new(v51)
        u29:playEffects(p48.guaranteedLowestRarity, p48.receivedItemRarity, v52)
        u29:playGiveItemEffect(p48.itemSmelted, v52.Position, p48.player)
        u29.currentRarity = u22.COMMON
        u29:recolorSmelterRarityEffects(u22.COMMON)
    end)
end
function u25.recolorSmelterRarityEffects(p53, p54) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u4
    --]]
    local u55 = u21.RarityEffectColors[p54]
    if u55 then
        local v56 = p53.particleMap
        local function v60(p57, _) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u55
            --]]
            for v58, v59 in p57 do
                local _ = v58 - 1
                if v59.Name == "TopFire" then
                    v59.Color = ColorSequence.new(u4.darken(u55, 0.4))
                else
                    v59.Color = ColorSequence.new(u55)
                end
            end
        end
        for v61, v62 in v56 do
            v60(v62, v61, v56)
        end
    end
    local v63 = u21.NeonEffectColors[p54]
    if v63 then
        for _, v64 in p53.neonPartMap do
            v64.Color = v63
        end
    end
end
function u25.playSounds(_, p65, p66, u67) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u7
    --]]
    local v68 = u24.SMELTER_SMELTING_TIER_1
    local u69 = u24.SMELTER_ITEM_REVEAL_TIER_1
    if p65 == u22.COMMON then
        v68 = u24.SMELTER_SMELTING_TIER_1
    elseif p65 == u22.UNCOMMON then
        v68 = u24.SMELTER_SMELTING_TIER_2
    elseif p65 == u22.RARE then
        v68 = u24.SMELTER_SMELTING_TIER_3
    elseif p65 == u22.EPIC then
        v68 = u24.SMELTER_SMELTING_TIER_4
    elseif p65 == u22.LEGENDARY then
        v68 = u24.SMELTER_SMELTING_TIER_5
    end
    if p66 == u22.COMMON then
        u69 = u24.SMELTER_ITEM_REVEAL_TIER_1
    elseif p66 == u22.UNCOMMON then
        u69 = u24.SMELTER_ITEM_REVEAL_TIER_2
    elseif p66 == u22.RARE then
        u69 = u24.SMELTER_ITEM_REVEAL_TIER_3
    elseif p66 == u22.EPIC then
        u69 = u24.SMELTER_ITEM_REVEAL_TIER_4
    elseif p66 == u22.LEGENDARY then
        u69 = u24.SMELTER_ITEM_REVEAL_TIER_5
    end
    u7:playSound(v68, {
        ["position"] = u67
    })
    task.delay(0.5, function() --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u69
            [3] = u67
        --]]
        u7:playSound(u69, {
            ["position"] = u67
        })
    end)
end
function u25.playEffects(_, _, p70, p71) --[[ Line: 255 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
        [3] = u22
    --]]
    local u72 = u14.Assets.Effects.SmelterEffect:Clone()
    u72.Parent = u15
    u72.CFrame = p71
    local u73 = u72.ParticleTop.Specs
    u72.ParticleTop.EnergyImplosion:Emit(10)
    local u74 = u72.ParticleTop.SpecExplosion1
    local u75 = u72.ParticleTop.SpecExplosion2
    local u76 = u72.ParticleTop.OutlineExplosion
    local u77 = u72.ParticleTop.Stars
    local u78 = u72.ParticleTop.TwinkleStars
    local u79 = u72.ParticleTop.Sparks
    local u80 = 2
    local u81 = 4
    local u82 = 8
    local u83 = 20
    local u84 = ColorSequence.new(Color3.new(1, 1, 1))
    if p70 == u22.COMMON then
        u84 = ColorSequence.new(Color3.new(1, 1, 1))
        u82 = 8
        u81 = 4
        u80 = 2
        u83 = 20
    elseif p70 == u22.UNCOMMON then
        u84 = ColorSequence.new(Color3.new(0.25, 0.94, 0.22))
        u82 = 10
        u81 = 6
        u80 = 3
        u83 = 30
    elseif p70 == u22.RARE then
        u84 = ColorSequence.new(Color3.new(0.13, 0.61, 0.87))
        u82 = 15
        u81 = 8
        u80 = 4
        u83 = 40
    elseif p70 == u22.EPIC then
        u84 = ColorSequence.new(Color3.new(0.87, 0.24, 0.85))
        u82 = 20
        u81 = 15
        u80 = 7
        u83 = 70
    elseif p70 == u22.LEGENDARY then
        u84 = ColorSequence.new(Color3.new(0.85, 0.7, 0.09))
        u82 = 30
        u81 = 25
        u80 = 9
        u83 = 90
    end
    task.delay(0.5, function() --[[ Line: 318 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u84
            [3] = u78
            [4] = u79
            [5] = u73
            [6] = u74
            [7] = u83
            [8] = u75
            [9] = u82
            [10] = u81
            [11] = u77
            [12] = u80
        --]]
        u76.Color = u84
        u78.Color = u84
        u79.Color = u84
        u73.Enabled = false
        u74:Emit(u83)
        u75:Emit(u83)
        u76:Emit(1)
        u78:Emit(u82)
        u79:Emit(u81)
        u77:Emit(u80)
    end)
    task.delay(1.5, function() --[[ Line: 330 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        u72:Destroy()
    end)
end
function u25.getNearestSmelter(_, p85) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v86 = (1 / 0)
    local v87 = nil
    for _, v88 in u12:GetTagged("smelter-block") do
        local v89 = (v88.Position - p85).Magnitude
        if v89 < v86 then
            v87 = v88
            v86 = v89
        end
    end
    return v87
end
function u25.playGiveItemEffect(_, p90, u91, u92) --[[ Line: 348 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
        [3] = u6
        [4] = u15
        [5] = u10
        [6] = u16
        [7] = u9
    --]]
    local v93 = u92.Character
    if v93 ~= nil then
        v93 = v93.PrimaryPart
        if v93 ~= nil then
            v93 = v93.CFrame.Position + Vector3.new(0, 6, 0)
        end
    end
    local u94
    if v93 then
        u94 = CFrame.new(v93)
    else
        u94 = nil
    end
    if not u94 then
        return false
    end
    local v95 = u14:WaitForChild("Items"):WaitForChild(p90)
    local u96 = u20.cloneItemIntoModel(v95):Clone()
    for v97, v98 in u96:GetDescendants() do
        local _ = v97 - 1
        u6:setQueryIgnored(v98, true)
    end
    u96.Parent = u15
    local v99 = u96.PrimaryPart.AssemblyMass
    local v100 = u10
    local v101 = {
        ["Name"] = "AntiGravity"
    }
    local v102 = u15.Gravity * v99
    v101.Force = Vector3.new(0, v102, 0)
    v101.Parent = u96.PrimaryPart
    v100("BodyForce", v101)
    u16(1, u9, function(p103) --[[ Line: 383 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u91
            [3] = u94
            [4] = u96
        --]]
        local v104 = u92.Character
        if v104 ~= nil then
            v104 = v104.PrimaryPart
            if v104 ~= nil then
                v104 = v104.CFrame.Position + Vector3.new(0, 6, 0)
            end
        end
        local v105
        if v104 then
            v105 = CFrame.new(v104)
        else
            v105 = nil
        end
        if v105 ~= nil then
            v105 = v105.Position
        end
        if not v105 then
            return nil
        end
        local v106 = u91:Lerp(u94.Position, p103):Lerp(u94.Position:Lerp(v105, p103), p103)
        u96:PivotTo(CFrame.new(v106) * CFrame.Angles(0, 6.283185307179586 * p103, 0))
    end, 0, 1):Wait()
    local u107 = u92.Character
    if u107 ~= nil then
        u107 = u107.PrimaryPart
        if u107 ~= nil then
            u107 = u107.CFrame
        end
    end
    task.delay(1.1, function() --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u107
            [2] = u96
            [3] = u16
            [4] = u9
            [5] = u92
        --]]
        if not u107 then
            return nil
        end
        local u108 = u96.PrimaryPart.Position
        u16(0.3, u9, function(p109) --[[ Line: 416 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u108
                [3] = u107
                [4] = u96
            --]]
            local v110 = u92.Character
            if v110 ~= nil then
                v110 = v110.PrimaryPart
                if v110 ~= nil then
                    v110 = v110.CFrame
                end
            end
            if v110 ~= nil then
                v110 = v110.Position
            end
            if not v110 then
                return nil
            end
            local v111 = u108:Lerp(u107.Position, p109):Lerp(u107.Position:Lerp(v110, p109), p109)
            u96:PivotTo(CFrame.new(v111) * CFrame.Angles(0, 6.283185307179586 * p109, 0))
        end, 0, 1):Wait()
    end)
    task.delay(1.5, function() --[[ Line: 434 ]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96:Destroy()
    end)
end
v8.CreateController(u25.new())
return nil