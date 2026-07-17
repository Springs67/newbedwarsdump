-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CircularSpinner = v1.CircularSpinner;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local EmptyButton = v1.EmptyButton;
local IconButton = v1.IconButton;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerProfileAchievements = RuntimeLib.import(script, script.Parent, "player-profile-achievements").PlayerProfileAchievements;
local PlayerProfileEquipped = RuntimeLib.import(script, script.Parent, "player-profile-equipped").PlayerProfileEquipped;
local PlayerProfileHeader = RuntimeLib.import(script, script.Parent, "player-profile-header").PlayerProfileHeader;
local PlayerProfileKits = RuntimeLib.import(script, script.Parent, "player-profile-kits").PlayerProfileKits;
local PlayerProfileLocker = RuntimeLib.import(script, script.Parent, "player-profile-locker").PlayerProfileLocker;
local PlayerProfileMatchHistory = RuntimeLib.import(script, script.Parent, "player-profile-match-history").PlayerProfileMatchHistory;
local PlayerProfileStats = RuntimeLib.import(script, script.Parent, "player-profile-stats").PlayerProfileStats;
local PlayerProfileTabButton = RuntimeLib.import(script, script.Parent, "player-profile-tab-button").PlayerProfileTabButton;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.STATS = "STATS";
v5.STATS = "STATS";
u6.KITS = "KITS";
v5.KITS = "KITS";
u6.LOCKER = "LOCKER";
v5.LOCKER = "LOCKER";
u6.EQUIPPED = "EQUIPPED";
v5.EQUIPPED = "EQUIPPED";
u6.MATCH_HISTORY = "MATCH_HISTORY";
v5.MATCH_HISTORY = "MATCH_HISTORY";
u6.ACHIEVEMENTS = "ACHIEVEMENTS";
v5.ACHIEVEMENTS = "ACHIEVEMENTS";

local function v53(u7, p8) -- Line: 48
    -- upvalues: u6 (ref), DeviceUtil (copy), Workspace (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), IconButton (copy), BedwarsImageId (copy), Flamework (copy), Theme (copy), PlayerProfileHeader (copy), PlayerProfileTabButton (copy), AutoCanvasScrollingFrame (copy), PlayerProfileStats (copy), PlayerProfileKits (copy), PlayerProfileLocker (copy), PlayerProfileEquipped (copy), PlayerProfileMatchHistory (copy), PlayerProfileAchievements (copy), CircularSpinner (copy), EmptyButton (copy), SlideIn (copy)
    local _ = p8.useEffect;
    local v9, u10 = p8.useState(u7.DefaultTab or u6.STATS);
    local v11 = DeviceUtil.isSmallScreen() and 0.08 or 0.05;
    local v12 = 1 - (v11 + 0.2);
    local v13 = u7.ProfileData or u7.store.Lobby.currentlyViewingProfileData;
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.ViewportSize;
    end;

    local v14 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };
    local v15 = { u2.createElement(DarkBackground, {
            IgnoreClickDuration = 0.4,
            AppId = u7.AppId,

            OnClick = function() -- Line: 69, Name: OnClick
                return true;
            end
        }) };
    local v16 = {};
    local v17 = {
        Modal = true,
        Size = UDim2.fromOffset(800, 700),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.05)
    };
    local v18 = {};
    local v19 = #v18;
    local v20 = {};
    local v21;

    if CurrentCamera == nil then
        v21 = CurrentCamera;
    else
        v21 = CurrentCamera.X;
    end;

    local v22;

    if v21 == 0 or (v21 ~= v21 or not v21) then
        v22 = (1 / 0);
    else
        local v23;

        if CurrentCamera == nil then
            v23 = CurrentCamera;
        else
            v23 = CurrentCamera.X;
        end;

        v22 = v23 * 0.9;
    end;

    local v24 = math.min(1600, v22);
    local v25;

    if CurrentCamera == nil then
        v25 = CurrentCamera;
    else
        v25 = CurrentCamera.Y;
    end;

    local v26;

    if v25 == 0 or (v25 ~= v25 or not v25) then
        v26 = (1 / 0);
    else
        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.Y;
        end;

        v26 = CurrentCamera * 0.9;
    end;

    v20.MaximumSize = Vector2.new(v24, (math.min(1400, v26)));
    v18[v19 + 1] = u2.createElement(ScaleComponent, v20);
    v18[v19 + 2] = u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 1.1428571428571428
    });
    v18[v19 + 3] = u2.createElement(IconButton, {
        Size = UDim2.new(0, 40, 0, 40),
        Image = BedwarsImageId.X,
        Position = UDim2.new(1, -4, 0, 4),
        AnchorPoint = Vector2.new(1, 0),

        OnClick = function() -- Line: 130, Name: OnClick
            -- upvalues: Flamework (ref), u7 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.AppId);
        end,

        IconProps = {
            ZIndex = 100,
            ImageTransparency = 0.2
        },
        ImageColor3 = Color3.fromRGB(255, 255, 255)
    });
    local v27 = {
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v28 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        }), u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u2.createElement(PlayerProfileHeader, {
            ProfileData = v13,
            FrameProps = {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.2)
            }
        }) };
    local v29 = #v28;
    local v30 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, v11),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v31 = {};
    local v32 = {
        ScrollingFrameProps = {
            ScrollingDirection = Enum.ScrollingDirection.X
        }
    };
    local v33 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        StatsTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 0,
            Text = "STATS",

            OnClick = function() -- Line: 182, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.STATS);
            end,

            Tab = u6.STATS,
            ActiveTab = v9
        }),
        KitsTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 2,
            Text = "KITS",

            OnClick = function() -- Line: 191, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.KITS);
            end,

            Tab = u6.KITS,
            ActiveTab = v9
        }),
        LockerTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 3,
            Text = "LOCKER",

            OnClick = function() -- Line: 200, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.LOCKER);
            end,

            Tab = u6.LOCKER,
            ActiveTab = v9
        }),
        AchievementsTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 4,
            Text = "ACHIEVEMENTS",
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.2 or 0.15, 1),

            OnClick = function() -- Line: 210, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.ACHIEVEMENTS);
            end,

            Tab = u6.ACHIEVEMENTS,
            ActiveTab = v9
        }),
        MatchHistoryTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 5,
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.2 or 0.18, 1),

            OnClick = function() -- Line: 220, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.MATCH_HISTORY);
            end,

            Tab = u6.MATCH_HISTORY,
            Text = DeviceUtil.isSmallScreen() and "MATCHES" or "MATCH HISTORY",
            ActiveTab = v9
        })
    };
    local v34 = #v33;
    local v35 = DeviceUtil.isSmallScreen() and u2.createFragment({
        EquippedTab = u2.createElement(PlayerProfileTabButton, {
            LayoutOrder = 1,
            Text = "EQUIPPED",

            OnClick = function() -- Line: 232, Name: OnClick
                -- upvalues: u10 (copy), u6 (ref)
                u10(u6.EQUIPPED);
            end,

            Tab = u6.EQUIPPED,
            ActiveTab = v9
        })
    });

    if v35 then
        v33[v34 + 1] = v35;
    end;

    v31[#v31 + 1] = u2.createElement(AutoCanvasScrollingFrame, v32, v33);
    v28.PlayerProfileTabList = u2.createElement("Frame", v30, v31);
    local v36;

    if v13 then
        local v37 = {
            LayoutOrder = 2,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, v12),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v38 = {};
        local v39 = #v38;
        local v40;

        if v9 == u6.STATS then
            v40 = u2.createElement(PlayerProfileStats, {
                ProfileData = v13,
                store = u7.store
            });
        else
            v40 = false;
        end;

        if v40 then
            v38[v39 + 1] = v40;
        end;

        local v41 = #v38;
        local v42;

        if v9 == u6.KITS then
            v42 = u2.createElement(PlayerProfileKits, {
                store = u7.store,
                ProfileData = v13
            });
        else
            v42 = false;
        end;

        if v42 then
            v38[v41 + 1] = v42;
        end;

        local v43 = #v38;
        local v44;

        if v9 == u6.LOCKER then
            v44 = u2.createElement(PlayerProfileLocker, {
                ProfileData = v13
            });
        else
            v44 = false;
        end;

        if v44 then
            v38[v43 + 1] = v44;
        end;

        local v45 = #v38;
        local v46;

        if v9 == u6.EQUIPPED then
            v46 = u2.createElement(PlayerProfileEquipped, {
                ProfileData = v13,
                store = u7.store
            });
        else
            v46 = false;
        end;

        if v46 then
            v38[v45 + 1] = v46;
        end;

        local v47 = #v38;
        local v48;

        if v9 == u6.MATCH_HISTORY then
            v48 = u2.createElement(PlayerProfileMatchHistory, {
                ProfileData = v13,
                store = u7.store
            });
        else
            v48 = false;
        end;

        if v48 then
            v38[v47 + 1] = v48;
        end;

        local v49 = #v38;
        local v50;

        if v9 == u6.ACHIEVEMENTS then
            v50 = u2.createElement(PlayerProfileAchievements, {
                ProfileData = v13,
                store = u7.store
            });
        else
            v50 = false;
        end;

        if v50 then
            v38[v49 + 1] = v50;
        end;

        v36 = u2.createFragment({
            PlayerProfileContent = u2.createElement("Frame", v37, v38)
        });
    else
        v36 = v13;
    end;

    if v36 then
        v28[v29 + 1] = v36;
    end;

    local v51 = #v28;
    local v52 = not v13 and u2.createFragment({
        PlayerProfileLoading = u2.createElement("Frame", {
            LayoutOrder = 2,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, v12),
            BackgroundColor3 = Theme.backgroundPrimary
        }, { u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = Theme.backgroundSecondary
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }),
                u2.createElement("TextLabel", {
                    Text = "Loading...",
                    TextSize = 18,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.2),
                    TextColor3 = Theme.textPrimary,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }),
                u2.createElement(CircularSpinner, {
                    Size = UDim2.fromScale(1, 0.2)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            }) })
    });

    if v52 then
        v28[v51 + 1] = v52;
    end;

    v18[v19 + 4] = u2.createElement("Frame", v27, v28);
    v16[#v16 + 1] = u2.createElement(EmptyButton, v17, v18);
    v15[#v15 + 1] = u2.createElement(SlideIn, {}, v16);

    return u2.createElement("ScreenGui", v14, v15);
end;

local v54 = v3.new(u2)(v53);

return {
    PlayerProfileTab = u6,
    PlayerProfileApp = v4.connect(function(p55, p56) -- Line: 362
        local v57 = {};

        for i, v in p56 do
            v57[i] = v;
        end;

        v57.store = p55;

        return v57;
    end)(v54)
};