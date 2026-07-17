-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitShopEquipButton = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: u2 (copy), Workspace (copy), Countdown (copy), Theme (copy), Button (copy), BedwarsImageId (copy), Empty (copy)
        local _ = p5.useState;

        local function v6() -- Line: 14
            -- upvalues: u4 (copy)
            if not u4.Equipped then
                u4.EquipKit();
            end;
        end;

        local v7 = {
            Size = u4.Size or UDim2.fromScale(1, 1)
        };
        local v8 = {};
        local v9 = #v8;
        local ActiveRental = u4.ActiveRental;

        if ActiveRental ~= nil then
            ActiveRental = ActiveRental.endTime;
        end;

        local v10 = ActiveRental ~= nil;

        if v10 then
            local v11 = { u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center"
                    }
                ) };
            local v12 = {
                EndTime = u4.ActiveRental.endTime
            };
            local v13 = Workspace:GetServerTimeNow();
            local ActiveRental2 = u4.ActiveRental;

            if ActiveRental2 ~= nil then
                ActiveRental2 = ActiveRental2.endTime;
            end;

            v12.PreText = " (" .. (ActiveRental2 < v13 and "Expired" or "");
            v12.PostText = ")";
            v12.TextLabel = {
                TextTransparency = 0.3,
                Size = UDim2.fromScale(0.5, 0.5)
            };
            v11[#v11 + 1] = u2.createElement(Countdown, v12);
            v10 = u2.createFragment(v11);
        end;

        local v14 = {
            Selectable = true,
            LayoutOrder = 3,
            Text = "<b>" .. (u4.Equipped and "EQUIPPED" or "EQUIP") .. "</b>",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundSuccess,
            OnClick = v6,
            TextLabel = {
                Size = UDim2.fromScale(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.X
            }
        };
        local v15 = {};
        local v16 = #v15;

        if v10 then
            v15[v16 + 1] = v10;
        end;

        v8[v9 + 1] = u2.createElement(Button, v14, v15);
        local v17 = u4.ActiveRental and u2.createElement("Frame", {
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

        if v17 then
            v8[v9 + 2] = v17;
        end;

        return u2.createElement(Empty, v7, v8);
    end)
};