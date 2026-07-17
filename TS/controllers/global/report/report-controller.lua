-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out");
local Reflect = v1.Reflect;
local Flamework = v1.Flamework;
local ExpireList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TeleportService = v2.TeleportService;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "ReportController";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 21
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 25
    -- upvalues: u3 (copy), ExpireList (copy)
    p6.currentTicketSignal = u3.new();
    p6.reportRateLimit = ExpireList.new(1);
    p6.reportedPlayers = {};
end;

function u4.onStart(p7) -- Line: 30
    -- upvalues: TeleportService (copy), default (copy)
    local v8 = TeleportService:GetLocalPlayerTeleportData();
    local v9 = not v8;

    if not v9 then
        local reportTicketId = v8.reportTicketId;

        if reportTicketId == "" then
            reportTicketId = false;
        end;

        v9 = not reportTicketId;
    end;

    if v9 then
        return nil;
    end;

    p7.currentTicket = default.Client:Get("GetTicket"):CallServer(v8.reportTicketId);

    if p7.currentTicket then
        p7.currentTicketSignal:Fire(p7.currentTicket);

        return;
    end;

    local reportTicketId = v8.reportTicketId;

    if reportTicketId ~= "" and reportTicketId then
        reportTicketId = not p7.currentTicket;
    end;

    if reportTicketId ~= "" and reportTicketId then
        print("[OW] No ticket retrieved. Attempted to retrieve id: " .. v8.reportTicketId);
    end;
end;

function u4.resolveCurrentTicket(p10, p11) -- Line: 54
    -- upvalues: default (copy)
    local currentTicket = p10.currentTicket;

    if currentTicket ~= nil then
        currentTicket = currentTicket._id;
    end;

    if currentTicket == "" or not currentTicket then
        return nil;
    end;

    default.Client:Get("SubmitTicketResult"):SendToServer(p10.currentTicket._id, p11);
end;

function u4.getNextTicket(p12) -- Line: 64
    -- upvalues: default (copy)
    default.Client:Get("RequestNextReport"):SendToServer();
end;

function u4.reportPlayer(p13, p14) -- Line: 67
    -- upvalues: Players (copy), Flamework (copy), default (copy)
    if p13.reportRateLimit:has(Players.LocalPlayer.UserId) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You\'re reporting too fast! Try again later"
        });

        return false;
    end;

    if p13.reportedPlayers[p14] ~= nil then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You have already reported this player"
        });

        return false;
    end;

    p13.reportRateLimit:add(Players.LocalPlayer.UserId);
    p13.reportedPlayers[p14] = true;
    default.Client:Get("ReportPlayer"):SendToServer(p14);

    return true;
end;

function u4.getCurrentTicket(p15) -- Line: 89
    return p15.currentTicket;
end;

Reflect.defineMetadata(u4, "identifier", "client/controllers/global/report/report-controller@ReportController");
Reflect.defineMetadata(u4, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u4, "$:flamework@Controller", Controller, { {} });

return {
    default = u4
};