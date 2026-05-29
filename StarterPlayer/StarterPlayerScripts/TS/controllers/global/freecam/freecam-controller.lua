local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "FreecamController"
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
        [2] = u3
    --]]
    u8.constructor(p12)
    p12.Name = "FreecamController"
    p12.freecamMaid = u3.new()
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    u8.KnitStart(u13)
    u7:GetAttributeChangedSignal("FreecamEnabled"):Connect(function(_) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
        --]]
        if not u7:GetAttribute("FreecamEnabled") then
            u13:disableFreecam()
        end
    end)
end
function u9.enableFreecamController(u14) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
    --]]
    u7:SetAttribute("FreecamControllerEnabled", true)
    local v15 = u4.mount
    local v16 = u4.createFragment
    local v17 = {}
    local v18 = u4.createElement
    local v19 = {
        ["ExitFreecamButton"] = u4.createElement("ImageButton", {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.95),
            ["Size"] = UDim2.fromScale(0.1, 0.1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            [u4.Event.Activated] = function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:disableFreecam()
            end
        }, { u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.8545454545454545
            }), u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }), u4.createElement("TextLabel", {
                ["Text"] = "Exit Freecam",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.8, 0.6),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.GothamMedium
            }) })
    }
    v17.ExitFreecamGui = v18("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 1000
    }, v19)
    local u20 = v15(v16(v17), u6.LocalPlayer:WaitForChild("PlayerGui"))
    u14.freecamMaid:GiveTask(function() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
        --]]
        u4.unmount(u20)
    end)
end
function u9.disableFreecam(p21) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7:SetAttribute("FreecamControllerEnabled", false)
    p21.freecamMaid:DoCleaning()
end
v2.CreateController(u9.new())
return nil