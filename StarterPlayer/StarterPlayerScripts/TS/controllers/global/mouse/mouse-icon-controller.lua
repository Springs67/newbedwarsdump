local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "MouseIconController"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    p10.mouseMaid = u4.new()
end
function u7.onStart(_) --[[ Line: 23 ]] end
function u7.setMouseIcon(p11, p12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local u13 = u6.LocalPlayer:GetMouse()
    local v14 = u5
    local v15 = {
        ["Name"] = "MouseIcon",
        ["DisplayOrder"] = 10000,
        ["Children"] = { u5("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10000,
                ["Size"] = UDim2.new(0, 48, 0, 48),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromOffset(u13.X, u13.Y),
                ["Image"] = p12,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) },
        ["Parent"] = u6.LocalPlayer:WaitForChild("PlayerGui")
    }
    local u16 = v14("ScreenGui", v15)
    local v18 = u13.Move:Connect(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u13
        --]]
        local v17 = u16:FindFirstChildWhichIsA("ImageLabel")
        if v17 then
            v17.Position = UDim2.fromOffset(u13.X, u13.Y)
        end
    end)
    p11.mouseMaid:GiveTask(v18)
    p11.mouseMaid:GiveTask(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:Destroy()
    end)
end
function u7.clearMouseIcon(p19) --[[ Line: 52 ]]
    p19.mouseMaid:DoCleaning()
end
v2.defineMetadata(u7, "identifier", "client/controllers/global/mouse/mouse-icon-controller@MouseIconController")
v2.defineMetadata(u7, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u7, "$:flamework@Controller", v3, {
    {}
})
return {
    ["MouseIconController"] = u7
}