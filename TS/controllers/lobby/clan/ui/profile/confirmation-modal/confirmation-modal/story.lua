-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ConfirmationModalApp = RuntimeLib.import(script, script.Parent, "confirmation-modal-base").ConfirmationModalApp;

return function(p2) -- Line: 8
    -- upvalues: CreateRoduxApp (copy), ConfirmationModalApp (copy), Theme (copy), u1 (copy), BedwarsImageId (copy)
    local u3 = CreateRoduxApp("ConfirmationModal", ConfirmationModalApp, {
        Title = "Rent Kit?",
        Body = "You don\'t have any kit rental passes for TRIXIE. You can receive rental passes by opening crates",
        PreviouslySelected = nil,
        PrimaryBtnProps = {
            Text = "USE RENTAL PASS",
            BackgroundColor3 = Theme.backgroundSuccess
        },
        PrimaryBtnChildren = { u1.createElement("UIListLayout", {
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0.05, 0)
            }), u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                SizeConstraint = "RelativeYY",
                Image = BedwarsImageId.KIT_RENTAL_PASS_ALL,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(1, 0.7),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.34, 0.5)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) },
        SecondaryBtnProps = {
            Text = "CANCEL"
        },

        OnPrimaryBtnClick = function() -- Line: 39, Name: OnPrimaryBtnClick
        end,

        OnSecondaryBtnClick = function() -- Line: 40, Name: OnSecondaryBtnClick
        end,

        AdditionalButtons = {
            {
                buttonProps = {
                    Text = "RENT",
                    LayoutOrder = -3
                },

                onClick = function() -- Line: 46, Name: onClick
                    return true;
                end,

                childElements = { u1.createElement("UIListLayout", {
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0.05, 0)
                    }), u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        SizeConstraint = "RelativeYY",
                        Image = BedwarsImageId.BED_COIN_ICON,
                        ImageColor3 = Color3.fromRGB(255, 255, 255),
                        Size = UDim2.fromScale(1, 0.7),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0.34, 0.5)
                    }, { u1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }) }
            }
        }
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 72
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;