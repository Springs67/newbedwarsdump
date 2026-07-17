-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ExpireList = v1.ExpireList;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "ClanChatController";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: default (copy), ExpireList (copy), u2 (copy)
    p6.clansRemotes = default.Client:GetNamespace("Clans");
    p6.sendMessageRateLimiter = ExpireList.new(0.5);
    p6.clanChatFetched = u2.new();
    p6.clanChatNewMessage = u2.new();
    p6.clanChatMessagesCache = nil;
end;

function u4.onInit(p7) -- Line: 34
end;

function u4.onStart(u8) -- Line: 36
    -- upvalues: KnitClient (copy), ColorUtil (copy), Theme (copy), ClientSyncEvents (copy)
    local v9 = KnitClient.Controllers.ChatController:getTextChannel("Clan");

    if v9 then
        function v9.OnIncomingMessage(p10) -- Line: 39
            -- upvalues: u8 (copy)
            local TextChatMessageProperties = Instance.new("TextChatMessageProperties");

            if p10.TextSource then
                u8:sendMessage(p10.Text);
                p10.Text = "";
            end;

            return TextChatMessageProperties;
        end;
    end;

    u8.clansRemotes:WaitFor("ClanChatUpdate"):andThen(function(p11) -- Line: 50
        -- upvalues: u8 (copy)
        p11:Connect(function(p12) -- Line: 51
            -- upvalues: u8 (ref)
            if #p12.messages == 0 then
                return nil;
            end;

            u8.clanChatMessagesCache = p12.messages;
            u8.clanChatFetched:Fire(p12.messages);
        end);
    end);
    u8.clansRemotes:WaitFor("ClanChatNewMessage"):andThen(function(p13) -- Line: 61
        -- upvalues: ColorUtil (ref), Theme (ref), KnitClient (ref), u8 (copy)
        p13:Connect(function(p14) -- Line: 62
            -- upvalues: ColorUtil (ref), Theme (ref), KnitClient (ref), u8 (ref)
            local v15 = "<font color=\"" .. ColorUtil.richTextColor(Theme.mcPink) .. "\">[CLAN] " .. p14.clanChatMessage.displayName .. ": " .. p14.clanChatMessage.message .. "</font>";
            KnitClient.Controllers.ChatController:displayMessage(v15);
            KnitClient.Controllers.ChatController:displayMessage(v15, "Clan");

            if u8.clanChatMessagesCache then
                table.insert(u8.clanChatMessagesCache, p14.clanChatMessage);
            end;

            u8.clanChatNewMessage:Fire(p14.clanChatMessage);
        end);
    end);
    ClientSyncEvents.ClanUpdate:connect(function(p16) -- Line: 76
        -- upvalues: u8 (copy)
        if u8.clanChatMessagesCache and p16.data.clanId == nil then
            u8.clanChatMessagesCache = nil;
        end;
    end);
end;

function u4.getClanChatMessages(p17) -- Line: 83
    if p17.clanChatMessagesCache then
        return p17.clanChatMessagesCache;
    end;

    local v18 = p17.clansRemotes:Get("FetchClanChat"):CallServer();
    p17.clanChatMessagesCache = v18;

    return v18;
end;

function u4.sendMessage(p19, p20) -- Line: 92
    -- upvalues: u3 (copy), Players (copy)
    if #u3.trim(p20) == 0 then
        return {
            success = false,
            errorMessage = "Your message only contains whitespace"
        };
    end;

    if p19.sendMessageRateLimiter:has(Players.LocalPlayer.UserId) then
        return {
            success = false,
            errorMessage = "You\'re sending messages too fast! Please slow down."
        };
    end;

    p19.sendMessageRateLimiter:add(Players.LocalPlayer.UserId);

    return p19.clansRemotes:Get("SendClanChatMessage"):CallServer(p20);
end;

function u4.clanChatFetchedEvent(p21) -- Line: 109
    return p21.clanChatFetched;
end;

function u4.clanChatNewMessageEvent(p22) -- Line: 112
    return p22.clanChatNewMessage;
end;

Reflect.defineMetadata(u4, "identifier", "client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController");
Reflect.defineMetadata(u4, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnInit" });
Reflect.decorate(u4, "$:flamework@Controller", Controller, { {} });

return {
    default = u4
};