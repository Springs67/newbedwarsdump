local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local u5 = v3.GameQueryUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Lighting
local u17 = v15.Players
local u18 = v15.TweenService
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = u1.import(script, script.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "crop", "crop-meta").getCropConfig
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "CropController"
    end,
    ["__index"] = u21
})
u33.__index = u33
function u33.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.constructor(p36)
    p36.Name = "CropController"
end
function u33.KnitStart(u37) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u19
        [3] = u11
        [4] = u25
        [5] = u2
        [6] = u29
        [7] = u17
        [8] = u30
        [9] = u7
        [10] = u31
        [11] = u13
        [12] = u16
        [13] = u5
        [14] = u14
        [15] = u4
        [16] = u20
        [17] = u18
        [18] = u1
        [19] = u24
        [20] = u32
        [21] = u9
        [22] = u12
        [23] = u28
        [24] = u10
        [25] = u23
        [26] = u22
        [27] = u27
        [28] = u6
        [29] = u26
    --]]
    u21.KnitStart(u37)
    u19.PlaceBlock:setPriority(u11.HIGHEST):connect(function(p38) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u2
            [3] = u29
        --]]
        if not u25(p38.blockType) then
            return nil
        end
        local v39 = u2:getStore():getBlockAt(p38.blockPosition - Vector3.new(0, 1, 0))
        if not v39 then
            p38:setCancelled(true)
            return nil
        end
        if u25(v39.Name) then
            p38:setCancelled(true)
        end
        if v39.Name == u29.BED then
            p38:setCancelled(true)
        end
    end)
    u19.DamageBlock:connect(function(p40) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u37
            [3] = u17
        --]]
        local v41 = u2:getStore():getBlockAt(p40.blockPosition)
        if v41 and not u37:canBreakCrop(u17.LocalPlayer, v41) then
            p40:setCancelled(true)
            return nil
        end
    end)
    u30.Client:WaitFor("HarvestCrop"):andThen(function(p42) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u2
            [3] = u7
            [4] = u31
            [5] = u13
            [6] = u16
            [7] = u5
            [8] = u14
            [9] = u4
            [10] = u20
            [11] = u18
            [12] = u1
        --]]
        p42:Connect(function(p43) --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u2
                [3] = u7
                [4] = u31
                [5] = u13
                [6] = u16
                [7] = u5
                [8] = u14
                [9] = u4
                [10] = u20
                [11] = u18
                [12] = u1
            --]]
            if u17.LocalPlayer.Character and u17.LocalPlayer:DistanceFromCharacter(u2:getWorldPosition(p43.blockPosition)) <= 100 then
                local v44 = p43.floatEffectItem or p43.itemType
                local v45 = u2:getWorldPosition(p43.blockPosition)
                if p43.player ~= u17.LocalPlayer then
                    u7:playSound(u31.CROP_HARVEST, {
                        ["position"] = v45
                    })
                end
                local v46 = u13("Part", {
                    ["Name"] = "HarvestCropFloatEffect",
                    ["Size"] = Vector3.new(1, 1, 1),
                    ["Transparency"] = 1,
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["CFrame"] = CFrame.new(v45),
                    ["Parent"] = u16
                })
                u5:setQueryIgnored(v46, true)
                local u47 = u14.createRef()
                local u48 = u14.mount(u14.createElement("BillboardGui", {
                    [u14.Ref] = u47,
                    ["Adornee"] = v46,
                    ["Size"] = UDim2.fromScale(2.5, 2.5),
                    ["LightInfluence"] = 0
                }, { u14.createElement(u4, {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }, { u14.createElement(u20, {
                            ["ItemType"] = v44
                        }) }) }), u17.LocalPlayer:WaitForChild("PlayerGui"))
                u18:Create(u47:getValue(), TweenInfo.new(0.7), {
                    ["StudsOffsetWorldSpace"] = Vector3.new(0, 3.2, 0)
                }):Play()
                u1.Promise.delay(0.5):andThen(function() --[[ Line: 129 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u47
                    --]]
                    u18:Create(u47:getValue(), TweenInfo.new(0.2), {
                        ["Size"] = UDim2.fromScale(0, 0)
                    }):Play()
                end)
                u1.Promise.delay(1.5):andThen(function() --[[ Line: 136 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u48
                    --]]
                    u14.unmount(u48)
                end)
            end
        end)
    end)
    u24("HarvestableCrop", function(u49) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u25
            [3] = u32
            [4] = u9
            [5] = u12
            [6] = u28
            [7] = u10
            [8] = u23
            [9] = u22
            [10] = u29
            [11] = u31
            [12] = u27
            [13] = u6
            [14] = u7
            [15] = u26
            [16] = u30
            [17] = u2
        --]]
        local v50 = u17:GetPlayerByUserId((u49:GetAttribute("PlacedByUserId")))
        local v51 = u25(u49.Name)
        local v52
        if v51 == nil then
            v52 = v51
        else
            v52 = v51.requireKit
        end
        if v52 and not u32(u17.LocalPlayer, v51.requireKit) then
            return nil
        end
        local v53 = u9.Controllers.TeamController:getPlayerTeam(u17.LocalPlayer)
        local v54
        if v50 == nil then
            v54 = nil
        else
            v54 = u9.Controllers.TeamController:getPlayerTeam(v50)
        end
        if v54 ~= v53 then
            return nil
        end
        if v51 ~= nil then
            v51 = v51.disableTeammatePickup
        end
        if v51 and v50 ~= u17.LocalPlayer then
            return nil
        end
        local v55 = u12.new()
        local v56 = u28(u49.Name)
        v55:GiveTask(u10.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Harvest",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["ObjectText"] = v56.displayName,
            ["Parent"] = u49
        }).Triggered:Connect(function(p57) --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u22
                [3] = u49
                [4] = u29
                [5] = u31
                [6] = u9
                [7] = u27
                [8] = u6
                [9] = u7
                [10] = u26
                [11] = u30
                [12] = u2
            --]]
            u23:playAnimation(p57, u22.PUNCH)
            if u49.Name == u29.CHICKEN_EGG_BLOCK then
                local v58 = u31.CHICKEN_ATTACK_1
                if p57 then
                    local v59 = u27[u9.Controllers.KitController:getKitSkin(p57)].taliyah
                    local v60
                    if v59 == nil then
                        v60 = v59
                    else
                        v60 = v59.entity
                        if v60 ~= nil then
                            v60 = v60.sounds
                            if v60 ~= nil then
                                v60 = v60.attack
                            end
                        end
                    end
                    if v60 then
                        local v61 = u6.fromList
                        local v62 = v59.entity.sounds.attack
                        v58 = v61(unpack(v62))
                    end
                end
                u7:playSound(v58)
            elseif u49:GetAttribute("CropKitSkin") == u26.FARMER_CLETUS_VALENTINE then
                u7:playSound(u31.VALENTINE_CROP_HARVEST)
            else
                u7:playSound(u31.CROP_HARVEST)
            end
            u30.Client:Get("CropHarvest"):CallServer({
                ["position"] = u2:getBlockPosition(u49.Position)
            })
        end))
    end)
end
function u33.canBreakCrop(_, p63, p64) --[[ Line: 220 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u17
        [3] = u9
    --]]
    if u25(p64.Name) then
        local v65 = p64:GetAttribute("PlacedByUserId")
        local v66 = v65 ~= 0 and (v65 == v65 and (v65 and u17:GetPlayerByUserId(v65)))
        if v66 then
            return u9.Controllers.TeamController:getPlayerTeam(v66) ~= u9.Controllers.TeamController:getPlayerTeam(p63) and true or p63.UserId == v65
        end
    end
    return true
end
return {
    ["CropController"] = u9.CreateController(u33.new())
}