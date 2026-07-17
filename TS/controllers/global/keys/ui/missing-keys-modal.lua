-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local ResetTime = v1.ResetTime;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KeyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-meta").KeyMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v36 = v3.new(u2)(function(u5, p6) -- Line: 25
    -- upvalues: QueueMeta (copy), Flamework (copy), SoundManager (copy), GameSound (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), Padding (copy), Empty (copy), AutoSizedText (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), KeyMeta (copy), ResetTime (copy), Countdown (copy), Theme (copy), SlideIn (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local v7 = UDim2.fromOffset(820, 400);
    local v8 = QueueMeta[u5.QueueType];

    local function _() -- Line: 30
        -- upvalues: Flamework (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MissingKeyModal");
    end;

    useEffect(function() -- Line: 33
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);
    end, {});
    local v9 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v10 = { u2.createElement(DarkBackground, {
            AppId = "MissingKeyModal",
            ImageButtonProps = {
                ZIndex = 0
            },

            OnClick = function() -- Line: 47, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MissingKeyModal");

                return true;
            end
        }) };
    local v11 = {};
    local v12 = {
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Size = v7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#333333")
    };
    local v13 = {
        u2.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new(v7.X.Offset * 1.2, v7.Y.Offset * 1.2),
            ScreenPadding = Vector2.new(45, 45)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        u2.createElement(Padding, {
            Padding = UDim.new(0, 28)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            Padding = UDim.new(0, 16)
        }),
        u2.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 28)
        }, { u2.createElement(AutoSizedText, {
                Text = "MISSING KEYS ",
                TextSize = 28,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold
            }), u2.createElement(IconButton, {
                Size = UDim2.new(0, 28, 0, 28),
                Image = BedwarsImageId.X,
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),

                OnClick = function() -- Line: 97, Name: OnClick
                    -- upvalues: Flamework (ref), SoundManager (ref), GameSound (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MissingKeyModal");
                    SoundManager:playSound(GameSound.UI_CLOSE_2);
                end
            }) })
    };
    local MissingKeys = u5.MissingKeys;

    local function v31(p14) -- Line: 106
        -- upvalues: KeyMeta (ref), u5 (copy), ResetTime (ref), u2 (ref), Countdown (ref), AutoSizedText (ref), ColorUtil (ref), Theme (ref), Empty (ref)
        local v15 = KeyMeta[p14.keyType];
        local v16 = u5.KeysData[p14.keyType];
        local v17;

        if v16 == nil then
            v17 = v16;
        else
            v17 = v16.amount;
        end;

        local v18 = v17 == nil and 0 or v17;
        local v19 = p14.amount <= v18;

        if v16 ~= nil then
            v16 = v16.keyRegenStartTime;
        end;

        local v20 = nil;
        local v21;

        if v16 == 0 or (v16 ~= v16 or not v16) then
            v21 = v16;
        else
            v21 = v15.keyRegen;
        end;

        if v21 ~= 0 and (v21 == v21 and v21) then
            v20 = ResetTime.new(v16):getNextResetTime(v15.keyRegen.cooldown);
        end;

        local v22 = v20 ~= nil;

        if v22 then
            local v23 = {
                EndTime = v20
            };
            local keyRegen = v15.keyRegen;

            if keyRegen ~= nil then
                keyRegen = keyRegen.amountPerRegen;
            end;

            v23.PreText = "<b>(+" .. tostring(keyRegen) .. " Key In: </b>";
            v23.PostText = "<b>)</b>";
            v23.TextLabel = {
                Size = UDim2.fromScale(0.45, 0.9),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = Color3.fromRGB(250, 254, 16)
            };
            v23.CountdownConfig = {
                days = false
            };
            v22 = u2.createElement(Countdown, v23);
        end;

        local v24 = {
            Size = UDim2.new(1, 0, 0, 20)
        };
        local v25 = {};
        local v26 = u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center"
        });
        local v27 = u2.createElement(AutoSizedText, {
            TextSize = 20,
            Text = "🔑  " .. v15.name .. ": ",
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.SourceSansBold
        });
        local createElement = u2.createElement;
        local v28 = {
            TextSize = 20,
            Text = tostring(v18) .. " / " .. tostring(p14.amount) .. "    ",
            Font = Enum.Font.SourceSansBold
        };
        local v29;

        if v19 then
            v29 = Theme.mcGreen;
        else
            v29 = Theme.mcRed;
        end;

        v28.TextColor3 = v29;
        v25[1], v25[2], v25[3] = v26, v27, createElement(AutoSizedText, v28);
        local v30 = #v25;

        if v22 then
            v25[v30 + 1] = v22;
        end;

        return u2.createElement(Empty, v24, v25);
    end;

    local v32 = table.create(#MissingKeys);

    for i, v in MissingKeys do
        v32[i] = v31(v, i - 1, MissingKeys);
    end;

    local v33 = {
        Size = UDim2.fromScale(1, 0.9)
    };
    local v34 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            Padding = UDim.new(0, 6)
        }), u2.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 20)
        }, { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal"
            }), u2.createElement(AutoSizedText, {
                Text = "You don\'t have enough keys to queue for: ",
                TextSize = 20,
                Font = Enum.Font.SourceSans
            }), u2.createElement(AutoSizedText, {
                TextSize = 20,
                Text = v8.title .. " ",
                Font = Enum.Font.SourceSansBold,
                TextColor3 = Color3.fromHex("89FFD4")
            }) }) };
    local v35 = #v34;

    for i, v in v32 do
        v34[v35 + i] = v;
    end;

    v13[#v13 + 1] = u2.createElement(Empty, v33, v34);
    v11[#v11 + 1] = u2.createElement("ImageButton", v12, v13);
    v10[#v10 + 1] = u2.createElement(SlideIn, {}, v11);

    return u2.createElement("ScreenGui", v9, v10);
end);

return {
    MissingKeysModal = v4.connect(function(p37, p38) -- Line: 226
        local v39 = {};

        for i, v in p38 do
            v39[i] = v;
        end;

        v39.KeysData = p37.Keys.keysData;

        return v39;
    end)(v36)
};