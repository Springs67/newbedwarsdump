-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local ShineEffect = v1.ShineEffect;
local Party = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").Party;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HotbarButton = RuntimeLib.import(script, script.Parent.Parent, "hotbar-button").HotbarButton;
local HotbarKitButton = RuntimeLib.import(script, script.Parent.Parent, "kit", "hotbar-kit-button").HotbarKitButton;
local HotbarKitViewport = RuntimeLib.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport;
local HotbarPartyButton = RuntimeLib.import(script, script.Parent, "hotbar-party-button").HotbarPartyButton;
local HotbarPartyMemberList = RuntimeLib.import(script, script.Parent, "hotbar-party-member-list").HotbarPartyMemberList;
local v3 = u2.Component:extend("HotbarPartySection");

function v3.init(p4) -- Line: 23
end;

function v3.render(u5) -- Line: 25
    -- upvalues: u2 (copy), DeviceUtil (copy), Empty (copy), HotbarButton (copy), BattlePassUtils (copy), Flamework (copy), BedwarsAppIds (copy), ShineEffect (copy), ImageId (copy), Theme (copy), BedwarsImageId (copy), HotbarPartyMemberList (copy), HotbarPartyButton (copy), Party (copy), HotbarKitButton (copy), HotbarKitViewport (copy)
    local v6 = #u5.props.store.Party.members + 1;
    local v7 = #u5.props.store.PartyInvites.incomingInvites;
    local v8 = v7 <= 0 and "Invites" or "Invites (" .. tostring(v7) .. ")";

    return u2.createElement("Frame", {
        BorderSizePixel = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.95 or 0.82),
        Position = UDim2.fromScale(0.5, -0.2),
        AnchorPoint = Vector2.new(0.5, 1)
    }, { u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, DeviceUtil.isSmallScreen() and -0.65 or -0.7)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Bottom",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            u2.createElement(HotbarButton, {
                Text = "Battle Pass",
                AspectRatio = 4.469387755102041,
                LayoutOrder = 0,
                Icon = BattlePassUtils.BATTLE_PASS_SEASON_ICON,
                IconSize = UDim2.fromScale(0.6, 0.6),

                OnClick = function() -- Line: 55, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});
                end,

                BackgroundColor = Color3.fromRGB(22, 103, 198)
            }, { u2.createElement(ShineEffect) }),
            u2.createElement(HotbarButton, {
                Text = "Missions",
                AspectRatio = 4.469387755102041,
                LayoutOrder = 1,
                Icon = ImageId.SCROLL_SOLID,

                OnClick = function() -- Line: 67, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.MISSIONS, {});
                end,

                BackgroundColor = Theme.backgroundSuccess
            }),
            u2.createElement(HotbarButton, {
                Text = "Locker",
                AspectRatio = 3.4693877551020407,
                LayoutOrder = 2,
                Icon = ImageId.BOX_OPEN_SLOID,

                OnClick = function() -- Line: 77, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LOCKER, {});
                end,

                BackgroundColor = Color3.fromRGB(69, 84, 247)
            }),
            u2.createElement(HotbarButton, {
                Text = "Clan",
                AspectRatio = 3.4693877551020407,
                LayoutOrder = 3,
                Icon = BedwarsImageId.CLAN,

                OnClick = function() -- Line: 87, Name: OnClick
                    -- upvalues: u5 (copy), Flamework (ref), BedwarsAppIds (ref)
                    local myClanId = u5.props.store.Clans.myClanId;

                    if myClanId == "" or not myClanId then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_MENU, {});

                        return;
                    end;

                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                        ClanId = u5.props.store.Clans.myClanId
                    });
                end,

                BackgroundColor = Color3.fromRGB(69, 84, 247)
            })
        }), u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 1)
        }, { u2.createElement(HotbarPartyMemberList, {
                LayoutOrder = 1,
                store = u5.props.store,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5)
            }), u2.createElement(Empty, {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 1)
            }, {
                u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Bottom",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder"
                    }
                ),
                u2.createElement(HotbarPartyButton, {
                    LayoutOrder = 1,
                    Text = v6 <= 1 and "Create Party" or "Party (" .. tostring(v6) .. "/" .. tostring(Party.MAX_SIZE) .. ")",
                    Image = ImageId.PARTY,

                    OnClick = function() -- Line: 124, Name: OnClick
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PARTY, {});
                    end
                }),
                u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.03, 0)
                }),
                u2.createElement(HotbarPartyButton, {
                    LayoutOrder = 3,
                    Text = v8,
                    Image = ImageId.BELL,

                    OnClick = function() -- Line: 136, Name: OnClick
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PARTY_INVITES, {});
                    end
                }),
                u2.createElement(Empty, {
                    LayoutOrder = 4,
                    Size = UDim2.fromScale(0.03, 0)
                }),
                u2.createElement(HotbarKitButton, {
                    LayoutOrder = 5,
                    store = u5.props.store
                })
            }), u2.createElement(HotbarKitViewport, {
                store = u5.props.store,
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(1, 1)
            }) }) });
end;

return {
    HotbarPartySection = v3
};