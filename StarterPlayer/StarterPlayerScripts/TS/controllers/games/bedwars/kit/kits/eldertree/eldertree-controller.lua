local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v2.StringUtil
local u8 = v2.WatchCollectionTag
local u9 = v2.WatchPlayerCharacter
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.TweenService
local u18 = v13.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u22 = v21.InteractionCategory
local u23 = v21.InteractionPriority
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u31 = {
    u26.BIGMAN_VICTORIOUS_GOLD,
    u26.BIGMAN_VICTORIOUS_PLATINUM,
    u26.BIGMAN_VICTORIOUS_DIAMOND,
    u26.BIGMAN_VICTORIOUS_EMERALD,
    u26.BIGMAN_VICTORIOUS_NIGHTMARE
}
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "EldertreeController"
    end,
    ["__index"] = u30
})
u32.__index = u32
function u32.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u27
    --]]
    u30.constructor(p35, u27.BIGMAN)
    p35.Name = "EldertreeController"
    p35.orbSet = {}
end
function u32.onKitLocalActivated(_, p36) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u10
        [4] = u26
        [5] = u14
    --]]
    p36:GiveTask(u9(u15.LocalPlayer, function(p37, _) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u26
            [3] = u14
        --]]
        if u10.Controllers.KitController:getKitSkin(p37) == u26.BIGMAN_SPIRIT and p37 ~= nil then
            for v38, v39 in p37:WaitForChild("mesh/uppertorso_particle"):GetDescendants() do
                local _ = v38 - 1
                if v39:IsA("ParticleEmitter") then
                    u14:AddTag(v39, "FirstPersonHidden")
                end
            end
        end
    end))
end
function u32.onKitLocalDeactivated(_) --[[ Line: 72 ]] end
function u32.onKitReplicationActivated(u40, u41) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u16
        [3] = u7
        [4] = u4
        [5] = u18
        [6] = u14
        [7] = u12
        [8] = u15
        [9] = u1
        [10] = u8
        [11] = u20
        [12] = u17
        [13] = u29
        [14] = u10
        [15] = u26
        [16] = u31
        [17] = u6
    --]]
    u28.Client:OnEvent("TreeOrbSpawn", function(u42) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u4
            [4] = u40
            [5] = u18
            [6] = u14
            [7] = u12
            [8] = u15
            [9] = u28
            [10] = u1
        --]]
        local v43 = string.split(u42.skin, "_")[#string.split(u42.skin, "_") - 1 + 1]
        local v44 = u16.Assets.Misc:FindFirstChild(u7.capitalizeFirstLetter(v43) .. "TreeOrb")
        local v45 = not v44 and "TreeOrb" or v44.Name
        local u46 = u16:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v45):Clone()
        u46:PivotTo(CFrame.new(u42.position))
        u46:SetAttribute("TreeOrbSecret", u42.treeOrbSecret)
        for _, v47 in u46:GetDescendants() do
            if v47:IsA("BasePart") then
                u4:setQueryIgnored(v47, true)
            end
        end
        u40.orbSet[u46] = true
        u46.Parent = u18
        u14:AddTag(u46, "treeOrb")
        local u48 = u12.new()
        local u49 = u46:GetAttribute("TreeOrbSecret")
        u48:GiveTask(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u46
            --]]
            u40.orbSet[u46] = nil
        end)
        u48:GiveTask(task.spawn(function() --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u42
                [3] = u28
                [4] = u49
                [5] = u48
                [6] = u40
                [7] = u46
            --]]
            while true do
                local v50 = task.wait(0.2)
                if v50 == 0 or (v50 ~= v50 or not v50) then
                    break
                end
                local v51 = u15.LocalPlayer.Character
                if v51 ~= nil then
                    v51 = v51.PrimaryPart
                    if v51 ~= nil then
                        v51 = v51.Position
                    end
                end
                if v51 and (v51 - u42.position).Magnitude < 10 then
                    local v52 = {
                        ["treeOrbSecret"] = u49
                    }
                    if u28.Client:Get("ConsumeTreeOrb"):CallServer(v52) then
                        u48:DoCleaning()
                        u40:collectEffect(u46)
                    end
                end
            end
        end))
        u1.Promise.delay(150):andThen(function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u48
            --]]
            u46:Destroy()
            u48:DoCleaning()
        end)
    end):andThen(function(p53) --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41:GiveTask(p53)
    end)
    u41:GiveTask(u8("treeOrb", function(u54) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u1
            [3] = u20
            [4] = u40
            [5] = u17
            [6] = u29
            [7] = u15
            [8] = u10
            [9] = u26
            [10] = u31
            [11] = u6
        --]]
        local u55 = u12.new()
        u1.Promise.defer(function() --[[ Line: 140 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
                [3] = u20
                [4] = u40
                [5] = u17
            --]]
            local v56 = Instance.new("CFrameValue")
            v56.Value = u54:GetPivot()
            v56.Changed:Connect(function(p57) --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                if u54.PrimaryPart then
                    u54:PivotTo(p57)
                end
            end)
            local u58 = nil
            local u59 = nil
            u55:GiveTask(u20.ElderTreeCollect:connect(function(p60) --[[ Line: 150 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u40
                    [3] = u58
                    [4] = u59
                --]]
                if p60.orb == u54 then
                    u40.orbSet[u54] = nil
                    local v61 = u58
                    if v61 ~= nil then
                        v61:Cancel()
                    end
                    local v62 = u58
                    if v62 ~= nil then
                        v62:Destroy()
                    end
                    local v63 = u59
                    if v63 ~= nil then
                        v63:Cancel()
                    end
                    local v64 = u59
                    if v64 ~= nil then
                        v64:Destroy()
                    end
                end
            end))
            while true do
                local v65 = u54.PrimaryPart
                if v65 then
                    v65 = u40.orbSet[u54] ~= nil
                end
                if not v65 or u40.orbSet[u54] == nil then
                    break
                end
                u58 = u17:Create(v56, TweenInfo.new(2), {
                    ["Value"] = v56.Value + Vector3.new(0, 2, 0)
                })
                u58:Play()
                u58.Completed:Wait()
                if u40.orbSet[u54] == nil then
                    break
                end
                u59 = u17:Create(v56, TweenInfo.new(2), {
                    ["Value"] = v56.Value + Vector3.new(0, -2, 0)
                })
                u59:Play()
                u59.Completed:Wait()
            end
        end)
        local v66 = u29.TREE_ORB_AMBIENT
        local v67 = u15.LocalPlayer.Character
        local v68 = nil
        local v69 = 0.4
        if v67 then
            local v70 = u10.Controllers.KitController:getKitSkin(v67)
            if v70 == u26.BIGMAN_CHRISTMAS then
                v66 = u29.CHRISTMAS_MUSIC
            elseif v70 == u26.BIGMAN_REEF then
                v66 = u29.ELDERREEF_AMBIENT
            elseif table.find(u31, v70) ~= nil then
                v66 = u29.LUCKY_BOX_SHIMMER
                v69 = 0.6
                v68 = 0.5
            end
        end
        if v66 ~= "" then
            local u71 = u6:playSound(v66, {
                ["rollOffMaxDistance"] = 25,
                ["looped"] = true,
                ["position"] = u54:GetPivot().Position,
                ["volumeMultiplier"] = v69,
                ["playbackSpeedMultiplier"] = v68
            })
            u55:GiveTask(function() --[[ Line: 241 ]]
                --[[
                Upvalues:
                    [1] = u71
                --]]
                local v72 = u71
                if v72 ~= nil then
                    v72:Stop()
                end
                local v73 = u71
                if v73 ~= nil then
                    v73:Destroy()
                end
            end)
        end
        u55:GiveTask(u54.AncestryChanged:Connect(function(_, p74) --[[ Line: 252 ]]
            --[[
            Upvalues:
                [1] = u55
            --]]
            if p74 == nil then
                u55:DoCleaning()
            end
        end))
    end))
end
function u32.onKitReplicationDeactivated(_) --[[ Line: 259 ]] end
function u32.onInnateAbilityEnabled(_, _, _) --[[ Line: 261 ]] end
function u32.onAbilityUsed(_, _, _) --[[ Line: 263 ]] end
function u32.createTreeOrbInteraction(_) --[[ Line: 265 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u23
        [4] = u22
        [5] = u15
        [6] = u25
        [7] = u24
        [8] = u29
        [9] = u26
        [10] = u5
        [11] = u6
        [12] = u28
    --]]
    u10.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Consume",
        ["interactionObjectText"] = "Tree Orb",
        ["interactionTag"] = "treeOrb",
        ["holdDuration"] = 0.3,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u3.isMobileControls(),
        ["priority"] = u23.ABILITY,
        ["category"] = u22.ABILITY,
        ["onInteracted"] = function(p75, p76, _) --[[ Name: onInteracted, Line 275 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u25
                [3] = u24
                [4] = u10
                [5] = u29
                [6] = u26
                [7] = u5
                [8] = u6
                [9] = u28
            --]]
            if p75 ~= u15.LocalPlayer then
                return nil
            end
            u25:playAnimation(p75, u24.PUNCH)
            u10.Controllers.ViewmodelController:playAnimation(u24.FP_USE_ITEM)
            local v77 = u29.CROP_HARVEST
            local v78 = p75.Character
            if v78 then
                local v79 = u10.Controllers.KitController:getKitSkin(v78)
                if v79 == u26.BIGMAN_CHRISTMAS then
                    local v80 = {
                        u29.CHRISTMAS_ELDERTREE_PICKUP,
                        u29.CHRISTMAS_ELDERTREE_PICKUP_2,
                        u29.CHRISTMAS_ELDERTREE_PICKUP_3,
                        u29.CHRISTMAS_ELDERTREE_PICKUP_4,
                        u29.CHRISTMAS_ELDERTREE_PICKUP_5
                    }
                    v77 = u5.randomArraySelectN(v80, 1)[1]
                elseif v79 == u26.BIGMAN_WITHERED then
                    v77 = u29.WITHERED_ELDERTREE_PICKUP
                elseif v79 == u26.BIGMAN_REEF then
                    v77 = u29.ELDERREEF_PICKUP
                elseif v79 == u26.BIGMAN_VICTORIOUS_GOLD then
                    v77 = u29.ELDERTREE_VICTORIOUS_GOLD_PICKUP
                elseif v79 == u26.BIGMAN_VICTORIOUS_PLATINUM then
                    v77 = u29.ELDERTREE_VICTORIOUS_PLATINUM_PICKUP
                elseif v79 == u26.BIGMAN_VICTORIOUS_DIAMOND then
                    v77 = u29.ELDERTREE_VICTORIOUS_DIAMOND_PICKUP
                elseif v79 == u26.BIGMAN_VICTORIOUS_EMERALD then
                    v77 = u29.ELDERTREE_VICTORIOUS_EMERALD_PICKUP
                elseif v79 == u26.BIGMAN_VICTORIOUS_NIGHTMARE then
                    v77 = u29.ELDERTREE_VICTORIOUS_NIGHTMARE_PICKUP
                end
            end
            u6:playSound(v77)
            local v81 = {
                ["treeOrbSecret"] = p76:GetAttribute("TreeOrbSecret")
            }
            if u28.Client:Get("ConsumeTreeOrb"):CallServer(v81) then
                p76:Destroy()
            end
        end
    })
end
function u32.collectEffect(_, u82) --[[ Line: 316 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u29
        [4] = u10
        [5] = u26
        [6] = u5
        [7] = u6
        [8] = u19
        [9] = u11
    --]]
    local v83 = u15.LocalPlayer.Character
    if v83 ~= nil then
        v83 = v83.PrimaryPart
        if v83 ~= nil then
            v83 = v83.Position
        end
    end
    if not v83 then
        return nil
    end
    u20.ElderTreeCollect:fire(u82)
    local v84 = u15.LocalPlayer.Character
    local v85 = u29.CROP_HARVEST
    if v84 then
        local v86 = u10.Controllers.KitController:getKitSkin(v84)
        if v86 == u26.BIGMAN_CHRISTMAS then
            local v87 = {
                u29.CHRISTMAS_ELDERTREE_PICKUP,
                u29.CHRISTMAS_ELDERTREE_PICKUP_2,
                u29.CHRISTMAS_ELDERTREE_PICKUP_3,
                u29.CHRISTMAS_ELDERTREE_PICKUP_4,
                u29.CHRISTMAS_ELDERTREE_PICKUP_5
            }
            v85 = u5.randomArraySelectN(v87, 1)[1]
        elseif v86 == u26.BIGMAN_WITHERED then
            v85 = u29.WITHERED_ELDERTREE_PICKUP
        elseif v86 == u26.BIGMAN_REEF then
            v85 = u29.ELDERREEF_PICKUP
        elseif v86 == u26.BIGMAN_VICTORIOUS_GOLD then
            v85 = u29.ELDERTREE_VICTORIOUS_GOLD_PICKUP
        elseif v86 == u26.BIGMAN_VICTORIOUS_PLATINUM then
            v85 = u29.ELDERTREE_VICTORIOUS_PLATINUM_PICKUP
        elseif v86 == u26.BIGMAN_VICTORIOUS_DIAMOND then
            v85 = u29.ELDERTREE_VICTORIOUS_DIAMOND_PICKUP
        elseif v86 == u26.BIGMAN_VICTORIOUS_EMERALD then
            v85 = u29.ELDERTREE_VICTORIOUS_EMERALD_PICKUP
        elseif v86 == u26.BIGMAN_VICTORIOUS_NIGHTMARE then
            v85 = u29.ELDERTREE_VICTORIOUS_NIGHTMARE_PICKUP
        end
    end
    u6:playSound(v85)
    u19(0.25, u11, function(p88) --[[ Line: 353 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82:PivotTo(p88)
    end, u82.PrimaryPart.CFrame, CFrame.new(v83)):Play()
    task.delay(0.25, function() --[[ Line: 356 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82:Destroy()
    end)
end
u10.CreateController(u32.new())
return nil