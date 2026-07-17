-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = u3.Component:extend("HotbarPartyButton");

function v4.init(p5) -- Line: 15
    -- upvalues: u3 (copy), u2 (copy)
    p5.bgRef = u3.createRef();
    p5.hoverMaid = u2.new();
end;

function v4.render(u6) -- Line: 19
    -- upvalues: u3 (copy), Theme (copy), TweenService (copy), SoundManager (copy), GameSound (copy), ColorUtil (copy), Empty (copy)
    return u3.createElement("ImageButton", {
        Size = UDim2.fromScale(0.3, 0.5),
        BackgroundColor3 = Theme.backgroundPrimary,
        BorderSizePixel = 0,
        LayoutOrder = u6.props.LayoutOrder,

        [u3.Event.MouseEnter] = function(p7) -- Line: 26
            -- upvalues: u6 (copy), TweenService (ref)
            u6.hoverMaid:DoCleaning();
            local u8 = TweenService:Create(u6.bgRef:getValue(), TweenInfo.new(0.12), {
                BackgroundTransparency = 0.9
            });
            u8:Play();
            u6.hoverMaid:GiveTask(function() -- Line: 32
                -- upvalues: u8 (copy)
                u8:Cancel();
            end);
        end,

        [u3.Event.MouseLeave] = function(p9) -- Line: 36
            -- upvalues: u6 (copy), TweenService (ref)
            u6.hoverMaid:DoCleaning();
            local u10 = TweenService:Create(u6.bgRef:getValue(), TweenInfo.new(0.12), {
                BackgroundTransparency = 1
            });
            u10:Play();
            u6.hoverMaid:GiveTask(function() -- Line: 42
                -- upvalues: u10 (copy)
                u10:Cancel();
            end);
        end,

        [u3.Event.MouseButton1Click] = function() -- Line: 46
            -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
            SoundManager:playSound(GameSound.UI_OPEN);
            u6.props.OnClick();
        end,

        AutoButtonColor = false
    }, {
        u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.469387755102041
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }),
        u3.createElement("Frame", {
            [u3.Ref] = u6.bgRef,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = 1,
            BorderSizePixel = 0
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }) }),
        u3.createElement(Empty, {
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
                Image = u6.props.Image
            }),
            u3.createElement("TextLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                Text = u6.props.Text,
                Size = UDim2.fromScale(3.1693877551020404, 0.55),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }),
            u3.createElement(Empty, {
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(0.2, 0)
            })
        })
    });
end;

function v4.willUnmount(p11) -- Line: 104
    p11.hoverMaid:DoCleaning();
end;

return {
    HotbarPartyButton = v4
};