local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "octo-tree", "out")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.RunService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "LaunchPadController"
    end,
    ["__index"] = u13
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p22)
    p22.Name = "LaunchPadController"
    p22.launchpadData = {}
    p22.lastLaunch = -1
    p22.launched = false
end
function u19.KnitStart(u23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u3
        [4] = u9
        [5] = u5
        [6] = u2
        [7] = u8
        [8] = u10
        [9] = u14
        [10] = u16
        [11] = u12
    --]]
    u13.KnitStart(u23)
    local u24 = u6.new()
    u3("launch-pad", function(p25) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u24
            [4] = u2
            [5] = u23
        --]]
        local v26 = p25:GetAttribute("PlacedByUserId")
        local v27
        if p25:GetAttribute("IgnoreTeam") or (v26 == nil or v26 == 0) then
            v27 = nil
        else
            local v28 = u9:GetPlayerByUserId(v26)
            if v28 == nil then
                return nil
            end
            v27 = v28:GetAttribute("Team")
        end
        if p25:GetAttribute("ClientPlaced") then
            return nil
        end
        local v29 = u5.new()
        local u30 = u24:CreateNode(p25.Position, {
            ["launchpad"] = p25,
            ["ownerTeam"] = v27
        })
        u2.getOrCreate(u23.launchpadData, p25, {
            ["maid"] = v29
        })
        v29:GiveTask(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u30
            --]]
            u24:RemoveNode(u30)
        end)
    end)
    u8:GetInstanceRemovedSignal("launch-pad"):Connect(function(p31) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v32 = u23.launchpadData[p31]
        if v32 then
            v32.maid:DoCleaning()
            u23.launchpadData[p31] = nil
        end
    end)
    u10.Heartbeat:Connect(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u24
            [3] = u14
            [4] = u23
        --]]
        local v33 = u9.LocalPlayer.Character
        if v33 ~= nil then
            v33 = v33:GetPivot().Position
        end
        if not v33 then
            return nil
        end
        for _, v34 in u24:SearchRadius(v33, 6) do
            if ((v34.Position - v33) * Vector3.new(1, 0, 1)).Magnitude <= u14 / 2 then
                u23:attemptLaunch(v34.Object.launchpad, v34.Object.ownerTeam)
                return nil
            end
        end
    end)
    u16.Client:OnEvent("LaunchPadUsed", function(p35) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
        --]]
        if p35.player ~= u9.LocalPlayer then
            u12.LaunchPadUsed:fire(p35.launchpad)
        end
    end)
end
function u19.attemptLaunch(p36, u37, p38) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u18
        [4] = u17
        [5] = u11
        [6] = u16
        [7] = u12
    --]]
    if p38 ~= nil and u9.LocalPlayer:GetAttribute("Team") ~= p38 then
        return nil
    end
    local u39 = u9.LocalPlayer.Character
    if not u39 then
        return nil
    end
    local v40 = u15:getLocalPlayerEntity()
    if v40 and u18:isActive(v40:getInstance(), u17.GROUNDED) then
        return nil
    end
    if v40 and u18:isActive(v40:getInstance(), u17.FROSTED) then
        return nil
    end
    if u11:GetServerTimeNow() - p36.lastLaunch < 1 then
        return nil
    end
    p36.lastLaunch = u11:GetServerTimeNow()
    local u41 = u37:GetAttribute("Strength")
    local u42 = u37:GetAttribute("Direction") or Vector3.new(0, 1, 0)
    local _ = u39.HumanoidRootPart.AssemblyLinearVelocity
    task.spawn(function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u37
            [3] = u39
            [4] = u41
            [5] = u42
        --]]
        local v43 = {
            ["launchPad"] = u37
        }
        u16.Client:Get("UseLaunchPad"):SendToServer(v43)
        u39.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        local v44 = u41
        local v45 = u39.PrimaryPart.AssemblyMass * 100 * (v44 == nil and 1 or v44)
        u39.PrimaryPart:ApplyImpulse(Vector3.new(v45, v45, v45) * u42)
    end)
    p36.launched = true
    u12.LaunchPadUsed:fire(u37)
end
v4.CreateController(u19.new())
return nil