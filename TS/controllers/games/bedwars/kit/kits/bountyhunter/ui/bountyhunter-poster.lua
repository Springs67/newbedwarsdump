-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AvatarUpper = RuntimeLib.import(script, script.Parent, "avatar-upper").AvatarUpper;
local u3 = u2.Component:extend("BountyHunterPoster");

function u3.init(p4) -- Line: 15
end;

function u3.render(p5) -- Line: 17
    -- upvalues: ColorUtil (copy), u2 (copy), SlideIn (copy), DeviceUtil (copy), Theme (copy), CornerFiller (copy), Empty (copy), AvatarUpper (copy)
    local bountyHunterTarget = p5.props.store.Kit.bountyHunterTarget;

    if bountyHunterTarget == nil then
        return nil;
    end;

    local function _(p6) -- Line: 24
        -- upvalues: bountyHunterTarget (copy)
        local Team = bountyHunterTarget.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        return p6.name == Team;
    end;

    local v7 = nil;

    for i, v in p5.props.store.Game.teams do
        local _ = i - 1;
        local Team = bountyHunterTarget.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if v.name == Team == true then
            v7 = v;
            break;
        end;
    end;

    if v7 ~= nil then
        v7 = v7.color;
    end;

    if v7 == nil then
        v7 = Color3.fromRGB(255, 255, 255);
    end;

    local v8 = ColorUtil.richTextColor(v7);

    return u2.createElement(SlideIn, {}, {
        BountyHunterPoster = u2.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 16, DeviceUtil.isSmallScreen() and 0.4 or 0.5, 0),
            Size = UDim2.fromScale(0.35, 0.35),
            BackgroundColor3 = Theme.backgroundSecondary
        }, {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.8432601880877743
            }),
            u2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(269, 319)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder"
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }),
            Header = u2.createElement("Frame", {
                ZIndex = 2,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.15, 0),
                BackgroundColor3 = Theme.backgroundPrimary
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), u2.createElement(CornerFiller, {
                    BottomLeft = true,
                    BottomRight = true
                }), u2.createElement("TextLabel", {
                    ZIndex = 3,
                    BackgroundTransparency = 1,
                    Font = "Roboto",
                    TextScaled = true,
                    RichText = true,
                    AutoLocalize = false,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(1, 0.6),
                    Text = "<b>Target:</b> <b><font face=\"RobotoMono\" color=\"" .. v8 .. "\">" .. bountyHunterTarget.DisplayName .. "</font></b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }) }),
            Background = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0.86, 0)
            }, {
                u2.createElement("UIListLayout", {
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0)
                }),
                Avatar = u2.createElement(AvatarUpper, {
                    LayoutOrder = 1,
                    store = p5.props.store,
                    player = bountyHunterTarget,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Size = UDim2.fromScale(0.9, 0.7),
                    BackgroundColor3 = Theme.backgroundTertiary
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) }),
                TextSection = u2.createElement("Frame", {
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Size = UDim2.fromScale(0.9, 0.2),
                    BackgroundColor3 = Theme.backgroundTertiary
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Font = "SourceSansSemibold",
                        Text = "Eliminate to receive rewards.",
                        RichText = true,
                        TextScaled = true,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.9, 0.9),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }) })
            })
        })
    });
end;

function u3.shouldUpdate(p9, p10) -- Line: 148
    return p9.props.store.Kit.bountyHunterTarget ~= p10.store.Kit.bountyHunterTarget;
end;

return {
    BountyHunterPosterWrapper = function(p11) -- Line: 152, Name: BountyHunterPosterWrapper
        -- upvalues: u2 (copy), u3 (ref)
        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(u3, {
                store = p11.store
            }) });
    end,

    BountyHunterPoster = u3
};