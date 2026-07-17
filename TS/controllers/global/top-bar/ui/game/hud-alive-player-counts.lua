-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v49 = v3.new(u2)(function(p5, p6) -- Line: 16
    -- upvalues: QueueMeta (copy), RuntimeLib (copy), Players (copy), GamePlayerUtil (copy), default (copy), default2 (copy), EntityUtil (copy), u2 (copy), BedwarsImageId (copy), ColorUtil (copy), TopBarCard (copy)
    local useEffect = p6.useEffect;
    local v7, u8 = p6.useState(0);
    local v9;

    if p5.QueueType then
        v9 = QueueMeta[p5.QueueType];
    else
        v9 = nil;
    end;

    local function v14(p10) -- Line: 30
        local teams = p10.teams;

        local function _(p11, p12) -- Line: 32
            return p11 + p12.maxPlayers;
        end;

        local v13 = 0;

        for i = 1, #teams do
            local _ = i - 1;
            v13 = v13 + teams[i].maxPlayers;
        end;

        return v13;
    end;

    useEffect(function() -- Line: 45
        -- upvalues: RuntimeLib (ref), Players (ref), GamePlayerUtil (ref), u8 (copy), default (ref), default2 (ref), EntityUtil (ref)
        local function _(p15) -- Line: 46
            -- upvalues: RuntimeLib (ref), Players (ref), GamePlayerUtil (ref)
            return RuntimeLib.Promise.retryWithDelay(function() -- Line: 47
                -- upvalues: RuntimeLib (ref), Players (ref), GamePlayerUtil (ref)
                return RuntimeLib.Promise.new(function(p16, p17) -- Line: 48
                    -- upvalues: Players (ref), GamePlayerUtil (ref)
                    local function _(p18) -- Line: 51
                        -- upvalues: GamePlayerUtil (ref)
                        return GamePlayerUtil.getGamePlayer(p18):isReady();
                    end;

                    local v19 = true;

                    for i, v in Players:GetPlayers() do
                        local _ = i - 1;

                        if not GamePlayerUtil.getGamePlayer(v):isReady() then
                            v19 = false;
                            break;
                        end;
                    end;

                    if not v19 then
                        return p17();
                    end;

                    local function _(p20) -- Line: 68
                        -- upvalues: GamePlayerUtil (ref)
                        return GamePlayerUtil.getGamePlayer(p20):isInGame();
                    end;

                    local v21 = 0;
                    local v22 = {};

                    for i, v in Players:GetPlayers() do
                        local _ = i - 1;

                        if GamePlayerUtil.getGamePlayer(v):isInGame() == true then
                            v21 = v21 + 1;
                            v22[v21] = v;
                        end;
                    end;

                    return p16(#v22);
                end);
            end, p15, 3.5);
        end;

        local function u33(p23) -- Line: 86
            -- upvalues: RuntimeLib (ref), Players (ref), GamePlayerUtil (ref), u8 (ref), default (ref)
            RuntimeLib.Promise.retryWithDelay(function() -- Line: 47
                -- upvalues: RuntimeLib (ref), Players (ref), GamePlayerUtil (ref)
                return RuntimeLib.Promise.new(function(p24, p25) -- Line: 48
                    -- upvalues: Players (ref), GamePlayerUtil (ref)
                    local function _(p26) -- Line: 51
                        -- upvalues: GamePlayerUtil (ref)
                        return GamePlayerUtil.getGamePlayer(p26):isReady();
                    end;

                    local v27 = true;

                    for i, v in Players:GetPlayers() do
                        local _ = i - 1;

                        if not GamePlayerUtil.getGamePlayer(v):isReady() then
                            v27 = false;
                            break;
                        end;
                    end;

                    if not v27 then
                        return p25();
                    end;

                    local function _(p28) -- Line: 68
                        -- upvalues: GamePlayerUtil (ref)
                        return GamePlayerUtil.getGamePlayer(p28):isInGame();
                    end;

                    local v29 = 0;
                    local v30 = {};

                    for i, v in Players:GetPlayers() do
                        local _ = i - 1;

                        if GamePlayerUtil.getGamePlayer(v):isInGame() == true then
                            v29 = v29 + 1;
                            v30[v29] = v;
                        end;
                    end;

                    return p24(#v30);
                end);
            end, p23, 3.5):andThen(function(p31) -- Line: 87
                -- upvalues: u8 (ref)
                u8(p31);
            end):catch(function(p32) -- Line: 89
                -- upvalues: default (ref)
                return default.Info("Failed to update player alive count");
            end);
        end;

        u33(3);
        local u34 = nil;
        task.spawn(function() -- Line: 97
            -- upvalues: u34 (ref), default2 (ref), EntityUtil (ref), u33 (copy)
            u34 = default2.Client:Get("EntityDeathEvent"):Connect(function(p35) -- Line: 98
                -- upvalues: EntityUtil (ref), u33 (ref)
                local v36 = EntityUtil:getEntity(p35.entityInstance);

                if v36 ~= nil then
                    v36 = v36:getPlayer();
                end;

                if v36 then
                    v36 = p35.finalKill;
                end;

                if v36 then
                    u33(1);
                end;
            end);
        end);
        local u38 = Players.PlayerAdded:Connect(function(p37) -- Line: 113
            -- upvalues: u33 (copy)
            u33(1);
        end);
        local u39 = Players.PlayerRemoving:Connect(function() -- Line: 116
            -- upvalues: u33 (copy)
            u33(1);
        end);

        return function() -- Line: 119
            -- upvalues: u34 (ref), u38 (copy), u39 (copy)
            local v40 = u34;

            if v40 ~= nil then
                v40:Disconnect();
            end;

            u38:Disconnect();
            u39:Disconnect();
        end;
    end, {});
    local v41 = {
        LayoutOrder = p5.LayoutOrder
    };
    local v42 = { u2.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = BedwarsImageId.USERS_SOLID,
            Size = UDim2.new(0, 16, 0, 16)
        }) };
    local v43 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X
    };
    local v44 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }) };
    local v45 = #v44;

    if v9 then
        local createElement = u2.createElement;
        local v46 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 16
        };
        local v47 = tostring(v7);
        local v48 = v14(v9);
        v46.Text = v47 .. " / " .. tostring(v48);
        v46.AutomaticSize = Enum.AutomaticSize.X;
        v46.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v46.TextXAlignment = Enum.TextXAlignment.Left;
        v46.TextColor3 = ColorUtil.WHITE;
        v9 = createElement("TextLabel", v46);
    end;

    if v9 then
        v44[v45 + 1] = v9;
    end;

    v42[#v42 + 1] = u2.createElement("Frame", v43, v44);

    return u2.createElement(TopBarCard, v41, v42);
end);

return {
    HudAlivePlayerCounts = v4.connect(function(p50, p51) -- Line: 174
        local v52 = {};

        for i, v in p51 do
            v52[i] = v;
        end;

        v52.QueueType = p50.Game.queueType;

        return v52;
    end)(v49)
};