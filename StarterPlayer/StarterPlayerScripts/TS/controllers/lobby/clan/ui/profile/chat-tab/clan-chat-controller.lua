local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.ExpireList
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "ClanChatController"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u9
    --]]
    p17.clansRemotes = u12.Client:GetNamespace("Clans")
    p17.sendMessageRateLimiter = u5.new(0.5)
    p17.clanChatFetched = u9.new()
    p17.clanChatNewMessage = u9.new()
    p17.clanChatMessagesCache = nil
end
function u14.onInit(_) --[[ Line: 34 ]] end
function u14.onStart(u18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u13
        [4] = u11
    --]]
    local v19 = u6.Controllers.ChatController:getTextChannel("Clan")
    if v19 then
        function v19.OnIncomingMessage(p20) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            local v21 = Instance.new("TextChatMessageProperties")
            if p20.TextSource then
                u18:sendMessage(p20.Text)
                p20.Text = ""
            end
            return v21
        end
    end
    u18.clansRemotes:WaitFor("ClanChatUpdate"):andThen(function(p22) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        p22:Connect(function(p23) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            if #p23.messages == 0 then
                return nil
            end
            u18.clanChatMessagesCache = p23.messages
            u18.clanChatFetched:Fire(p23.messages)
        end)
    end)
    u18.clansRemotes:WaitFor("ClanChatNewMessage"):andThen(function(p24) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u6
            [4] = u18
        --]]
        p24:Connect(function(p25) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u13
                [3] = u6
                [4] = u18
            --]]
            local v26 = "<font color=\"" .. u4.richTextColor(u13.mcPink) .. "\">[CLAN] " .. p25.clanChatMessage.displayName .. ": " .. p25.clanChatMessage.message .. "</font>"
            u6.Controllers.ChatController:displayMessage(v26)
            u6.Controllers.ChatController:displayMessage(v26, "Clan")
            if u18.clanChatMessagesCache then
                local v27 = u18.clanChatMessagesCache
                local v28 = p25.clanChatMessage
                table.insert(v27, v28)
            end
            u18.clanChatNewMessage:Fire(p25.clanChatMessage)
        end)
    end)
    u11.ClanUpdate:connect(function(p29) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        if u18.clanChatMessagesCache and p29.data.clanId == nil then
            u18.clanChatMessagesCache = nil
        end
    end)
end
function u14.getClanChatMessages(p30) --[[ Line: 83 ]]
    if p30.clanChatMessagesCache then
        return p30.clanChatMessagesCache
    end
    local v31 = p30.clansRemotes:Get("FetchClanChat"):CallServer()
    p30.clanChatMessagesCache = v31
    return v31
end
function u14.sendMessage(p32, p33) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    if #u10.trim(p33) == 0 then
        return {
            ["success"] = false,
            ["errorMessage"] = "Your message only contains whitespace"
        }
    end
    if p32.sendMessageRateLimiter:has(u8.LocalPlayer.UserId) then
        return {
            ["success"] = false,
            ["errorMessage"] = "You\'re sending messages too fast! Please slow down."
        }
    end
    p32.sendMessageRateLimiter:add(u8.LocalPlayer.UserId)
    return p32.clansRemotes:Get("SendClanChatMessage"):CallServer(p33)
end
function u14.clanChatFetchedEvent(p34) --[[ Line: 109 ]]
    return p34.clanChatFetched
end
function u14.clanChatNewMessageEvent(p35) --[[ Line: 112 ]]
    return p35.clanChatNewMessage
end
v2.defineMetadata(u14, "identifier", "client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController")
v2.defineMetadata(u14, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnInit" })
v2.decorate(u14, "$:flamework@Controller", v7, {
    {}
})
return {
    ["default"] = u14
}