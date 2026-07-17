-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local CooldownBar = v1.CooldownBar;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ItemToolTip = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local ItemDurabilityBar = RuntimeLib.import(script, script.Parent.Parent.Parent, "item-durability", "item-durability-bar").ItemDurabilityBar;
local v6 = u4.Component:extend("HotbarTile");

function v6.init(p7) -- Line: 26
    -- upvalues: u4 (copy), u3 (copy)
    p7.frameRef = u4.createRef();
    p7.arrowRef = u4.createRef();
    p7.positionMaid = u3.new();
    p7.maid = u3.new();
    p7.cooldownMaid = u3.new();
end;

function v6.didMount(u8) -- Line: 33
    -- upvalues: DeviceUtil (copy), Flamework (copy)
    u8:tweenPosition();
    u8:tweenArrowPosition();
    local v9 = u8.frameRef:getValue();

    if v9 and not DeviceUtil.isHoarceKat() then
        u8.draggingScreenSinkInfo = Flamework.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):registerScreenSink(v9.AbsolutePosition, v9.AbsoluteSize, function(p10, p11) -- Line: 38
            -- upvalues: Flamework (ref), u8 (copy)
            if p10 == "began" then
                Flamework.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItem(u8.props.SlotNumber, p11, true);

                return;
            end;

            if p10 == "ended" then
                Flamework.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItemOntoSlot(u8.props.SlotNumber, p11, true);
            end;
        end);

        if u8.draggingScreenSinkInfo then
            u8.maid:GiveTask(u8.draggingScreenSinkInfo.maid);
        end;
    end;

    local maid = u8.maid;
    local v12 = u8.frameRef:getValue();

    if v12 ~= nil then
        v12 = v12.Changed;
    end;

    maid:GiveTask(v12:Connect(function(p13) -- Line: 54
        -- upvalues: u8 (copy)
        if p13 == "AbsoluteSize" or p13 == "AbsolutePosition" then
            local v14 = u8.frameRef:getValue();

            if not (v14 and u8.draggingScreenSinkInfo) then
                return nil;
            end;

            u8.draggingScreenSinkInfo.position = v14.AbsolutePosition;
            u8.draggingScreenSinkInfo.size = v14.AbsoluteSize;
        end;
    end));
end;

function v6.willUnmount(p15) -- Line: 65
    p15.maid:DoCleaning();
end;

function v6.didUpdate(u16, p17) -- Line: 68
    -- upvalues: u2 (copy), CooldownId (copy), Flamework (copy), ClientSyncEvents (copy)
    if p17.HighlightedSlot ~= u16.props.HighlightedSlot then
        u16:tweenArrowPosition();
    end;

    if p17.Selected ~= u16.props.Selected then
        u16:tweenPosition();
    end;

    local item = p17.HotbarSlot.item;

    if item ~= nil then
        item = item.itemType;
    end;

    local item2 = u16.props.HotbarSlot.item;

    if item2 ~= nil then
        item2 = item2.itemType;
    end;

    if item ~= item2 then
        u16.cooldownMaid:DoCleaning();
        local item3 = u16.props.HotbarSlot.item;

        if item3 ~= nil then
            item3 = item3.itemType;
        end;

        if item3 and table.find(u2.values(CooldownId), item3) ~= nil then
            if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(item3) then
                u16:setState({
                    onCooldown = true
                });
            end;

            u16.cooldownMaid:GiveTask(ClientSyncEvents.CooldownStarted:connect(function(p18) -- Line: 101
                -- upvalues: item3 (copy), u16 (copy), Flamework (ref)
                if p18.cooldownId ~= item3 then
                    return nil;
                end;

                u16:setState({
                    onCooldown = true
                });
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(p18.cooldownId, "hotbar-tile_" .. p18.cooldownId, function() -- Line: 108
                    -- upvalues: u16 (ref)
                    u16:setState({
                        onCooldown = false
                    });
                end);
            end));
            u16.cooldownMaid:GiveTask(function() -- Line: 114
                -- upvalues: u16 (copy)
                u16:setState({
                    onCooldown = false
                });
            end);
        end;
    end;
end;

function v6.tweenPosition(p19) -- Line: 122
    -- upvalues: TweenService (copy)
    p19.positionMaid:DoCleaning();
    local v20 = p19.frameRef:getValue();

    if not v20 then
        return nil;
    end;

    local u21;

    if p19.props.Selected then
        u21 = TweenService:Create(v20, TweenInfo.new(0.12), {
            Position = UDim2.fromScale(0, -0.075)
        });
    else
        u21 = TweenService:Create(v20, TweenInfo.new(0.12), {
            Position = UDim2.fromScale(0, 0)
        });
    end;

    u21:Play();
    p19.positionMaid:GiveTask(function() -- Line: 139
        -- upvalues: u21 (ref)
        u21:Cancel();
    end);
end;

function v6.tweenArrowPosition(p22) -- Line: 143
    -- upvalues: TweenService (copy)
    if p22.props.HighlightedSlot then
        local u23 = TweenService:Create(p22.arrowRef:getValue(), TweenInfo.new(0.5), {
            Position = UDim2.fromScale(0.5, -0.8)
        });
        local u24 = TweenService:Create(p22.arrowRef:getValue(), TweenInfo.new(0.5), {
            Position = UDim2.fromScale(0.5, -0.45)
        });
        u23:Play();
        p22.positionMaid:GiveTask(u23.Completed:Connect(function() -- Line: 154
            -- upvalues: u24 (ref)
            u24:Play();
        end));
        p22.positionMaid:GiveTask(u24.Completed:Connect(function() -- Line: 157
            -- upvalues: u23 (ref)
            u23:Play();
        end));
    end;
end;

function v6.render(u25) -- Line: 162
    -- upvalues: DeviceUtil (copy), Players (copy), u4 (copy), ColorUtil (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy), CooldownBar (copy), ItemDurabilityBar (copy), ItemToolTip (copy), ItemViewport (copy), Empty (copy)
    local v26;

    if DeviceUtil.isHoarceKat() then
        v26 = nil;
    else
        v26 = Players.LocalPlayer.Character;

        if v26 ~= nil then
            v26 = v26:FindFirstChild("ObservedChestFolder");
        end;
    end;

    local v27 = nil;
    local v28;

    if v26 == nil then
        v28 = v26;
    else
        v28 = v26.Value;
    end;

    if v28 then
        v27 = v26.Value;
    end;

    if v27 ~= nil then
        v27 = v27:GetAttribute("Smelter");
    end;

    local item = u25.props.HotbarSlot.item;

    if item ~= nil then
        item = item.tool:GetAttribute("Smeltable");
    end;

    local item2 = u25.props.HotbarSlot.item;

    if item2 ~= nil then
        item2 = item2.tool:GetAttribute("Durability");
    end;

    local v29 = item2 ~= nil;
    local v30 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = u25.props.LayoutOrder
    };
    local v31 = {};
    local v32 = #v31;
    local v33 = u25.props.HighlightedSlot and u4.createFragment({
        HighlightedSlotArrow = u4.createElement("ImageLabel", {
            [u4.Ref] = u25.arrowRef,
            Size = UDim2.fromScale(0.9, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, -0.7),
            Image = "rbxassetid://16809397532",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(255, 255, 255)
        })
    });

    if v33 then
        v31[v32 + 1] = v33;
    end;

    local v34 = #v31;
    local v35 = {
        [u4.Ref] = u25.frameRef,
        Size = UDim2.fromScale(1, 1),
        SizeConstraint = "RelativeYY",
        BackgroundColor3 = ColorUtil.hexColor(1909806),
        BackgroundTransparency = u25.props.Selected and 0.2 or 0.4,
        BorderMode = "Inset"
    };
    local _ = u25.props.Selected;
    v35.BorderSizePixel = 1;
    local v36;

    if u25.props.Selected then
        v36 = Color3.fromRGB(255, 255, 255);
    else
        v36 = ColorUtil.hexColor(7503788);
    end;

    v35.BorderColor3 = v36;
    v35.Image = nil;
    v35.Selectable = table.find(u25.props.store.AppInfo.openApps, BedwarsAppIds.INVENTORY) ~= nil;

    v35[u4.Event.MouseButton1Click] = function() -- Line: 235
        -- upvalues: u25 (copy)
        u25.props.OnClick();
    end;

    v35[u4.Event.MouseEnter] = function(p37) -- Line: 238
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_HOVER);
    end;

    local onCooldown = u25.state.onCooldown;

    if onCooldown then
        onCooldown = u25.props.HotbarSlot.item;

        if onCooldown ~= nil then
            onCooldown = onCooldown.itemType;
        end;

        if onCooldown then
            onCooldown = u4.createElement(CooldownBar, {
                ZIndex = 3,
                cooldownId = u25.props.HotbarSlot.item.itemType,
                Position = UDim2.fromScale(0.5, 0.9),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.8, 0.1)
            });
        end;
    end;

    local v38 = {};
    local v39 = #v38;

    if onCooldown then
        v38[v39 + 1] = onCooldown;
    end;

    local v40 = #v38;

    if v29 then
        v29 = u4.createElement(ItemDurabilityBar, {
            ZIndex = 3,
            uiStrokeTransparency = 0.5,
            inventoryItem = u25.props.HotbarSlot.item,
            Position = UDim2.fromScale(0.5, 0.9),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.fromScale(0.8, 0.1),
            uiStrokeColor = Color3.fromRGB(29, 36, 46)
        });
    end;

    if v29 then
        v38[v40 + 1] = v29;
    end;

    local v41 = #v38;
    local createElement = u4.createElement;
    local v42 = {
        BorderSizePixel = 0,
        TextScaled = true,
        ZIndex = 10,
        Text = u25.props.Keybind,
        Size = UDim2.fromScale(0.23, 0.23),
        Position = UDim2.fromScale(0, 0)
    };
    local v43;

    if u25.props.Selected then
        v43 = Color3.fromRGB(255, 255, 255);
    else
        v43 = ColorUtil.hexColor(7503788);
    end;

    v42.BackgroundColor3 = v43;
    local v44;

    if u25.props.Selected then
        v44 = Color3.fromRGB(0, 0, 0);
    else
        v44 = Color3.fromRGB(255, 255, 255);
    end;

    v42.TextColor3 = v44;
    v42.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v38[v41 + 1] = createElement("TextLabel", v42, { u4.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }), u4.createElement("UIPadding", {
            PaddingTop = UDim.new(0.15, 0),
            PaddingBottom = UDim.new(0.15, 0)
        }) });
    local v45 = {};
    local item3 = u25.props.HotbarSlot.item;

    if item3 ~= nil then
        item3 = item3.itemType;
    end;

    v45.item = item3;
    v38[v41 + 2] = u4.createElement(ItemToolTip, v45);
    local v46;

    if u25.props.HotbarSlot.item == nil then
        v46 = false;
    else
        v46 = u4.createElement(ItemViewport, {
            ItemType = u25.props.HotbarSlot.item.itemType,
            Amount = u25.props.HotbarSlot.item.amount,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.15),
            AnchorPoint = Vector2.new(0.5, 0)
        });
    end;

    if v46 then
        v38[v41 + 3] = v46;
    end;

    v31[v34 + 1] = u4.createElement("ImageButton", v35, v38);
    local v47 = v27 ~= nil and not (item == true);

    if v47 then
        local createFragment = u4.createFragment;
        local v48 = {};
        local createElement2 = u4.createElement;
        local v49 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            ZIndex = 50,
            Visible = true,
            Size = UDim2.fromScale(1, 1)
        };
        local v50;

        if u25.props.Selected then
            v50 = UDim2.fromScale(0, -0.075);
        else
            v50 = UDim2.fromScale(0, 0);
        end;

        v49.Position = v50;
        v49.BackgroundColor3 = ColorUtil.BLACK;
        v48.Overlay = createElement2("Frame", v49);
        v47 = createFragment(v48);
    end;

    if v47 then
        v31[v34 + 2] = v47;
    end;

    return u4.createElement(Empty, v30, v31);
end;

return {
    HotbarTile = v6
};