local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out")
local u3 = v2.default
local u4 = v2.Logger
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").SceneManager
local u6 = v1.import(script, script.Parent).pirateBuildupScene
return function(_) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u5
        [4] = u6
    --]]
    u3.SetLogger(u4:configure():WriteTo(u3.RobloxOutput()):Create())
    local u7 = u5.new()
    u7:loadScene(u6)
    local u8 = u7:begin()
    return function() --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
        --]]
        u7:cleanAllState()
        u8:DoCleaning()
    end
end