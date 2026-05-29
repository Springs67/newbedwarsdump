local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
return {
    ["StatefulEntity"] = {
        ["constructor"] = function(u7, p8, p9, p10, p11) --[[ Name: constructor, Line 15 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u4
                [4] = u5
                [5] = u6
            --]]
            u7.isFirstStateChange = true
            u7.deathMaid = u2.new()
            u7.alive = true
            if u3:IsServer() then
                u7.stateUpdatedRemote = u4.Server:Create("EntityStateUpdate")
                u7.actionRequestRemote = u4.Server:Create("EntityActionRequest")
            end
            u7.deathMaid:GiveTask(u5.SharedStatefulEntityDamage:connect(function(p12) --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u7
                --]]
                local v13
                if u3:IsServer() then
                    v13 = p12.entity:getInstance():GetAttribute("EntityUUID")
                else
                    v13 = p12.entity.instance
                    if v13 ~= nil then
                        v13 = v13:GetAttribute("EntityUUID")
                    end
                end
                if v13 == u7.entityUUID then
                    u7:onEntityDamaged(p12.damage, p12.damageType)
                end
            end))
            u7.deathMaid:GiveTask(u5.SharedStatefulEntityDeath:connect(function(p14) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u7
                --]]
                local v15
                if u3:IsServer() then
                    v15 = p14.entity:getInstance():GetAttribute("EntityUUID")
                else
                    v15 = p14.entity.instance
                    if v15 ~= nil then
                        v15 = v15:GetAttribute("EntityUUID")
                    end
                end
                if v15 == u7.entityUUID then
                    u7:onEntityDeath()
                    u7.alive = false
                    u7.deathMaid:DoCleaning()
                end
            end))
            if p11 == nil then
                p11 = u6:generateUUID()
            end
            u7.entityUUID = p11
            u7.entityTag = p9
            u7:createGameEntity(p10)
            if u3:IsClient() then
                u7:handleIncomingStateUpdates()
                u7:handleIncomingActionRequests()
            end
            u7:setEntityState(p8)
        end,
        ["setEntityState"] = function(u16, p17) --[[ Name: setEntityState, Line 77 ]]
            if not u16.isFirstStateChange then
                u16:sendOutgoingStateUpdate(p17)
            end
            if u16.activeState ~= nil then
                task.spawn(function() --[[ Line: 83 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    return u16:onStateExit(u16.activeState)
                end)
            end
            u16.activeState = p17
            task.spawn(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                return u16:onStateEnter(u16.activeState)
            end)
            if u16.isFirstStateChange then
                u16.isFirstStateChange = false
            end
        end,
        ["sendActionRequest"] = function(p18, p19, p20) --[[ Name: sendActionRequest, Line 96 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            if not u3:IsServer() then
                return nil
            end
            if not p18.actionRequestRemote then
                return nil
            end
            p18.actionRequestRemote:SendToAllPlayers(p19, p18.entityUUID, p20)
        end,
        ["sendOutgoingStateUpdate"] = function(p21, p22) --[[ Name: sendOutgoingStateUpdate, Line 105 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            if not u3:IsServer() then
                return nil
            end
            if not p21.stateUpdatedRemote then
                return nil
            end
            p21.stateUpdatedRemote:SendToAllPlayers(p22, p21.entityUUID)
        end,
        ["handleIncomingStateUpdates"] = function(u23) --[[ Name: handleIncomingStateUpdates, Line 114 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4.Client:WaitFor("EntityStateUpdate"):expect():Connect(function(p24, p25) --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                if p25 == u23.entityUUID then
                    u23:setEntityState(p24)
                end
            end)
        end,
        ["handleIncomingActionRequests"] = function(u26) --[[ Name: handleIncomingActionRequests, Line 122 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4.Client:WaitFor("EntityActionRequest"):expect():Connect(function(p27, p28, p29) --[[ Line: 123 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                if p28 == u26.entityUUID then
                    u26:handleActionRequest(p27, p29)
                end
            end)
        end,
        ["registerClientGameEntity"] = function(p30, p31) --[[ Name: registerClientGameEntity, Line 130 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            local v32 = p30.entityUUID
            if v32 ~= "" and v32 then
                local u33 = p30.entityUUID
                u6.uuidToClientEntity[u33] = p31
                p30.deathMaid:GiveTask(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u33
                    --]]
                    u6.uuidToClientEntity[u33] = nil
                end)
            end
        end
    }
}