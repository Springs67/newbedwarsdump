local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local v24 = {}
local u25 = setmetatable({}, {
    ["__index"] = v24
})
u25.Red = 0
v24[0] = "Red"
u25.Orange = 1
v24[1] = "Orange"
u25.Yellow = 2
v24[2] = "Yellow"
u25.Green = 3
v24[3] = "Green"
u25.Blue = 4
v24[4] = "Blue"
u25.Indigo = 5
v24[5] = "Indigo"
u25.Violet = 6
v24[6] = "Violet"
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "RainbowAxeController"
    end,
    ["__index"] = u14
})
u26.__index = u26
function u26.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p29)
    p29.Name = "RainbowAxeController"
    p29.axeTargetMap = {}
    p29.prismModelMap = {}
    p29.prismCountMap = {}
end
function u26.KnitStart(u30) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u15
        [4] = u10
        [5] = u5
        [6] = u17
        [7] = u16
        [8] = u6
        [9] = u22
        [10] = u12
        [11] = u18
        [12] = u21
        [13] = u11
        [14] = u23
        [15] = u9
    --]]
    u14.KnitStart(u30)
    u13.AbilityUsed:connect(function(p31) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u10
            [3] = u5
            [4] = u17
            [5] = u16
            [6] = u6
            [7] = u22
            [8] = u30
            [9] = u12
            [10] = u18
        --]]
        if p31.ability == u15.RAINBOW_AXE then
            local v32 = u10:GetPlayerFromCharacter(p31.userCharacter)
            if not v32 then
                return nil
            end
            if v32 == u10.LocalPlayer then
                u5:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.WINTER_BOSS_RAISE_AXE))
                u6:playSound(u22.RAINBOW_AXE_ABILITY)
            end
            local v33 = u30.axeTargetMap[v32]
            if not v33 then
                return nil
            end
            for _, u34 in v33 do
                task.spawn(function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u34
                        [3] = u12
                        [4] = u18
                    --]]
                    local v35 = u30.prismModelMap[u34]
                    if not v35 then
                        return nil
                    end
                    local v36 = u30.prismCountMap[u34]
                    if v36 == 0 or (v36 ~= v36 or not v36) then
                        return nil
                    end
                    local v37 = v35:WaitForChild("Handle")
                    local v38 = u30:returnPrismColorNames(v36)
                    local v39 = false
                    local v40 = 0
                    while true do
                        if v39 then
                            v40 = v40 + 1
                        else
                            v39 = true
                        end
                        if v40 >= #v38 then
                            v35:Destroy()
                            u30.prismModelMap[u34] = nil
                            u30.prismCountMap[u34] = nil
                            return
                        end
                        for _, v41 in v37:GetDescendants() do
                            if v41:IsA("MeshPart") and v41.Name == v38[v40 + 1] then
                                u12:Create(v41, TweenInfo.new(u18.RAINBOW_AXE_PRISM_INTERVAL - 0.05), {
                                    ["Transparency"] = 1
                                }):Play()
                                local v42 = v41:WaitForChild("Beam")
                                if v42 then
                                    v42.Enabled = false
                                end
                                task.wait(u18.RAINBOW_AXE_PRISM_INTERVAL - 0.05)
                            end
                        end
                    end
                end)
            end
            u30.axeTargetMap[v32] = nil
        end
    end)
    u21.Client:Get("EntityDeathEvent"):Connect(function(p43) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        if u30.prismCountMap[p43.entityInstance] ~= nil then
            u30.prismCountMap[p43.entityInstance] = nil
        end
        if u30.prismModelMap[p43.entityInstance] ~= nil then
            u30.prismModelMap[p43.entityInstance] = nil
        end
        for _, v44 in u30.axeTargetMap do
            local v45 = p43.entityInstance
            if table.find(v44, v45) ~= nil then
                local v46 = p43.entityInstance
                local v47 = (table.find(v44, v46) or 0) - 1
                table.remove(v44, v47 + 1)
            end
        end
    end)
    u21.Client:OnEvent("AddRainbowPrism", function(p48) --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u11
            [3] = u23
            [4] = u10
            [5] = u9
            [6] = u12
        --]]
        u30.prismCountMap[p48.targetEntity] = p48.prismCount
        local v49 = u30.prismModelMap[p48.targetEntity]
        if v49 == nil then
            v49 = u11.Assets.Misc.RainbowAxePrisms:Clone()
            u30.prismModelMap[p48.targetEntity] = v49
            for v50, v51 in v49:WaitForChild("Handle"):GetDescendants() do
                local _ = v50 - 1
                if v51:IsA("BasePart") then
                    v51.Transparency = 1
                elseif v51:IsA("Beam") then
                    v51.Enabled = false
                end
            end
            p48.targetEntity.Humanoid:AddAccessory(v49)
            v49.Parent = p48.targetEntity
            u23:weldCharacterAccessories(p48.targetEntity)
            if p48.targetEntity == u10.LocalPlayer.Character then
                u9:AddTag(v49, "FirstPersonHidden")
            end
        end
        local v52 = v49:WaitForChild("Handle")
        local v53 = u30:returnPrismColorNames(p48.prismCount)
        local v54 = #v53
        local u55 = v53[v54]
        v53[v54] = nil
        local v56 = v52:GetDescendants()
        local function v59(p57) --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u12
            --]]
            if p57:IsA("MeshPart") and p57.Name == u55 then
                u12:Create(p57, TweenInfo.new(0.6), {
                    ["Transparency"] = 0.25
                }):Play()
                local v58 = p57:WaitForChild("Beam")
                if v58 then
                    v58.Enabled = true
                end
            end
        end
        for v60, v61 in v56 do
            v59(v61, v60 - 1, v56)
        end
        local v62 = u30.axeTargetMap[p48.fromPlayer]
        local v63 = v62 == nil and {} or v62
        local v64 = p48.targetEntity
        if table.find(v63, v64) == nil then
            local v65 = p48.targetEntity
            table.insert(v63, v65)
            u30.axeTargetMap[p48.fromPlayer] = v63
        end
    end)
end
function u26.returnPrismColorNames(_, p66) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v67 = false
    local v68 = 0
    local v69 = {}
    while true do
        if v67 then
            v68 = v68 + 1
        else
            v67 = true
        end
        if v68 >= p66 then
            return v69
        end
        local v70 = u25[v68]
        table.insert(v69, v70)
    end
end
function u26.isRelevantItem(_, p71) --[[ Line: 256 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return p71.itemType == u20.RAINBOW_AXE
end
function u26.onEnable(p72, _, _) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u19
        [4] = u4
    --]]
    p72:setupDestroyableYield(function() --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u19
            [4] = u4
        --]]
        local v73 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v74 = u15.RAINBOW_AXE
        local v75 = {
            ["abilityType"] = "ItemPrimary"
        }
        local v76 = {
            ["icon"] = u19.CLOUD_ENCHANT,
            ["stateColors"] = {
                [u4.READY] = Color3.fromRGB(247, 133, 212)
            }
        }
        v75.abilityButton = v76
        return v73:enableAbility(v74, v75):expect()
    end)
end
function u26.onDisable(_) --[[ Line: 272 ]] end
v7.CreateController(u26.new())
return nil