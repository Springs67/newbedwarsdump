local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ItemSkinPreviewController"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p13)
    p13.Name = "ItemSkinPreviewController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p14)
end
function u10.previewItemSkin(_, p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u7
        [4] = u4
        [5] = u8
        [6] = u5
    --]]
    local v16 = u3.new()
    u2.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 0.6108652381980153, 0))
    local v17 = u7:FindFirstChild("Items")
    if v17 ~= nil then
        v17 = v17:FindFirstChild(p15)
    end
    if not v17 then
        return v16
    end
    local v18 = v17:Clone()
    local v19 = v18:FindFirstChild("Handle")
    if not v19 then
        return v16
    end
    local v20 = u4("Model", {
        ["Children"] = { v18 }
    })
    local v21 = select(2, v20:GetBoundingBox()).Y
    local v22 = Vector3.new(0, v21, 0)
    local v23 = u4("Part", {
        ["Name"] = "ItemSkinPivot",
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Parent"] = u8,
        ["CFrame"] = CFrame.new(v19:GetPivot() * v22)
    })
    v20.Parent = v23
    v20:PivotTo(CFrame.new(v19:GetPivot() * v22) * CFrame.Angles(0.6981317007977318, 0, 0))
    u5(v20, 1.5)
    v16:GiveTask(v23)
    v16:GiveTask(v18)
    return v16
end
u2.CreateController(u10.new())
return nil