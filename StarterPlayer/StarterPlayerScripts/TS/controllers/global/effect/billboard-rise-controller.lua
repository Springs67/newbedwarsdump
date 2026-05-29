local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.GameQueryUtil
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Lighting
local u10 = v8.Players
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = u1.import(script, script.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "BillboardRiseController"
    end,
    ["__index"] = u13
})
u16.__index = u16
function u16.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p19)
    p19.Name = "BillboardRiseController"
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:WaitFor("BillboardRiseEffect"):andThen(function(p21) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        p21:Connect(function(p22) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:playEffect(p22.position, {
                ["image"] = p22.image,
                ["imageColor"] = p22.imageColor,
                ["itemType"] = p22.itemType,
                ["size"] = p22.size
            })
        end)
    end)
end
function u16.playEffect(_, p23, p24) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u9
        [4] = u4
        [5] = u7
        [6] = u15
        [7] = u3
        [8] = u10
        [9] = u11
        [10] = u1
    --]]
    if (p23 - u12.CurrentCamera.CFrame.Position).Magnitude >= 100 then
        return nil
    end
    local v25 = u6("Part", {
        ["Name"] = "HarvestCropFloatEffect",
        ["Size"] = Vector3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CFrame"] = CFrame.new(p23),
        ["Parent"] = u9
    })
    u4:setQueryIgnored(v25, true)
    local v26 = p24.size or UDim2.fromScale(2.5, 2.5)
    local u27 = u7.createRef()
    local v28 = u7
    local v29 = {
        [u7.Ref] = u27,
        ["Adornee"] = v25,
        ["Size"] = v26,
        ["LightInfluence"] = 0
    }
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v33 = {}
    local v34 = #v33
    local v35
    if p24.itemType == nil then
        v35 = false
    else
        v35 = u7.createElement(u15, {
            ["ItemType"] = p24.itemType
        })
    end
    if v35 then
        v33[v34 + 1] = v35
    end
    local v36 = #v33
    local v37
    if p24.image == nil then
        v37 = false
    else
        v37 = u7.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = p24.image,
            ["ImageColor3"] = p24.imageColor,
            ["Size"] = UDim2.fromScale(1, 1)
        })
    end
    if v37 then
        v33[v36 + 1] = v37
    end
    v30[v31 + 1] = u7.createElement(u3, v32, v33)
    local u38 = v28.mount(u7.createElement("BillboardGui", v29, v30), u10.LocalPlayer:WaitForChild("PlayerGui"))
    u11:Create(u27:getValue(), TweenInfo.new(0.7), {
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 3.2, 0)
    }):Play()
    u1.Promise.delay(0.5):andThen(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u27
        --]]
        u11:Create(u27:getValue(), TweenInfo.new(0.2), {
            ["Size"] = UDim2.fromScale(0, 0)
        }):Play()
    end)
    u1.Promise.delay(1.5):andThen(function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u38
        --]]
        u7.unmount(u38)
    end)
end
return {
    ["BillboardRiseController"] = v5.CreateController(u16.new())
}