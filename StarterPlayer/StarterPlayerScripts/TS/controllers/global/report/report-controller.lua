local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local v3 = v2.Reflect
local u4 = v2.Flamework
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TeleportService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "ReportController"
    end
})
u12.__index = u12
function u12.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
    --]]
    p15.currentTicketSignal = u10.new()
    p15.reportRateLimit = u5.new(1)
    p15.reportedPlayers = {}
end
function u12.onStart(p16) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
    --]]
    local v17 = u9:GetLocalPlayerTeleportData()
    local v18 = not v17
    if not v18 then
        local v19 = v17.reportTicketId
        if v19 == "" then
            v19 = false
        end
        v18 = not v19
    end
    if v18 then
        return nil
    else
        p16.currentTicket = u11.Client:Get("GetTicket"):CallServer(v17.reportTicketId)
        if p16.currentTicket then
            p16.currentTicketSignal:Fire(p16.currentTicket)
        else
            local v20 = v17.reportTicketId
            if v20 ~= "" and v20 then
                v20 = not p16.currentTicket
            end
            if v20 ~= "" and v20 then
                print("[OW] No ticket retrieved. Attempted to retrieve id: " .. v17.reportTicketId)
            end
        end
    end
end
function u12.resolveCurrentTicket(p21, p22) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v23 = p21.currentTicket
    if v23 ~= nil then
        v23 = v23._id
    end
    if v23 == "" or not v23 then
        return nil
    end
    u11.Client:Get("SubmitTicketResult"):SendToServer(p21.currentTicket._id, p22)
end
function u12.getNextTicket(_) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.Client:Get("RequestNextReport"):SendToServer()
end
function u12.reportPlayer(p24, p25) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u11
    --]]
    if p24.reportRateLimit:has(u8.LocalPlayer.UserId) then
        u4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You\'re reporting too fast! Try again later"
        })
        return false
    end
    if p24.reportedPlayers[p25] ~= nil then
        u4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You have already reported this player"
        })
        return false
    end
    p24.reportRateLimit:add(u8.LocalPlayer.UserId)
    p24.reportedPlayers[p25] = true
    u11.Client:Get("ReportPlayer"):SendToServer(p25)
    return true
end
function u12.getCurrentTicket(p26) --[[ Line: 89 ]]
    return p26.currentTicket
end
v3.defineMetadata(u12, "identifier", "client/controllers/global/report/report-controller@ReportController")
v3.defineMetadata(u12, "flamework:implements", { "$:flamework@OnStart" })
v3.decorate(u12, "$:flamework@Controller", v6, {
    {}
})
return {
    ["default"] = u12
}