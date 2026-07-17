-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ConsumableType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MissionIntervalType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MissionDescriptionRow = RuntimeLib.import(script, script.Parent, "mission-description-row").MissionDescriptionRow;
local MissionProgressRow = RuntimeLib.import(script, script.Parent, "mission-progress-row").MissionProgressRow;
local v31 = v4.new(u3)(function(u6, p7) -- Line: 21
    -- upvalues: u2 (copy), ConsumableType (copy), MissionIntervalType (copy), Theme (copy), u3 (copy), ImageId (copy), ColorUtil (copy), MissionDescriptionRow (copy), MissionProgressRow (copy), ButtonComponent (copy), DeviceUtil (copy), default (copy), SoundManager (copy), GameSound (copy), BedwarsImageId (copy)
    local _ = p7.useEffect;
    local v8, u9 = p7.useState(u6.Mission.currProgress == u6.Mission.goalProgress);

    local function _(p10) -- Line: 26
        -- upvalues: ConsumableType (ref)
        local _ = p10[1];

        return p10[2].consumable == ConsumableType.AUTO_COMPLETE_DAILY_MISSION_TICKET;
    end;

    local v11 = 0;
    local v12 = {};

    for i, v in u2.entries(u6.ConsumablesReducer.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].consumable == ConsumableType.AUTO_COMPLETE_DAILY_MISSION_TICKET == true then
            v11 = v11 + 1;
            v12[v11] = v;
        end;
    end;

    local v13 = #v12;

    local function _(p14) -- Line: 43
        -- upvalues: ConsumableType (ref)
        local _ = p14[1];

        return p14[2].consumable == ConsumableType.AUTO_COMPLETE_WEEKLY_MISSION_TICKET;
    end;

    local v15 = 0;
    local v16 = {};

    for i, v in u2.entries(u6.ConsumablesReducer.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].consumable == ConsumableType.AUTO_COMPLETE_WEEKLY_MISSION_TICKET == true then
            v15 = v15 + 1;
            v16[v15] = v;
        end;
    end;

    local v17 = #v16;
    local u18 = u6.Mission.intervalType == MissionIntervalType.DAILY and (v13 == nil and 0 or v13) > 0 or u6.Mission.intervalType == MissionIntervalType.WEEKLY and (v17 == nil and 0 or v17) > 0;
    local v19 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v20 = {};
    local v21 = #v20;
    local v22;

    if u6.Mission.currProgress == u6.Mission.goalProgress or v8 then
        v22 = u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(1, 0.1),
            Size = UDim2.fromOffset(24, 24),
            Image = ImageId.CHECK_CIRCLE_SOLID,
            ImageColor3 = ColorUtil.hexColor(65305)
        });
    else
        v22 = v8;
    end;

    if v22 then
        v20[v21 + 1] = v22;
    end;

    local v23 = #v20;
    v20[v23 + 1] = u3.createElement("UICorner", {
        CornerRadius = UDim.new(0, 5)
    });
    v20[v23 + 2] = u3.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 11),
            PaddingBottom = UDim.new(0, 11),
            PaddingLeft = UDim.new(0, 18),
            PaddingRight = UDim.new(0, 26)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 12),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        u3.createElement(MissionDescriptionRow, {
            Mission = u6.Mission
        }),
        u3.createElement(MissionProgressRow, {
            Mission = u6.Mission,
            Completed = v8
        })
    });
    local v24 = u6.TicketView and (u6.Mission.currProgress ~= u6.Mission.goalProgress and not v8 and true or false);

    if v24 then
        local createElement = u3.createElement;
        local v25 = {
            Size = UDim2.fromScale(0.95, 0.35),
            Position = UDim2.fromScale(0.025, 0.55)
        };
        local v26;

        if u18 then
            v26 = Theme.backgroundSuccess;
        else
            v26 = ColorUtil.hexColor(8487297);
        end;

        v25.BackgroundColor3 = v26;

        function v25.OnClick() -- Line: 135
            -- upvalues: DeviceUtil (ref), u18 (copy), default (ref), u6 (copy), SoundManager (ref), GameSound (ref), u9 (copy)
            if not DeviceUtil.isHoarceKat() and (u18 and default.Client:Get("UseMissionTicket"):CallServer(u6.Mission.id)) then
                SoundManager:playSound(GameSound.UI_REWARD);
                u9(true);
            end;
        end;

        local v27 = {};
        local v28 = u3.createElement("TextLabel", {
            Text = "<b>AUTO-COMPLETE WITH MISSION TICKET</b>",
            TextSize = 14,
            RichText = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(-0.03, 0),
            TextColor3 = ColorUtil.WHITE,
            TextTransparency = u18 and 0 or 0.2,
            Font = Enum.Font.Roboto
        });
        local createElement2 = u3.createElement;
        local v29 = {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.85),
            Position = UDim2.fromScale(0.24, 0.1)
        };
        local v30;

        if u6.Mission.intervalType == MissionIntervalType.DAILY then
            v30 = BedwarsImageId.MISSION_TICKET_DAILY;
        else
            v30 = BedwarsImageId.MISSION_TICKET_WEEKLY;
        end;

        v29.Image = v30;
        v29.ImageTransparency = u18 and 0 or 0.2;
        v27[1], v27[2] = v28, createElement2("ImageLabel", v29);
        v24 = createElement(ButtonComponent, v25, v27);
    end;

    if v24 then
        v20[v23 + 3] = v24;
    end;

    return u3.createFragment({
        TaskContainer = u3.createElement("Frame", v19, v20)
    });
end);

return {
    MissionCard = v5.connect(function(p32, p33) -- Line: 175
        local v34 = {};

        for i, v in p33 do
            v34[i] = v;
        end;

        v34.ConsumablesReducer = p32.Consumable;

        return v34;
    end)(v31)
};