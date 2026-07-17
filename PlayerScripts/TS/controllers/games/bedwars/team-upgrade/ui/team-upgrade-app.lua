-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local SlideIn = v1.SlideIn;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedTeamUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade;
local getSortedTeamUpgrades = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta").getSortedTeamUpgrades;
local TeamUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BedTeamUpgradeCard = RuntimeLib.import(script, script.Parent, "bed-team-upgrade-card").BedTeamUpgradeCard;
local TeamUpgradeCard = RuntimeLib.import(script, script.Parent, "team-upgrade-card").TeamUpgradeCard;
local TeamUpgradeCurrencyCount = RuntimeLib.import(script, script.Parent, "team-upgrade-currency-count").TeamUpgradeCurrencyCount;
local v86 = v4.new(u3)(function(u6, p7) -- Line: 26
    -- upvalues: TeamUpgrade (copy), BedTeamUpgrade (copy), DeviceUtil (copy), GamePlayerUtil (copy), Players (copy), getSortedTeamUpgrades (copy), u3 (copy), getQueueMeta (copy), u2 (copy), RuntimeLib (copy), Flamework (copy), default (copy), DarkBackground (copy), Empty (copy), TeamUpgradeCurrencyCount (copy), TeamUpgradeUtil (copy), TeamUpgradeCard (copy), KnitClient (copy), BedTeamUpgradeCard (copy), EmptyButton (copy), SlideIn (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8 = u6.TeamUpgradesPurchased[TeamUpgrade.DAMAGE];
    local u9, u10 = useState(v8 == nil and 0 or v8);
    local v11 = u6.TeamUpgradesPurchased[TeamUpgrade.ARMOR];
    local u12, u13 = useState(v11 == nil and 0 or v11);
    local v14 = u6.TeamUpgradesPurchased[TeamUpgrade.TEAM_GENERATOR];
    local u15, u16 = useState(v14 == nil and 0 or v14);
    local v17 = u6.TeamUpgradesPurchased[TeamUpgrade.DIAMOND_GENERATOR];
    local u18, u19 = useState(v17 == nil and 0 or v17);
    local v20 = u6.TeamUpgradesPurchased[TeamUpgrade.BREAK_SPEED];
    local u21, u22 = useState(v20 == nil and 0 or v20);
    local u23, u24 = useState(u6.BedTeamUpgradesPurchased[BedTeamUpgrade.BED_ALARM] == true);
    local u25, u26 = useState(u6.BedTeamUpgradesPurchased[BedTeamUpgrade.BED_SHIELD] == true);
    local v27 = u6.TeamUpgradesPurchased[TeamUpgrade.SURVIVAL_BED_UPGRADE];
    local u28, u29 = useState(v27 == nil and 0 or v27);
    local v30 = u6.TeamUpgradesPurchased[TeamUpgrade.SURVIVAL_PLUNDER_UPGRADE];
    local u31, u32 = useState(v30 == nil and 0 or v30);
    local u33 = DeviceUtil.isHoarceKat() and 0 or GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
    local v34 = getSortedTeamUpgrades();

    if not u6.QueueType then
        return u3.createFragment();
    end;

    local u35 = getQueueMeta(u6.QueueType);

    local function _(p36) -- Line: 91
        -- upvalues: u35 (copy)
        return u35.disabledBedTeamUpgrades == nil and true or table.find(u35.disabledBedTeamUpgrades, p36) == nil;
    end;

    local v37 = 0;
    local v38 = {};

    for i, v in u2.values(BedTeamUpgrade) do
        local _ = i - 1;
        local v39;

        if u35.disabledBedTeamUpgrades == nil then
            v39 = true;
        else
            local v40 = table.find(u35.disabledBedTeamUpgrades, v) ~= nil;
            v39 = not v40;
        end;

        if v39 == true then
            v37 = v37 + 1;
            v38[v37] = v;
        end;
    end;

    local v41;

    if u6.QueueType then
        local disabledFeatures = getQueueMeta(u6.QueueType).disabledFeatures;

        if disabledFeatures ~= nil then
            disabledFeatures = disabledFeatures.disableBedTeamUpgrades;
        end;

        v41 = disabledFeatures == true;
    else
        v41 = false;
    end;

    local function getHasBedUpgrade(p42) -- Line: 121
        -- upvalues: BedTeamUpgrade (ref), u23 (copy), u25 (copy)
        if p42 == BedTeamUpgrade.BED_ALARM then
            return u23;
        end;

        if p42 == BedTeamUpgrade.BED_SHIELD then
            return u25;
        end;
    end;

    local function getUpgradeTier(p43) -- Line: 131
        -- upvalues: TeamUpgrade (ref), u9 (copy), u12 (copy), u15 (copy), u18 (copy), u21 (copy), u28 (copy), u31 (copy)
        if p43 == TeamUpgrade.DAMAGE then
            return u9;
        end;

        if p43 == TeamUpgrade.ARMOR then
            return u12;
        end;

        if p43 == TeamUpgrade.TEAM_GENERATOR then
            return u15;
        end;

        if p43 == TeamUpgrade.DIAMOND_GENERATOR then
            return u18;
        end;

        if p43 == TeamUpgrade.BREAK_SPEED then
            return u21;
        end;

        if p43 == TeamUpgrade.SURVIVAL_BED_UPGRADE then
            return u28;
        end;

        if p43 == TeamUpgrade.SURVIVAL_PLUNDER_UPGRADE then
            return u31;
        end;
    end;

    local function setUpgradeTier(p44, p45) -- Line: 156
        -- upvalues: TeamUpgrade (ref), u10 (copy), u13 (copy), u16 (copy), u19 (copy), u22 (copy), u29 (copy), u32 (copy)
        if p44 == TeamUpgrade.DAMAGE then
            u10(p45);

            return;
        end;

        if p44 == TeamUpgrade.ARMOR then
            u13(p45);

            return;
        end;

        if p44 == TeamUpgrade.TEAM_GENERATOR then
            u16(p45);

            return;
        end;

        if p44 == TeamUpgrade.DIAMOND_GENERATOR then
            u19(p45);

            return;
        end;

        if p44 == TeamUpgrade.BREAK_SPEED then
            u22(p45);

            return;
        end;

        if p44 == TeamUpgrade.SURVIVAL_BED_UPGRADE then
            u29(p45);

            return;
        end;

        if p44 ~= TeamUpgrade.SURVIVAL_PLUNDER_UPGRADE then
            return;
        end;

        u32(p45);
    end;

    local function setBedTeamUpgrade(p46, p47) -- Line: 188
        -- upvalues: BedTeamUpgrade (ref), u24 (copy), u26 (copy)
        if p46 == BedTeamUpgrade.BED_ALARM then
            u24(p47);

            return;
        end;

        if p46 ~= BedTeamUpgrade.BED_SHIELD then
            return;
        end;

        u26(p47);
    end;

    useEffect(function() -- Line: 200
        -- upvalues: DeviceUtil (ref), Players (ref), RuntimeLib (ref), Flamework (ref), default (ref), u33 (copy), setUpgradeTier (copy), setBedTeamUpgrade (copy)
        local u48 = true;

        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;
        end;

        if LocalPlayer then
            local Position = Players.LocalPlayer.Character:GetPivot().Position;
            RuntimeLib.Promise.defer(function() -- Line: 212
                -- upvalues: u48 (ref), Players (ref), Position (copy), Flamework (ref)
                while true do
                    local v49 = task.wait(0.2);

                    if v49 ~= 0 and (v49 == v49 and v49) then
                        v49 = u48;
                    end;

                    if v49 == 0 or (v49 ~= v49 or not v49) then
                        return;
                    end;

                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        Character = Character:GetPivot().Position;
                    end;

                    if Character == nil then
                        Character = Vector3.new();
                    end;

                    if (Character - Position).Magnitude > 6 then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TeamUpgradeApp");
                    end;
                end;
            end);
        end;

        local u54 = default.Client:Get("TeamUpgradePurchased"):Connect(function(p50, p51) -- Line: 237
            -- upvalues: u33 (ref), setUpgradeTier (ref)
            if u33 == p50 then
                local function _(p52, p53) -- Line: 240
                    -- upvalues: setUpgradeTier (ref)
                    setUpgradeTier(p53, p52);
                end;

                for i, v in p51 do
                    setUpgradeTier(i, v);
                end;
            end;
        end);
        local u59 = default.Client:Get("BedTeamUpgradeChanged"):Connect(function(p55, p56) -- Line: 249
            -- upvalues: u33 (ref), setBedTeamUpgrade (ref)
            if u33 == p55 then
                local function _(p57, p58) -- Line: 252
                    -- upvalues: setBedTeamUpgrade (ref)
                    setBedTeamUpgrade(p58, p57);
                end;

                for i, v in p56 do
                    setBedTeamUpgrade(i, v);
                end;
            end;
        end);

        return function() -- Line: 260
            -- upvalues: u54 (copy), u59 (copy), u48 (ref)
            u54:Disconnect();
            u59:Disconnect();
            u48 = false;
        end;
    end, {});
    local v60 = {
        DisplayOrder = 20
    };
    local v61 = { u3.createElement(DarkBackground, {
            AppId = "TeamUpgradeApp"
        }) };
    local v62 = {};
    local _ = #v62;
    local v63 = {
        Modal = true
    };
    local fromScale = UDim2.fromScale;
    local v64 = DeviceUtil.isSmallScreen() and 0.9 or 0.75;
    DeviceUtil.isSmallScreen();
    v63.Size = fromScale(v64, 0.75);
    v63.Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.03 or 0.05);
    v63.AnchorPoint = Vector2.new(0.5, 0);
    local v65 = {
        CurrencyWrapper = u3.createElement(Empty, {
            Size = UDim2.fromScale(0.33, 0.08),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0)
        }, { u3.createElement(TeamUpgradeCurrencyCount, {
                ObservedInventory = u6.ObservedInventory,
                Currency = TeamUpgradeUtil.TEAM_UPGRADE_RESOURCE,
                IsHomeBase = u6.IsHomeBase,
                FrameProps = {
                    Size = UDim2.fromScale(1, 1)
                },
                ListProps = {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }
            }) })
    };
    local _ = #v65;
    local v66 = {
        Size = UDim2.fromScale(1, 0.925),
        Position = UDim2.fromScale(0, 0.1)
    };
    local v67 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.015, 0)
        }) };
    local _ = #v67;

    local function v71(p68, p69) -- Line: 317
        -- upvalues: u3 (ref), TeamUpgradeCard (ref), u2 (ref), TeamUpgrade (ref), u6 (copy), getUpgradeTier (copy), KnitClient (ref)
        return u3.createElement(TeamUpgradeCard, {
            FrameProps = {
                Size = UDim2.new(1 / #u2.values(TeamUpgrade) - (#u2.values(TeamUpgrade) - 1) * 0.015 / #u2.values(TeamUpgrade), 0, 1, 0),
                LayoutOrder = p69
            },
            ObservedInventory = u6.ObservedInventory,
            TeamUpgrade = p68,
            CurrentTier = getUpgradeTier(p68),

            Selected = function(p70) -- Line: 326, Name: Selected
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.TeamUpgradeController:requestPurchaseTeamUpgrade(p70);
            end,

            IsHomeBase = u6.IsHomeBase,
            GamepadShouldAutoSelect = p69 == 0
        });
    end;

    local v72 = table.create(#v34);

    for i, v in v34 do
        v72[i] = v71(v, i - 1, v34);
    end;

    local v73 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.79),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v74 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            HorizontalFlex = "Fill",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.015, 0)
        }) };
    local v75 = #v74;

    for i, v in v72 do
        v74[v75 + i] = v;
    end;

    v67.TieredUpgradesWrapper = u3.createElement("Frame", v73, v74);
    local v76 = not v41;

    if v76 then
        local function v82(p77, p78) -- Line: 363
            -- upvalues: u3 (ref), BedTeamUpgradeCard (ref), u2 (ref), BedTeamUpgrade (ref), u6 (copy), u23 (copy), u25 (copy), KnitClient (ref)
            local createElement = u3.createElement;
            local v79 = {
                FrameProps = {
                    Size = UDim2.new(1 / (#u2.values(BedTeamUpgrade) + 1), 0, 1, 0),
                    LayoutOrder = p78
                },
                ObservedInventory = u6.ObservedInventory,
                BedTeamUpgrade = p77
            };
            local v80;

            if p77 == BedTeamUpgrade.BED_ALARM then
                v80 = u23;
            elseif p77 == BedTeamUpgrade.BED_SHIELD then
                v80 = u25;
            else
                v80 = nil;
            end;

            v79.Purchased = v80 == true;

            function v79.AttemptPurchase(p81) -- Line: 372
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.BedTeamUpgradeController:requestPurchaseBedTeamUpgrade(p81);
            end;

            v79.IsHomeBase = u6.IsHomeBase;
            v79.BedStatus = u6.BedStatus;

            return createElement(BedTeamUpgradeCard, v79);
        end;

        v76 = table.create(#v38);

        for i, v in v38 do
            v76[i] = v82(v, i - 1, v38);
        end;
    end;

    local v83 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.8, 0.21),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v84 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            HorizontalFlex = "Fill",
            Padding = UDim.new(0.015, 0)
        }) };
    local v85 = #v84;

    if v76 then
        for i, v in v76 do
            v84[v85 + i] = v;
        end;
    end;

    v67.BedUpgradesWrapper = u3.createElement("Frame", v83, v84);
    v65.UpgradesContainer = u3.createElement(Empty, v66, v67);
    v62.TeamUpgradeAppContainer = u3.createElement(EmptyButton, v63, v65);
    v61[#v61 + 1] = u3.createElement(SlideIn, {}, v62);

    return u3.createFragment({
        TeamUpgradeApp = u3.createElement("ScreenGui", v60, v61)
    });
end);

return {
    TeamUpgradeApp = v5.connect(function(p87, p88) -- Line: 419
        local v89 = {};

        for i, v in p88 do
            v89[i] = v;
        end;

        v89.TeamUpgradesPurchased = p87.Bedwars.myTeamUpgrades;
        v89.BedTeamUpgradesPurchased = p87.Bedwars.myBedTeamUpgrades;
        v89.QueueType = p87.Game.queueType;
        v89.ObservedInventory = p87.Inventory.observedInventory;
        v89.BedStatus = p87.Bedwars.teamBedStatus[p88.TeamId];

        return v89;
    end)(v86)
};