-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelPlayerRow = RuntimeLib.import(script, script.Parent, "host-panel-player-row").HostPanelPlayerRow;
local u4 = {
    [OfflinePlayerUtil.Dummy.oiogy.userId] = "Red",
    [OfflinePlayerUtil.Dummy.spleenhook.userId] = "Blue",
    [OfflinePlayerUtil.Dummy.SnickTrix.userId] = "Blue"
};

return {
    HostPanelPlayersTab = v3.new(u2)(function(u5, p6) -- Line: 21
        -- upvalues: DeviceUtil (copy), Players (copy), OfflinePlayerUtil (copy), u4 (copy), KnitClient (copy), u2 (copy), Theme (copy), AutoCompleteSearchbar (copy), Empty (copy), ColorUtil (copy), HostPanelPlayerRow (copy), AutoCanvasScrollingFrame (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7;

        if DeviceUtil.isHoarceKat() then
            u7 = { OfflinePlayerUtil.Dummy.oiogy, OfflinePlayerUtil.Dummy.spleenhook, OfflinePlayerUtil.Dummy.SnickTrix };
        else
            local v8 = Players:GetPlayers();

            local function _(p9) -- Line: 27
                -- upvalues: OfflinePlayerUtil (ref)
                return OfflinePlayerUtil.getOfflinePlayer(p9);
            end;

            u7 = table.create(#v8);

            for i, v in v8 do
                local _ = i - 1;
                u7[i] = OfflinePlayerUtil.getOfflinePlayer(v);
            end;
        end;

        local v10, u11 = useState(u7);
        local u12, u13 = useState(not DeviceUtil.isHoarceKat() and {} or u4);
        local u14, u15 = useState(false);
        useEffect(function() -- Line: 44
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u13 (copy), u15 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local v16 = KnitClient.Controllers.TeamController:getTeams();

            local function v21(u17, u18) -- Line: 49
                local function _(p19) -- Line: 51
                    -- upvalues: u17 (copy), u18 (copy)
                    local v20 = u17;
                    v20[p19.userId] = u18.name;

                    return v20;
                end;

                for _, v in u18.members do
                    u17[v.userId] = u18.name;
                end;

                return u17;
            end;

            local v22 = {};

            for i = 1, #v16 do
                v22 = v21(v22, v16[i], i - 1, v16);
            end;

            if v22 then
                u13(v22);
            end;

            if not DeviceUtil.isHoarceKat() and KnitClient.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist", "director" }) then
                u15(true);
            end;
        end, {});
        local v23 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }), u2.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Text = "<b>PLAYERS</b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Bottom",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = Theme.textPrimary
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }) };
        local v24 = #v23;
        local v25 = {
            Size = UDim2.new(1, 0, 0, 30)
        };

        local function _(p26, p27) -- Line: 138
            table.insert(p26, {
                key = p27.displayName,
                aliases = { p27.name }
            });

            return p26;
        end;

        local v28 = {};

        local function v34(p29, u30) -- Line: 81
            -- upvalues: u11 (copy), u7 (copy)
            if p29 == "" then
                return u11(u7);
            end;

            local function _(p31) -- Line: 85
                -- upvalues: u30 (copy)
                return table.find(u30, p31.displayName) ~= nil or table.find(u30, p31.name) ~= nil;
            end;

            local v32 = 0;
            local v33 = {};

            for i, v in u7 do
                local _ = i - 1;

                if (table.find(u30, v.displayName) ~= nil or table.find(u30, v.name) ~= nil) == true then
                    v32 = v32 + 1;
                    v33[v32] = v;
                end;
            end;

            u11(v33);
        end;

        for i = 1, #u7 do
            local v35 = u7[i];
            local _ = i - 1;
            table.insert(v28, {
                key = v35.displayName,
                aliases = { v35.name }
            });
        end;

        v25.Items = v28;
        v25.InputText = "";
        v25.OnTextChange = v34;
        v25.PlaceHolderText = "Search User";
        v25.LayoutOrder = 2;
        v23[v24 + 1] = u2.createElement(AutoCompleteSearchbar, v25);
        v23.ColumnHeaders = u2.createFragment({
            ColumnHeaders = u2.createElement(Empty, {
                LayoutOrder = 3,
                Size = UDim2.new(1, 0, 0, 20)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 12)
                }),
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.03, 0),
                    PaddingRight = UDim.new(0.03, 0)
                }),
                u2.createElement("TextLabel", {
                    Text = "<b>Player</b>",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Bottom",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.4, 1),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.new(0.6, -12, 1, 0)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Right",
                        VerticalAlignment = "Bottom",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 8)
                    }),
                    u2.createElement("TextLabel", {
                        Text = "<b>Max Health</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Bottom",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.25, 1),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }),
                    u2.createElement("TextLabel", {
                        Text = "<b>Team</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Bottom",
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.new(0.25, -8, 1, 0),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }),
                    u2.createElement("TextLabel", {
                        Text = "<b>Actions</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Bottom",
                        BackgroundTransparency = 1,
                        LayoutOrder = 4,
                        Size = UDim2.new(0.25, -8, 1, 0),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) })
                })
            })
        });
        local v36 = next(u12) ~= nil;

        if v36 then
            table.sort(v10, function(p37, p38) -- Line: 255
                return string.lower(p37.displayName) < string.lower(p38.displayName);
            end);

            local function _(p39, p40) -- Line: 260
                -- upvalues: u12 (copy), u14 (copy), u5 (copy), u2 (ref), HostPanelPlayerRow (ref)
                return u2.createElement(HostPanelPlayerRow, {
                    OfflinePlayer = p39,
                    Index = p40,
                    Team = u12[p39.userId],
                    HasGameBanPermission = u14,
                    store = u5.store
                });
            end;

            v36 = table.create(#v10);

            for i, v in v10 do
                v36[i] = u2.createElement(HostPanelPlayerRow, {
                    OfflinePlayer = v,
                    Index = i - 1,
                    Team = u12[v.userId],
                    HasGameBanPermission = u14,
                    store = u5.store
                });
            end;
        end;

        local v41 = {
            AdditionalSpace = 40,
            ScrollingFrameProps = {
                LayoutOrder = 4,
                Size = UDim2.new(1, 0, 1, -100)
            }
        };
        local v42 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 4)
            }) };
        local v43 = #v42;

        if v36 then
            for i, v in v36 do
                v42[v43 + i] = v;
            end;
        end;

        v23[v24 + 2] = u2.createElement(AutoCanvasScrollingFrame, v41, v42);

        return u2.createFragment(v23);
    end)
};