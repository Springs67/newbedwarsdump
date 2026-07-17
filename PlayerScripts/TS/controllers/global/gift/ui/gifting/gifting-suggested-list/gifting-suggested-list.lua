-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local StringUtil = v1.StringUtil;
local TabsComponent = v1.TabsComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SuggestedPlayerListTabs = RuntimeLib.import(script, script.Parent.Parent, "gift-ui-types").SuggestedPlayerListTabs;
local GiftingSuggestedListElement = RuntimeLib.import(script, script.Parent, "gifting-suggested-list-element").GiftingSuggestedListElement;

return {
    GiftingSuggestedList = v4.new(u3)(function(u5, p6) -- Line: 16
        -- upvalues: SuggestedPlayerListTabs (copy), Theme (copy), u3 (copy), u2 (copy), StringUtil (copy), TabsComponent (copy), AutoCompleteSearchbar (copy), GiftingSuggestedListElement (copy), AutoCanvasScrollingFrame (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7, u8 = useState(u5.SuggestedPlayerListTab);
        local u9, u10 = useState({});
        local v11, u12 = useState({});
        useEffect(function() -- Line: 23
            -- upvalues: u7 (copy), SuggestedPlayerListTabs (ref), u5 (copy), u12 (copy), u10 (copy)
            if u7 ~= SuggestedPlayerListTabs.SERVER or not u5.PlayersInServer then
                if u7 == SuggestedPlayerListTabs.FRIENDS and u5.Friends then
                    local Friends = u5.Friends;

                    local function _(p13) -- Line: 44
                        return {
                            key = p13.name,
                            aliases = { p13.name }
                        };
                    end;

                    local v14 = table.create(#Friends);

                    for i, v in Friends do
                        local _ = i - 1;
                        v14[i] = {
                            key = v.name,
                            aliases = { v.name }
                        };
                    end;

                    u12(v14);
                    u10(u5.Friends);
                end;

                return;
            end;

            local PlayersInServer = u5.PlayersInServer;

            local function _(p15) -- Line: 26
                return {
                    key = p15.name,
                    aliases = { p15.displayName, p15.name }
                };
            end;

            local v16 = table.create(#PlayersInServer);

            for i, v in PlayersInServer do
                local _ = i - 1;
                v16[i] = {
                    key = v.name,
                    aliases = { v.displayName, v.name }
                };
            end;

            u12(v16);
            u10(u5.PlayersInServer);
        end, { u5.Friends, u5.PlayersInServer, u7 });

        local function _() -- Line: 62
            -- upvalues: u7 (copy), SuggestedPlayerListTabs (ref), u5 (copy)
            local v17 = {};

            if u7 == SuggestedPlayerListTabs.SERVER then
                if u5.PlayersInServer then
                    return u5.PlayersInServer;
                end;
            elseif u7 == SuggestedPlayerListTabs.FRIENDS and u5.Friends then
                v17 = u5.Friends;
            end;

            return v17;
        end;

        local function v24(p18, u19) -- Line: 75
            -- upvalues: u10 (copy), u7 (copy), SuggestedPlayerListTabs (ref), u5 (copy), u9 (copy)
            if p18 == "" then
                local v20 = {};

                if u7 == SuggestedPlayerListTabs.SERVER then
                    if u5.PlayersInServer then
                        v20 = u5.PlayersInServer;
                    end;
                elseif u7 == SuggestedPlayerListTabs.FRIENDS and u5.Friends then
                    v20 = u5.Friends;
                end;

                u10(v20);

                return nil;
            end;

            local function _(p21) -- Line: 81
                -- upvalues: u19 (copy)
                return table.find(u19, p21.name) ~= nil;
            end;

            local v22 = 0;
            local v23 = {};

            for i, v in u9 do
                local _ = i - 1;

                if table.find(u19, v.name) ~= nil == true then
                    v22 = v22 + 1;
                    v23[v22] = v;
                end;
            end;

            u10(v23);
        end;

        local v25 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = u5.Size,
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v26 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 16),
                PaddingLeft = UDim.new(0, 16)
            }) };
        local v27 = #v26;
        local v28 = u2.values(SuggestedPlayerListTabs);

        local function _(p29) -- Line: 129
            -- upvalues: StringUtil (ref)
            return {
                value = p29,
                text = StringUtil.capitalizeFirstLetter(p29)
            };
        end;

        local v30 = table.create(#v28);
        local v31 = {
            Value = u7
        };

        for i, v in v28 do
            local _ = i - 1;
            v30[i] = {
                value = v,
                text = StringUtil.capitalizeFirstLetter(v)
            };
        end;

        v31.Tabs = v30;

        function v31.OnChange(p32) -- Line: 142
            -- upvalues: u8 (copy)
            u8(p32.value);
        end;

        v31.FrameProps = {
            LayoutOrder = 1
        };
        v26[v27 + 1] = u3.createElement(TabsComponent, v31);
        v26[v27 + 2] = u3.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 28),
            BackgroundColor3 = Theme.backgroundPrimary
        }, { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingRight = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 0)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u3.createElement(AutoCompleteSearchbar, {
                BackgroundTransparency = 1,
                InputText = "",
                PlaceHolderText = "Username",
                LayoutOrder = 2,
                AutoLocalize = false,
                Items = v11,
                Size = UDim2.new(0.85, 0, 0, 28),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                OnTextChange = v24
            }) });
        table.sort(u9, function(p33, p34) -- Line: 178
            return p33.name < p34.name;
        end);

        if u9 ~= nil then
            local function _(p35, p36) -- Line: 184
                -- upvalues: u3 (ref), GiftingSuggestedListElement (ref), u5 (copy)
                if p36 >= 50 then
                    return nil;
                end;

                return u3.createElement(GiftingSuggestedListElement, {
                    OfflineDisplayPlayer = p35,
                    SetSelectedUser = u5.SetSelectedUser
                });
            end;

            local v37 = 0;
            u9 = {};

            for i, v in u9 do
                local v38;

                if i - 1 >= 50 then
                    v38 = nil;
                else
                    v38 = u3.createElement(GiftingSuggestedListElement, {
                        OfflineDisplayPlayer = v,
                        SetSelectedUser = u5.SetSelectedUser
                    });
                end;

                if v38 ~= nil then
                    v37 = v37 + 1;
                    u9[v37] = v38;
                end;
            end;
        end;

        local v39 = {
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 1, -70)
            }
        };
        local v40 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }) };
        local v41 = #v40;

        for i, v in u9 do
            v40[v41 + i] = v;
        end;

        v26[v27 + 3] = u3.createElement(AutoCanvasScrollingFrame, v39, v40);

        return u3.createElement("Frame", v25, v26);
    end)
};