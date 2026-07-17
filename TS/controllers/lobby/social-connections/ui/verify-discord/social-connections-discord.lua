-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SocialConnectionsConnectInfoCard = RuntimeLib.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;
local u5 = default.Client:GetNamespace("SocialConnections");

return {
    SocialConnectionsDiscord = v4.new(u3)(function(u6, p7) -- Line: 20
        -- upvalues: u2 (copy), u5 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u3 (copy), SocialConnectionsConnectInfoCard (copy), ImageId (copy), Theme (copy), CornerFiller (copy), ColorUtil (copy), Empty (copy), ButtonComponent (copy), RuntimeLib (copy), Workspace (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(false);
        local v10, u11 = useState("");
        local validated = u6.store.SocialConnections.connections.discord.validated;
        local u12 = u2.new();
        useEffect(function() -- Line: 27
            -- upvalues: u5 (ref), u12 (copy), u9 (copy), u6 (copy), u11 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref)
            u5:WaitFor("VerificationStatusResolved"):andThen(function(p13) -- Line: 29
                -- upvalues: u12 (ref), u9 (ref), u6 (ref), u11 (ref), SoundManager (ref), GameSound (ref), KnitClient (ref)
                u12:GiveTask(p13:Connect(function(p14, p15, p16, p17) -- Line: 30
                    -- upvalues: u9 (ref), u6 (ref), u11 (ref), SoundManager (ref), GameSound (ref), KnitClient (ref)
                    u9(false);

                    if not p15 and (p15 == u6.store.SocialConnections.connections.discord.validated and not p17) then
                        u11("Cannot verify, please try again.");
                        SoundManager:playSound(GameSound.INFO_NOTIFICATION);
                    end;

                    if p14 ~= u6.store.SocialConnections.connections.discord.verificationCode then
                        KnitClient.Controllers.SocialConnectionsController:updateDiscordStore({
                            verificationCode = p14,
                            validated = p15,
                            legacyDiscordVerification = p16
                        });
                        u11("");

                        return nil;
                    end;

                    if p15 ~= u6.store.SocialConnections.connections.discord.validated then
                        KnitClient.Controllers.SocialConnectionsController:updateDiscordStore({
                            verificationCode = p14,
                            validated = p15,
                            legacyDiscordVerification = p16
                        });
                        SoundManager:playSound(GameSound.INFO_NOTIFICATION);
                        u11("");

                        return nil;
                    end;
                end));
            end);
            u5:Get("RegisterUser"):SendToServer();

            return function() -- Line: 60
                -- upvalues: u12 (ref)
                u12:DoCleaning();
            end;
        end, {});
        local v18 = {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            LayoutOrder = u6.LayoutOrder
        };
        local v19 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }), u3.createElement(SocialConnectionsConnectInfoCard, {
                Text = "<b>Verify</b> through the Community Server link on the game page",
                CornerFill = true,
                LayoutOrder = 1,
                ImageId = ImageId.SATELITE
            }) };
        local _ = #v19;
        local v20 = {
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 92),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v21 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u3.createElement(CornerFiller, {
                TopLeft = true,
                TopRight = true
            }) };
        local v22 = #v21;
        local v23 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v24 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }) };
        local v25 = #v24;
        local v26;

        if validated then
            v26 = u3.createFragment({
                DiscordConnectConnected = u3.createElement("TextLabel", {
                    Text = "<b>Your account has been verified!</b>",
                    RichText = true,
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Roboto
                })
            });
        else
            local v27 = {
                AutomaticSize = Enum.AutomaticSize.XY
            };
            local v28 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u3.createElement("TextLabel", {
                    Text = "Verification Code: ",
                    AutoLocalize = false,
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.new(0, 0, 0, 14),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold)
                }) };
            local _ = #v28;
            local v29 = {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.new(0, 0, 0, 14)
            };
            local verificationCode = u6.store.SocialConnections.connections.discord.verificationCode;
            v29.Text = verificationCode == nil and "Generating Code" or verificationCode;
            v29.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold);
            v29.TextEditable = false;
            v29.ClearTextOnFocus = false;
            v29.AutoLocalize = false;
            v29.TextColor3 = Theme.textPrimary;
            v29.TextXAlignment = Enum.TextXAlignment.Left;
            v29.TextSize = 14;
            v29.BackgroundTransparency = 1;
            v29.LayoutOrder = 2;
            v28.DiscordVerficationCode = u3.createElement("TextBox", v29);
            v26 = u3.createElement(Empty, v27, v28);
        end;

        local v30 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(0.75, 1)
        };
        local v31 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            }),
            [#v31 + 1] = v26
        };
        local v32 = #v31;
        local v33 = not validated and u3.createFragment({
            DiscordConnectInstructions = u3.createElement("Frame", {
                AutomaticSize = "Y",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 0)
                }),
                u3.createElement("TextLabel", {
                    Text = "1. Open the BedWars game page on Roblox",
                    RichText = true,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 12),
                    TextColor3 = Theme.textSecondary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Roboto
                }),
                u3.createElement("TextLabel", {
                    Text = "2. Join from the <b><font color=\"#FFFFFF\">Community Server</font></b> Social Link",
                    RichText = true,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 12),
                    TextColor3 = Theme.textSecondary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Roboto
                }),
                u3.createElement("TextLabel", {
                    Text = "3. Enter your code in verification",
                    RichText = true,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 12),
                    TextColor3 = Theme.textSecondary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Roboto
                }),
                u3.createElement("TextLabel", {
                    Text = "4. Return here and click <b><font color=\"#FFFFFF\">Verify</font></b>",
                    RichText = true,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 12),
                    TextColor3 = Theme.textSecondary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Roboto
                })
            })
        });

        if v33 then
            v31[v32 + 1] = v33;
        end;

        v24.DiscordConnectTextInfo = u3.createElement("Frame", v30, v31);
        local v34;

        if validated then
            v34 = u3.createElement(ButtonComponent, {
                Text = "Unlink",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.fromScale(0.25, 0.5),
                Loading = v8,
                OnClick = RuntimeLib.async(function() -- Line: 260
                    -- upvalues: u9 (copy), RuntimeLib (ref), u5 (ref), Workspace (ref), u11 (copy)
                    u9(true);
                    local v35 = RuntimeLib.await(u5:Get("UnverifyUser"):CallServerAsync());
                    local v36;

                    if v35 then
                        v36 = v35.timeout;
                    else
                        v36 = v35;
                    end;

                    if v36 ~= 0 and (v36 == v36 and v36) then
                        local v37 = v35.timeout - Workspace:GetServerTimeNow();
                        local v38 = math.round(v37);
                        u11("Please wait " .. tostring(v38) .. " second" .. (v38 == 1 and "" or "s") .. " before trying again.");
                        u9(false);
                    end;
                end)
            });
        else
            v34 = validated;
        end;

        if v34 then
            v24[v25 + 1] = v34;
        end;

        local v39 = #v24;
        local v44 = not validated and u3.createElement(ButtonComponent, {
            Text = "Verify",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromScale(0.25, 0.5),
            Loading = v8,
            OnClick = RuntimeLib.async(function() -- Line: 281
                -- upvalues: u9 (copy), RuntimeLib (ref), u5 (ref), u11 (copy), Workspace (ref)
                u9(true);
                local v40 = RuntimeLib.await(u5:Get("VerifyUser"):CallServerAsync());
                local v41;

                if v40 then
                    v41 = v40.timeout;
                else
                    v41 = v40;
                end;

                if v41 ~= 0 and (v41 == v41 and v41) then
                    local v42 = v40.timeout - Workspace:GetServerTimeNow();
                    local v43 = math.round(v42);
                    u11("Please wait " .. tostring(v43) .. " seconds before trying again.");
                    u9(false);
                end;
            end)
        });

        if v44 then
            v24[v39 + 1] = v44;
        end;

        v21[v22 + 1] = u3.createElement("Frame", v23, v24);
        v21[v22 + 2] = u3.createElement("TextLabel", {
            RichText = true,
            TextSize = 12,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 12),
            Position = UDim2.new(0, 0, 1, -12),
            Text = v10,
            TextColor3 = Theme.backgroundError,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.Roboto
        });
        v19.DiscordConnectionContent = u3.createElement("Frame", v20, v21);

        return u3.createFragment({
            DiscordConnectionContainer = u3.createElement("Frame", v18, v19)
        });
    end)
};