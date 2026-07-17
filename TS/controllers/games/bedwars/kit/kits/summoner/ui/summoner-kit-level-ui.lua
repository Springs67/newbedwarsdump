-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local summoner_getPlayerSpellLevel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_getPlayerSpellLevel;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

local function v32(p4, p5) -- Line: 14
    -- upvalues: ColorUtil (copy), DeviceUtil (copy), default (copy), summoner_getPlayerSpellLevel (copy), Players (copy), u2 (copy), ProgressBar (copy), Empty (copy)
    local useState = p5.useState;
    local useEffect = p5.useEffect;
    local v6, u7 = useState(0);
    local v8, u9 = useState(1);
    local v10, u11 = useState(2);
    local v12, u13 = useState("0%");
    local v14, _ = useState(true);
    local v15, _ = useState(ColorSequence.new(ColorUtil.hexColor(14363435), ColorUtil.hexColor(14573407)));
    DeviceUtil.isMobileControls();
    useEffect(function() -- Line: 27
        -- upvalues: default (ref), u7 (copy), summoner_getPlayerSpellLevel (ref), Players (ref), u9 (copy), u11 (copy), u13 (copy)
        default.Client:Get("SummonerLevelUpProgressFromServer"):Connect(function(p16) -- Line: 28
            -- upvalues: u7 (ref), summoner_getPlayerSpellLevel (ref), Players (ref), u9 (ref), u11 (ref), u13 (ref)
            local progress = p16.progress;
            u7(progress);
            local v17 = summoner_getPlayerSpellLevel(Players.LocalPlayer);

            if v17 == nil then
                return nil;
            end;

            u9(v17);
            local v18;

            if v17 == 4 then
                v18 = nil;
            else
                v18 = v17 + 1;
            end;

            u11(v18);
            local v19 = math.floor(progress * 100);
            local v20 = tostring(v19) .. "%";

            if v18 == nil then
                u13("Max Level");

                return;
            end;

            u13(v20);
        end);
    end, {});
    local v21 = {
        Size = UDim2.fromScale(0.6, 0.04),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v22 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local _ = #v22;

    if v14 then
        local v23 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v24 = { u2.createElement(ProgressBar, {
                AcceptZero = true,
                Size = UDim2.fromScale(1, 1),
                Progress = v6,
                BarGradient = v15,
                BarCornerRadius = UDim.new(0.25, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }) };
        local v25 = #v24;
        local v26;

        if v10 == nil then
            v26 = false;
        else
            v26 = u2.createElement("TextLabel", {
                TextScaled = true,
                TextStrokeTransparency = 1,
                BackgroundTransparency = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(0.95, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = "Lv. " .. tostring(v8),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;

        if v26 then
            v24[v25 + 1] = v26;
        end;

        local v27 = #v24;
        local v28;

        if v10 == nil then
            v28 = false;
        else
            v28 = u2.createElement("TextLabel", {
                TextScaled = true,
                TextStrokeTransparency = 1,
                BackgroundTransparency = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(0.95, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = "Lv. " .. tostring(v10),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Right,
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;

        if v28 then
            v24[v27 + 1] = v28;
        end;

        v24[#v24 + 1] = u2.createElement("TextLabel", {
            TextScaled = true,
            TextStrokeTransparency = 1,
            BackgroundTransparency = 1,
            ZIndex = 3,
            Size = UDim2.fromScale(0.95, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = v12,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        });
        v14 = u2.createElement(Empty, v23, v24);
    end;

    local v29 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v30 = {};
    local v31 = #v30;

    if v14 then
        v30[v31 + 1] = v14;
    end;

    v22.SummonerLevelUpBar = u2.createElement(Empty, v29, v30);

    return u2.createElement(Empty, v21, v22);
end;

v3.new(u2)(v32);

return {
    SummonerKitLevelUI = v3.new(u2)(v32)
};