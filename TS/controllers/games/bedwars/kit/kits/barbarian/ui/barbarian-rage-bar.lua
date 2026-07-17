-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local BarbarianKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local u4 = u2.Component:extend("BarbarianRageBar");

function u4.init(p5) -- Line: 16
    -- upvalues: u2 (copy)
    p5.progressRef = u2.createRef();
end;

function u4.updateFill(p6) -- Line: 19
    -- upvalues: BarbarianKit (copy), Players (copy), TweenService (copy)
    local v7 = BarbarianKit.getSwordProgress(Players.LocalPlayer);
    local prev = v7.prev;
    local next = v7.next;

    if next == nil then
        prev = BarbarianKit.SwordProgression[#BarbarianKit.SwordProgression - 2 + 1];
        next = BarbarianKit.SwordProgression[#BarbarianKit.SwordProgression - 1 + 1];
    end;

    local v8 = math.clamp((p6.props.store.Kit.barbarianRage - prev.rage) / (next.rage - prev.rage), 0.001, 1);
    local v9 = p6.progressRef:getValue();

    if v9 then
        TweenService:Create(v9, TweenInfo.new(0.3), {
            Size = UDim2.fromScale(v8, 0.25)
        }):Play();
    end;
end;

function u4.didMount(p10) -- Line: 37
    p10:updateFill();
end;

function u4.didUpdate(p11, p12) -- Line: 40
    if p12.store.Kit.barbarianRage ~= p11.props.store.Kit.barbarianRage then
        p11:updateFill();
    end;
end;

function u4.render(p13) -- Line: 45
    -- upvalues: BarbarianKit (copy), Players (copy), u2 (copy), UIUtil (copy), ItemViewport (copy), Empty (copy), ColorUtil (copy)
    local v14 = BarbarianKit.getSwordProgress(Players.LocalPlayer);
    local prev = v14.prev;
    local next = v14.next;

    if next == nil then
        prev = BarbarianKit.SwordProgression[#BarbarianKit.SwordProgression - 2 + 1];
        next = BarbarianKit.SwordProgression[#BarbarianKit.SwordProgression - 1 + 1];
    end;

    return u2.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UIUtil:getActionBarPosition(),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(0.35, 0.04)
    }, {
        u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 12.441176470588236
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center"
        }),
        u2.createElement(ItemViewport, {
            SizeConstraint = "RelativeYY",
            ItemType = prev.item,
            Size = UDim2.fromScale(1, 1)
        }),
        u2.createElement(Empty, {
            SizeConstraint = "RelativeYY",
            Size = UDim2.fromScale(10.441176470588236, 1)
        }, { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }), u2.createElement("Frame", {
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.25),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            }), u2.createElement("Frame", {
                [u2.Ref] = p13.progressRef,
                Size = UDim2.fromScale(0, 0.25),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                BorderSizePixel = 0
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new(ColorUtil.hexColor(16578693), ColorUtil.hexColor(16433185))
                }) }) }),
        u2.createElement(ItemViewport, {
            SizeConstraint = "RelativeYY",
            ItemType = next.item,
            Size = UDim2.fromScale(1, 1)
        })
    });
end;

return {
    BarbarianRageBarWrapper = function(p15) -- Line: 111, Name: BarbarianRageBarWrapper
        -- upvalues: u2 (copy), u4 (ref)
        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(u4, {
                store = p15.store
            }) });
    end,

    BarbarianRageBar = u4
};