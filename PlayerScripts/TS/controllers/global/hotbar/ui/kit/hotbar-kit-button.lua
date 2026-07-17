-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = u3.Component:extend("HotbarKitButton");

function v4.init(p5) -- Line: 17
    -- upvalues: u3 (copy), u2 (copy)
    p5.bgRef = u3.createRef();
    p5.hoverMaid = u2.new();
end;

function v4.openKitShop(p6) -- Line: 21
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), ClientStore (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
        SelectedKit = ClientStore:getState().Bedwars.kit
    });
end;

function v4.render(u7) -- Line: 26
    -- upvalues: u3 (copy), Empty (copy), Theme (copy), TweenService (copy), ColorUtil (copy), ImageId (copy)
    return u3.createElement(Empty, {
        Size = UDim2.fromScale(0.3, 0.5),
        LayoutOrder = u7.props.LayoutOrder
    }, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.061224489795918
        }), u3.createElement("ImageButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0,

            [u3.Event.MouseEnter] = function(p8) -- Line: 39
                -- upvalues: u7 (copy), TweenService (ref)
                u7.hoverMaid:DoCleaning();
                local u9 = TweenService:Create(u7.bgRef:getValue(), TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.9
                });
                u9:Play();
                u7.hoverMaid:GiveTask(function() -- Line: 45
                    -- upvalues: u9 (copy)
                    u9:Cancel();
                end);
            end,

            [u3.Event.MouseLeave] = function(p10) -- Line: 49
                -- upvalues: u7 (copy), TweenService (ref)
                u7.hoverMaid:DoCleaning();
                local u11 = TweenService:Create(u7.bgRef:getValue(), TweenInfo.new(0.12), {
                    BackgroundTransparency = 1
                });
                u11:Play();
                u7.hoverMaid:GiveTask(function() -- Line: 55
                    -- upvalues: u11 (copy)
                    u11:Cancel();
                end);
            end,

            [u3.Event.MouseButton1Click] = function() -- Line: 59
                -- upvalues: u7 (copy)
                u7:openKitShop();
            end,

            AutoButtonColor = false
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u3.createElement("Frame", {
                [u3.Ref] = u7.bgRef,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE,
                BackgroundTransparency = 1,
                BorderSizePixel = 0
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }) }), u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                u3.createElement(Empty, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.5, 0)
                }),
                u3.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.6, 0.6),
                    Image = ImageId.SHIELD
                }),
                u3.createElement("TextLabel", {
                    Text = "Kit",
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Size = UDim2.fromScale(1.611224489795918, 0.55),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }),
                u3.createElement(Empty, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.2, 0)
                })
            }) }) });
end;

return {
    HotbarKitButton = v4
};