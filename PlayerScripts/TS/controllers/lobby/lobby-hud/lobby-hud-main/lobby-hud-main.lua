-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local ScaleComponent = v1.ScaleComponent;
local Party = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").Party;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HotbarKitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "kit", "hotbar-kit-viewport").HotbarKitViewport;
local HotbarPartyMemberList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "party", "hotbar-party-member-list").HotbarPartyMemberList;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local Badge = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge;
local LobbyHudMainButton = RuntimeLib.import(script, script.Parent, "lobby-hud-main-button").LobbyHudMainButton;
local LobbyHudPlayButton = RuntimeLib.import(script, script.Parent, "lobby-hud-play-button").LobbyHudPlayButton;
local v20 = v3.new(u2)(function(p5, p6) -- Line: 21
    -- upvalues: DeviceUtil (copy), u2 (copy), ScaleComponent (copy), HotbarPartyMemberList (copy), ImageId (copy), Party (copy), Players (copy), Flamework (copy), BedwarsAppIds (copy), Badge (copy), LobbyHudMainButton (copy), LobbyHudPlayButton (copy), ClientStore (copy), HotbarKitViewport (copy), Empty (copy)
    local _ = p6.useState;
    local v7 = {
        ResetOnSpawn = false
    };
    local v8 = {};
    local v9 = {
        Size = UDim2.fromOffset(700, 60),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.8 or 0.9)
    };
    local v10 = { u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(DeviceUtil.isSmallScreen() and 450 or 700, DeviceUtil.isSmallScreen() and 40 or 60)
        }), u2.createElement(HotbarPartyMemberList, {
            LayoutOrder = 1,
            store = p5.store,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.03, 0.5)
        }) };
    local _ = #v10;
    local v11 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v12 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.03, 0)
        }) };
    local v13 = #v12;
    local v15 = {
        store = p5.store,
        Icon = ImageId.PARTY,
        Text = p5.partyMemberCount <= 1 and "Create Party" or "Party (" .. tostring(p5.partyMemberCount) .. "/" .. tostring(Party.MAX_SIZE) .. ")",

        OnClick = function() -- Line: 63, Name: OnClick
            -- upvalues: Players (ref), Flamework (ref), BedwarsAppIds (ref)
            local v14 = Players.LocalPlayer:GetAttribute("ResolvingMatchDisconnect");

            if v14 ~= 0 and (v14 == v14 and (v14 ~= "" and v14)) then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PARTY, {});
        end,

        FrameProps = {
            Size = UDim2.fromScale(0.25, 0.7)
        }
    };
    local v16 = {};
    local v17 = #v16;
    local v18;

    if p5.numIncomingInvites > 0 then
        v18 = u2.createElement(Badge, {
            Text = tostring(p5.numIncomingInvites)
        });
    else
        v18 = false;
    end;

    if v18 then
        v16[v17 + 1] = v18;
    end;

    v12[v13 + 1] = u2.createElement(LobbyHudMainButton, v15, v16);
    v12[v13 + 2] = u2.createElement(LobbyHudPlayButton, {
        FrameProps = {
            Size = UDim2.fromScale(0.35, 1)
        }
    });
    v12[v13 + 3] = u2.createElement(LobbyHudMainButton, {
        Text = "Kits",
        store = p5.store,

        OnClick = function() -- Line: 91, Name: OnClick
            -- upvalues: Players (ref), Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
            local v19 = Players.LocalPlayer:GetAttribute("ResolvingMatchDisconnect");

            if v19 ~= 0 and (v19 == v19 and (v19 ~= "" and v19)) then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                SelectedKit = ClientStore:getState().Bedwars.kit
            });
        end,

        FrameProps = {
            Size = UDim2.fromScale(0.25, 0.7)
        }
    }, { u2.createElement(HotbarKitViewport, {
            store = p5.store,
            Size = UDim2.fromScale(1.5, 1.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.02, 0.48)
        }) });
    v10.ButtonList = u2.createElement(Empty, v11, v12);
    v8[#v8 + 1] = u2.createElement(Empty, v9, v10);

    return u2.createElement("ScreenGui", v7, v8);
end);

return {
    LobbyHudMain = v4.connect(function(p21, p22) -- Line: 116
        local v23 = {};

        for i, v in p22 do
            v23[i] = v;
        end;

        v23.store = p21;
        v23.partyMemberCount = #p21.Party.members + 1;
        v23.numIncomingInvites = #p21.PartyInvites.incomingInvites;

        return v23;
    end)(v20)
};