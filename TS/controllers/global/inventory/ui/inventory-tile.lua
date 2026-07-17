-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularProgress = v1.CircularProgress;
local ColorUtil = v1.ColorUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ItemToolTip = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local HotbarKeyboardNumbers = RuntimeLib.import(script, script.Parent.Parent.Parent, "hotbar", "lib", "hotbar-keyboard-numbers").HotbarKeyboardNumbers;
local ItemDurabilityBar = RuntimeLib.import(script, script.Parent.Parent.Parent, "item-durability", "item-durability-bar").ItemDurabilityBar;
local ItemViewport = RuntimeLib.import(script, script.Parent, "item-viewport").ItemViewport;
local v4 = u3.Component:extend("InventoryTile");

function v4.init(p5, p6) -- Line: 20
    -- upvalues: u2 (copy), u3 (copy), ExpireList (copy)
    p5.maid = u2.new();
    p5.ref = u3.createRef();
    p5.hotbarSwapCooldown = ExpireList.new(0.1);
    p5:setState({
        hovered = false,
        loading = false
    });
end;

function v4.didMount(u7) -- Line: 29
    -- upvalues: UserInputService (copy), HotbarKeyboardNumbers (copy), UIUtil (copy)
    u7.maid:GiveTask(UserInputService.InputBegan:Connect(function(p8, p9) -- Line: 31
        -- upvalues: u7 (copy), HotbarKeyboardNumbers (ref)
        if u7.hotbarSwapCooldown:has("lock") then
            return nil;
        end;

        u7.hotbarSwapCooldown:add("lock");

        if p9 then
            return nil;
        end;

        if table.find(HotbarKeyboardNumbers, p8.KeyCode) ~= nil and (table.find(HotbarKeyboardNumbers, p8.KeyCode) ~= nil and u7.state.hovered) then
            u7.props.SendToHotbarSlot(p8.KeyCode.Value - 49);
        end;
    end));

    if UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and u7.props.AutoSelect) then
        UIUtil:selectGui(u7.ref:getValue());
    end;
end;

function v4.willUnmount(p10) -- Line: 56
    p10.maid:DoCleaning();
end;

function v4.render(u11) -- Line: 59
    -- upvalues: ColorUtil (copy), u3 (copy), SoundManager (copy), GameSound (copy), ItemToolTip (copy), CircularProgress (copy), ItemViewport (copy), ItemDurabilityBar (copy)
    local v12 = u11.props.TileColor or ColorUtil.hexColor(4016991);
    local v13 = u11.props.TileBorderColor or ColorUtil.brighten(v12, 0.1);
    local InvItem = u11.props.InvItem;

    if InvItem ~= nil then
        InvItem = InvItem.tool:GetAttribute("Durability");
    end;

    local v14 = InvItem ~= nil;
    local v16 = {
        [u3.Ref] = u11.ref,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = v12,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = u11.props.LayoutOrder,
        Modal = true,

        [u3.Event.MouseButton1Click] = function() -- Line: 75
            -- upvalues: u11 (copy), SoundManager (ref), GameSound (ref)
            if u11.props.InvItem and u11.props.ItemClickLoadingProgress then
                u11:setState({
                    loading = true
                });
                SoundManager:playSound(GameSound.UI_CLICK, {
                    volumeMultiplier = 0.1
                });
            end;

            u11.props.OnClick():andThen(function(p15) -- Line: 85
                -- upvalues: u11 (ref)
                u11:setState({
                    loading = false
                });
            end);
        end,

        [u3.Event.MouseEnter] = function() -- Line: 92
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy)
            SoundManager:playSound(GameSound.UI_HOVER);
            u11:setState({
                hovered = true
            });
        end,

        [u3.Event.MouseLeave] = function() -- Line: 98
            -- upvalues: u11 (copy)
            u11:setState({
                hovered = false
            });
        end
    };
    local v17 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }), u3.createElement("UIStroke", {
            Thickness = 1.5,
            Color = v13
        }) };
    local v18 = #v17;
    local v19 = {};
    local InvItem2 = u11.props.InvItem;

    if InvItem2 ~= nil then
        InvItem2 = InvItem2.itemType;
    end;

    v19.item = InvItem2;
    v17[v18 + 1] = u3.createElement(ItemToolTip, v19);
    local v20 = u11.state.loading and u3.createElement(CircularProgress, {
        Duration = 0.2,
        Transparency = 0.3,
        Size = UDim2.fromScale(0.45, 0.45),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    });

    if v20 then
        v17[v18 + 2] = v20;
    end;

    local v21 = #v17;
    local v22;

    if u11.props.InvItem == nil then
        v22 = false;
    else
        v22 = u3.createElement(ItemViewport, {
            ItemType = u11.props.InvItem.itemType,
            Amount = u11.props.InvItem.amount,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;

    if v22 then
        v17[v21 + 1] = v22;
    end;

    local v23 = #v17;

    if v14 then
        v14 = u3.createElement(ItemDurabilityBar, {
            ZIndex = 3,
            inventoryItem = u11.props.InvItem,
            Position = UDim2.fromScale(0.5, 0.9),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.fromScale(0.8, 0.07),
            uiStrokeColor = Color3.fromRGB(27, 42, 53)
        });
    end;

    if v14 then
        v17[v23 + 1] = v14;
    end;

    return u3.createElement("ImageButton", v16, v17);
end;

return {
    InventoryTile = v4
};