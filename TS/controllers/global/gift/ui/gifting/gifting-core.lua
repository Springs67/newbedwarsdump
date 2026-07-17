-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GiftMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local SuggestedPlayerListTabs = RuntimeLib.import(script, script.Parent, "gift-ui-types").SuggestedPlayerListTabs;
local GiftingForm = RuntimeLib.import(script, script.Parent, "gifting-form", "gifting-form").GiftingForm;
local GiftingSuggestedList = RuntimeLib.import(script, script.Parent, "gifting-suggested-list", "gifting-suggested-list").GiftingSuggestedList;
local v39 = v4.new(u3)(function(p6, p7) -- Line: 20
    -- upvalues: SuggestedPlayerListTabs (copy), DeviceUtil (copy), u2 (copy), OfflinePlayerUtil (copy), GiftMeta (copy), Players (copy), u3 (copy), DarkBackground (copy), ScaleComponent (copy), ImageId (copy), GiftingSuggestedList (copy), GiftingForm (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, v9 = useState(SuggestedPlayerListTabs.SERVER);
    local v10;

    if DeviceUtil.isHoarceKat() then
        local v11 = u2.values(OfflinePlayerUtil.Dummy);

        local function _(p12) -- Line: 27
            return {
                displayName = "",
                name = p12.name,
                userId = p12.userId
            };
        end;

        v10 = table.create(#v11);

        for i, v in v11 do
            local _ = i - 1;
            v10[i] = {
                displayName = "",
                name = v.name,
                userId = v.userId
            };
        end;
    else
        local RobloxFriends = p6.RobloxFriends;
        local v13;

        if RobloxFriends == nil then
            v13 = RobloxFriends;
        else
            local function _(p14) -- Line: 45
                return {
                    displayName = "",
                    name = p14.username,
                    userId = p14.userId
                };
            end;

            v13 = table.create(#RobloxFriends);

            for i, v in RobloxFriends do
                local _ = i - 1;
                v13[i] = {
                    displayName = "",
                    name = v.username,
                    userId = v.userId
                };
            end;
        end;

        v10 = v13 == nil and {} or v13;
    end;

    local v15, _ = useState(v10);
    local v16, u17 = useState({});
    local v18, v19 = useState(nil);
    local v20 = GiftMeta[p6.GiftType];
    useEffect(function() -- Line: 72
        -- upvalues: DeviceUtil (ref), u2 (ref), OfflinePlayerUtil (ref), u17 (copy), Players (ref)
        if DeviceUtil.isHoarceKat() then
            local v21 = u2.values(OfflinePlayerUtil.Dummy);

            local function _(p22) -- Line: 75
                return {
                    name = p22.name,
                    displayName = p22.displayName,
                    userId = p22.userId
                };
            end;

            local v23 = table.create(#v21);

            for i, v in v21 do
                local _ = i - 1;
                v23[i] = {
                    name = v.name,
                    displayName = v.displayName,
                    userId = v.userId
                };
            end;

            u17(v23);

            return;
        end;

        local function _(p24) -- Line: 92
            -- upvalues: Players (ref), OfflinePlayerUtil (ref)
            if p24 == Players.LocalPlayer then
                return nil;
            end;

            return OfflinePlayerUtil.getOfflinePlayer(p24);
        end;

        local v25 = 0;
        local v26 = {};

        for i, v in Players:GetPlayers() do
            local _ = i - 1;
            local v27;

            if v == Players.LocalPlayer then
                v27 = nil;
            else
                v27 = OfflinePlayerUtil.getOfflinePlayer(v);
            end;

            if v27 ~= nil then
                v25 = v25 + 1;
                v26[v25] = v27;
            end;
        end;

        u17(v26);
    end, {});
    local v28 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v29 = { u3.createElement(DarkBackground, {
            AppId = p6.AppId
        }) };
    local v30 = {};
    local v31 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(620, 463)
    };
    local v32 = { u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(775, 579),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v33 = {
        AppId = p6.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        TitleIcon = ImageId.GIFTS_SOLID,
        Title = "Gift " .. v20.name
    };
    local v34 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 16)
        }), u3.createElement(GiftingSuggestedList, {
            LayoutOrder = 1,
            SetSelectedUser = v19,
            SuggestedPlayerListTab = v8,
            SetSuggestedPlayerListTab = v9,
            Friends = v15,
            PlayersInServer = v16,
            Size = UDim2.new(0.43, -8, 1, 0)
        }) };
    local v35 = {
        SelectedUser = v18
    };
    local v36 = {};
    local v37 = #v36;
    local v38 = #v16;
    table.move(v16, 1, v38, v37 + 1, v36);
    table.move(v15, 1, #v15, v37 + v38 + 1, v36);
    v35.Players = v36;
    v35.GiftType = p6.GiftType;
    v35.Size = UDim2.new(0.57, -8, 1, 0);
    v35.LayoutOrder = 2;
    v34[#v34 + 1] = u3.createElement(GiftingForm, v35);
    v32[#v32 + 1] = u3.createElement(WidgetComponent, v33, v34);
    v30[#v30 + 1] = u3.createElement("Frame", v31, v32);
    v29[#v29 + 1] = u3.createElement(SlideIn, {}, v30);

    return u3.createElement("ScreenGui", v28, v29);
end);

return {
    GiftingCore = v5.connect(function(p40, p41) -- Line: 184
        local v42 = {};

        for i, v in p41 do
            v42[i] = v;
        end;

        v42.RobloxFriends = p40.Friends.friends;

        return v42;
    end)(v39)
};