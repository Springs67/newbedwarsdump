local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.RunService
local u8 = v4.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "DizzyToadController"
    end,
    ["__index"] = u10
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
    --]]
    u10.constructor(p18)
    p18.Name = "DizzyToadController"
    p18.dizzyMaid = u3.new()
    p18.dizzinessAngle = 0
    p18.effectMap = {}
end
function u15.KnitStart(u19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u12
        [4] = u13
        [5] = u9
        [6] = u14
        [7] = u5
        [8] = u7
        [9] = u11
        [10] = u3
        [11] = u6
        [12] = u8
    --]]
    u10.KnitStart(u19)
    u2.Controllers.PreloadController:preloadForItemType(u12.DIZZY_TOAD, {
        ["sounds"] = { u13.TOAD_CROAK }
    })
    u9.StatusEffectAdded:connect(function(u20) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u5
            [3] = u19
            [4] = u7
            [5] = u11
            [6] = u3
            [7] = u6
            [8] = u8
        --]]
        if u20.statusEffect ~= u14.DIZZY then
            return nil
        end
        if u20.entityInstance == u5.LocalPlayer.Character then
            u19.dizzinessAngle = 0
            u7:BindToRenderStep("dizzy-status", Enum.RenderPriority.Character.Value + 1, function(p21) --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u5
                --]]
                local v22 = u19
                v22.dizzinessAngle = v22.dizzinessAngle + p21 * math.random() * 2
                local v23 = u5.LocalPlayer.Character
                if v23 ~= nil then
                    v23 = v23:FindFirstChild("Humanoid")
                end
                if not v23 or v23.MoveDirection.Magnitude == 0 then
                    return nil
                end
                local v24 = CFrame.Angles
                local v25 = u19.dizzinessAngle * 2 * 3.141592653589793 / 1.2
                v23:Move(v24(0, math.sin(v25) * 0.5235987755982988, 0) * v23.MoveDirection)
            end)
            u19.dizzyMaid:GiveTask(function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                return u7:UnbindFromRenderStep("dizzy-status")
            end)
        end
        local u26 = u5:GetPlayerFromCharacter(u20.entityInstance)
        local v27 = u20.entityInstance.PrimaryPart
        if v27 ~= nil then
            v27 = v27.Position
        end
        local u28 = u11:getEntity(u20.entityInstance)
        if u28 and (v27 and (u26 and u19.effectMap[u26] == nil)) then
            local u29 = u3.new()
            local u30 = u6.Assets.Effects.DizzyEffect:Clone()
            u29:GiveTask(u30)
            u30.Parent = u8
            u30:PivotTo(CFrame.new(v27 + Vector3.new(0, 6, 0)))
            u19.effectMap[u26] = u29
            local u31 = 0
            u29:GiveTask(u7.Heartbeat:Connect(function(p32) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u19
                    [3] = u26
                    [4] = u28
                    [5] = u29
                    [6] = u30
                    [7] = u31
                --]]
                local v33 = u20.entityInstance.PrimaryPart
                if v33 ~= nil then
                    v33 = v33.Position
                end
                if u19.effectMap[u26] == nil or (u28:isDead() or not v33) then
                    u29:DoCleaning()
                    return nil
                end
                u30:PivotTo(CFrame.new(v33 + Vector3.new(0, 6, 0)) * CFrame.Angles(0, -3.141592653589793 * u31 * 5, 0))
                u31 = u31 + p32
            end))
        end
    end)
    u9.StatusEffectRemoved:connect(function(p34) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u5
            [3] = u19
        --]]
        if p34.statusEffect ~= u14.DIZZY then
            return nil
        end
        local v35 = u5:GetPlayerFromCharacter(p34.entityInstance)
        if v35 then
            local v36 = u19.effectMap[v35]
            if v36 then
                v36:DoCleaning()
            end
            u19.effectMap[v35] = nil
        end
        if p34.entityInstance ~= u5.LocalPlayer.Character then
            return nil
        end
        u19.dizzyMaid:DoCleaning()
    end)
end
u2.CreateController(u15.new())
return nil