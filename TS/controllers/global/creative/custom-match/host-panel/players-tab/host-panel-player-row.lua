-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local MenuComponent = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "menu", "menu-component").MenuComponent;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role");
local CustomMatchRole = v4.CustomMatchRole;
local CustomMatchRoleAttribute = v4.CustomMatchRoleAttribute;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;

return {
    HostPanelPlayerRow = v3.new(u2)(function(u5, p6) -- Line: 24
        -- upvalues: OfflinePlayerUtil (copy), CustomMatchRoleAttribute (copy), CustomMatchRole (copy), DeviceUtil (copy), KnitClient (copy), RuntimeLib (copy), Players (copy), SoundManager (copy), GameSound (copy), default (copy), BedwarsImageId (copy), Theme (copy), u2 (copy), ColorUtil (copy), Empty (copy), EntityUtil (copy), HostPanelTextBox (copy), DropdownComponent (copy), MenuComponent (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState("");
        local v9 = OfflinePlayerUtil.getPlayer(u5.OfflinePlayer);
        local customMatch = u5.store.Game.customMatch;

        if customMatch ~= nil then
            customMatch = customMatch.hostUserId;
        end;

        local v10 = customMatch == u5.OfflinePlayer.userId;
        local v11;

        if v9 then
            v11 = v9:GetAttribute(CustomMatchRoleAttribute) == CustomMatchRole.COHOST;
        else
            v11 = false;
        end;

        local v12, u13 = useState({
            map = {
                Red = {
                    text = "<font color=\"#E32743\">Red</font>",
                    value = "Red"
                },
                Blue = {
                    text = "<font color=\"#49B4F2\">Blue</font>",
                    value = "Blue"
                }
            },
            dropDownItems = { {
                    text = "<font color=\"#E32743\">Red</font>",
                    value = "Red"
                }, {
                    text = "<font color=\"#49B4F2\">Blue</font>",
                    value = "Blue"
                } }
        });
        local v14 = {};

        for i, v in u5 do
            v14[i] = v;
        end;

        local Team = v14.Team;
        local v15 = Team == nil and "Spectator" or Team;
        useEffect(function() -- Line: 64
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u13 (copy), u5 (copy), u8 (copy), RuntimeLib (ref), Players (ref)
            local u16 = true;

            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local v17 = KnitClient.Controllers.TeamController:getTeamDropdown(true);

            if v17 and v17.dropDownItems then
                u13({
                    map = v17.map,
                    dropDownItems = v17.dropDownItems
                });
            end;

            local v18 = KnitClient.Controllers.CustomMatchController.playerAvatarImages[u5.OfflinePlayer.userId];

            if v18 == "" or not v18 then
                RuntimeLib.Promise.defer(function() -- Line: 82
                    -- upvalues: Players (ref), u5 (ref), u16 (ref), u8 (ref), KnitClient (ref)
                    local v19, v20 = Players:GetUserThumbnailAsync(u5.OfflinePlayer.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);

                    if v20 and u16 then
                        u8(v19);
                        local playerAvatarImages = KnitClient.Controllers.CustomMatchController.playerAvatarImages;
                        playerAvatarImages[u5.OfflinePlayer.userId] = v19;

                        return playerAvatarImages;
                    end;
                end);
            else
                u8(v18);
            end;

            return function() -- Line: 93
                -- upvalues: u16 (ref)
                u16 = false;
            end;
        end, {});

        local function _(p21, p22) -- Line: 97
            -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local v23 = KnitClient.Controllers.TeamController:getTeamById(p22);

            if v23 then
                KnitClient.Controllers.CustomMatchController:setPlayerTeam(p21, v23.name);
            end;
        end;

        local function _(p24, p25) -- Line: 104
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.CustomMatchController:setPlayerMaxHealth(p24, p25);
        end;

        local function v27() -- Line: 111
            -- upvalues: SoundManager (ref), GameSound (ref), OfflinePlayerUtil (ref), u5 (copy), default (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local v26 = OfflinePlayerUtil.getPlayer(u5.OfflinePlayer);

            if v26 then
                default.Client:Get("BanPlayer"):CallServerAsync(v26);
            end;
        end;

        local function v28() -- Line: 118
            -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u5 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            KnitClient.Controllers.CustomMatchController:toggleCohost(u5.OfflinePlayer);
        end;

        local v29 = {
            {
                text = "Blacklist",

                callback = function() -- Line: 107
                    -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u5 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);
                    KnitClient.Controllers.CustomMatchController:blacklistPlayer(u5.OfflinePlayer);
                end
            }
        };
        local customMatch2 = u5.store.Game.customMatch;

        if customMatch2 ~= nil then
            customMatch2 = customMatch2.hostUserId;
        end;

        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.UserId;
        end;

        if customMatch2 == LocalPlayer then
            table.insert(v29, {
                text = (v11 and "Remove" or "Give") .. " Cohost",
                callback = v28
            });
        end;

        if u5.HasGameBanPermission then
            table.insert(v29, {
                text = "Game Ban",
                callback = v27
            });
        end;

        local v30 = "";

        if v10 then
            v30 = BedwarsImageId.CROWN_SOLID;
        elseif v11 then
            v30 = BedwarsImageId.SAFETY_HELMET_SOLID;
        end;

        local v31 = {
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Theme.backgroundPrimary,
            LayoutOrder = u5.Index
        };
        local v32 = {};
        local v33 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v34 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }) };
        local v35 = #v34;
        local v36 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.4, 1)
        };
        local v37 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u2.createElement("ImageLabel", {
                LayoutOrder = 1,
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = v7
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(100, 0)
                }) }) };
        local v38 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.76, 1)
        };
        local v39 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v40 = #v39;
        local v41 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.55)
        };
        local v42 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }) };
        local v43 = #v42;
        local v44;

        if v30 == "" then
            v44 = false;
        else
            v44 = u2.createFragment({
                RankIcon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = v30
                })
            });
        end;

        if v44 then
            v42[v43 + 1] = v44;
        end;

        v42[#v42 + 1] = u2.createElement("TextLabel", {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AutoLocalize = false,
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(v30 == "" and 1 or 0.8, 1),
            Text = "<b>" .. u5.OfflinePlayer.displayName .. "</b>",
            TextColor3 = ColorUtil.WHITE
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v39[v40 + 1] = u2.createElement(Empty, v41, v42);
        v39[v40 + 2] = u2.createElement("TextLabel", {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AutoLocalize = false,
            Size = UDim2.fromScale(1, 0.4),
            Text = "@" .. u5.OfflinePlayer.name,
            TextColor3 = ColorUtil.WHITE
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        v37[#v37 + 1] = u2.createElement(Empty, v38, v39);
        v34[v35 + 1] = u2.createElement(Empty, v36, v37);
        local v45 = {
            LayoutOrder = 2,
            Size = UDim2.new(0.6, -12, 1, 0)
        };
        local v46 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }) };
        local v47 = {
            Size = UDim2.fromScale(0.25, 1)
        };
        local v48;

        if DeviceUtil.isHoarceKat() then
            v48 = "100";
        else
            local v49 = EntityUtil:getEntity(OfflinePlayerUtil.getPlayer(u5.OfflinePlayer));

            if v49 ~= nil then
                v49 = v49:getMaxHealth();
            end;

            local v50 = tostring(v49);
            v48 = v50 == nil and "nil" or v50;
        end;

        v47.Text = v48;
        v47.NumbersOnly = true;

        function v47.OnFocusLost(p51) -- Line: 316
            -- upvalues: u5 (copy), KnitClient (ref)
            local v52 = tonumber(p51);

            if v52 ~= 0 and (v52 == v52 and v52) then
                KnitClient.Controllers.CustomMatchController:setPlayerMaxHealth(u5.OfflinePlayer, v52);
            end;
        end;

        v47.LayoutOrder = 1;
        v46.Health = u2.createElement(HostPanelTextBox, v47);

        if v12 then
            local v53 = {
                Size = UDim2.fromScale(0.25, 1),
                DefaultItem = v12.map[v15]
            };
            local v54 = v12.map[v15];

            if v54 ~= nil then
                v54 = v54.text;
            end;

            v53.PlaceholderText = v54 == nil and "" or v54;
            v53.Items = v12.dropDownItems;

            function v53.OnItemSelected(p55) -- Line: 340
                -- upvalues: u5 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref)
                local OfflinePlayer = u5.OfflinePlayer;
                SoundManager:playSound(GameSound.UI_CLICK);
                local v56 = KnitClient.Controllers.TeamController:getTeamById(p55);

                if v56 then
                    KnitClient.Controllers.CustomMatchController:setPlayerTeam(OfflinePlayer, v56.name);
                end;
            end;

            v53.LayoutOrder = 2;
            v12 = u2.createElement(DropdownComponent, v53);
        end;

        v46[#v46 + 1] = v12;
        v46[#v46 + 1] = u2.createElement(MenuComponent, {
            ButtonText = "Actions",
            LayoutOrder = 3,
            Items = v29,
            Size = UDim2.new(0.25, 0, 1, 0)
        });
        v34[v35 + 2] = u2.createElement(Empty, v45, v46);
        v32[#v32 + 1] = u2.createElement(Empty, v33, v34);

        return u2.createFragment({
            HostPanelPlayerRow = u2.createElement("Frame", v31, v32)
        });
    end)
};