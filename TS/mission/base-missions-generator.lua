local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitServer
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-context").MissionContext
return {
    ["BaseMissionsGenerator"] = {
        ["constructor"] = function(p7, p8, p9, p10, p11, p12) --[[ Name: constructor, Line 11 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u3
                [4] = u6
            --]]
            p7.missionGenerator = p8
            p7.dailyPool = p9
            p7.weeklyPool = p10
            p7.config = p11
            p7.disabled = false
            p7.startingResetTime = DateTime.fromUniversalTime(2021, 8, 27, 23)
            p7.registeredDay = 0
            p7.registeredWeek = 0
            p7.dailyMissions = {}
            p7.weeklyMissions = {}
            p7.dailyMissionRewardAmount = p11.dailyMissionAmount
            p7.weeklyMissionRewardAmount = p11.weeklyMissionAmount
            if p12 then
                p7.disabled = p12
            end
            if #p9 < p11.numDailyMissions or #p10 < p11.numWeeklyMissions then
                p7.disabled = true
                warn("[MISSIONS] Mission pool for " .. p7.missionGenerator .. " doesn\'t have a large enough mission pool for the amount of missions required to be chosen")
            end
            if not p7.disabled then
                p7.dailyMissions = p7:generateDailyMissions(p9)
                p7.weeklyMissions = p7:generateWeeklyMissions(p10)
                p7:registerDailyMissions()
                p7:registerWeeklyMissions()
                if u4:IsServer() and not u2.isHoarceKat() then
                    u3.Services.MissionService:addMissionGenerator(p7.missionGenerator, p7)
                end
                u6.registerGeneratorClass(p7)
            end
        end,
        ["getDailyMissions"] = function(p13) --[[ Name: getDailyMissions, Line 42 ]]
            if p13:getDay() ~= p13.registeredDay then
                p13:unregisterDailyMissions()
                p13.dailyMissions = p13:generateDailyMissions(p13.dailyPool)
                p13:registerDailyMissions()
            end
            return p13.dailyMissions
        end,
        ["getWeeklyMissions"] = function(p14) --[[ Name: getWeeklyMissions, Line 51 ]]
            if p14:getWeek() ~= p14.registeredWeek then
                p14:unregisterWeeklyMissions()
                p14.weeklyMissions = p14:generateWeeklyMissions(p14.weeklyPool)
                p14:registerWeeklyMissions()
            end
            return p14.weeklyMissions
        end,
        ["getDailyMissionRewardAmount"] = function(p15) --[[ Name: getDailyMissionRewardAmount, Line 60 ]]
            local v16 = p15.dailyMissionRewardAmount
            local v17 = p15.config.multiplierEvent
            if v17 then
                local v18 = os.time()
                local v19 = p15.config.multiplierEvent
                if v19 ~= nil then
                    v19 = v19.eventEndTime
                end
                v17 = v18 < v19
            end
            if v17 then
                v16 = v16 * p15.config.multiplierEvent.multiplier
            end
            return v16
        end,
        ["getWeeklyMissionRewardAmount"] = function(p20) --[[ Name: getWeeklyMissionRewardAmount, Line 76 ]]
            local v21 = p20.weeklyMissionRewardAmount
            local v22 = p20.config.multiplierEvent
            if v22 then
                local v23 = os.time()
                local v24 = p20.config.multiplierEvent
                if v24 ~= nil then
                    v24 = v24.eventEndTime
                end
                v22 = v23 < v24
            end
            if v22 then
                v21 = v21 * p20.config.multiplierEvent.multiplier
            end
            return v21
        end,
        ["getDay"] = function(p25) --[[ Name: getDay, Line 92 ]]
            local v26 = DateTime.now().UnixTimestamp - p25.startingResetTime.UnixTimestamp
            local v27 = math.max(v26, 0) / 86400
            return math.ceil(v27)
        end,
        ["getWeek"] = function(p28) --[[ Name: getWeek, Line 96 ]]
            local v29 = p28:getDay() / 7
            return math.ceil(v29)
        end,
        ["generateMissions"] = function(p30, p31, p32, p33, p34, p35, p36, p37) --[[ Name: generateMissions, Line 100 ]]
            local v38 = {}
            if p30.disabled then
                return {}
            end
            local v39 = Random.new(p34)
            if #p31 == 0 then
                return {}
            end
            local v40 = false
            local v41 = 0
            local v42 = {}
            while true do
                if v40 then
                    v41 = v41 + 1
                else
                    v40 = true
                end
                if v41 >= p35 then
                    return v38
                end
                repeat
                    local v43 = p31[v39:NextInteger(0, #p31 - 1) + 1]
                    local v44 = v43.stages[1].type
                until v42[v44] == nil
                local v45 = {}
                local v46 = p30.config.missionIdPrefix
                if v46 == nil then
                    v46 = string.upper(p30.missionGenerator)
                end
                v45.id = v46 .. "_" .. string.upper(p32) .. "_" .. tostring(p33) .. "_MISSION_" .. tostring(v41)
                v45.generator = p30.missionGenerator
                for v47, v48 in v43 do
                    v45[v47] = v48
                end
                v45.rewardAmount = p36
                v45.intervalType = p37
                v42[v44] = true
                table.insert(v38, v45)
            end
        end,
        ["generateDailyMissions"] = function(p49, p50) --[[ Name: generateDailyMissions, Line 153 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            local v51 = p49:getDay()
            return p49:onGenerateDailyMissions((p49:generateMissions(p50, "daily", v51, v51, p49.config.numDailyMissions, p49:getDailyMissionRewardAmount(), u5.DAILY)))
        end,
        ["generateWeeklyMissions"] = function(p52, p53) --[[ Name: generateWeeklyMissions, Line 158 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            local v54 = p52:getWeek()
            return p52:onGenerateWeeklyMissions((p52:generateMissions(p53, "weekly", v54, v54 * 100, p52.config.numWeeklyMissions, p52:getWeeklyMissionRewardAmount(), u5.WEEKLY)))
        end,
        ["registerDailyMissions"] = function(p55) --[[ Name: registerDailyMissions, Line 163 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p55.disabled then
                return nil
            end
            p55.registeredDay = p55:getDay()
            for v56, v57 in p55.dailyMissions do
                local _ = v56 - 1
                u6.register(v57)
            end
        end,
        ["registerWeeklyMissions"] = function(p58) --[[ Name: registerWeeklyMissions, Line 177 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p58.disabled then
                return nil
            end
            p58.registeredWeek = p58:getWeek()
            for v59, v60 in p58.weeklyMissions do
                local _ = v59 - 1
                u6.register(v60)
            end
        end,
        ["unregisterDailyMissions"] = function(p61) --[[ Name: unregisterDailyMissions, Line 191 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p61.disabled then
                return nil
            end
            for v62, v63 in p61.dailyMissions do
                local _ = v62 - 1
                u6.unregister(v63.id)
            end
        end,
        ["unregisterWeeklyMissions"] = function(p64) --[[ Name: unregisterWeeklyMissions, Line 204 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p64.disabled then
                return nil
            end
            for v65, v66 in p64.weeklyMissions do
                local _ = v65 - 1
                u6.unregister(v66.id)
            end
        end,
        ["getConfig"] = function(p67) --[[ Name: getConfig, Line 217 ]]
            return p67.config
        end
    }
}