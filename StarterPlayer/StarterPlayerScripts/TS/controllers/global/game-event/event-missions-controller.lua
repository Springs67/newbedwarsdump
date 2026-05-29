local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Signal
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "EventMissionsController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
    --]]
    u5.constructor(p11)
    p11.Name = "EventMissionsController"
    p11.eventRemotes = u7.Client:GetNamespace("Event")
    p11.missionsUpdate = p11.eventRemotes:Get("ActiveEventMissionsUpdate")
    p11.activeMissions = {}
    p11.missionDataReceivedSignal = u4.new()
end
function u8.KnitStart(u12) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.KnitStart(u12)
    u12.missionsUpdate:Connect(function(p13) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        local v14 = {
            ["type"] = "SetEventPartial",
            ["data"] = {
                ["activeMissions"] = p13
            }
        }
        u6:dispatch(v14)
        u12.activeMissions = p13
        u12.missionDataReceivedSignal:Fire(p13)
    end)
end
function u8.waitForMissionData(p15) --[[ Line: 44 ]]
    if next(p15.activeMissions) == nil then
        return p15.missionDataReceivedSignal:Wait()
    else
        return p15.activeMissions
    end
end
function u8.getEventActiveMissions(p16, p17) --[[ Line: 51 ]]
    return p16.activeMissions[p17]
end
function u8.claimMission(p18, p19, p20) --[[ Line: 56 ]]
    return p18.eventRemotes:Get("ClaimMission"):CallServer(p19, p20)
end
v3.CreateController(u8.new())
return nil