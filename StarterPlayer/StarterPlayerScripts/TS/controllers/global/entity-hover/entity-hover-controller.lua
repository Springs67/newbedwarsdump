local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.UserInputService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "EntityHoverController"
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
        [2] = u7
        [3] = u3
    --]]
    u8.constructor(p13)
    p13.Name = "EntityHoverController"
    p13.hoverSignal = u7.new()
    p13.unhoverSignal = u7.new()
    p13.maid = u3.new()
    p13.hoveredEntity = nil
end
function u10.KnitStart(p14) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p14)
end
function u10.enable(u15) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u9
    --]]
    u15.maid:DoCleaning()
    local u16 = u5.LocalPlayer:GetMouse()
    u15.maid:GiveTask(u6.InputChanged:Connect(function(_) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u9
            [3] = u15
        --]]
        if u16.Target then
            local v17 = u9:getEntityFromDescendant(u16.Target)
            if v17 then
                if u15.hoveredEntity == v17 then
                    return nil
                end
                u15.hoveredEntity = v17
                u15.hoverSignal:Fire(v17)
                return
            end
            if u15.hoveredEntity == nil then
                return nil
            end
            u15.unhoverSignal:Fire(u15.hoveredEntity)
            u15.hoveredEntity = nil
        end
    end))
end
function u10.disable(p18) --[[ Line: 59 ]]
    p18.maid:DoCleaning()
end
function u10.watchEntityMouseHover(p19, u20) --[[ Line: 62 ]]
    local u22 = p19.hoverSignal:Connect(function(p21) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20(p21)
    end)
    return function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:Disconnect()
    end
end
function u10.watchEntityMouseUnHover(p23, u24) --[[ Line: 70 ]]
    local u26 = p23.unhoverSignal:Connect(function(p25) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24(p25)
    end)
    return function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:Disconnect()
    end
end
function u10.getMouseHoverSignal(p27) --[[ Line: 78 ]]
    return p27.hoverSignal
end
v2.CreateController(u10.new())
return nil