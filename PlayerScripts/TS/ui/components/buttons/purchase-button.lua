-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent, "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    PurchaseButton = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: Theme (copy), u2 (copy), SoundManager (copy), GameSound (copy), PlaceUtil (copy), Flamework (copy), BedwarsAppIds (copy), UILayers (copy), ColorUtil (copy), BedwarsImageId (copy), Empty (copy)
        local _ = p5.useEffect;
        local v6, u7 = p5.useState(false);
        local v8 = {};

        for i, v in u4 do
            v8[i] = v;
        end;

        v8.OnClick = nil;
        v8.Title = nil;
        v8.Cost = nil;
        local v11 = {
            ImageTransparency = 1,
            BackgroundColor3 = Theme.mcGreen,
            BorderSizePixel = 0,

            [u2.Event.MouseEnter] = function() -- Line: 32
                -- upvalues: SoundManager (ref), GameSound (ref), u7 (copy)
                SoundManager:playSound(GameSound.UI_HOVER);
                u7(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 36
                -- upvalues: u7 (copy)
                u7(false);
            end,

            [u2.Event.Activated] = function() -- Line: 39
                -- upvalues: u4 (copy), PlaceUtil (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), UILayers (ref)
                if not u4.EnablePurchaseNotInLobby and PlaceUtil.isLobbyServer() then
                    if u4.OnClick then
                        u4.OnClick();
                    end;

                    return nil;
                end;

                local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v10 = {
                    Title = "Purchase Error"
                };
                local Title = u4.Title;

                if Title ~= nil then
                    Title = string.lower(Title);
                end;

                v10.Body = "Please go to the lobby in order to " .. tostring(Title) .. ".";
                v10.PrimaryBtnProps = {
                    Text = "OK",
                    BackgroundColor3 = Theme.mcGreen
                };

                function v10.OnPrimaryBtnClick() -- Line: 61
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                function v10.OnSecondaryBtnClick() -- Line: 64
                end;

                v9:openApp(CONFIRMATION_MODAL, v10);

                return nil;
            end
        };

        for i, v in v8 do
            v11[i] = v;
        end;

        local v12 = {};
        local v13 = #v12;

        if v6 then
            v6 = u2.createElement("UIStroke", {
                Transparency = 0.35,
                Thickness = 2,
                Color = ColorUtil.brighten(u4.BackgroundColor3 or Theme.mcGreen, 0.3)
            }, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) });
        end;

        if v6 then
            v12[v13 + 1] = v6;
        end;

        local v14 = #v12;
        v12[v14 + 1] = u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u2.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
            }) });
        v12[v14 + 2] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });
        local v15 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("UIPadding", {
                PaddingRight = UDim.new(0.075, 0),
                PaddingLeft = UDim.new(0.075, 0),
                PaddingBottom = UDim.new(0.075, 0),
                PaddingTop = UDim.new(0.075, 0)
            }) };
        local v17 = #v16;
        local v18;

        if u4.Title == nil then
            v18 = false;
        else
            v18 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextTransparency = 0.4,
                Size = UDim2.fromScale(0.9, 0.375),
                Text = u4.Title,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;

        if v18 then
            v16[v17 + 1] = v18;
        end;

        local v19 = u4.Cost ~= nil;

        if v19 then
            local Cost = u4.Cost;

            local function v29(p20, p21) -- Line: 143
                -- upvalues: BedwarsImageId (ref), u4 (copy), u2 (ref), Empty (ref), ColorUtil (ref)
                local v22;

                if p20 == nil then
                    v22 = p20;
                else
                    v22 = p20.Image;
                end;

                if v22 == nil then
                    local v23;

                    if p20 == nil then
                        v23 = p20;
                    else
                        v23 = p20.bedcoin;
                    end;

                    if v23 == 0 or (v23 ~= v23 or not v23) then
                        v22 = nil;
                    else
                        v22 = BedwarsImageId.BED_COIN_ICON;
                    end;

                    if v22 == nil then
                        local v24;

                        if p20 == nil then
                            v24 = p20;
                        else
                            v24 = p20.robux;
                        end;

                        if v24 == 0 or (v24 ~= v24 or not v24) then
                            v22 = nil;
                        else
                            v22 = BedwarsImageId.ROBUX;
                        end;
                    end;
                end;

                local custom = p20.custom;

                if custom == nil then
                    custom = p20.bedcoin;

                    if custom == nil then
                        custom = p20.robux;
                    end;
                end;

                local v25 = #u4.Cost;

                if v22 == "" or (not v22 or (custom == 0 or (custom ~= custom or not custom))) then
                    return nil;
                end;

                local v26 = { u2.createElement(Empty, {
                        Size = UDim2.fromScale(1 / v25, 1)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.03, 0)
                        }), u2.createElement("ImageLabel", {
                            LayoutOrder = 0,
                            SizeConstraint = "RelativeYY",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            Image = v22
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) }), u2.createElement("TextLabel", {
                            AutomaticSize = "X",
                            BackgroundTransparency = 1,
                            TextScaled = true,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(0, 1),
                            Text = tostring(custom),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Center
                        }, { u2.createElement("UIStroke", {
                                Thickness = 1,
                                Transparency = 0.7,
                                Color = ColorUtil.BLACK
                            }) }) }) };
                local v27 = #v26;
                local v28;

                if p21 < v25 - 1 then
                    v28 = u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "or",
                        Size = UDim2.fromScale(0.1, 1),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UIStroke", {
                            Thickness = 1,
                            Transparency = 0.7,
                            Color = ColorUtil.BLACK
                        }) });
                else
                    v28 = false;
                end;

                if v28 then
                    v26[v27 + 1] = v28;
                end;

                return u2.createFragment(v26);
            end;

            local v30 = 0;
            v19 = {};

            for i, v in Cost do
                local v31 = v29(v, i - 1, Cost);

                if v31 ~= nil then
                    v30 = v30 + 1;
                    v19[v30] = v31;
                end;
            end;
        end;

        local v32 = {
            Size = UDim2.fromScale(1, 0.6)
        };
        local v33 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }) };
        local v34 = #v33;

        if v19 then
            for i, v in v19 do
                v33[v34 + i] = v;
            end;
        end;

        v16[#v16 + 1] = u2.createElement(Empty, v32, v33);
        v12[v14 + 3] = u2.createElement(Empty, v15, v16);

        return u2.createElement("ImageButton", v11, v12);
    end)
};