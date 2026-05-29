local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "NewRankedSeasonCountdownController"
    end,
    ["__index"] = u6
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
        [1] = u6
        [2] = u7
        [3] = u8
    --]]
    u6.constructor(p12)
    p12.Name = "NewRankedSeasonCountdownController"
    p12.countdownTag = "ranked-countdown"
    p12.endTime = u7(u8.activeRankMeta.queueType).endTime
end
function u9.KnitStart(u13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.KnitStart(u13)
    u4(u13.countdownTag, function(u14) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v15 = u13.endTime
        if v15 == 0 or (v15 ~= v15 or not v15) then
            return nil
        end
        u14.RichText = false
        if os.time() > u13.endTime then
            u14:Destroy()
            return nil
        end
        task.spawn(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u14
            --]]
            while true do
                local v16 = u13.endTime
                if v16 == 0 or (v16 ~= v16 or not v16) then
                    break
                end
                u14.Text = u13:getTime(u13.endTime, "Ranked Season Ending")
                local v17 = task.wait(1)
                if v17 == 0 or (v17 ~= v17 or not v17) then
                    return
                end
            end
            return nil
        end)
    end)
end
function u9.getTime(_, p18, p19) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v20 = p18 - os.time()
    local v21 = math.max(0, v20)
    if v21 == 0 then
        return p19
    else
        return u3.formatCountdownTime(v21, {
            ["days"] = true,
            ["hours"] = true,
            ["seperator"] = " : "
        })
    end
end
v5.CreateController(u9.new())
return nil