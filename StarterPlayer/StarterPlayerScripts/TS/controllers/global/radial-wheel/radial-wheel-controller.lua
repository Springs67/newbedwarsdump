local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "radial-wheel", "radial-wheel-type").SLICE_META
local u9 = v1.import(script, script.Parent, "radial-wheel").RadialWheel
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "RadialWheelController"
    end,
    ["__index"] = u7
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
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p13)
    p13.Name = "RadialWheelController"
    p13.radialWheelMaid = u4.new()
    p13.opened = false
end
function u10.KnitStart(p14) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u3
        [4] = u8
    --]]
    u7.KnitStart(p14)
    local v15 = u2.Controllers.PreloadController
    local v16 = u3.values(u8)
    local v17 = table.create(#v16)
    local v18 = {}
    for v19, v20 in v16 do
        local _ = v19 - 1
        v17[v19] = v20.image
    end
    v18.imageIds = v17
    v15:runPreload(v18)
end
function u10.openRadialWheel(u21, p22, p23, p24, u25, p26, p27, u28) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
    --]]
    u21:closeRadialWheel()
    local v29 = u6.LocalPlayer:FindFirstChild("PlayerGui")
    if not v29 then
        return nil
    end
    local u31 = u5.mount(u5.createElement("ScreenGui", {
        ["IgnoreGuiInset"] = true
    }, { u5.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageTransparency"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Modal"] = true,
            [u5.Event.Activated] = function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u21
                --]]
                if u25 then
                    u21:closeRadialWheel()
                end
            end
        }, { u5.createElement(u9, {
                ["angleOffset"] = 270,
                ["entries"] = p22,
                ["numSlices"] = p23,
                ["Position"] = p26,
                ["Size"] = p27 or UDim2.fromScale(0.4, 0.4),
                ["inputObject"] = p24,
                ["limitHoverDistance"] = p24 == nil,
                ["enableClickToSelect"] = p24 == nil,
                ["onClose"] = function() --[[ Name: onClose, Line 78 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    local v30 = u28
                    if v30 ~= nil then
                        v30()
                    end
                end
            }) }) }), v29)
    u21.opened = true
    u21.radialWheelMaid:GiveTask(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u31
            [3] = u21
        --]]
        u5.unmount(u31)
        u21.opened = false
    end)
end
function u10.closeRadialWheel(p32) --[[ Line: 93 ]]
    p32.radialWheelMaid:DoCleaning()
end
function u10.isRadialWheelOpen(p33) --[[ Line: 96 ]]
    return p33.opened
end
u2.CreateController(u10.new())
return nil