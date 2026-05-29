local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.TweenService
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "SmokeBlockController"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p12)
    p12.Name = "SmokeBlockController"
end
function u9.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u4
    --]]
    u8.KnitStart(u13)
    u2("smoke_block", function(u14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
        --]]
        for _, v15 in Enum.NormalId:GetEnumItems() do
            u4("Texture", {
                ["StudsPerTileU"] = 3,
                ["StudsPerTileV"] = 3,
                ["Texture"] = "rbxassetid://8538034808",
                ["Parent"] = u14,
                ["Face"] = v15
            })
        end
        for _, v16 in u14:GetChildren() do
            if v16:IsA("Texture") then
                u13:handleTexture(u14, v16)
            end
        end
        u14.ChildAdded:Connect(function(p17) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u14
            --]]
            if p17:IsA("Texture") then
                u13:handleTexture(u14, p17)
            end
        end)
    end)
end
function u9.handleTexture(_, _, u18) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local u19 = u7:GetServerTimeNow() % 3
    u18.OffsetStudsU = u19
    task.spawn(function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u19
        --]]
        while u18.Parent do
            local v20 = u6
            local v21 = u18
            local v22 = TweenInfo.new(3, Enum.EasingStyle.Linear)
            local v23 = {
                ["OffsetStudsU"] = u19 + 3
            }
            local v24 = v20:Create(v21, v22, v23)
            v24:Play()
            v24.Completed:Wait()
            u19 = u19 + 3
        end
    end)
end
v3.CreateController(u9.new())
return nil