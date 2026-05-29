local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["EventUtil"] = {
        ["ROBLOX_WINTER_SPOTLIGHT_ACTIVE"] = true,
        ["makeStarterEventData"] = function() --[[ Line: 12 ]]
            return {
                ["currencies"] = {},
                ["events"] = {}
            }
        end,
        ["getItemColorRarity"] = function(p6) --[[ Line: 19 ]]
            if p6 >= 6000 then
                return Color3.fromRGB(255, 59, 59)
            elseif p6 >= 4000 then
                return Color3.fromRGB(242, 255, 95)
            elseif p6 >= 3000 then
                return Color3.fromRGB(95, 169, 255)
            elseif p6 >= 500 then
                return Color3.fromRGB(79, 255, 107)
            else
                return Color3.fromHex("#FFFFFF")
            end
        end,
        ["isEventActive"] = function(p7) --[[ Name: isEventActive, Line 32 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
                [3] = u4
            --]]
            local v8 = u3[p7]
            if v8 then
                return v8.active and true or ((u5.isStaging() or u4:IsStudio()) and v8.alwaysActiveInDevTesting == true and true or false)
            else
                return false
            end
        end,
        ["isEventRunning"] = function(p9) --[[ Name: isEventRunning, Line 48 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
                [3] = u4
            --]]
            local v10 = u3[p9]
            if v10 then
                if (u5.isStaging() or u4:IsStudio()) and v10.alwaysActiveInDevTesting == true then
                    return true
                elseif v10.active then
                    return os.time() > v10.startDate and os.time() < v10.endDate
                else
                    return false
                end
            else
                return false
            end
        end,
        ["getActiveEvents"] = function() --[[ Name: getActiveEvents, Line 67 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u5
                [4] = u4
            --]]
            local v11 = 0
            local v12 = {}
            for v13, v14 in u2.entries(u3) do
                local _ = v13 - 1
                local v15 = v14[1]
                local v16 = v14[2]
                if u5.isStaging() or u4:IsStudio() then
                    local _ = v16.alwaysActiveInDevTesting == true
                end
                if not v16.active then
                    v15 = nil
                end
                if v15 ~= nil then
                    v11 = v11 + 1
                    v12[v11] = v15
                end
            end
            return v12
        end,
        ["getActiveTeamEvents"] = function() --[[ Name: getActiveTeamEvents, Line 96 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u5
                [4] = u4
            --]]
            local v17 = 0
            local v18 = {}
            for v19, v20 in u2.entries(u3) do
                local _ = v19 - 1
                local v21 = v20[1]
                local v22 = v20[2]
                if not (u5.isStaging() or u4:IsStudio()) or v22.alwaysActiveInDevTesting ~= true then
                    if v22.active then
                        local v23 = v22.customPagesConfig
                        if v23 ~= nil then
                            v23 = v23.setTeamPage
                        end
                        if v23 == nil then
                            v21 = nil
                        end
                    else
                        v21 = nil
                    end
                end
                if v21 ~= nil then
                    v17 = v17 + 1
                    v18[v17] = v21
                end
            end
            return v18
        end
    }
}