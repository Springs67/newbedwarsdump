local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u23 = v1.import(script, script.Parent.Parent.Parent, "global", "training-room", "ui", "training-room-hud-side").TrainingRoomHudSide
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "TrainingRoomEntityController"
    end,
    ["__index"] = u12
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
    --]]
    u12.constructor(p27, { u16.TRAINING_ROOM, u16.CUSTOM_KIT_CREATOR })
    p27.Name = "TrainingRoomEntityController"
end
function u24.KnitStart(p28) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p28)
end
function u24.onGameInit(u29) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u9
        [3] = u6
        [4] = u5
        [5] = u18
        [6] = u7
        [7] = u19
        [8] = u15
        [9] = u20
        [10] = u10
        [11] = u22
        [12] = u4
        [13] = u14
        [14] = u13
        [15] = u11
    --]]
    u21.Client:Get("TrainingRoomLoad"):Connect(function(p30) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u29
            [3] = u6
        --]]
        if p30.player ~= u9.LocalPlayer then
            return nil
        end
        u29:mountTrainingRoomCommands()
        u6.Controllers.KitController:getActiveKits(p30.player)
    end)
    u5("trainingRoomDummy", function(u31) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u7
            [3] = u19
            [4] = u15
            [5] = u20
            [6] = u10
            [7] = u22
            [8] = u4
            [9] = u14
            [10] = u13
            [11] = u29
            [12] = u11
        --]]
        local v32 = u31:GetAttribute("TrainingRoomDummy")
        if v32 ~= 0 and (v32 == v32 and (v32 ~= "" and v32)) then
            task.spawn(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u18
                    [3] = u7
                    [4] = u19
                    [5] = u15
                    [6] = u20
                    [7] = u10
                    [8] = u22
                    [9] = u4
                    [10] = u14
                    [11] = u13
                    [12] = u29
                    [13] = u11
                --]]
                local v33 = u31:GetAttribute("ArmorType")
                local u34
                if v33 == "LEATHER" then
                    u34 = u18.LEATHER
                elseif v33 == "IRON" then
                    u34 = u18.IRON
                elseif v33 == "DIAMOND" then
                    u34 = u18.DIAMOND
                elseif v33 == "EMERALD" then
                    u34 = u18.EMERALD
                elseif v33 == "VOID" then
                    u34 = u18.VOID
                else
                    local _ = v33 == nil
                    u34 = {}
                end
                local u35 = 0
                local v36 = false
                while true do
                    if v36 then
                        u35 = u35 + 1
                    else
                        v36 = true
                    end
                    if u35 >= #u7.values(u19) then
                        local u37 = u31
                        local v38 = u31:WaitForChild("Humanoid")
                        u4:playAnimation(v38:WaitForChild("Animator"), u14:getAssetId(u13.WARLOCK_IDLE))
                        local u39 = nil
                        local u40 = u29:setUpAnimationTrack(v38)
                        local u41 = -1
                        local u42 = nil
                        u42 = u11.Heartbeat:Connect(function() --[[ Line: 148 ]]
                            --[[
                            Upvalues:
                                [1] = u37
                                [2] = u42
                                [3] = u39
                                [4] = u40
                                [5] = u41
                            --]]
                            local v43 = u37
                            v43.Destroying:Connect(function() --[[ Line: 150 ]]
                                --[[
                                Upvalues:
                                    [1] = u42
                                --]]
                                u42:Disconnect()
                            end)
                            if v43.HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 1 and u39 ~= u40.idle then
                                local v44 = u39
                                if v44 ~= nil then
                                    v44:Stop()
                                end
                                u40.idle:Play()
                                u39 = u40.idle
                                u41 = time() + math.random(6, 12)
                                return
                            elseif v43.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 1 and u39 ~= u40.walk then
                                local v45 = u39
                                if v45 ~= nil then
                                    v45:Stop()
                                end
                                local v46 = u40.walk
                                if v46 ~= nil then
                                    v46:Play()
                                end
                                u39 = u40.walk
                                u41 = -1
                            elseif u39 == u40.idle and (u41 > 0 and u41 < time()) then
                                u41 = time() + math.random(10, 20)
                            end
                        end)
                        return
                    end
                    if not u15.new(u31) then
                        return nil
                    end
                    u31:WaitForChild("Humanoid");
                    (function() --[[ Line: 112 ]]
                        --[[
                        Upvalues:
                            [1] = u34
                            [2] = u35
                            [3] = u20
                            [4] = u10
                            [5] = u31
                            [6] = u22
                        --]]
                        local v47 = u34[u35 + 1]
                        if not u20(v47) then
                            return nil
                        end
                        local v48 = u10:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v47):GetChildren()
                        if not v48 then
                            return nil
                        end
                        for v49, v50 in v48 do
                            local _ = v49 - 1
                            local v51 = v50:Clone()
                            if v51 then
                                v51.Parent = u31
                            end
                        end
                        u22:weldCharacterAccessories(u31)
                    end)()
                end
            end)
        end
    end)
end
function u24.setUpAnimationTrack(_, p52) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
    --]]
    local v53 = p52:WaitForChild("Animator")
    local v54 = v53:LoadAnimation(u14:getAnimation(u13.WARLOCK_WALK))
    v54.Priority = Enum.AnimationPriority.Action
    local v55 = v53:LoadAnimation(u14:getAnimation(u13.WARLOCK_IDLE))
    v55.Priority = Enum.AnimationPriority.Action
    return {
        ["walk"] = v54,
        ["idle"] = v55
    }
end
function u24.mountTrainingRoomCommands(_) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u17
        [3] = u2
        [4] = u23
    --]]
    if u6.Controllers.MatchController:getQueueType() == u17.CUSTOM_KIT_CREATION then
        return nil
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("TrainingRoomHudSide") then
        return nil
    end
    local v56 = {
        ["appId"] = "TrainingRoomHudSide",
        ["app"] = u23
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v56, {})
end
function u24.showWarningPopup(_) --[[ Line: 203 ]] end
u6.CreateController(u24.new())
return nil