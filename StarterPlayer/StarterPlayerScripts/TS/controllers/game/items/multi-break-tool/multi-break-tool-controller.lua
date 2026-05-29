local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.MathExtras
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-controller").ViewmodelController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "MultiBreakToolController"
    end,
    ["__index"] = u14
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
    --]]
    u14.constructor(p26)
    p26.Name = "MultiBreakToolController"
    p26.localMaid = u8.new()
    p26.firstPersonDrillMotorPlayerMap = {}
    p26.thirdPersonDrillMotorPlayerMap = {}
    p26.isCheckingForDrillEnd = false
    p26.lastBlockDamageTime = 0
    p26.currentSpinSpeedPlayerMap = {}
    p26.currentSpinSpeedGoalPlayerMap = {}
    p26.currentDrillSoundPlayerMap = {}
    p26.drillSoundPitchMin = 0.1
    p26.drillSoundPitchMax = 1
    p26.drillMaxSpinSpeed = 30
    p26.drillSpinAcceleration = 0.4
    p26.drillSpinEndCooldownCheck = 0.4
    p26.stopSpinningSoundLastPlayedPlayerMap = {}
end
function u23.KnitStart(u27) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u19
        [4] = u22
        [5] = u21
        [6] = u17
        [7] = u10
        [8] = u16
        [9] = u15
        [10] = u12
        [11] = u18
        [12] = u2
        [13] = u6
        [14] = u5
        [15] = u11
        [16] = u4
        [17] = u20
    --]]
    u14.KnitStart(u27)
    u7.Controllers.PreloadController:preloadForItemType(u19.MULTI_BREAK_TOOL, {
        ["sounds"] = {
            u22.MULTI_BREAK_TOOL_DRILL_LOOP,
            u22.MULTI_BREAK_TOOL_DRILL_STOP,
            u22.MULTI_BREAK_TOOL_STONE_BREAK_1,
            u22.MULTI_BREAK_TOOL_STONE_BREAK_2,
            u22.MULTI_BREAK_TOOL_STONE_BREAK_3,
            u22.MULTI_BREAK_TOOL_STONE_BREAK_4,
            u22.MULTI_BREAK_TOOL_WOOD_BREAK_1,
            u22.MULTI_BREAK_TOOL_WOOD_BREAK_2,
            u22.MULTI_BREAK_TOOL_WOOD_BREAK_3,
            u22.MULTI_BREAK_TOOL_WOOD_BREAK_4,
            u22.MULTI_BREAK_TOOL_WOOL_BREAK_1,
            u22.MULTI_BREAK_TOOL_WOOL_BREAK_2,
            u22.MULTI_BREAK_TOOL_WOOL_BREAK_3,
            u22.MULTI_BREAK_TOOL_WOOL_BREAK_4
        }
    })
    u21.BeforeAnimationPlayEvent:connect(function(p28) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u10
            [3] = u19
            [4] = u16
            [5] = u15
        --]]
        local v29 = u17.getInventory(u10.LocalPlayer).hand
        if v29 ~= nil then
            v29 = v29.itemType
        end
        if v29 ~= u19.MULTI_BREAK_TOOL then
            return nil
        end
        local v30 = {
            u16:getAssetId(u15.BREAK_BLOCK),
            u16:getAssetId(u15.PUNCH),
            u16:getAssetId(u15.FP_USE_ITEM),
            u16:getAssetId(u15.FP_WALK)
        }
        local v31 = p28.animationAssetId
        if table.find(v30, v31) ~= nil then
            p28:setCancelled(true)
            return nil
        end
    end)
    u12.DamageBlock:connect(function(_) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u10
            [3] = u27
        --]]
        local v32 = u17.getInventory(u10.LocalPlayer).hand
        if not (v32 and u27:isRelevantItem(v32)) then
            return nil
        end
        u27.lastBlockDamageTime = time()
        if not u27.isCheckingForDrillEnd then
            u27:startDrillSpinLocal()
        end
    end)
    u12.DamageBlockEffect:connect(function(p33) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u27
            [3] = u18
            [4] = u2
            [5] = u6
            [6] = u5
            [7] = u22
        --]]
        if p33.fromPlayer then
            local v34 = u17.getInventory(p33.fromPlayer).hand
            if v34 and u27:isRelevantItem(v34) then
                local v35 = u18(p33.blockType)
                if v35 ~= nil then
                    v35 = v35.block
                    if v35 ~= nil then
                        v35 = v35.breakType
                    end
                end
                if v35 then
                    if v35 == u2.STONE then
                        local v36 = u6
                        local v37 = u5.fromList
                        local v38 = {
                            u22.MULTI_BREAK_TOOL_STONE_BREAK_1,
                            u22.MULTI_BREAK_TOOL_STONE_BREAK_2,
                            u22.MULTI_BREAK_TOOL_STONE_BREAK_3,
                            u22.MULTI_BREAK_TOOL_STONE_BREAK_4
                        }
                        p33.sound = v36:createSound(v37(unpack(v38)))
                        return
                    elseif v35 == u2.WOOD then
                        local v39 = u6
                        local v40 = u5.fromList
                        local v41 = {
                            u22.MULTI_BREAK_TOOL_WOOD_BREAK_1,
                            u22.MULTI_BREAK_TOOL_WOOD_BREAK_2,
                            u22.MULTI_BREAK_TOOL_WOOD_BREAK_3,
                            u22.MULTI_BREAK_TOOL_WOOD_BREAK_4
                        }
                        p33.sound = v39:createSound(v40(unpack(v41)))
                        return
                    elseif v35 == u2.WOOL then
                        local v42 = u6
                        local v43 = u5.fromList
                        local v44 = {
                            u22.MULTI_BREAK_TOOL_WOOL_BREAK_1,
                            u22.MULTI_BREAK_TOOL_WOOL_BREAK_2,
                            u22.MULTI_BREAK_TOOL_WOOL_BREAK_3,
                            u22.MULTI_BREAK_TOOL_WOOL_BREAK_4
                        }
                        p33.sound = v42:createSound(v43(unpack(v44)))
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    u27.spinConnection = u11.PreSimulation:Connect(function(u45) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        local v46 = u27.currentSpinSpeedPlayerMap
        local function v52(_, p47) --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u45
            --]]
            local v48 = u27.firstPersonDrillMotorPlayerMap[p47]
            local v49 = u27.thirdPersonDrillMotorPlayerMap[p47]
            local v50 = u27.currentSpinSpeedPlayerMap[p47]
            local v51 = (v50 == 0 or (v50 ~= v50 or not v50)) and 0 or v50
            if v51 <= 0 then
                return nil
            end
            if v48 then
                v48.C0 = v48.C0 * CFrame.Angles(u45 * -v51, 0, 0)
            end
            if v49 then
                v49.C0 = v49.C0 * CFrame.Angles(u45 * -v51, 0, 0)
            end
        end
        for v53, v54 in v46 do
            v52(v54, v53, v46)
        end
    end)
    u27.spinSpeedConnection = u11.Heartbeat:Connect(function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u6
            [3] = u22
            [4] = u4
            [5] = u10
        --]]
        local v55 = u27.currentSpinSpeedPlayerMap
        local function v73(p56, p57) --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u6
                [3] = u22
                [4] = u4
                [5] = u10
            --]]
            if p56 ~= u27.currentSpinSpeedGoalPlayerMap[p57] then
                local v58 = u27.currentSpinSpeedGoalPlayerMap[p57] - p56
                local v59 = -u27.drillSpinAcceleration
                local v60 = u27.drillSpinAcceleration
                local v61 = p56 + math.clamp(v58, v59, v60)
                local v62 = u27.drillMaxSpinSpeed
                local v63 = math.clamp(v61, 0, v62)
                if p56 <= 0 and v63 > 0 then
                    local v64 = u27.currentDrillSoundPlayerMap[p57]
                    if v64 then
                        v64:Destroy()
                    end
                    local v65 = u6
                    local v66 = u22.MULTI_BREAK_TOOL_DRILL_LOOP
                    local v67 = {
                        ["looped"] = true
                    }
                    local v68 = p57.Character
                    if v68 ~= nil then
                        v68 = v68.PrimaryPart
                    end
                    v67.parent = v68
                    local v69 = p57.Character
                    if v69 ~= nil then
                        v69 = v69.PrimaryPart
                        if v69 ~= nil then
                            v69 = v69.Position
                        end
                    end
                    v67.position = v69
                    local v70 = v65:playModifiableSound(v66, v67)
                    u27.currentDrillSoundPlayerMap[p57] = v70
                elseif p56 > 0 and v63 <= 0 then
                    local v71 = u27.currentDrillSoundPlayerMap[p57]
                    if v71 then
                        v71:Destroy()
                    end
                    u27.currentDrillSoundPlayerMap[p57] = nil
                end
                local v72 = p56 ~= v63 and u27.currentDrillSoundPlayerMap[p57]
                if v72 then
                    v72.PlaybackSpeed = u4:lerp(u27.drillSoundPitchMin, u27.drillSoundPitchMax, v63 / u27.drillMaxSpinSpeed)
                end
                u27.currentSpinSpeedPlayerMap[p57] = v63
            end
            if u27.isCheckingForDrillEnd and (p57 == u10.LocalPlayer and time() - u27.lastBlockDamageTime > u27.drillSpinEndCooldownCheck) then
                u27:stopDrillSpinLocal()
            end
        end
        for v74, v75 in v55 do
            v73(v75, v74, v55)
        end
    end)
    u20.Client:Get("MultiBreakToolStartSpinningFromServer"):Connect(function(p76) --[[ Line: 250 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
        --]]
        if p76.player == u10.LocalPlayer then
            return nil
        end
        u27.currentSpinSpeedGoalPlayerMap[p76.player] = u27.drillMaxSpinSpeed
        if u27.currentSpinSpeedPlayerMap[p76.player] == nil then
            u27.currentSpinSpeedPlayerMap[p76.player] = 0
        end
        local v77 = p76.player.Character
        if not v77 then
            return nil
        end
        local v78 = u27.thirdPersonDrillMotorPlayerMap
        local v79 = p76.player
        local v80 = v77:FindFirstChild("multi_break_tool")
        if v80 ~= nil then
            v80 = v80:FindFirstChild("Handle")
            if v80 ~= nil then
                v80 = v80:FindFirstChild("Drill")
                if v80 ~= nil then
                    v80 = v80:FindFirstChild("Motor6D")
                end
            end
        end
        v78[v79] = v80
    end)
    u20.Client:Get("MultiBreakToolStopSpinningFromServer"):Connect(function(p81) --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
            [3] = u6
            [4] = u22
        --]]
        if p81.player == u10.LocalPlayer then
            return nil
        end
        local v82 = p81.player.Character
        if v82 ~= nil then
            v82 = v82.PrimaryPart
        end
        if not v82 then
            return nil
        end
        u27.currentSpinSpeedGoalPlayerMap[p81.player] = 0
        local v83 = u27.stopSpinningSoundLastPlayedPlayerMap[p81.player]
        local v84 = (v83 == 0 or (v83 ~= v83 or not v83)) and 0 or v83
        if time() - v84 > 0.5 then
            u6:playSound(u22.MULTI_BREAK_TOOL_DRILL_STOP, {
                ["volumeMultiplier"] = 0.5,
                ["fadeOutTime"] = 0.1,
                ["parent"] = v82,
                ["position"] = v82.Position
            })
            u27.stopSpinningSoundLastPlayedPlayerMap[p81.player] = time()
        end
    end)
end
function u23.startDrillSpinLocal(p85) --[[ Line: 319 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
    --]]
    p85.isCheckingForDrillEnd = true
    u20.Client:Get("MultiBreakToolStartSpinningFromClient"):SendToServer()
    p85.currentSpinSpeedGoalPlayerMap[u10.LocalPlayer] = p85.drillMaxSpinSpeed
    if p85.currentSpinSpeedPlayerMap[u10.LocalPlayer] == nil then
        p85.currentSpinSpeedPlayerMap[u10.LocalPlayer] = 0
    end
end
function u23.stopDrillSpinLocal(p86) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
        [3] = u10
        [4] = u20
    --]]
    p86.isCheckingForDrillEnd = false
    local v87 = u6
    local v88 = u22.MULTI_BREAK_TOOL_DRILL_STOP
    local v89 = {
        ["volumeMultiplier"] = 0.5,
        ["fadeOutTime"] = 0.1
    }
    local v90 = u10.LocalPlayer.Character
    if v90 ~= nil then
        v90 = v90.PrimaryPart
    end
    v89.parent = v90
    local v91 = u10.LocalPlayer.Character
    if v91 ~= nil then
        v91 = v91.PrimaryPart
        if v91 ~= nil then
            v91 = v91.Position
        end
    end
    v89.position = v91
    v87:playSound(v88, v89)
    u20.Client:Get("MultiBreakToolStopSpinningFromClient"):SendToServer()
    p86.currentSpinSpeedGoalPlayerMap[u10.LocalPlayer] = 0
end
function u23.onEnable(u92, _) --[[ Line: 363 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u10
        [3] = u16
        [4] = u15
    --]]
    task.spawn(function() --[[ Line: 365 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u92
            [3] = u10
        --]]
        local v93 = u13:getViewModel()
        if v93 ~= nil then
            v93 = v93:WaitForChild("multi_break_tool"):WaitForChild("Handle"):WaitForChild("Drill"):WaitForChild("Motor6D")
        end
        u92.firstPersonDrillMotorPlayerMap[u10.LocalPlayer] = v93
    end)
    local v94 = u92.thirdPersonDrillMotorPlayerMap
    local v95 = u10.LocalPlayer
    local v96 = u10.LocalPlayer.Character
    if v96 ~= nil then
        v96 = v96:FindFirstChild("multi_break_tool")
        if v96 ~= nil then
            v96 = v96:FindFirstChild("Handle")
            if v96 ~= nil then
                v96 = v96:FindFirstChild("Drill")
                if v96 ~= nil then
                    v96 = v96:FindFirstChild("Motor6D")
                end
            end
        end
    end
    v94[v95] = v96
    u92:setupYield(function() --[[ Line: 393 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u10
            [3] = u15
        --]]
        local u97 = u16:playAnimation(u10.LocalPlayer, u15.FLAMETHROWER_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 397 ]]
            --[[
            Upvalues:
                [1] = u97
            --]]
            local v98 = u97
            if v98 ~= nil then
                v98:Stop()
            end
        end
    end)
end
function u23.onDisable(p99) --[[ Line: 420 ]]
    p99.localMaid:DoCleaning()
end
function u23.isRelevantItem(_, p100) --[[ Line: 423 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p100.itemType == u19.MULTI_BREAK_TOOL
end
u7.CreateController(u23.new())
return nil