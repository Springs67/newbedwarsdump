-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local TabsComponent = v1.TabsComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab");
local LockerTab = v5.LockerTab;
local LockerTabOrder = v5.LockerTabOrder;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LockerItemsGrid = RuntimeLib.import(script, script.Parent.Parent.Parent, "locker", "ui", "locker-items-grid").LockerItemsGrid;
local LockerUtil = RuntimeLib.import(script, script.Parent.Parent.Parent, "locker", "ui", "locker-util").LockerUtil;
local PlayerProfileEmpty = RuntimeLib.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty;

return {
    PlayerProfileLocker = v4.new(u3)(function(p6, p7) -- Line: 23
        -- upvalues: KillEffectType (copy), EmoteType (copy), TitleType (copy), LobbyGadgetType (copy), WinEffectType (copy), BedBreakEffectType (copy), BadgeType (copy), LockerTab (copy), LockerUtil (copy), DeviceUtil (copy), Theme (copy), u3 (copy), u2 (copy), LockerTabOrder (copy), TabsComponent (copy), PlayerProfileEmpty (copy), LockerItemsGrid (copy)
        local useState = p7.useState;
        local _ = p7.useEffect;
        local v8 = {
            inventory = {},
            record = {}
        };
        local v9 = {
            selectedKillEffect = KillEffectType.NONE,
            killEffects = p6.ProfileData.locker.killEffects,
            selectedEmotes = { EmoteType.BED_BREAK },
            emotes = p6.ProfileData.locker.emotes,
            selectedTitle = TitleType.NONE,
            titles = p6.ProfileData.locker.titles,
            selectedLobbyGadget = LobbyGadgetType.NONE,
            lobbyGadgets = p6.ProfileData.locker.lobbyGadgets,
            selectedWinEffect = WinEffectType.NONE,
            winEffects = p6.ProfileData.locker.winEffects,
            selectedBreakBedEffect = BedBreakEffectType.NONE,
            breakBedEffects = p6.ProfileData.locker.breakBedEffect,
            featuredBadges = { BadgeType.NONE },
            badges = {},
            bedSkin = p6.ProfileData.equipped.bedSkin,
            bedSkins = p6.ProfileData.locker.bedSkins,
            itemSkins = {},
            selectedItemSkins = {},
            limitedReward = {}
        };
        local v10, u11 = useState(LockerTab.TITLES);
        local v12, v13 = useState(nil);
        local v14 = LockerUtil.buildElementGrid(v10, v9, nil, true);
        local v15 = DeviceUtil.isSmallScreen() and 0.14 or 0.1;
        local v16 = 1 - v15;
        local v17 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local FrameProps = p6.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v17[i] = v;
            end;
        end;

        local v18 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v19 = #v18;

        local function _(p20) -- Line: 82
            -- upvalues: LockerTab (ref), LockerTabOrder (ref)
            return p20 ~= LockerTab.CONSUMABLES and {
                value = p20,
                text = p20,
                layoutOrder = LockerTabOrder[p20]
            } or nil;
        end;

        local v21 = 0;
        local v22 = {};
        local v23 = {
            Value = v10
        };

        for i, v in u2.values(LockerTab) do
            local _ = i - 1;
            local v24 = v ~= LockerTab.CONSUMABLES and {
                value = v,
                text = v,
                layoutOrder = LockerTabOrder[v]
            } or nil;

            if v24 ~= nil then
                v21 = v21 + 1;
                v22[v21] = v24;
            end;
        end;

        v23.Tabs = v22;

        function v23.OnChange(p25) -- Line: 104
            -- upvalues: u11 (copy)
            u11(p25.value);
        end;

        v23.FrameProps = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, v15, 0),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        v18[v19 + 1] = u3.createElement(TabsComponent, v23, { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }) });
        local v26;

        if #v14 == 0 then
            v26 = u3.createElement(PlayerProfileEmpty, {
                Size = UDim2.fromScale(1, v16),
                Text = "No " .. string.lower(v10) .. " owned."
            });
        else
            local v27 = {
                Size = UDim2.fromScale(0.95, v16) - UDim2.fromScale(0, 0.1),
                Tab = v10,
                ConsumableInventory = v8.inventory,
                MinSize = Vector2.new(0, 0),
                MaxSize = Vector2.new((1 / 0), (1 / 0)),
                Elements = v14,
                EquippedElement = v12,
                SetElement = v13,
                LayoutOrder = 2,
                ViewOnly = true,
                SearchBarHeight = DeviceUtil.isSmallScreen() and 20 or nil,
                SearchBarPadding = DeviceUtil.isSmallScreen() and 5 or nil
            };
            v26 = u3.createElement(LockerItemsGrid, v27);
        end;

        v18[v19 + 2] = v26;

        return u3.createElement("Frame", v17, v18);
    end)
};