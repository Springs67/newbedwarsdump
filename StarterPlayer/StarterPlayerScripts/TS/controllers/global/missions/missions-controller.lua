local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "MissionsController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "MissionsController"
end
function u6.KnitStart(u10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    u3.KnitStart(u10)
    u5.Client:OnEvent("SetAllMissionData", function(p11) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
        --]]
        u10.missionData = p11.missionData
        u4:dispatch({
            ["type"] = "LobbySetMissionsData",
            ["missionsData"] = p11.missionData
        })
    end)
    u5.Client:OnEvent("UpdateMissionProgress", function(p12) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
        --]]
        local v13 = u10.missionData
        if v13 ~= nil then
            v13.progress[p12.missionId] = p12.progress
        end
        local v14 = p12.nextStage
        if v14 ~= 0 and (v14 == v14 and v14) then
            local v15 = u10.missionData
            if v15 ~= nil then
                v15.stages[p12.missionId] = p12.nextStage
            end
        end
        if u10.missionData then
            u4:dispatch({
                ["type"] = "LobbySetMissionsData",
                ["missionsData"] = u10.missionData
            })
        end
    end)
end
function u6.getMissionData(u16) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u4
    --]]
    local u17 = u16.missionData
    if u17 then
        return u1.Promise.new(function(p18) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            p18(u17)
        end)
    end
    local v19 = u5.Client:Get("LoadMissionData"):CallServerAsync()
    v19:andThen(function(p20) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u16
        --]]
        u4:dispatch({
            ["type"] = "LobbySetMissionsData",
            ["missionsData"] = p20
        })
        u16.missionData = p20
    end)
    return v19
end
v2.CreateController(u6.new())
return nil