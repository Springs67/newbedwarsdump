local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.RunService
local u18 = v14.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-meta")
local u27 = v26.TRAVELING_MERCHANT_ITEM_ATTRIBUTE
local u28 = v26.TRAVELING_MERCHANT_ITEM_TAG
local u29 = v26.TRAVELING_MERCHANT_OPEN_ATTRIBUTE
local u30 = v26.TRAVELING_MERCHANT_WAGON_TAG
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u33 = v1.import(script, script.Parent, "ui", "countdown", "traveling-merchant-unlock-countdown").TravelingMerchantUnlockCountdown
local u34 = v1.import(script, script.Parent, "ui", "item", "traveling-merchant-item").TravelingMerchantItemPopup
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "TravelingMerchantController"
    end,
    ["__index"] = u20
})
u35.__index = u35
function u35.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u25
    --]]
    u20.constructor(p38)
    p38.Name = "TravelingMerchantController"
    p38.merchantActive = false
    p38.shopOpen = false
    p38.cleanupMap = {}
    p38.billboardMap = {}
    p38.purchaseRequestRemote = u25.Client:Get("TravelingMerchantPurchaseRequest")
end
function u35.KnitStart(u39) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u6
        [3] = u30
        [4] = u28
        [5] = u27
        [6] = u31
        [7] = u19
    --]]
    u20.KnitStart(u39)
    u6(u30, function(p40) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39.merchantInstance = p40
        u39:handleWagonSpawn(p40)
        u39:createPurchasePrompt()
    end)
    u6(u28, function(p41) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u31
            [3] = u39
        --]]
        local u42 = u31:getShopItemByItemType((p41:GetAttribute(u27)))
        if not u42 then
            return nil
        end
        if not u39.shopOpen then
            u39.shopOpen = true
            u39:handleShopOpen()
        end
        u39:handleWagonItemSpawn(u42, p41)
        p41.AncestryChanged:Connect(function(_, p43) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u42
            --]]
            if p43 == nil then
                u39:handleWagonItemDespawn(u42)
            end
        end)
    end)
    u19.TravelingMerchantBillboardMounted:connect(function(p44) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39.billboardMap[p44.merchantItem] = p44.billboard
    end)
    u39:handleItemSelection()
end
function u35.handleWagonSpawn(p45, u46) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u18
        [3] = u13
        [4] = u33
        [5] = u15
        [6] = u12
        [7] = u4
        [8] = u22
        [9] = u21
    --]]
    p45.merchantActive = true
    local v47 = u46:GetAttribute(u29)
    if v47 ~= nil then
        local v48 = v47 - u18:GetServerTimeNow()
        if v48 > 10 then
            local u49 = u13.mount(u13.createElement(u33, {
                ["shopOpensIn"] = v48,
                ["wagonInstance"] = u46
            }), u15.LocalPlayer:WaitForChild("PlayerGui"))
            task.delay(v48 + 0.5, function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u49
                --]]
                return u13.unmount(u49)
            end)
        end
    end
    task.delay(5, function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u12
            [3] = u4
            [4] = u22
            [5] = u21
        --]]
        local v50 = u46:WaitForChild("TravelingMerchantNPC")
        local v51 = u46:WaitForChild("TravelingMerchantNPC"):WaitForChild("Humanoid")
        if not u46:FindFirstChildWhichIsA("Animator") then
            u12("Animator", {
                ["Parent"] = v51
            })
        end
        u4:playAnimation(v50, u22:getAssetId(u21.MERCHANT_IDLE))
    end)
end
function u35.handleShopOpen(p52) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u22
        [3] = u21
    --]]
    if not p52.merchantInstance then
        return nil
    end
    local v53 = u4:playAnimation(p52.merchantInstance, u22:getAssetId(u21.MERCHANT_WAGON_IDLE))
    if v53 then
        v53:AdjustSpeed(0.5)
    end
end
function u35.createPurchasePrompt(u54) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u4
        [4] = u22
        [5] = u21
        [6] = u31
        [7] = u5
        [8] = u2
    --]]
    u54.purchasePrompt = u9.Controllers.ProximityPromptController:createProximityPrompt({
        ["Name"] = "TravelingMerchantPurchasePrompt",
        ["Enabled"] = false,
        ["HoldDuration"] = 1.5,
        ["RequiresLineOfSight"] = false,
        ["ObjectText"] = "itemName",
        ["ActionText"] = "Buy",
        ["UIOffset"] = Vector2.new(0, -80)
    })
    u54.purchasePrompt.Triggered:Connect(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u12
            [3] = u4
            [4] = u22
            [5] = u21
            [6] = u31
            [7] = u5
            [8] = u2
        --]]
        if u54.selectedItem then
            u54.purchaseRequestRemote:CallServerAsync({
                ["merchantItem"] = u54.selectedItem
            }):andThen(function(p55) --[[ Line: 165 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u12
                    [3] = u4
                    [4] = u22
                    [5] = u21
                    [6] = u31
                    [7] = u5
                    [8] = u2
                --]]
                if p55 then
                    if u54.merchantInstance then
                        local v56 = u54.merchantInstance:WaitForChild("TravelingMerchantNPC")
                        local v57 = u54.merchantInstance:WaitForChild("TravelingMerchantNPC"):WaitForChild("Humanoid")
                        if not u54.merchantInstance:FindFirstChildWhichIsA("Animator") then
                            u12("Animator", {
                                ["Parent"] = v57
                            })
                        end
                        u4:playAnimation(v56, u22:getAssetId(u21.MERCHANT_PURCHASE))
                    end
                    if u54.selectedItem then
                        u5:playSound(u31:getPurchaseSoundForRarity(u54.selectedItem.rarity), {
                            ["position"] = nil
                        })
                        return
                    end
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "Failed to complete purchase."
                    })
                end
            end)
        end
    end)
end
function u35.handleWagonItemSpawn(p58, p59, u60) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u34
        [4] = u15
        [5] = u17
        [6] = u18
        [7] = u23
        [8] = u16
        [9] = u31
        [10] = u32
    --]]
    local v61 = u11.new()
    local u62 = u13.mount(u13.createElement(u34, {
        ["merchantItem"] = p59,
        ["merchantItemInstance"] = u60
    }), u15.LocalPlayer:WaitForChild("PlayerGui"))
    v61:GiveTask(function() --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u62
        --]]
        return u13.unmount(u62)
    end)
    v61:GiveTask(u17.Heartbeat:Connect(function(p63) --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u18
            [3] = u23
        --]]
        if u60.Parent == nil then
            return nil
        end
        local v64 = u18.CurrentCamera
        if v64 ~= nil then
            v64 = v64.CFrame
        end
        if not v64 then
            return nil
        end
        if (v64.Position - u60.Position).Magnitude > 40 * u23 then
            return nil
        end
        debug.profilebegin("traveling-merchant-inventory")
        local v65 = u60.Orientation
        local v66 = u60
        local v67 = v65.X
        local v68 = v65.Y + p63 * 25
        local v69 = v65.Z
        v66.Orientation = Vector3.new(v67, v68, v69)
        for v70, v71 in u60:GetDescendants() do
            local _ = v70 - 1
            if v71.Parent ~= nil then
                if v71:IsA("BasePart") then
                    local v72 = v71.Orientation
                    local v73 = v72.X
                    local v74 = v72.Y + p63 * 25
                    local v75 = v72.Z
                    v71.Orientation = Vector3.new(v73, v74, v75)
                end
            end
        end
        debug.profileend()
    end))
    local v76 = u16.Assets.Effects.TravelingMerchantItemEffect:Clone()
    local v77 = u31:getRarityColor(p59.rarity)
    v76.Root.Particle.RarityRing.Color = ColorSequence.new(v77)
    v76:PivotTo(u60.CFrame - Vector3.new(0, 0.5, 0))
    v76.Parent = u18
    u32:playEffects({ v76 }, nil)
    v61:GiveTask(v76)
    p58.cleanupMap[p59] = v61
end
function u35.handleWagonItemDespawn(p78, p79) --[[ Line: 257 ]]
    local v80 = p78.cleanupMap[p79]
    if v80 then
        v80:DoCleaning()
        p78.cleanupMap[p79] = nil
    end
    p78.billboardMap[p79] = nil
end
function u35.handleItemSelection(u81) --[[ Line: 272 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u24
    --]]
    task.spawn(function() --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u81
            [3] = u10
            [4] = u24
        --]]
        while true do
            local v82 = u15.LocalPlayer.Character
            if v82 ~= nil then
                v82 = v82:GetPivot().Position
            end
            if u81.merchantActive and (v82 and u81.purchasePrompt) then
                local v83 = u10.keys(u81.billboardMap)
                local v84 = nil
                local v85 = nil
                local v86 = (1 / 0)
                local v87 = nil
                local v88 = v87
                local v89 = v84
                local v90 = v85
                local v91 = v86
                for v92, v93 in v83 do
                    local _ = v92 - 1
                    local v94 = u81.billboardMap[v93]
                    if v94 then
                        local v95 = v94.Adornee
                        local v96 = (v95.Position - v82).Magnitude
                        if v96 <= 6 and v96 < v91 then
                            v84 = v94
                            v85 = v93
                            v86 = v96
                            v87 = v95
                            v88 = v87
                            v89 = v84
                            v90 = v85
                            v91 = v86
                        end
                    end
                end
                if v90 and v89 then
                    if u81.enabledBillboard then
                        u81.enabledBillboard.Enabled = false
                        u81.enabledBillboard = nil
                    end
                    u81.selectedItem = v90
                    v89.Enabled = true
                    u81.enabledBillboard = v89
                    if u81.purchasePrompt.Parent ~= v88 then
                        u81.purchasePrompt.ObjectText = u24(v90.item).displayName
                        u81.purchasePrompt.Parent = nil
                        u81.purchasePrompt.Parent = v88
                        u81.purchasePrompt.Enabled = false
                        u81.purchasePrompt.Enabled = true
                    end
                else
                    if u81.enabledBillboard then
                        u81.enabledBillboard.Enabled = false
                        u81.enabledBillboard = nil
                    end
                    if u81.purchasePrompt then
                        u81.purchasePrompt.Parent = nil
                        u81.purchasePrompt.Enabled = false
                    end
                    if u81.selectedItem then
                        u81.selectedItem = nil
                    end
                end
            end
            task.wait(0.2)
        end
    end)
end
v8.CreateController(u35.new())
return nil