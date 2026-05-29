local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "new-years", "ball-drop-util").BallDropUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "BallDropCountdownController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p12)
    p12.Name = "BallDropCountdownController"
end
function u9.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.KnitStart(u13)
    u4("NewYearCountdownBoard", function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v15 = p14:FindFirstChildOfClass("SurfaceGui")
        if v15 ~= nil then
            v15 = v15:FindFirstChildOfClass("TextLabel")
        end
        if v15 then
            u13:countdown(v15)
        end
    end)
    u4("BallDropCountdownTimer", function(u16) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        task.spawn(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            u13:countdown(u16, "JOIN GAME!", -120)
        end)
    end)
end
function u9.countdown(_, p17, p18, p19) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u6
    --]]
    while true do
        local v20 = u8:getTimeToNextBallDropSec() + (p19 == nil and 0 or p19)
        if v20 == nil then
            break
        end
        if v20 < 0 then
            p17.Text = p18 == nil and "" or p18
        else
            p17.Text = u3.fromNow(u6:GetServerTimeNow() + v20, {
                ["long"] = false,
                ["seconds"] = true,
                ["minutes"] = true,
                ["hours"] = false,
                ["days"] = false,
                ["weeks"] = false
            })
        end
        local v21 = task.wait(1)
        if v21 == 0 or (v21 ~= v21 or not v21) then
            return
        end
    end
    local v22 = p17.Parent
    while v22 and not v22:IsA("Model") do
        v22 = v22.Parent
    end
    if v22 ~= nil then
        v22:Destroy()
    end
    return nil
end
v5.CreateController(u9.new())
return nil