local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").ItemSkinMeta
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "BedSkinPreviewController"
    end,
    ["__index"] = u10
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p16)
    p16.Name = "BedSkinPreviewController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p17)
end
function u13.previewBedSkin(_, p18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u8
        [4] = u5
        [5] = u9
        [6] = u6
        [7] = u12
        [8] = u2
        [9] = u11
    --]]
    local v19 = u4.new()
    u3.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 0.6108652381980153, 0))
    local v20 = u3.Controllers.LockerPreviewController:getBedAttachment()
    local v21 = u3.Controllers.LockerPreviewController:getBedCenterAttachment()
    local v22 = u8.Assets.Blocks:FindFirstChild(p18)
    if not v22 then
        return v19
    end
    local v23 = v22:Clone()
    local v24 = select(2, v23:GetBoundingBox()).Y
    local v25 = Vector3.new(0, v24, 0)
    local v26 = u5("Part", {
        ["Name"] = "BedSkinPivot",
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Parent"] = u9,
        ["CFrame"] = CFrame.new(v21.WorldPosition + v25)
    })
    v23.Parent = v26
    v23:PivotTo(CFrame.new(v20.WorldPosition + v25) * CFrame.Angles(0.6981317007977318, 0, 0))
    u6(v23, 1.5)
    v19:GiveTask(v26)
    v19:GiveTask(v23)
    local v27 = v23:FindFirstChild("Carpet", true)
    if v27 then
        v27:Destroy()
    end
    local v28 = u12[p18].defaultColor
    local v29 = v23:FindFirstChildWhichIsA("SurfaceAppearance", true)
    if v29 then
        local v30 = u2
        if v28 == nil then
            v28 = u11.red
        end
        v29.Color = v30.hexColor(v28)
    end
    return v19
end
u3.CreateController(u13.new())
return nil