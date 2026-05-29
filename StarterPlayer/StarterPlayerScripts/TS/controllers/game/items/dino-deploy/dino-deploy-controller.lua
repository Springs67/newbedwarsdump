local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.TimedProgressBar
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DinoTamerBalance
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "DinoDeployController"
    end,
    ["__index"] = u16
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p29)
    p29.Name = "DinoDeployController"
end
function u26.KnitStart(u30) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u23
        [4] = u12
        [5] = u9
        [6] = u2
        [7] = u17
        [8] = u18
        [9] = u8
        [10] = u22
        [11] = u1
        [12] = u21
        [13] = u4
        [14] = u25
        [15] = u19
        [16] = u13
        [17] = u10
        [18] = u5
        [19] = u14
        [20] = u20
        [21] = u24
    --]]
    u16.KnitStart(u30)
    u15.GenericMountMounted:connect(function(p31) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u12
            [3] = u30
            [4] = u9
            [5] = u2
            [6] = u17
            [7] = u18
            [8] = u8
        --]]
        if p31.mountType == u23.DINO and p31.player == u12.LocalPlayer then
            u30.dinoMaid = u9.new()
            local v32 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v33 = u17.DINO_CHARGE
            local v34 = {}
            for v35, v36 in u18[u17.DINO_CHARGE].triggerConfig do
                v34[v35] = v36
            end
            local u37 = v32:enableAbility(v33, v34):expect()
            local v38 = u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = 1.2
            })
            u30.dinoMaid:GiveTask(v38)
            u30.dinoMaid:GiveTask(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37.Destroy()
            end)
        end
    end)
    u15.GenericMountDismounted:connect(function(p39) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u12
            [3] = u30
        --]]
        if p39.mountType == u23.DINO and p39.player == u12.LocalPlayer then
            local v40 = u30.dinoMaid
            if v40 ~= nil then
                v40:DoCleaning()
            end
        end
    end)
    u15.AbilityUsed:connect(function(p41) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u1
            [3] = u21
            [4] = u17
            [5] = u9
            [6] = u4
            [7] = u25
            [8] = u12
            [9] = u8
            [10] = u19
            [11] = u13
            [12] = u2
            [13] = u10
            [14] = u5
            [15] = u14
            [16] = u20
            [17] = u15
            [18] = u24
        --]]
        local u42 = u22:getEntity(p41.userCharacter)
        if u42 == nil or not u1.instanceof(u42, u21) then
            return nil
        end
        local u43 = u42:getPlayer()
        local u44 = p41.userCharacter:FindFirstChildOfClass("Humanoid")
        if u44 == nil then
            return nil
        end
        if p41.ability == u17.DINO_CHARGE then
            local u45 = u9.new()
            local v46 = u4
            local v47 = u25.DINO_CHARGE_START
            local v48 = {
                ["rollOffMaxDistance"] = 150
            }
            local v49
            if u43 == u12.LocalPlayer then
                v49 = nil
            else
                v49 = u42:getInstance():GetPivot().Position
            end
            v48.position = v49
            v46:playSound(v47, v48)
            local v50 = u4
            local v51 = u25.DINO_CHARGE_LOOP
            local v52 = {
                ["rollOffMaxDistance"] = 150,
                ["volumeMultiplier"] = 1.5,
                ["looped"] = true
            }
            local v53
            if u43 == u12.LocalPlayer then
                v53 = nil
            else
                v53 = u42:getInstance():GetPivot().Position
            end
            v52.position = v53
            v52.parent = u42:getInstance().HumanoidRootPart
            local u54 = v50:playSound(v51, v52)
            u45:GiveTask(function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                local v55 = u54
                if v55 ~= nil then
                    v55:Destroy()
                end
            end)
            u45:GiveTask(function() --[[ Line: 103 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u25
                    [3] = u43
                    [4] = u12
                    [5] = u42
                --]]
                local v56 = u4
                local v57 = u25.DINO_CHARGE_STOP
                local v58 = {
                    ["rollOffMaxDistance"] = 150
                }
                local v59
                if u43 == u12.LocalPlayer then
                    v59 = nil
                else
                    v59 = u42:getInstance():GetPivot().Position
                end
                v58.position = v59
                v56:playSound(v57, v58)
            end)
            local u60 = u8.Controllers.MountController:getActiveMounts()[u43]
            if u60 ~= nil then
                u60 = u60.model
            end
            if u60 then
                local u61 = u8.Controllers.MountAnimationController:playAnimationInMount(u60, u19.DINO_CHARGING)
                if u61 then
                    u61.Priority = Enum.AnimationPriority.Action
                    u45:GiveTask(function() --[[ Line: 118 ]]
                        --[[
                        Upvalues:
                            [1] = u61
                        --]]
                        u61:Stop()
                        u61:Destroy()
                    end)
                end
                u45:GiveTask(function() --[[ Line: 123 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u60
                        [3] = u19
                    --]]
                    local v62 = u8.Controllers.MountAnimationController:playAnimationInMount(u60, u19.DINO_HIT)
                    if v62 then
                        v62.Priority = Enum.AnimationPriority.Action
                        v62.Looped = false
                    end
                end)
            end
            if u43 == u12.LocalPlayer then
                u45:GiveTask((u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = true,
                    ["moveSpeedMultiplier"] = 3
                })))
                u45:GiveTask(u13.Heartbeat:Connect(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                    --]]
                    u44:Move(Vector3.new(0, 0, -1), true)
                end))
                u45:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 0.05),
                    ["ProgressBarConfig"] = {
                        ["BarGradient"] = ColorSequence.new(Color3.fromRGB(230, 255, 168), Color3.fromRGB(64, 255, 94)),
                        ["Title"] = {
                            ["text"] = "MAX CHARGE"
                        }
                    },
                    ["StartTime"] = u14:GetServerTimeNow(),
                    ["EndTime"] = u14:GetServerTimeNow() + u20.TIME_TO_GET_DINO_CHARGE_II
                })))
                u45:GiveTask(u15.BeforeSwordSwing:connect(function(p63) --[[ Line: 151 ]]
                    p63:setCancelled(true)
                end))
                u45:GiveTask(u15.SwordSwing:connect(function(p64) --[[ Line: 154 ]]
                    p64:setCancelled(true)
                end))
            end
            u45:GiveTask(u24.Client:Get("StopDinoCharging"):Connect(function(p65) --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u45
                --]]
                if p65.player == u43 then
                    u45:DoCleaning()
                end
            end))
            task.delay(u20.DINO_CHARGE_DURATION, function() --[[ Line: 163 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                u45:DoCleaning()
            end)
        end
    end)
end
v7.CreateController(u26.new())
return nil