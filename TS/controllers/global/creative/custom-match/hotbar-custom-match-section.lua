-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local HostPanelToggle = v5.HostPanelToggle;
local HostPanelToggleValue = v5.HostPanelToggleValue;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local LiveServerVisibilityMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util");
local KitWithCustomWeapon = v6.KitWithCustomWeapon;
local WeaponType = v6.WeaponType;
local HotbarKitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "hotbar", "ui", "kit", "hotbar-kit-viewport").HotbarKitViewport;
local WeaponViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "hotbar", "ui", "weapon-selection", "weapon-viewport").WeaponViewport;
local CustomMatchStartButton = RuntimeLib.import(script, script.Parent, "custom-match-start-button").CustomMatchStartButton;
local CustomMatchTeamButton = RuntimeLib.import(script, script.Parent, "custom-match-team-button").CustomMatchTeamButton;
local v37 = v3.new(u2)(function(u7, p8) -- Line: 34
    -- upvalues: u2 (copy), getQueueMeta (copy), Players (copy), ClientStore (copy), BedwarsKit (copy), KitWithCustomWeapon (copy), Button (copy), GameType (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), HotbarKitViewport (copy), WeaponViewport (copy), WeaponType (copy), BedwarsImageId (copy), ColorUtil (copy), LiveServerVisibilityMode (copy), Theme (copy), SoundManager (copy), GameSound (copy), HostPanelToggleValue (copy), HostPanelToggle (copy), CustomMatchStartButton (copy), default (copy), Empty (copy), CustomMatchTeamButton (copy)
    local _ = p8.useState;

    if u7.QueueType == nil then
        return u2.createFragment();
    end;

    local u9 = getQueueMeta(u7.QueueType);
    local v10 = not Players.LocalPlayer and true or Players.LocalPlayer.UserId == u7.HostUserId;
    local v11 = KitWithCustomWeapon[ClientStore:getState().Bedwars.kit or BedwarsKit.NONE] == nil;
    local weapon = ClientStore:getState().Bedwars.weapon;
    local v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.5),
        Position = UDim2.fromScale(0.5, -0.2),
        AnchorPoint = Vector2.new(0.5, 1)
    };
    local v13 = {};
    local v14 = #v13;
    local v15 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0, -1.2)
    };
    local v16 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.02, 0)
        }) };
    local v17 = #v16;
    local v18 = not u9.noKits and u2.createElement(Button, {
        Text = "<b>KITS</b>",
        LayoutOrder = 10,

        OnClick = function() -- Line: 73, Name: OnClick
            -- upvalues: u9 (copy), GameType (ref), KnitClient (ref), Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
            if u9.game == GameType.COMBINED_KIT then
                KnitClient.Controllers.CombinedKitDraftController:mountUI();

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                SelectedKit = ClientStore:getState().Bedwars.kit
            });
        end,

        Size = UDim2.fromScale(0.28, 1)
    }, { u2.createElement(HotbarKitViewport, {
            store = u7.store,
            Size = UDim2.fromScale(1.5, 1.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.02, 0.48)
        }), u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.795918367346939,
            DominantAxis = "Height"
        }) });

    if v18 then
        v16[v17 + 1] = v18;
    end;

    local v19 = #v16;
    local enableWeapons = u9.enableWeapons;

    if enableWeapons then
        local v20 = {
            LayoutOrder = 10,
            Text = v11 and "<b>Weapons</b>" or "<b>Unavailable For Kit</b>",

            OnClick = function() -- Line: 104, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.WEAPON_SELECTION_APP, {});
            end,

            Size = UDim2.fromScale(0.28, 1),
            Interactable = v11
        };
        local v21 = {};
        local v22 = #v21;

        if v11 then
            local createElement = u2.createElement;
            local v23 = {
                WeaponType = weapon or WeaponType.SWORD,
                Size = UDim2.fromScale(0.4, 1.75),
                Position = UDim2.fromScale(-0.1, -0.8)
            };
            local v24;

            if v11 then
                v24 = nil;
            else
                v24 = BedwarsImageId.BLOCK_ICON;
            end;

            v23.image = v24;
            v11 = createElement(WeaponViewport, v23);
        end;

        if v11 then
            v21[v22 + 1] = v11;
        end;

        v21[#v21 + 1] = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.795918367346939,
            DominantAxis = "Height"
        });
        enableWeapons = u2.createElement(Button, v20, v21);
    end;

    if enableWeapons then
        v16[v19 + 1] = enableWeapons;
    end;

    local v25 = #v16;

    if v10 then
        local v26 = {};
        local createElement = u2.createElement;
        local v27 = {
            LayoutOrder = 3
        };
        local v28;

        if u7.VisibilityMode == LiveServerVisibilityMode.PUBLIC then
            v28 = Theme.mcGreen;
        else
            v28 = Theme.mcRed;
        end;

        v27.Text = "<b>SERVER VISIBILITY: <font color=\"" .. ColorUtil.richTextColor(v28) .. "\">" .. string.upper(u7.VisibilityMode) .. "</font></b>";
        v27.Size = UDim2.fromScale(2, 1);

        function v27.OnClick() -- Line: 139
            -- upvalues: SoundManager (ref), GameSound (ref), u7 (copy), LiveServerVisibilityMode (ref), HostPanelToggleValue (ref), KnitClient (ref), HostPanelToggle (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local v29;

            if u7.VisibilityMode == LiveServerVisibilityMode.PUBLIC then
                v29 = HostPanelToggleValue.OFF;
            else
                v29 = HostPanelToggleValue.ON;
            end;

            KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.GameVisibilityMode, v29);
        end;

        v27.BackgroundColor3 = Theme.backgroundSecondary;
        v26[1], v26[2] = createElement(Button, v27, { u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 8,
        DominantAxis = "Height"
    }) }), u2.createElement(CustomMatchStartButton, {
    LayoutOrder = 3
});
        local v30 = {};
        local CustomMatchJoinCode = u7.CustomMatchJoinCode;

        if CustomMatchJoinCode ~= nil then
            CustomMatchJoinCode = string.upper(CustomMatchJoinCode);
        end;

        v30.Text = "Join Code: " .. tostring(CustomMatchJoinCode);
        v30.Size = UDim2.fromScale(1, 1);

        function v30.OnClick() -- Line: 164
        end;

        v30.BackgroundColor3 = Theme.backgroundTertiary;
        v30.LayoutOrder = 4;
        v26[#v26 + 1] = u2.createElement(Button, v30, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4
            }) });
        v10 = u2.createFragment(v26);
    end;

    if v10 then
        v16[v25 + 1] = v10;
    end;

    v16[#v16 + 1] = u2.createElement(Button, {
        Text = "<b>LOBBY</b>",
        LayoutOrder = 5,
        BackgroundColor3 = Theme.mcRed,
        Size = UDim2.fromScale(0.4, 1),

        OnClick = function() -- Line: 182, Name: OnClick
            -- upvalues: default (ref)
            default.Client:Get("TeleportToLobby"):SendToServer();
        end
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.795918367346939,
            DominantAxis = "Height"
        }) });
    v13[v14 + 1] = u2.createElement(Empty, v15, v16);
    local Teams = u7.Teams;

    local function _(p31, p32) -- Line: 194
        -- upvalues: u2 (ref), CustomMatchTeamButton (ref), u9 (copy)
        return u2.createElement(CustomMatchTeamButton, {
            AppId = "CustomMatchTeamButton_" .. p31.id,
            Team = p31,
            QueueMeta = u9,
            LayoutOrder = p32
        });
    end;

    local v33 = table.create(#Teams);

    for i, v in Teams do
        v33[i] = u2.createElement(CustomMatchTeamButton, {
            AppId = "CustomMatchTeamButton_" .. v.id,
            Team = v,
            QueueMeta = u9,
            LayoutOrder = i - 1
        });
    end;

    local v34 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v35 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.02, 0)
        }), u2.createElement(Button, {
            Text = "<b>EVENLY SPLIT TEAMS</b>",
            LayoutOrder = -2,
            Size = UDim2.fromScale(1, 1),

            OnClick = function() -- Line: 222, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
                KnitClient.Controllers.CustomMatchController:autoSplitTeams();
            end,

            BackgroundColor3 = Theme.backgroundSecondary
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4,
                DominantAxis = "Height"
            }) }), u2.createElement(CustomMatchTeamButton, {
            AppId = "CustomMatchTeamButton_spectators",
            Team = nil,
            LayoutOrder = -1,
            QueueMeta = u9
        }) };
    local v36 = #v35;

    for i, v in v33 do
        v35[v36 + i] = v;
    end;

    v13[v14 + 2] = u2.createElement(Empty, v34, v35);

    return u2.createElement("Frame", v12, v13);
end);

return {
    HotbarCustomMatchSection = v4.connect(function(p38, p39) -- Line: 249
        -- upvalues: HostPanelToggleValue (copy), LiveServerVisibilityMode (copy)
        local v40 = {};

        for i, v in p39 do
            v40[i] = v;
        end;

        v40.store = p38;
        v40.Teams = p38.Game.teams;
        v40.QueueType = p38.Game.queueType;
        local customMatch = p38.Game.customMatch;

        if customMatch ~= nil then
            customMatch = customMatch.hostUserId;
        end;

        v40.HostUserId = customMatch;
        local customMatch2 = p38.Game.customMatch;

        if customMatch2 ~= nil then
            customMatch2 = customMatch2.joinCode;
        end;

        v40.CustomMatchJoinCode = customMatch2;
        local v41;

        if p38.CustomMatch.generalToggles.GameVisibilityMode == HostPanelToggleValue.ON then
            v41 = LiveServerVisibilityMode.PUBLIC;
        else
            v41 = LiveServerVisibilityMode.PRIVATE;
        end;

        v40.VisibilityMode = v41;

        return v40;
    end)(v37)
};