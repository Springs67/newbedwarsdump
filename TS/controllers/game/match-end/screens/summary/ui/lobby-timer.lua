-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BasicCountdownCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "client", "ui", "lib", "components", "basic-countdown-card").BasicCountdownCard;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;

return {
    LobbyTimer = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: KnitClient (copy), getQueueMeta (copy), u1 (copy), BasicCountdownCard (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(0);
        local v7, u8 = useState(0);
        useEffect(function() -- Line: 13
            -- upvalues: KnitClient (ref), getQueueMeta (ref), u6 (copy), u8 (copy)
            local v9 = KnitClient.Controllers.MatchController:getCustomMatchConfig();

            if v9 ~= nil then
                v9 = v9.queueType;
            end;

            local v10;

            if v9 then
                v10 = getQueueMeta(v9);
            else
                v10 = nil;
            end;

            if v10 ~= nil then
                v10 = v10.lobbyDelaySecs;
            end;

            u6(v10 == nil and 30 or v10);
            u8(os.time());
        end, {});

        return u1.createElement(BasicCountdownCard, {
            Text = "Returning to Lobby in {0}",
            EndTime = v7 + v5,
            Size = p3.Size or UDim2.fromScale(0.3, 1),
            Position = p3.Position or UDim2.new(0.5, 0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0)
        });
    end)
};