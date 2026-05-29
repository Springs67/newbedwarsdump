local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ExpireList
local u6 = v3.SoundManager
local u7 = v3.WatchCharacterAnimation
local u8 = v3.WatchCollectionTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-loot-table").TimeToMakeSnowCone
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-machine-state").SnowConeMachineState
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = v1.import(script, script.Parent, "snow-cone-queue-ui").SnowConeQueueUI
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "SnowConeMachineController"
    end,
    ["__index"] = u18
})
u33.__index = u33
function u33.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u5
    --]]
    u18.constructor(p36)
    p36.Name = "SnowConeMachineController"
    p36.upgradeCooldowns = u5.new(2)
    p36.isPreloaded = false
end
function u33.KnitStart(u37) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u26
        [3] = u8
        [4] = u10
        [5] = u20
        [6] = u11
        [7] = u22
        [8] = u4
        [9] = u19
        [10] = u2
        [11] = u24
        [12] = u25
        [13] = u12
        [14] = u21
        [15] = u16
        [16] = u17
        [17] = u30
        [18] = u27
        [19] = u28
        [20] = u6
        [21] = u29
        [22] = u7
        [23] = u23
        [24] = u31
    --]]
    u18.KnitStart(u37)
    u26.Client:Get("MakeSnowCone")
    local u38 = u26.Client:Get("RepairSnowConeMachine")
    u8("BrokenSnowConeMachine", function(u39) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u10
            [3] = u20
            [4] = u11
            [5] = u22
            [6] = u4
            [7] = u19
            [8] = u2
            [9] = u24
            [10] = u25
            [11] = u12
            [12] = u21
            [13] = u16
            [14] = u38
        --]]
        if not u37.isPreloaded then
            u10.Controllers.PreloadController:runPreload({
                ["animations"] = { u20.REPAIR_SNOW_CONE_MACHINE }
            })
            u37.isPreloaded = true
        end
        local v40 = u11.Controllers.ProximityPromptController
        local v41 = {
            ["ObjectText"] = "Repair Snow Cone Machine",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["HoldDuration"] = 3.68,
            ["Parent"] = u39
        }
        local v42 = u22.RepairSnowConeMachinePrice
        v41.ActionText = tostring(v42) .. " Diamonds"
        v41.ClickablePrompt = u4.isMobileControls()
        local u43 = v40:createProximityPrompt(v41)
        u43.PromptButtonHoldBegan:Connect(function(p44) --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u19
                [3] = u43
                [4] = u2
                [5] = u24
                [6] = u25
                [7] = u22
                [8] = u12
                [9] = u21
                [10] = u16
                [11] = u20
            --]]
            local v45 = u39:GetAttribute("Team")
            local v46 = u19:getState().Game.myTeam
            if v46 ~= nil then
                v46 = v46.id
            end
            if v45 ~= v46 then
                u43:InputHoldEnd()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You can only repair your team\'s Snow Cone Machine."
                })
                return nil
            end
            if not u24.hasEnough(p44, u25.DIAMOND, u22.RepairSnowConeMachinePrice) then
                u43:InputHoldEnd()
                local v47 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v48 = {}
                local v49 = u22.RepairSnowConeMachinePrice
                v48.message = "You need " .. tostring(v49) .. " diamonds to repair the Snow Cone Machine."
                v47:sendErrorNotification(v48)
                return nil
            end
            local u50 = u12.new()
            local u51 = u21:playAnimation(u16.LocalPlayer, u20.REPAIR_SNOW_CONE_MACHINE)
            u50:GiveTask(function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u51
                --]]
                local v52 = u51
                if v52 ~= nil then
                    v52:Stop()
                end
                local v53 = u51
                if v53 ~= nil then
                    v53:Destroy()
                end
            end)
            u43.PromptButtonHoldEnded:Connect(function() --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50:DoCleaning()
            end)
        end)
        u43.Triggered:Connect(function(_) --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u39
            --]]
            u38:CallServer(u39)
        end)
    end)
    u8("SnowConeMachine", function(u54) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u37
            [3] = u30
            [4] = u11
            [5] = u4
            [6] = u19
            [7] = u16
            [8] = u12
            [9] = u27
            [10] = u28
            [11] = u6
            [12] = u29
        --]]
        local u55 = u17.Assets.Effects.SnowBlast:Clone()
        u55.Parent = u54
        u55.Position = u54.Position + Vector3.new(0, 2.75, 0)
        u37:hookSnowConeQueueBillboard(u54)
        task.spawn(function() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u55
            --]]
            u30:playEffects(u55:GetChildren(), nil, {
                ["destroyAfterSec"] = 3,
                ["sizeMultiplier"] = 2
            })
        end)
        local v56 = u11.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "1 Emerald",
            ["ObjectText"] = "Make Snow Cone",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["HoldDuration"] = 0.5,
            ["Parent"] = u54,
            ["ClickablePrompt"] = u4.isMobileControls()
        })
        local v57 = u54:GetAttribute("Team")
        local v58 = u19:getState().Game.myTeam
        if v58 ~= nil then
            v58 = v58.id
        end
        if v57 ~= v58 then
            v56.Enabled = false
        end
        v56.Triggered:Connect(function(p59) --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u37
                [3] = u54
            --]]
            if p59 ~= u16.LocalPlayer then
                return nil
            end
            u37:makeSnowCone(u54)
        end)
        local u60 = u12.new()
        u54:GetAttributeChangedSignal("SnowConeMachineState"):Connect(function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u27
                [3] = u60
                [4] = u28
                [5] = u6
                [6] = u29
            --]]
            local v61 = u54:GetAttribute("SnowConeMachineState")
            local v62 = u54:FindFirstChild("Model")
            if v62 ~= nil then
                v62 = v62:FindFirstChild("Button")
            end
            if not v62 then
                return nil
            end
            local v63 = u27 / 10
            u60:DoCleaning()
            if v61 == u28.GENERATING then
                task.spawn(function() --[[ Line: 167 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u29
                        [3] = u54
                        [4] = u60
                    --]]
                    local u64 = u6:playSound(u29.SNOW_CONE_MACHINE_MAKING, {
                        ["rollOffMaxDistance"] = 100,
                        ["looped"] = true,
                        ["position"] = u54.Position
                    })
                    u60:GiveTask(function() --[[ Line: 173 ]]
                        --[[
                        Upvalues:
                            [1] = u64
                        --]]
                        local v65 = u64
                        if v65 ~= nil then
                            v65:Stop()
                        end
                        local v66 = u64
                        if v66 ~= nil then
                            v66:Destroy()
                        end
                    end)
                    local v67 = u54:FindFirstChild("SpiralTrailBW")
                    if v67 then
                        local u68 = require(v67)
                        task.spawn(function() --[[ Line: 186 ]]
                            --[[
                            Upvalues:
                                [1] = u68
                                [2] = u54
                            --]]
                            u68:Init(u54, {
                                ["Size"] = 0.15,
                                ["Offset"] = 0.065,
                                ["Frequency"] = 1,
                                ["Color"] = Color3.fromRGB(135, 177, 255)
                            })
                        end)
                    end
                end)
                local v69 = false
                local v70 = 0
                local v71 = true
                while true do
                    if true then
                        if v69 then
                            v70 = v70 + 1
                        else
                            v69 = true
                        end
                    end
                    if v70 >= 10 then
                        break
                    end
                    if v71 then
                        v62.Color = Color3.fromRGB(105, 237, 112)
                        v62.Material = Enum.Material.Neon
                        v62.Transparency = 0
                    else
                        v62.Color = Color3.fromRGB(255, 255, 255)
                        v62.Material = Enum.Material.Neon
                        v62.Transparency = 0.5
                    end
                    task.wait(v63)
                    v71 = not v71
                end
            else
                v62.Color = Color3.fromRGB(85, 159, 255)
                v62.Material = Enum.Material.SmoothPlastic
                v62.Transparency = 0.2
            end
        end)
    end)
    u7({ u21:getAssetId(u20.REPAIR_SNOW_CONE_MACHINE) }, function(p72, p73) --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u16
            [3] = u23
            [4] = u12
            [5] = u17
            [6] = u31
            [7] = u30
            [8] = u6
            [9] = u29
        --]]
        local u74 = p72.Character
        if not u74 then
            return nil
        end
        if u37.upgradeCooldowns:has(p72.UserId) and p72.UserId ~= u16.LocalPlayer.UserId then
            return nil
        end
        u37.upgradeCooldowns:add(p72.UserId)
        local v75 = u23:getEntity(p72)
        if not v75 then
            return nil
        end
        if not u74.PrimaryPart then
            return nil
        end
        local v76 = u74.PrimaryPart.Position
        if not v76 then
            return nil
        end
        local u77 = u37:getClosestBrokenSnowConeMachine(v76)
        if not u77 then
            return nil
        end
        local u78 = u12.new()
        local v79 = v75:getItemInHandClient()
        if v79 then
            for _, u80 in v79:GetDescendants() do
                if u80:IsA("BasePart") then
                    local u81 = u80.Transparency
                    u80.Transparency = 1
                    u78:GiveTask(function() --[[ Line: 273 ]]
                        --[[
                        Upvalues:
                            [1] = u80
                            [2] = u81
                        --]]
                        u80.Transparency = u81
                    end)
                end
            end
        end
        local u82 = u74 == u16.LocalPlayer.Character
        local u83 = u17.Assets.Effects.RepairEnchantTableHammer:Clone()
        u83.Parent = u74
        u31:weldCharacterAccessories(u74)
        local u84 = nil
        u84 = p73:GetMarkerReachedSignal("hammer_1"):Connect(function() --[[ Line: 284 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u30
                [3] = u77
                [4] = u6
                [5] = u29
                [6] = u82
                [7] = u74
            --]]
            u84:Disconnect()
            u30:playEffects(u77.HammerEffect:GetChildren(), nil)
            local v85 = u6
            local v86 = u29.SNOW_CONE_MACHINE_REPAIR_HAMMER_1
            local v87 = {}
            local v88
            if u82 then
                v88 = nil
            else
                v88 = u74.PrimaryPart
                if v88 ~= nil then
                    v88 = v88.Position
                end
            end
            v87.position = v88
            v85:playSound(v86, v87)
        end)
        local u89 = nil
        u89 = p73:GetMarkerReachedSignal("hammer_2"):Connect(function() --[[ Line: 305 ]]
            --[[
            Upvalues:
                [1] = u89
                [2] = u30
                [3] = u77
                [4] = u6
                [5] = u29
                [6] = u82
                [7] = u74
            --]]
            u89:Disconnect()
            u30:playEffects(u77.HammerEffect:GetChildren(), nil)
            local v90 = u6
            local v91 = u29.SNOW_CONE_MACHINE_REPAIR_HAMMER_2
            local v92 = {}
            local v93
            if u82 then
                v93 = nil
            else
                v93 = u74.PrimaryPart
                if v93 ~= nil then
                    v93 = v93.Position
                end
            end
            v92.position = v93
            v90:playSound(v91, v92)
        end)
        local u94 = nil
        u94 = p73:GetMarkerReachedSignal("hammer_3"):Connect(function() --[[ Line: 326 ]]
            --[[
            Upvalues:
                [1] = u94
                [2] = u30
                [3] = u77
                [4] = u6
                [5] = u29
                [6] = u82
                [7] = u74
            --]]
            u94:Disconnect()
            u30:playEffects(u77.HammerEffect:GetChildren(), nil)
            local v95 = u6
            local v96 = u29.SNOW_CONE_MACHINE_REPAIR_HAMMER_3
            local v97 = {}
            local v98
            if u82 then
                v98 = nil
            else
                v98 = u74.PrimaryPart
                if v98 ~= nil then
                    v98 = v98.Position
                end
            end
            v97.position = v98
            v95:playSound(v96, v97)
        end)
        local u99 = nil
        u99 = p73:GetMarkerReachedSignal("hammer_4"):Connect(function() --[[ Line: 347 ]]
            --[[
            Upvalues:
                [1] = u99
                [2] = u30
                [3] = u77
                [4] = u6
                [5] = u29
                [6] = u82
                [7] = u74
            --]]
            u99:Disconnect()
            u30:playEffects(u77.HammerEffect:GetChildren(), nil)
            local v100 = u6
            local v101 = u29.SNOW_CONE_MACHINE_REPAIR_HAMMER_4
            local v102 = {}
            local v103
            if u82 then
                v103 = nil
            else
                v103 = u74.PrimaryPart
                if v103 ~= nil then
                    v103 = v103.Position
                end
            end
            v102.position = v103
            v100:playSound(v101, v102)
        end)
        p73.Stopped:Connect(function() --[[ Line: 367 ]]
            --[[
            Upvalues:
                [1] = u83
                [2] = u78
            --]]
            u83:Destroy()
            u78:DoCleaning()
        end)
    end)
    u26.Client:OnEvent("SnowConeMade", function(u104) --[[ Line: 372 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u30
            [3] = u6
            [4] = u29
        --]]
        task.spawn(function() --[[ Line: 373 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u104
                [3] = u30
            --]]
            local v105 = u17.Assets.Effects.SnowBlast:Clone()
            v105.Parent = u104.snowConeMachine
            v105.Position = u104.snowConeMachine.Position + Vector3.new(0, 2.75, 0)
            u30:playEffects(v105:GetChildren(), nil, {
                ["destroyAfterSec"] = 3,
                ["sizeMultiplier"] = 1.25
            })
        end)
        u6:playSound(u29.BEDWARS_PURCHASE_ITEM, {
            ["position"] = u104.snowConeMachine.Position
        })
        u6:playSound(u29.SNOW_CONE_MACHINE_MAKING_FINISH, {
            ["position"] = u104.snowConeMachine.Position
        })
    end)
end
function u33.getClosestBrokenSnowConeMachine(_, u106) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v107 = u15:GetTagged("BrokenSnowConeMachine")
    table.sort(v107, function(p108, p109) --[[ Line: 394 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        return (p108.Position - u106).Magnitude < (p109.Position - u106).Magnitude
    end)
    local v110 = nil
    for v111, v112 in v107 do
        local _ = v111 - 1
        if true == true then
            v110 = v112
            break
        end
    end
    return v110
end
function u33.getClosestSnowConeMachine(_, u113) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v114 = u15:GetTagged("SnowConeMachine")
    table.sort(v114, function(p115, p116) --[[ Line: 420 ]]
        --[[
        Upvalues:
            [1] = u113
        --]]
        return (p115.Position - u113).Magnitude < (p116.Position - u113).Magnitude
    end)
    local v117 = nil
    for v118, v119 in v114 do
        local _ = v118 - 1
        if true == true then
            v117 = v119
            break
        end
    end
    return v117
end
function u33.makeSnowCone(_, p120) --[[ Line: 444 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
    --]]
    local v121 = u16.LocalPlayer.Character
    if v121 ~= nil then
        v121 = v121.PrimaryPart
        if v121 ~= nil then
            v121 = v121.Position
        end
    end
    if not v121 then
        return nil
    end
    u26.Client:Get("MakeSnowCone"):CallServer({
        ["snowConeMachine"] = p120
    })
end
function u33.hookSnowConeQueueBillboard(_, p122) --[[ Line: 460 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u32
    --]]
    u13.mount(u13.createElement("BillboardGui", {
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 1),
        ["ResetOnSpawn"] = false,
        ["MaxDistance"] = 30,
        ["AlwaysOnTop"] = true,
        ["Adornee"] = p122,
        ["Size"] = UDim2.fromScale(3, 3)
    }, { u13.createElement(u32, {
            ["SnowConeMachine"] = p122
        }) }), p122, "SnowConeQueueBillboard")
end
u10.CreateController(u33.new())
return nil