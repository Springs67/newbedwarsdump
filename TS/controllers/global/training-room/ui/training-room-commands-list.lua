-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TrainingRoomCommandsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "training-room", "training-room-commands-meta").TrainingRoomCommandsMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v33 = v4.new(u3)(function(u6, p7) -- Line: 16
    -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy), TrainingRoomCommandsMeta (copy), u3 (copy), AutoSizedText (copy), ScaleComponent (copy), Flamework (copy), Theme (copy), WidgetComponent (copy)
    local _ = p7.useState;
    p7.useEffect(function() -- Line: 19
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 21
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local u8 = {};
    local v9 = u2.values(TrainingRoomCommandsMeta);

    local function v13(p10, p11) -- Line: 27
        -- upvalues: u8 (copy), u3 (ref), AutoSizedText (ref)
        local v12 = u3.createElement(AutoSizedText, {
            TextTransparency = 0,
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.65, 0.085),
            Text = p10.commandName,
            TextColor3 = Color3.fromRGB(242, 242, 242),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.FredokaOne,
            TextXAlignment = Enum.TextXAlignment.Center
        });
        table.insert(u8, v12);
    end;

    for i, v in v9 do
        v13(v, i - 1, v9);
    end;

    local u14 = {};
    local v15 = u2.values(TrainingRoomCommandsMeta);

    local function v19(p16, p17) -- Line: 48
        -- upvalues: u14 (copy), u3 (ref), AutoSizedText (ref)
        local v18 = u3.createElement(AutoSizedText, {
            TextTransparency = 0,
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.65, 0.085),
            Text = p16.commandDescription,
            TextColor3 = Color3.fromRGB(242, 242, 242),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.FredokaOne,
            TextXAlignment = Enum.TextXAlignment.Center
        });
        table.insert(u14, v18);
    end;

    for i, v in v15 do
        v19(v, i - 1, v15);
    end;

    local v20 = {};
    local v21 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(750, 350)
    };
    local v22 = { u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(1050, 489.99999999999994),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v23 = {
        ClipsDescendents = false,
        Title = "Commands Panel               NOTE: Most custom match commands work here too",
        AppId = u6.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 93, Name: OnClose
            -- upvalues: Flamework (ref), u6 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
        end,

        ContentUIPadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 0),
            PaddingRight = UDim.new(0, 0)
        })
    };
    local v24 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder"
        }) };
    local v25 = #v24;
    local v26 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.2, 1),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v27 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0, 20)
        }), u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15)
        }) };
    local v28 = #v27;
    local v29 = {
        ResetOnSpawn = false,
        DisplayOrder = 1001
    };

    for i, v in u8 do
        v27[v28 + i] = v;
    end;

    v24[v25 + 1] = u3.createElement("Frame", v26, v27);
    local v30 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 0.25,
        Size = UDim2.fromScale(0.8, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v31 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0, 20)
        }), u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15)
        }) };
    local v32 = #v31;

    for i, v in u14 do
        v31[v32 + i] = v;
    end;

    v24[v25 + 2] = u3.createElement("Frame", v30, v31);
    v22[#v22 + 1] = u3.createElement(WidgetComponent, v23, v24);
    v20[#v20 + 1] = u3.createElement("Frame", v21, v22);

    return u3.createFragment({
        TrainingRoomCommandsGui = u3.createElement("ScreenGui", v29, v20)
    });
end);

return {
    TrainingRoomCommandsList = v5.connect(function(p34, p35) -- Line: 163
        local v36 = {};

        for i, v in p35 do
            v36[i] = v;
        end;

        return v36;
    end)(v33)
};