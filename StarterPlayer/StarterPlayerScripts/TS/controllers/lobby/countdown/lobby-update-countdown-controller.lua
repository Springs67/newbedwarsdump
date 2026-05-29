local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "LobbyUpdateCountdownController"
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
        [2] = u8
    --]]
    u7.constructor(p12)
    p12.Name = "LobbyUpdateCountdownController"
    p12.weeklyUpdateReset = u8.resetTime
    p12.boardTag = "update-countdown-board"
    p12.boardTitle = "NEXT UPDATE"
    p12.displayThreshold = 1209600
    p12.updateResetInterval = 604800
    p12.updateTime = p12:getWeeklyUpdateTime()
    p12.updateTimeOverride = 1760738400
end
function u9.KnitStart(u13) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
    --]]
    u7.KnitStart(u13)
    u4(u13.boardTag, function(u14) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
        --]]
        local v15 = u13:getUpdateTime() - os.time() < u13.displayThreshold
        local u16 = false
        local v17 = u14:FindFirstChild("TitlePart")
        if v17 ~= nil then
            v17 = v17:FindFirstChildWhichIsA("SurfaceGui")
            if v17 ~= nil then
                v17 = v17:FindFirstChildWhichIsA("TextLabel")
            end
        end
        if v17 then
            v17.Text = u13.boardTitle
        end
        local function u23() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u14
                [3] = u6
                [4] = u13
            --]]
            u16 = true
            for v18, v19 in u14:GetDescendants() do
                local _ = v18 - 1
                if v19:IsA("SurfaceGui") then
                    v19.Enabled = true
                end
            end
            for v20, u21 in u6:GetTagged("update-countdown") do
                local _ = v20 - 1
                if u21:IsA("TextLabel") then
                    task.spawn(function() --[[ Line: 71 ]]
                        --[[
                        Upvalues:
                            [1] = u21
                            [2] = u13
                        --]]
                        repeat
                            u21.Text = u13:getTime(u13:getUpdateTime(), "UPDATE HYPE!!")
                            local v22 = task.wait(1)
                        until v22 == 0 or (v22 ~= v22 or not v22)
                    end)
                end
            end
        end
        if v15 then
            u23()
        end
        if not u16 then
            u13.weeklyUpdateReset:poll(86400, 3600, function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23()
            end)
        end
    end)
    u13.weeklyUpdateReset:poll(u13.updateResetInterval, 300, function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.updateTime = u13:getWeeklyUpdateTime()
    end)
end
function u9.getUpdateTime(p24) --[[ Line: 101 ]]
    if p24.updateTimeOverride > os.time() then
        return p24.updateTimeOverride
    else
        return p24.updateTime
    end
end
function u9.getTime(_, p25, p26) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v27 = p25 - os.time()
    local v28 = math.max(0, v27)
    if v28 == 0 then
        return p26
    else
        return u3.formatCountdownTime(v28, {
            ["days"] = true,
            ["hours"] = true,
            ["seperator"] = " : "
        })
    end
end
function u9.getWeeklyUpdateTime(p29) --[[ Line: 119 ]]
    return p29.weeklyUpdateReset:getNextWeeklyResetTime()
end
v5.CreateController(u9.new())
return nil