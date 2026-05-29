local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent, "ui", "script-progress-container").ScriptProgressContainer
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ScriptProgressBarController"
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
    p13.Name = "ScriptProgressBarController"
    p13.progressBars = {}
    p13.progressGUIMaid = u4.new()
end
function u10.KnitStart(u14) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    u7.KnitStart(u14)
    u8.Client:OnEvent("UpdateScriptProgressBar", function(p15) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.progressBars[p15.id] = p15.progressBar
        u14:mountProgressGUI()
    end)
    u8.Client:OnEvent("RemoveScriptProgressBar", function(p16) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.progressBars[p16.id] = nil
        u14:mountProgressGUI()
    end)
end
function u10.mountProgressGUI(p17) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u9
        [4] = u6
    --]]
    p17.progressGUIMaid:DoCleaning()
    local v18 = {
        ["progressBars"] = u3.values(p17.progressBars)
    }
    local u19 = u5.mount(u5.createElement(u9, v18), u6.LocalPlayer:WaitForChild("PlayerGui"))
    p17.progressGUIMaid:GiveTask(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u19
        --]]
        u5.unmount(u19)
    end)
end
v2.CreateController(u10.new())
return nil