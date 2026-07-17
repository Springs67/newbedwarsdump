-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = u3.Component:extend("CauldronCard");

function v4.init(p5) -- Line: 18
    -- upvalues: u3 (copy), u2 (copy)
    p5.ref = u3.createRef();
    p5.maid = u2.new();
end;

function v4.didMount(u6) -- Line: 22
    -- upvalues: UserInputService (copy), UIUtil (copy), SoundManager (copy), GameSound (copy)
    local v7 = UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and u6.ref:getValue());

    if v7 then
        UIUtil:selectGui(v7);
        u6.maid:GiveTask(v7.MouseButton1Down:Connect(function() -- Line: 27
            -- upvalues: u6 (copy), SoundManager (ref), GameSound (ref)
            if u6:hasEnough() then
                u6:purchase();

                return;
            end;

            SoundManager:playSound(GameSound.UI_CLICK);
        end));
    end;
end;

function v4.willUnmount(p8) -- Line: 37
    p8.maid:DoCleaning();
end;

function v4.purchase(p9) -- Line: 40
    p9.props.Purchased();
end;

function v4.hasEnough(u10) -- Line: 43
    local function _(p11) -- Line: 48
        -- upvalues: u10 (copy)
        return p11.itemType == u10.props.Currency;
    end;

    local v12 = nil;

    for i, v in u10.props.ObservedInventory.inventory.items do
        local _ = i - 1;

        if v.itemType == u10.props.Currency == true then
            v12 = v;
            break;
        end;
    end;

    if v12 ~= nil then
        v12 = v12.amount;
    end;

    return (v12 == nil and 0 or v12) >= u10.props.Price;
end;

function v4.render(u13) -- Line: 74
    -- upvalues: u3 (copy), Theme (copy), ColorUtil (copy), Button (copy), getItemMeta (copy), ItemUtil (copy), SoundManager (copy), GameSound (copy)
    local v14 = u13:hasEnough();
    local v15 = {
        [u3.Ref] = u13.ref,
        Size = u13.props.Size or UDim2.fromScale(0.2, 1),
        Position = UDim2.fromScale(0.5, 0.15),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Theme.backgroundPrimary,
        BorderSizePixel = 0,
        LayoutOrder = u13.props.LayoutOrder,
        AutoButtonColor = false,
        Selectable = true,
        Modal = true
    };
    local v16 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.01, 0)
        }) };
    local v17 = #v16;
    local v18 = {};
    local AspectRatio = u13.props.AspectRatio;
    v18.AspectRatio = AspectRatio == nil and 0.8275862068965517 or AspectRatio;
    v18.DominantAxis = "Height";
    v16[v17 + 1] = u3.createElement("UIAspectRatioConstraint", v18);
    v16[v17 + 2] = u3.createElement("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.95, 0.12),
        Position = UDim2.fromScale(0.5, 0.015),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Theme.backgroundSecondary
    }, { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.01, 0)
        }), u3.createElement("TextLabel", {
            TextScaled = true,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            RichText = true,
            Font = "Roboto",
            Text = "<b>" .. u13.props.Name .. "</b>",
            Size = UDim2.fromScale(0.95, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });
    v16[v17 + 3] = u3.createElement("TextLabel", {
        Text = "",
        TextScaled = true,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        RichText = true,
        Font = "Roboto",
        TextXAlignment = "Center",
        TextYAlignment = "Top",
        Size = UDim2.fromScale(0.94, 0.325),
        Position = UDim2.fromScale(0.5, 0.42),
        AnchorPoint = Vector2.new(0.5, 0),
        TextColor3 = ColorUtil.hexColor(13948390)
    });
    local v19;

    if v14 then
        local v20 = {
            Size = UDim2.fromScale(0.92, 0.78),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundSuccess
        };
        local ButtonTextOverride = u13.props.ButtonTextOverride;
        v20.Text = ButtonTextOverride == nil and "" or ButtonTextOverride;
        v20.Selectable = false;

        function v20.OnClick() -- Line: 157
            -- upvalues: u13 (copy)
            u13:purchase();
        end;

        v20[u3.Event.MouseButton2Click] = function() -- Line: 160
            -- upvalues: u13 (copy)
            u13:purchase();
        end;

        v20.TextLabel = {
            Size = UDim2.fromScale(0.8, 0.85)
        };
        v19 = u3.createElement(Button, v20);
    else
        v19 = u3.createElement(Button, {
            Selectable = false,
            Size = UDim2.fromScale(0.92, 0.78),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundError,
            Text = "<b>Not Enough Items</b>\n<font color=\"" .. ColorUtil.richTextColor(getItemMeta(u13.props.Currency).displayNameColor or Color3.fromRGB(255, 255, 255)) .. "\"><b>" .. tostring(u13.props.Price) .. " " .. ItemUtil.getDisplayName(u13.props.Currency) .. "</b></font>",

            OnClick = function() -- Line: 175, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
            end,

            TextLabel = {
                Size = UDim2.fromScale(0.8, 0.85)
            }
        });
    end;

    local v21 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 0.15),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v22 = {
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }),
        [#v22 + 1] = v19
    };
    v16.ActionsSection = u3.createElement("Frame", v21, v22);

    return u3.createElement("ImageButton", v15, v16);
end;

return {
    CauldronCard = v4
};