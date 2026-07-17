-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local ConsumableType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v53 = v4.new(u3)(function(u6, p7) -- Line: 21
    -- upvalues: u2 (copy), ConsumableType (copy), DeviceUtil (copy), KnitClient (copy), default (copy), Theme (copy), u3 (copy), BedwarsImageId (copy), ColorUtil (copy), Empty (copy), ButtonComponent (copy), BattlePassUtils (copy), ImageId (copy), Flamework (copy), BedwarsAppIds (copy)
    local useEffect = p7.useEffect;
    local _, u8 = p7.useState(nil);

    local function _(p9) -- Line: 26
        -- upvalues: ConsumableType (ref)
        local _ = p9[1];

        return p9[2].consumable == ConsumableType.AUTO_COMPLETE_DAILY_MISSION_TICKET;
    end;

    local v10 = 0;
    local v11 = {};

    for i, v in u2.entries(u6.ConsumablesReducer.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].consumable == ConsumableType.AUTO_COMPLETE_DAILY_MISSION_TICKET == true then
            v10 = v10 + 1;
            v11[v10] = v;
        end;
    end;

    local v12 = #v11;

    local function _(p13) -- Line: 43
        -- upvalues: ConsumableType (ref)
        local _ = p13[1];

        return p13[2].consumable == ConsumableType.AUTO_COMPLETE_WEEKLY_MISSION_TICKET;
    end;

    local v14 = 0;
    local v15 = {};

    for i, v in u2.entries(u6.ConsumablesReducer.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].consumable == ConsumableType.AUTO_COMPLETE_WEEKLY_MISSION_TICKET == true then
            v14 = v14 + 1;
            v15[v14] = v;
        end;
    end;

    local v16 = #v15;
    useEffect(function() -- Line: 59
        -- upvalues: DeviceUtil (ref), KnitClient (ref), u8 (copy), default (ref)
        if not DeviceUtil.isHoarceKat() then
            KnitClient.Controllers.MissionsController:getMissionData():andThen(function(p17) -- Line: 62
                -- upvalues: u8 (ref)
                u8(p17);
            end);
            local u19 = default.Client:WaitFor("SetAllMissionData"):expect():Connect(function(p18) -- Line: 67
                -- upvalues: u8 (ref)
                u8(p18.missionData);
            end);

            return function() -- Line: 70
                -- upvalues: u19 (copy)
                u19:Disconnect();
            end;
        end;
    end, {});
    local v20 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = -1,
        Size = u6.Size,
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v21 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, DeviceUtil.isSmallScreen() and 0 or 5),
            PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 0 or 5)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.15, 0)
        }) };
    local v22 = #v21;
    local v23 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0.5, 0)
    };
    local v24 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.1, 0)
        }) };
    local v25 = #v24;
    local v26 = {
        Size = UDim2.fromScale(1.05, 0.15)
    };
    local v27 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.03, 0)
        }) };
    local v28 = #v27;
    local v29 = {
        Size = UDim2.fromScale(0.2, 1)
    };
    local v30 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.1, 0)
        }) };
    local v31 = #v30;
    local v32 = {
        Size = UDim2.fromScale(1, 0.5)
    };
    local v33 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.2, 0)
        }), u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            Image = BedwarsImageId.MISSION_TICKET_DAILY
        }) };
    local v34 = {
        Size = UDim2.fromScale(0.5, 1),
        Text = "<b>" .. tostring(v12 == nil and 0 or v12) .. "</b>",
        TextColor3 = ColorUtil.WHITE,
        TextSize = 14,
        RichText = true,
        Font = Enum.Font.Roboto,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        TextXAlignment = Enum.TextXAlignment.Left
    };
    v33[#v33 + 1] = u3.createElement("TextLabel", v34);
    v30[v31 + 1] = u3.createElement(Empty, v32, v33);
    local v35 = {
        Size = UDim2.fromScale(1, 0.5)
    };
    local v36 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.2, 0)
        }), u3.createElement(Empty, {
            Size = UDim2.fromScale(0.5, 1)
        }, { u3.createElement("ImageLabel", {
                ScaleType = "Fit",
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                ZIndex = 11,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.MISSION_TICKET_WEEKLY
            }), u3.createElement("ImageLabel", {
                ScaleType = "Fit",
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                ZIndex = 10,
                Size = UDim2.fromScale(1.5, 1.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = BedwarsImageId.MISSION_TICKET_GLOW
            }) }) };
    local v37 = {
        Size = UDim2.fromScale(0.5, 1),
        Text = "<b>" .. tostring(v16 == nil and 0 or v16) .. "</b>",
        TextColor3 = ColorUtil.WHITE,
        TextSize = 14,
        RichText = true,
        Font = Enum.Font.Roboto,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        TextXAlignment = Enum.TextXAlignment.Left
    };
    v36[#v36 + 1] = u3.createElement("TextLabel", v37);
    v30[v31 + 2] = u3.createElement(Empty, v35, v36);
    v27[v28 + 1] = u3.createElement(Empty, v29, v30);
    local createElement = u3.createElement;
    local v38 = {
        Text = "USE MISSION TICKETS",
        TextScaled = true,
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.7, 1)
    };
    local v39;

    if u6.TicketView then
        v39 = Theme.backgroundTertiary;
    else
        v39 = Theme.backgroundPrimary;
    end;

    v38.BackgroundColor3 = v39;
    v38.TextColor3 = ColorUtil.WHITE;

    function v38.OnClick() -- Line: 235
        -- upvalues: u6 (copy)
        u6.ChangeTicketView(not u6.TicketView);
    end;

    v27[v28 + 2] = createElement(ButtonComponent, v38, { u3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.15, 0),
            PaddingBottom = UDim.new(0.15, 0)
        }) });
    v24[v25 + 1] = u3.createElement(Empty, v26, v27);
    v24[v25 + 2] = u3.createElement("ImageLabel", {
        ScaleType = "Fit",
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0.25),
        Image = BedwarsImageId.MISSION
    });
    local createElement2 = u3.createElement;
    local v40 = {
        Text = "Complete <b>daily</b> and <b>weekly</b> missions for Rewards",
        RichText = true,
        TextSize = 16,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(DeviceUtil.isSmallScreen() and 0.9 or 0.85, 0, 0.15, 0)
    };
    local v41;

    if DeviceUtil.isSmallScreen() then
        v41 = Enum.AutomaticSize.None;
    else
        v41 = Enum.AutomaticSize.Y;
    end;

    v40.AutomaticSize = v41;
    v40.TextColor3 = ColorUtil.WHITE;
    v40.Font = Enum.Font.Roboto;
    v40.TextScaled = DeviceUtil.isSmallScreen() and true or false;
    v24[v25 + 3] = createElement2("TextLabel", v40);
    v24[v25 + 4] = u3.createElement("Frame", {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.new(DeviceUtil.isSmallScreen() and 0.9 or 0.85, 0, 0.15, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = ColorUtil.BLACK
    }, { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 2)
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u3.createElement("TextLabel", {
            AutomaticSize = "Y",
            Text = "<b>Daily Refresh:</b> 3pm PST\n<b>Weekly Refresh:</b> Fri 3pm PST",
            RichText = true,
            TextSize = 14,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        }) });
    v21.MissionsInfo = u3.createElement("Frame", v23, v24);
    local v42 = BattlePassUtils.isActiveBattlePass();

    if v42 then
        local v43 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0.35, 0),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v44 = {};
        local v45 = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        });
        local v46 = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 6)
        });
        local v47 = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        });
        local v48 = u3.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 60, 0, 60),
            BackgroundColor3 = Theme.backgroundTertiary
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.7, 0.7),
                Image = ImageId.TICKET
            }) });
        local createElement3 = u3.createElement;
        local v49 = {
            RichText = true,
            TextSize = 16,
            TextWrapped = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 32 or 16)
        };
        local v50;

        if DeviceUtil.isSmallScreen() then
            v50 = Enum.AutomaticSize.None;
        else
            v50 = Enum.AutomaticSize.Y;
        end;

        v49.AutomaticSize = v50;
        v49.Text = not u6.BattlePassPaid and "<b>Earn 20% more XP from missions & matches with the Battle Pass</b>" or "<b>20% mission XP bonus <font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(2600544)) .. "\">ACTIVATED</font></b>";
        v49.TextColor3 = Theme.textPrimary;
        v49.TextYAlignment = Enum.TextYAlignment.Bottom;
        v49.Font = Enum.Font.Roboto;
        v49.TextScaled = DeviceUtil.isSmallScreen() and true or false;
        v44[1], v44[2], v44[3], v44[4], v44[5] = v45, v46, v47, v48, createElement3("TextLabel", v49);
        local v51 = #v44;
        local v52 = not u6.BattlePassPaid and BattlePassUtils.isActiveBattlePassPaid() and u3.createElement(ButtonComponent, {
            TextSize = 14,
            Text = "BUY BATTLE PASS",
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Theme.backgroundSuccess,

            OnClick = function() -- Line: 365, Name: OnClick
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.BattlePassController:promptBattlePassPurchase();
            end
        });

        if v52 then
            v44[v51 + 1] = v52;
        end;

        v44[#v44 + 1] = u3.createElement(ButtonComponent, {
            TextSize = 14,
            Text = "VIEW REWARDS",
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Theme.backgroundSecondary,

            OnClick = function() -- Line: 379, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});
            end
        });
        v42 = u3.createFragment({
            BattlePassPerkInfo = u3.createElement("Frame", v43, v44)
        });
    end;

    if v42 then
        v21[v22 + 1] = v42;
    end;

    return u3.createFragment({
        LeftWrapper = u3.createElement("Frame", v20, v21)
    });
end);

return {
    MissionsSidebar = v5.connect(function(p54, p55) -- Line: 395
        local v56 = {};

        for i, v in p55 do
            v56[i] = v;
        end;

        v56.ConsumablesReducer = p54.Consumable;

        return v56;
    end)(v53)
};