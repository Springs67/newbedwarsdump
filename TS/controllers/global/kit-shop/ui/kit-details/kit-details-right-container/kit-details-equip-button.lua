-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitDetailsEquipButton = v3.new(u2)(function(u4, p5) -- Line: 18
        -- upvalues: u2 (copy), DeviceUtil (copy), UIUtil (copy), ColorUtil (copy), Theme (copy), Workspace (copy), Countdown (copy), BedwarsKit (copy), ClientStore (copy), default (copy), SoundManager (copy), GameSound (copy), BedwarsImageId (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local v7, u8 = useState(false);
        local v9 = {};

        for i, v in u4 do
            v9[i] = v;
        end;

        v9.SelectedKit = nil;
        v9.Equipped = nil;
        v9.ActiveRental = nil;
        useEffect(function() -- Line: 31
            -- upvalues: DeviceUtil (ref), u6 (copy), UIUtil (ref)
            if DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u6:getValue()));
            end;
        end, {});
        local v10 = {
            BackgroundColor3 = ColorUtil.WHITE
        };

        for i, v in v9 do
            v10[i] = v;
        end;

        local v11 = { u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 206, 92)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 166, 76)) })
            }) };
        local v12 = #v11;

        if v7 then
            local createElement = u2.createElement;
            local v13 = {
                Transparency = 0.35,
                Thickness = 2
            };
            local v14;

            if u4.Equipped then
                v14 = Theme.mcGreen;
            else
                v14 = ColorUtil.brighten(Theme.mcGreen, 0.2);
            end;

            v13.Color = v14;
            v7 = createElement("UIStroke", v13, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) });
        end;

        if v7 then
            v11[v12 + 1] = v7;
        end;

        local v15 = #v11;
        local ActiveRental = u4.ActiveRental;

        if ActiveRental ~= nil then
            ActiveRental = ActiveRental.endTime;
        end;

        local v16 = ActiveRental ~= nil;

        if v16 then
            local v17 = {
                BackgroundTransparency = 0.5,
                ZIndex = 10,
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = ColorUtil.BLACK
            };
            local v18 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) };
            local v19 = {
                EndTime = u4.ActiveRental.endTime
            };
            local v20 = Workspace:GetServerTimeNow();
            local ActiveRental2 = u4.ActiveRental;

            if ActiveRental2 ~= nil then
                ActiveRental2 = ActiveRental2.endTime;
            end;

            v19.PreText = " (" .. (ActiveRental2 < v20 and "Expired" or "");
            v19.PostText = ")";
            v19.TextLabel = {
                TextTransparency = 0.3,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1)
            };
            v18[#v18 + 1] = u2.createElement(Countdown, v19);
            v16 = u2.createElement("Frame", v17, v18);
        end;

        local v21 = {
            Size = UDim2.fromScale(0.8, 0.7),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            TextScaled = true,
            Text = u4.Equipped and "EQUIPPED" or "EQUIP KIT",
            TextTransparency = u4.Equipped and 0.4 or 0
        };
        local v22;

        if u4.Equipped then
            v22 = ColorUtil.BLACK;
        else
            v22 = ColorUtil.WHITE;
        end;

        v21.TextColor3 = v22;
        v21.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v21.TextXAlignment = Enum.TextXAlignment.Center;
        v21.TextYAlignment = Enum.TextYAlignment.Center;

        v21[u2.Event.Activated] = function() -- Line: 114
            -- upvalues: u4 (copy), BedwarsKit (ref), DeviceUtil (ref), ClientStore (ref), default (ref), SoundManager (ref), GameSound (ref)
            local u23;

            if u4.Equipped then
                u23 = BedwarsKit.NONE;
            else
                u23 = u4.SelectedKit;
            end;

            if DeviceUtil.isHoarceKat() then
                ClientStore:dispatch({
                    type = "SetBedwarsKit",
                    kit = u23
                });

                return nil;
            end;

            default.Client:Get("BedwarsActivateKit"):CallServerAsync({
                kit = u23
            }):andThen(function(p24) -- Line: 126
                -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), u23 (copy)
                if p24 then
                    SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
                    ClientStore:dispatch({
                        type = "SetBedwarsKit",
                        kit = u23
                    });
                end;
            end);
        end;

        v21[u2.Event.MouseEnter] = function() -- Line: 137
            -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy)
            SoundManager:playSound(GameSound.UI_HOVER);
            u8(true);
        end;

        v21[u2.Event.MouseLeave] = function() -- Line: 141
            -- upvalues: u8 (copy)
            u8(false);
        end;

        v21[u2.Ref] = u6;
        local v25 = {};
        local v26 = #v25;

        if v16 then
            v25[v26 + 1] = v16;
        end;

        v11[v15 + 1] = u2.createElement("TextButton", v21, v25);
        local v27 = u4.ActiveRental and u2.createElement("Frame", {
            Size = UDim2.fromScale(0.6, 0.6),
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }),
            u2.createElement("UIGradient", {
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 83, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(114, 122, 255)) })
            }),
            u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.7),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = BedwarsImageId.HUD_TIMER_ICON
            })
        });

        if v27 then
            v11[v15 + 2] = v27;
        end;

        v11[#v11 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });

        return u2.createElement("Frame", v10, v11);
    end)
};