local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.UserInputService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "MouseController"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p11)
    p11.Name = "MouseController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p12)
end
function u8.hookToMouseMovement(_, u13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    local v14 = u3.new()
    v14:GiveTask(u6.InputChanged:Connect(function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p15.UserInputType == Enum.UserInputType.MouseMovement then
            u13(p15.Position, p15)
        end
    end))
    return v14
end
function u8.hookToMouseClick(_, u16) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    local v17 = u3.new()
    local u18 = u5.LocalPlayer:GetMouse()
    local u19 = 0
    v17:GiveTask(u18.Button1Down:Connect(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u16
            [3] = u18
        --]]
        u19 = u19 + 1
        if u19 % 2 == 0 then
            u16(u18, true)
        else
            u16(u18, false)
        end
        task.delay(0.5, function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19 = u19 - 1
        end)
    end))
    return v17
end
v2.CreateController(u8.new())
return nil