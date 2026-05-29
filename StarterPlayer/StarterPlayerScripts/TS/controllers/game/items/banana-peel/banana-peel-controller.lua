local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "octo-tree", "out")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BananaPeelController"
    end,
    ["__index"] = u10
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p15)
    p15.Name = "BananaPeelController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u7
        [4] = u1
        [5] = u9
        [6] = u8
        [7] = u11
        [8] = u4
    --]]
    u10.KnitStart(p16)
    local u17 = u5.new()
    u7:GetInstanceAddedSignal("banana_peel"):Connect(u1.async(function(u18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u17
        --]]
        local v19 = #u9.Assets.Misc.BananaPeel:GetDescendants()
        local u20 = #u18:GetDescendants()
        u18.DescendantAdded:Connect(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20 = u20 + 1
        end)
        while u20 < v19 do
            task.wait()
        end
        local u21 = u17:CreateNode(u18:GetPivot().Position, {})
        u18.AncestryChanged:Connect(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u17
                [3] = u21
            --]]
            if u18.Parent then
                return nil
            end
            u17:RemoveNode(u21)
        end)
    end))
    task.spawn(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
            [3] = u11
            [4] = u4
        --]]
        while true do
            local v22 = task.wait(0.1)
            if v22 == 0 or (v22 ~= v22 or not v22) then
                break
            end
            local v23 = u8.LocalPlayer.Character
            if v23 then
                local v24 = v23:GetPivot().Position
                if v24 and (#u17:GetNearest(v24, u11, 1) ~= 0 and v23.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics) then
                    u4.Controllers.TaserController:taseSelf(0.5)
                end
            end
        end
    end)
end
v3.CreateController(u12.new())
return nil