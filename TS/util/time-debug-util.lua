local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.HttpService
local u7 = v5.RunService
return {
    ["TimeDebugUtil"] = {
        ["startDebugTimer"] = function() --[[ Name: startDebugTimer, Line 12 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u7
                [3] = u4
                [4] = u3
            --]]
            local v8 = u6:GenerateGUID()
            if u7:IsServer() then
                u4.Services.DebugService.debugTimers[v8] = {
                    ["endTime"] = nil,
                    ["key"] = v8,
                    ["startTime"] = os.clock()
                }
                return v8
            else
                u3.Controllers.DebugController.debugTimers[v8] = {
                    ["endTime"] = nil,
                    ["key"] = v8,
                    ["startTime"] = os.clock()
                }
                return v8
            end
        end,
        ["getDebugTimerResult"] = function(p9) --[[ Name: getDebugTimerResult, Line 34 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u3
            --]]
            local v10
            if u7:IsServer() then
                v10 = u4.Services.DebugService.debugTimers[p9]
            else
                v10 = u3.Controllers.DebugController.debugTimers[p9]
            end
            if not v10 then
                return nil
            end
            v10.endTime = os.clock()
            return os.clock()
        end,
        ["startDebugTimerArray"] = function() --[[ Name: startDebugTimerArray, Line 52 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u7
                [3] = u4
                [4] = u3
            --]]
            local v11 = u6:GenerateGUID()
            if u7:IsServer() then
                u4.Services.DebugService.debugTimerArrays[v11] = {}
                return v11
            else
                u3.Controllers.DebugController.debugTimerArrays[v11] = {}
                return v11
            end
        end,
        ["getDebugTimerArrayResults"] = function(p12) --[[ Name: getDebugTimerArrayResults, Line 62 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u3
            --]]
            local v13
            if u7:IsServer() then
                v13 = u4.Services.DebugService.debugTimerArrays[p12]
            else
                v13 = u3.Controllers.DebugController.debugTimerArrays[p12]
            end
            if not v13 then
                return nil
            end
            local v14 = {}
            for v15, v16 in v13 do
                local _ = v15 - 1
                local v17 = v16.endTime
                if v17 ~= 0 and (v17 == v17 and v17) then
                    local v18 = v16.endTime - v16.startTime
                    table.insert(v14, v18)
                end
            end
            local v19 = unpack
            local _ = math.min(v19(v14)) * 1000
            local v20 = unpack
            local _ = math.max(v20(v14)) * 1000
            if #v14 == 0 then
                error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
            end
            local v21 = v14[1]
            for v22 = 2, #v14 do
                local v23 = v14[v22]
                local _ = v22 - 1
                v21 = v21 + v23
            end
            local _ = v21 / #v14 * 1000
            return v14
        end,
        ["startDebugTimerInArray"] = function(p24) --[[ Name: startDebugTimerInArray, Line 107 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u3
                [4] = u6
            --]]
            local v25
            if u7:IsServer() then
                v25 = u4.Services.DebugService.debugTimerArrays[p24] or {}
            else
                v25 = u3.Controllers.DebugController.debugTimerArrays[p24] or {}
            end
            if v25 then
                local v26 = u6:GenerateGUID()
                local v27 = {
                    ["endTime"] = nil,
                    ["key"] = v26,
                    ["startTime"] = os.clock()
                }
                table.insert(v25, v27)
                if u7:IsServer() then
                    u4.Services.DebugService.debugTimerArrays[p24] = v25
                    return v26
                else
                    u3.Controllers.DebugController.debugTimerArrays[p24] = v25
                    return v26
                end
            else
                return ""
            end
        end,
        ["endDebugTimerInArray"] = function(p28, p29) --[[ Name: endDebugTimerInArray, Line 151 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u3
            --]]
            local v30
            if u7:IsServer() then
                v30 = u4.Services.DebugService.debugTimerArrays[p28] or {}
            else
                v30 = u3.Controllers.DebugController.debugTimerArrays[p28] or {}
            end
            local v31 = nil
            for v32, v33 in v30 do
                local _ = v32 - 1
                if v33.key == p29 == true then
                    v31 = v33
                    break
                end
            end
            if not v31 then
                return nil
            end
            if v31.endTime ~= nil then
                return nil
            end
            v31.endTime = os.clock()
            return v31.endTime - v31.startTime
        end
    }
}