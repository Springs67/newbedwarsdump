local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, script.Parent.Parent, "spectate", "spectate-controller").SpectateMode
local u7 = v1.import(script, script.Parent, "ui", "overwatch-hud").OverwatchHud
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "OverwatchController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "OverwatchController"
    p11.hudEnabled = false
end
function u8.KnitStart(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    u4.KnitStart(u12)
    u2.resolveDependency("client/controllers/global/report/report-controller@ReportController").currentTicketSignal:Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:enableHud(p13)
    end)
    local v14 = u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getCurrentTicket()
    if v14 ~= nil then
        u12:enableHud(v14)
    end
end
function u8.enableHud(p15, p16) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u7
    --]]
    if p15.hudEnabled then
        return nil
    end
    p15.hudEnabled = true
    u3.Controllers.SpectateController:setSpectateMode(u6.PLAYER)
    local v17 = {
        ["appId"] = "OverwatchHud",
        ["app"] = u7
    }
    local v18 = {
        ["ReportTicket"] = p16,
        ["SuspectInfo"] = u5.Client:Get("GetSuspectInfo"):CallServer(p16.reported)
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v17, v18)
end
u3.CreateController(u8.new())
return nil