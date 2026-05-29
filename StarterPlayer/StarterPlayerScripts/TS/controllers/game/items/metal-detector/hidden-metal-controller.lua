local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.ExpireList
local u5 = v2.GameQueryUtil
local u6 = v2.SoundManager
local u7 = v2.WatchCharacterAnimation
local u8 = v2.WatchCollectionTag
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "base-kit-controller").BaseKitController
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u18 = v17.InteractionCategory
local u19 = v17.InteractionPriority
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "HiddenMetalController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u23
        [3] = u4
    --]]
    u16.constructor(p30, u23.METAL_DETECTOR)
    p30.Name = "HiddenMetalController"
    p30.animationPlayingCooldowns = u4.new(2)
end
function u27.onKitLocalActivated(u31, p32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u12
        [4] = u8
        [5] = u9
        [6] = u3
        [7] = u19
        [8] = u18
        [9] = u21
        [10] = u20
        [11] = u6
        [12] = u25
    --]]
    u24.Client:OnEvent("CollectableEntitySpawn", function(p33) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u31
        --]]
        if p33.entityType ~= u22.HIDDEN_METAL then
            return nil
        end
        u31:createLocalModel({
            ["id"] = p33.id,
            ["origin"] = p33.position
        })
    end)
    u24.Client:OnEvent("CollectableEntityRemoved", function(p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v35 = nil
        for v36, v37 in u12:GetTagged("hidden-metal") do
            local _ = v36 - 1
            if v37:GetAttribute("Id") == p34.id == true then
                v35 = v37
                break
            end
        end
        if v35 ~= nil then
            v35:Destroy()
        end
    end)
    p32:GiveTask(u8("hidden-metal", function(p38) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:AddTag(p38, "hidden-metal-prompt")
    end))
    p32:GiveTask(u9.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Collect",
        ["interactionTag"] = "hidden-metal-prompt",
        ["holdDuration"] = 1,
        ["maxActivationDistance"] = 8,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u3.isMobileControls(),
        ["priority"] = u19.ABILITY,
        ["category"] = u18.ABILITY,
        ["onInteracted"] = function(p39, p40, _) --[[ Name: onInteracted, Line 90 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u20
                [3] = u6
                [4] = u25
                [5] = u24
            --]]
            local v41 = p40:GetAttribute("Id")
            if v41 == nil then
                return nil
            end
            u21:playAnimation(p39, u20.SHOVEL_DIG)
            u6:playSound(u25.SNAP_TRAP_CONSUME_MARK)
            u24.Client:Get("CollectCollectableEntity"):SendToServer({
                ["id"] = v41
            })
        end
    }))
end
function u27.onKitLocalDeactivated(_) --[[ Line: 103 ]] end
function u27.onKitReplicationActivated(u42, p43) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u20
        [4] = u13
        [5] = u14
        [6] = u26
    --]]
    p43:GiveTask(u7({ u21:getAssetId(u20.SHOVEL_DIG) }, function(p44, u45) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u13
            [3] = u14
            [4] = u26
        --]]
        local v46 = p44.Character
        if not v46 then
            return nil
        end
        if u42.animationPlayingCooldowns:has(p44.UserId) and p44.UserId ~= u13.LocalPlayer.UserId then
            return nil
        end
        u42.animationPlayingCooldowns:add(p44.UserId)
        local u47 = u14.Assets.Effects.Shovel:Clone()
        u47.Parent = v46
        u26:weldCharacterAccessories(v46)
        local u48 = v46:FindFirstChild("metal_detector")
        if u48 then
            for _, v49 in u48:GetChildren() do
                if v49:IsA("BasePart") then
                    v49.Transparency = 1
                end
            end
        end
        u45.Stopped:Connect(function() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u45
            --]]
            u47:Destroy()
            u45:Destroy()
        end)
        u45.Destroying:Connect(function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u48
            --]]
            u47:Destroy()
            if u48 then
                for _, v50 in u48:GetChildren() do
                    if v50:IsA("BasePart") then
                        v50.Transparency = 0
                    end
                end
            end
        end)
    end))
end
function u27.onKitReplicationDeactivated(_) --[[ Line: 142 ]] end
function u27.onInnateAbilityEnabled(_, _, _) --[[ Line: 144 ]] end
function u27.onAbilityUsed(_, _, _) --[[ Line: 146 ]] end
function u27.KnitStart(p51) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p51)
end
function u27.createLocalModel(_, p52) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u5
        [4] = u12
    --]]
    local v53 = u10("Model", {})
    v53.PrimaryPart = u10("Part", {
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["Parent"] = v53
    })
    v53.Parent = u15
    v53:PivotTo(CFrame.new(p52.origin))
    v53:SetAttribute("Id", p52.id)
    for _, v54 in v53:GetDescendants() do
        if v54:IsA("BasePart") then
            u5:setQueryIgnored(v54, true)
        end
    end
    u12:AddTag(v53, "hidden-metal")
    return v53
end
u9.CreateController(u27.new())
return nil