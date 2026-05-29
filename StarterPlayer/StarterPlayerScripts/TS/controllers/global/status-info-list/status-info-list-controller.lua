local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.Signal
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent, "status-info-list").StatusInfoList
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "StatusInfoListController"
    end,
    ["__index"] = u8
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
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p13)
    p13.Name = "StatusInfoListController"
    p13.isListSetup = false
    p13.listSetupSignal = u5.new()
    p13.listElementsQueue = {}
end
function u10.KnitStart(u14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u9
        [4] = u7
    --]]
    u8.KnitStart(u14)
    u14.tree = u6.mount(u6.createElement(u9, {
        ["SetupRef"] = function(p15) --[[ Name: SetupRef, Line 35 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14.list = p15
            u14.isListSetup = true
            u14.listSetupSignal:Fire(p15)
        end
    }), u7.LocalPlayer:WaitForChild("PlayerGui"))
    u14.listSetupSignal:Connect(function(_) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        for v16, v17 in u14.listElementsQueue do
            local _ = v16 - 1
            u14:addElement(v17.element, v17.position)
        end
    end)
end
function u10.addElement(p18, p19, p20, p21, p22) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    if p18.list then
        if p20 then
            local v23 = p20 == "Right" and #p18.list:GetChildren() or 0
            if p20 == "Left" then
                p18:shiftListLayoutOrder()
                v23 = 0
            end
            local v24 = p22 == nil and "StatusInfoElement" or p22
            local v25 = u6.createFragment
            local v26 = {
                [v24] = u6.createElement(u2, {
                    ["Size"] = p21 or UDim2.fromScale(1, 1),
                    ["LayoutOrder"] = v23
                }, { p19 })
            }
            p19 = v25(v26)
        end
        return u6.mount(p19, p18.list)
    end
    local v27 = p18.listElementsQueue
    table.insert(v27, {
        ["element"] = p19,
        ["position"] = p20
    })
    return nil
end
function u10.waitForSetupAddElement(p28, p29, p30, p31, p32) --[[ Line: 85 ]]
    if not p28.isListSetup then
        p28.listSetupSignal:Wait()
    end
    return p28:addElement(p29, p30, p32, p31)
end
function u10.getList(p33) --[[ Line: 91 ]]
    return p33.list
end
function u10.shiftListLayoutOrder(p34) --[[ Line: 94 ]]
    local v35 = p34.list
    if v35 ~= nil then
        for v36, v37 in v35:GetChildren() do
            local _ = v36 - 1
            if v37:IsA("GuiObject") then
                v37.LayoutOrder = v37.LayoutOrder + 1
            end
        end
    end
end
v4.CreateController(u10.new())
return nil