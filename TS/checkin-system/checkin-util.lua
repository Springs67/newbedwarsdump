local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system-meta").getCheckInSystemMeta
local u20 = {
    ["hasCheckedIn"] = function(p6, p7, p8) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u20
            [3] = u2
            [4] = u4
        --]]
        if #p6.checkIns == 0 then
            return false
        end
        if p8 ~= 0 and (p8 == p8 and p8) then
            return p6.checkIns[p8 + 1] ~= nil
        end
        local v9 = false
        local v10 = u5(p7)
        local v11 = u20.getSystemDates(p7)
        if v11 then
            local v12 = (os.time() - v11.startTime) / 86400
            local v13 = math.ceil(v12)
            local v14 = #p6.checkIns
            v9 = v13 <= (v14 == nil and 0 or v14) and true or v9
        end
        local v15 = p6.checkIns[#p6.checkIns - 1 + 1]
        local v16
        if v11 then
            if v11 ~= nil then
                v11 = v11.startTime
            end
            v16 = u2.new(v11)
        else
            v16 = u4.resetTime
        end
        return v16:getDailyResetId() == v16:getResetId(v10.interval, v15.time) and true or v9
    end,
    ["getSystemDates"] = function(p17) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
        --]]
        local v18 = u5(p17)
        if v18.timePeriod then
            return v18.timePeriod
        end
        if not v18.event then
            return nil
        end
        local v19 = u3[v18.event]
        return {
            ["startTime"] = v19.startDate,
            ["endTime"] = v19.endDate
        }
    end
}
return {
    ["CheckInUtil"] = u20
}