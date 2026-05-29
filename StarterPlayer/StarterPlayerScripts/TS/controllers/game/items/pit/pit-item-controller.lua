local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TimedProgressBar
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.Linear
local u6 = v4.OutBounce
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "PitItemController"
    end,
    ["__index"] = u13
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
        [1] = u13
    --]]
    u13.constructor(p18)
    p18.Name = "PitItemController"
    p18.pitItemDatas = {}
end
function u15.KnitStart(u19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    u13.KnitStart(u19)
    u14.Client:Get("PitItemPlaced"):Connect(function(u20) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        task.spawn(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
            --]]
            u19:pitItemPlaced(u20.pitItemData)
        end)
    end)
end
function u15.pitItemPlaced(p21, p22) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u2
        [4] = u10
        [5] = u11
    --]]
    local v23 = p21.pitItemDatas
    table.insert(v23, p22)
    p22.maid = u7.new()
    local v24 = u8.mount
    local v25 = u8.createElement
    local v26 = {
        ["ResetOnSpawn"] = false,
        ["MaxDistance"] = 200,
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 5, 0),
        ["Adornee"] = p22.pitModel.Pivot.GUIParent,
        ["Size"] = UDim2.fromScale(8, 0.8)
    }
    local v27 = {}
    local v28 = u8.createElement
    local v29 = u2
    local v30 = {
        ["HideOnComplete"] = true,
        ["Size"] = UDim2.fromScale(1, 1),
        ["StartTime"] = p22.timePlaced,
        ["EndTime"] = p22.activationTime,
        ["ProgressBarConfig"] = {
            ["Flip"] = true,
            ["BarGradient"] = ColorSequence.new(Color3.fromRGB(232, 33, 33), Color3.fromRGB(181, 97, 56)),
            ["Title"] = {
                ["text"] = "Danger!"
            }
        }
    }
    __set_list(v27, 1, {v28(v29, v30)})
    local u31 = v24(v25("BillboardGui", v26, v27), u10.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    p22.maid:GiveTask(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u31
        --]]
        return u8.unmount(u31)
    end)
    local v32 = p22.activationTime - u11:GetServerTimeNow()
    if v32 > 0 then
        task.wait(v32 + 0.1)
    end
    p21:openDoor(p22.pitModel.Pivot.Door, p22.pitModel.Pivot.TrafficCone)
end
function u15.openDoor(_, u33, _) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
    --]]
    local u34 = u33:GetPivot()
    local v35 = u33:GetPivot().Position
    local u36 = CFrame.new(v35 - Vector3.new(0, 0.25, 0)) * CFrame.Angles(0.17453292519943295, 0, 0)
    u12(2, u6, function(p37) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u36
            [3] = u33
        --]]
        u33:PivotTo((u34:Lerp(u36, p37)))
    end):Play():Wait()
    u33.CanCollide = false
end
function u15.closeDoor(_, p38) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
    --]]
    local u39 = p38.Door
    local u40 = u39:GetPivot()
    local u41 = CFrame.new(u39:GetPivot().Position) * CFrame.Angles(0, 0, 0)
    u12(0.5, u5, function(p42) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u41
            [3] = u39
        --]]
        u39:PivotTo((u40:Lerp(u41, p42)))
    end):Play()
end
v3.CreateController(u15.new())
return nil