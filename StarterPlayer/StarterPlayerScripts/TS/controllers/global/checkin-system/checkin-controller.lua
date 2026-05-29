local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "CheckinController"
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
    p9.Name = "CheckinController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    u3.KnitStart(p10)
    u5.Client:Get("SendCheckInData"):Connect(function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4:dispatch({
            ["type"] = "LobbySetCheckInData",
            ["system"] = p11.system,
            ["data"] = p11.profileData
        })
    end)
end
function u6.recordCheckIn(_, u12) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    print("[CheckinController] Recording check-in for system:")
    local v13 = u5.Client:Get("RecordCheckIn"):CallServerAsync(u12)
    v13:andThen(function(p14) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
        --]]
        if not p14 then
            return nil
        end
        u4:dispatch({
            ["type"] = "LobbyRecordCheckIn",
            ["system"] = u12
        })
    end)
    return v13
end
function u6.requestCheckInData(_, u15) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v16 = u5.Client:Get("RequestCheckInData"):CallServerAsync(u15)
    v16:andThen(function(p17) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u15
        --]]
        if not p17 then
            return nil
        end
        u4:dispatch({
            ["type"] = "LobbySetCheckInData",
            ["system"] = u15,
            ["data"] = p17
        })
    end)
    return v16
end
v2.CreateController(u6.new())
return nil