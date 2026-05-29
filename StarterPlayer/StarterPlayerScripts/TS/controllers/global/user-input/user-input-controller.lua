local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "UserInputController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "UserInputController"
end
function u7.KnitStart(u11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.KnitStart(u11)
    u5.Client:Get("RequestUserInputType"):Connect(function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
        --]]
        u5.Client:Get("SendUserInputType"):SendToServer({
            ["userInputType"] = u11:getUserInputType()
        })
    end)
end
function u7.getUserInputType(_) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    if u3.GamepadEnabled then
        return u6.GAMEPAD
    elseif u3.TouchEnabled and not u3.MouseEnabled then
        return u6.MOBILE
    else
        return u6.PC
    end
end
v2.CreateController(u7.new())
return nil