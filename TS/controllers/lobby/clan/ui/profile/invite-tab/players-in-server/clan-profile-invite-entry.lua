-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local PlayerRender = v1.PlayerRender;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local LobbyClientConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientConfig;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfileInviteEntry = v4.new(u3)(function(u5, p6) -- Line: 18
        -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), ClientStore (copy), u3 (copy), Empty (copy), Theme (copy), SoundManager (copy), LobbyClientConfig (copy), TweenService (copy), PlayerRender (copy), ColorUtil (copy), ImageId (copy)
        local u7, u8 = p6.useState(false);
        local u9 = u2.new();

        local function _() -- Line: 22
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u5 (copy), ClientStore (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            KnitClient.Controllers.ClanController:invitePlayerToClan(u5.Player, ClientStore:getState().Clans.myClanId);
        end;

        local createElement = u3.createElement;
        local v10 = {
            Size = UDim2.new(1, 0, 0, 40)
        };
        local v11 = {};
        local createElement2 = u3.createElement;
        local v16 = {
            Size = UDim2.new(0.98, 0, 1, 0),
            BackgroundColor3 = Theme.backgroundPrimary,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ZIndex = 10,
            ImageTransparency = 1,
            AutoButtonColor = false,

            [u3.Event.MouseButton1Click] = function() -- Line: 39
                -- upvalues: SoundManager (ref), LobbyClientConfig (ref), u8 (copy), DeviceUtil (ref), KnitClient (ref), u5 (copy), ClientStore (ref)
                SoundManager:playSound(LobbyClientConfig.sounds.UI_CLICK);
                u8(true);

                if DeviceUtil.isHoarceKat() then
                    return;
                end;

                KnitClient.Controllers.ClanController:invitePlayerToClan(u5.Player, ClientStore:getState().Clans.myClanId);
            end,

            [u3.Event.MouseEnter] = function(p12) -- Line: 44
                -- upvalues: u7 (copy), u9 (copy), TweenService (ref)
                if u7 then
                    return nil;
                end;

                u9:DoCleaning();
                local u13 = TweenService:Create(p12, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.3
                });
                u13:Play();
                u9:GiveTask(function() -- Line: 53
                    -- upvalues: u13 (copy)
                    u13:Cancel();
                end);
            end,

            [u3.Event.MouseLeave] = function(p14) -- Line: 57
                -- upvalues: u7 (copy), u9 (copy), TweenService (ref)
                if u7 then
                    return nil;
                end;

                u9:DoCleaning();
                local u15 = TweenService:Create(p14, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0
                });
                u15:Play();
                u9:GiveTask(function() -- Line: 66
                    -- upvalues: u15 (copy)
                    u15:Cancel();
                end);
            end
        };
        local v17 = {};
        local v18 = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });
        local v19 = u3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        });
        local v20 = u3.createElement(
            "UIListLayout",
            {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder"
            }
        );
        local v21 = u3.createElement(Empty, {
            Size = UDim2.fromScale(0.7, 1)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement(PlayerRender, {
                FallbackTransparency = 1,
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 21,
                LayoutOrder = 1,
                PlayerUserId = u5.Player.userId,
                Size = UDim2.fromScale(1, 0.7)
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }), u3.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) }), u3.createElement("TextLabel", {
                AutomaticSize = "X",
                SizeConstraint = "RelativeXX",
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                TextTransparency = 0,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                ZIndex = 21,
                LayoutOrder = 2,
                AutoLocalize = false,
                Size = UDim2.fromScale(0, 1),
                Text = "<b>" .. u5.Player.displayName .. "</b>",
                TextColor3 = ColorUtil.hexColor(16777215)
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) }) });
        local v22;

        if u7 then
            v22 = u3.createElement("TextLabel", {
                Text = "(Invited)",
                TextXAlignment = "Right",
                BackgroundTransparency = 1,
                TextTransparency = 0,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                ZIndex = 21,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.3, 1),
                TextColor3 = ColorUtil.hexColor(16777215)
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
        else
            v22 = u3.createElement(Empty, {
                Size = UDim2.fromScale(0.3, 1)
            }, { u3.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 21,
                    LayoutOrder = 3,
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Image = ImageId.PLUS,
                    Size = UDim2.fromScale(1, 0.5)
                }) });
        end;

        v17[1], v17[2], v17[3], v17[4], v17[5] = v18, v19, v20, v21, v22;
        v11[1] = createElement2("ImageButton", v16, v17);

        return createElement(Empty, v10, v11);
    end)
};