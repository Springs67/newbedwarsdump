local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.SoundManager
local u6 = v4.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "no-build", "bed-defense-meta").BedDefenseMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "no-build", "no-build-util").NoBuildUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "game-player").GamePlayer
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "AutoBedDefenseController"
    end,
    ["__index"] = u16
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p31)
    p31.Name = "AutoBedDefenseController"
end
function u28.KnitStart(p32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
        [3] = u7
        [4] = u15
        [5] = u11
        [6] = u26
        [7] = u3
        [8] = u13
        [9] = u14
        [10] = u8
        [11] = u19
        [12] = u22
        [13] = u5
        [14] = u27
        [15] = u25
        [16] = u6
        [17] = u9
        [18] = u24
        [19] = u18
        [20] = u17
        [21] = u23
        [22] = u21
        [23] = u2
        [24] = u12
    --]]
    u16.KnitStart(p32)
    if not u20(u7.Controllers.MatchController:getQueueTypeAsync():expect()).autoBedDefense then
        return nil
    end
    u15.DamageBlock:connect(function(p33) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
        --]]
        local v34 = u7.Controllers.TeamController:getPlayerTeam(u11.LocalPlayer)
        if not v34 then
            return nil
        end
        if p33.blockInstance:GetAttribute("BedDefenseForTeam") == v34.id then
            p33:setCancelled(true)
        end
    end)
    u26.Client:Get("UpgradeBedDefense"):Connect(function(p35, p36) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
            [3] = u14
            [4] = u8
            [5] = u19
            [6] = u22
            [7] = u5
            [8] = u27
            [9] = u11
        --]]
        if not p35 then
            return nil
        end
        local v37 = false
        local v38 = 0
        while true do
            if v37 then
                v38 = v38 + 1
            else
                v37 = true
            end
            local v39 = #p36
            if v38 >= math.pow(v39, 0.8) then
                return
            end
            local v40 = math.random() * #p36
            local v41 = math.floor(v40)
            local u42 = table.remove(p36, v41 + 1)
            if not u42 then
                return nil
            end
            local u43 = u42.blockType
            local v44 = u3:getHandlerRegistry():getHandler(u43)
            if v44 then
                local u45 = v44:place(Vector3.new(0, 0, 0), u42.blockData)
                u45.CanCollide = false
                u45.CanQuery = false
                u45.Anchored = true
                u45.Name = "UpgradeEffectBlock"
                u45.Parent = u13
                local u46 = p35.Character
                if u46 ~= nil then
                    u46 = u46:GetPivot()
                end
                if not u46 then
                    return nil
                end
                u45.CFrame = u46
                u45.Size = Vector3.new(0.5, 0.5, 0.5)
                local u51 = u14(0.3, u8, function(p47) --[[ Line: 106 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                        [2] = u19
                        [3] = u46
                        [4] = u42
                    --]]
                    local v48 = u19
                    local v49 = u19
                    local v50 = u19
                    u45.Size = (Vector3.new(0.5, 0.5, 0.5)):Lerp(Vector3.new(v48, v49, v50), p47)
                    u45.CFrame = u46:Lerp(CFrame.new(u42.worldPosition), p47)
                end)
                task.spawn(function() --[[ Line: 110 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u45
                        [3] = u22
                        [4] = u43
                        [5] = u5
                        [6] = u42
                    --]]
                    u51:Wait()
                    u45:Destroy()
                    local v52 = u22(u43).block
                    if v52 ~= nil then
                        v52 = v52.placeSound
                    end
                    if v52 then
                        u5:playSound(v52()[1].SoundId, {
                            ["volumeMultiplier"] = 0.95 + 0.1 * math.random(),
                            ["position"] = u42.worldPosition
                        })
                    end
                end)
                local v53 = u5
                local v54 = u27.PICKUP_ITEM_DROP
                local v55 = {
                    ["volumeMultiplier"] = 0.95 + 0.1 * math.random()
                }
                local v56
                if p35 == u11.LocalPlayer then
                    v56 = nil
                else
                    v56 = u46.Position
                end
                v55.position = v56
                v53:playSound(v54, v55)
                task.wait(0.05)
            end
        end
    end)
    local u57 = u25.new(u11.LocalPlayer)
    u6("UpgradeBedDefense", function(u58) --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u24
            [3] = u18
            [4] = u11
            [5] = u17
            [6] = u23
            [7] = u21
            [8] = u2
            [9] = u22
            [10] = u26
            [11] = u12
            [12] = u57
        --]]
        local u59 = u9.new()
        u59:GiveTask(u58.Destroying:Connect(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u59
            --]]
            u59:DoCleaning()
        end))
        local function u64(p60) --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u24
            --]]
            local v61 = p60 == nil and true or p60
            local v62 = u58:GetAttribute("MissingBlocks")
            local v63 = v62 == nil and 0 or v62
            if v63 == 0 then
                u58.HoldDuration = 1
            else
                u58.HoldDuration = v63 * u24.REPAIR_BLOCKS_PER_SECOND + 0.2
            end
            if v61 then
                u58:InputHoldEnd()
            end
            u58.Enabled = false
            task.delay(0.016666666666666666, function() --[[ Line: 161 ]]
                --[[
                Upvalues:
                    [1] = u58
                --]]
                u58.Enabled = true
            end)
        end
        local u65 = false
        local u66 = u9.new()
        local u67 = u9.new()
        u59:GiveTask(u58.PromptButtonHoldBegan:Connect(function() --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u66
                [3] = u18
                [4] = u11
                [5] = u17
                [6] = u67
                [7] = u58
                [8] = u23
                [9] = u21
                [10] = u2
                [11] = u22
                [12] = u24
                [13] = u26
                [14] = u12
            --]]
            u65 = true
            u66:DoCleaning()
            local u68 = u18:playAnimation(u11.LocalPlayer, u17.OPEN_CRATE)
            u67:GiveTask(function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u68
                --]]
                local v69 = u68
                if v69 ~= nil then
                    v69:Stop()
                end
                local v70 = u68
                if v70 ~= nil then
                    v70:Destroy()
                end
            end)
            local v71 = u58:GetAttribute("MissingBlocks")
            local v72 = v71 == nil and 0 or v71
            if v72 == 0 then
                local v73 = u58:GetAttribute("DefenseLevel")
                local v74 = v73 == nil and 0 or v73
                if #u23 - 1 <= v74 then
                    return nil
                end
                local v75 = u23[v74 + 1 + 1]
                if u21.hasEnough(u11.LocalPlayer, v75.cost.itemType, v75.cost.amount) then
                    return nil
                end
                local v76 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v77 = {}
                local v78 = v75.cost.amount
                v77.message = "Upgrade requires " .. tostring(v78) .. "x " .. string.lower(u22(v75.cost.itemType).displayName)
                v76:sendErrorNotification(v77)
                u58:InputHoldEnd()
                return nil
            end
            if v72 > 0 then
                local v79 = u24.REPAIR_COST
                local u80 = "Repair requires " .. tostring(v79) .. "x " .. string.lower(u22(u24.REPAIR_RESOURCE).displayName)
                if not u21.hasEnough(u11.LocalPlayer, u24.REPAIR_RESOURCE, u24.REPAIR_COST) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = u80
                    })
                    u58:InputHoldEnd()
                    return nil
                end
                u26.Client:Get("SetRepairingBedDefense"):SendToServer(true)
                u66:GiveTask(function() --[[ Line: 225 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26.Client:Get("SetRepairingBedDefense"):SendToServer(false)
                end)
                u66:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 229 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u11
                        [3] = u24
                        [4] = u2
                        [5] = u80
                        [6] = u58
                        [7] = u66
                    --]]
                    if u21.hasEnough(u11.LocalPlayer, u24.REPAIR_RESOURCE, u24.REPAIR_COST) then
                        return nil
                    end
                    local v81 = {
                        ["message"] = u80
                    }
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification(v81)
                    u58:InputHoldEnd()
                    u66:DoCleaning()
                end))
            end
        end))
        u59:GiveTask(u58.PromptButtonHoldEnded:Connect(function() --[[ Line: 241 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u66
                [3] = u65
                [4] = u64
            --]]
            u67:DoCleaning()
            u66:DoCleaning()
            u65 = false
            u64(false)
        end))
        u59:GiveTask(u58:GetAttributeChangedSignal("MissingBlocks"):Connect(function() --[[ Line: 247 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u64
                [3] = u65
            --]]
            local v82 = u58:GetAttribute("MissingBlocks")
            if (v82 == nil and 0 or v82) == 0 then
                u64()
            elseif not u65 then
                u64()
            end
        end))
        u59:GiveTask(u57:watchTeamId(function(p83) --[[ Line: 259 ]]
            --[[
            Upvalues:
                [1] = u58
            --]]
            u58.Enabled = u58:GetAttribute("Team") == p83
        end))
    end)
end
u7.CreateController(u28.new())
return nil