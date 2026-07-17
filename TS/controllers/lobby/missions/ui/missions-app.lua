-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MissionAppTab = RuntimeLib.import(script, script.Parent, "mission-app-consts").MissionAppTab;
local MissionsListContainer = RuntimeLib.import(script, script.Parent, "missions-list-container").MissionsListContainer;
local MissionsSidebar = RuntimeLib.import(script, script.Parent, "missions-sidebar").MissionsSidebar;
local u5 = {
    {
        text = "Daily Missions",
        layoutOrder = 1,
        value = MissionAppTab.DAILY
    },
    {
        text = "Weekly Missions",
        layoutOrder = 2,
        value = MissionAppTab.WEEKLY
    }
};
local v23 = v3.new(u2)(function(u6, p7) -- Line: 28
    -- upvalues: MissionAppTab (copy), Flamework (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), u5 (copy), SoundManager (copy), GameSound (copy), MissionsSidebar (copy), MissionsListContainer (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p7.useState;
    local v8, u9 = useState(MissionAppTab.DAILY);
    local v10, v11 = useState(false);

    local function u12() -- Line: 32
        -- upvalues: Flamework (ref), u6 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
    end;

    local v13 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    };
    local v14 = { u2.createElement(DarkBackground, {
            AppId = u6.AppId
        }) };
    local v15 = {};
    local v16 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Theme.widgetSize
    };
    local v17 = { u2.createElement(ScaleComponent, {
            MaximumSize = Theme.widgetScaleComponentMaxSize,
            ScreenPadding = Theme.widgetScaleComponentScreenPadding
        }) };
    local v19 = {
        Title = "Missions",
        AppId = u6.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 67, Name: OnClose
            -- upvalues: u12 (copy)
            return u12();
        end,

        Navbar = {
            Value = v8,
            Tabs = u5,
            UIListLayout = {
                Padding = UDim.new(0.09, 0)
            },

            OnChange = function(p18) -- Line: 76, Name: OnChange
                -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
                u9(p18.value);
                SoundManager:playSound(GameSound.UI_CLICK);
            end
        }
    };
    local v20 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.04, 0)
        }) };
    local v21 = #v20;
    local v22 = not u6.HideSidebar and u2.createElement(MissionsSidebar, {
        AppId = "MissionsSidebar",
        BattlePassPaid = u6.BattlePassPaid,
        Size = UDim2.new(0.26, 0, 1, 0),

        OnClose = function() -- Line: 96, Name: OnClose
            -- upvalues: u12 (copy)
            return u12();
        end,

        ChangeTicketView = v11,
        TicketView = v10
    });

    if v22 then
        v20[v21 + 1] = v22;
    end;

    v20[#v20 + 1] = u2.createElement(MissionsListContainer, {
        Size = UDim2.new(u6.HideSidebar and 1 or 0.7, 0, 1, 0),
        TicketView = v10,
        Tab = v8,
        PlayerLevel = u6.PlayerLevel
    });
    v17[#v17 + 1] = u2.createElement(WidgetComponent, v19, v20);
    v15[#v15 + 1] = u2.createElement("Frame", v16, v17);
    v14[#v14 + 1] = u2.createElement(SlideIn, {}, v15);

    return u2.createElement("ScreenGui", v13, v14);
end);

return {
    MissionsApp = v4.connect(function(p24, p25) -- Line: 118
        local v26 = {};

        for i, v in p25 do
            v26[i] = v;
        end;

        v26.BattlePassPaid = p24.BattlePass.paid;
        v26.PlayerLevel = p24.Bedwars.playerLevel;

        return v26;
    end)(v23)
};