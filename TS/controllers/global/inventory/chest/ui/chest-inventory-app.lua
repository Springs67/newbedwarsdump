-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ChestConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "chest-constants").ChestConstants;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local InventoryHeader = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local InventoryTile = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;
local InventoryChest = RuntimeLib.import(script, script.Parent, "inventory-chest").InventoryChest;
local SmelterHeader = RuntimeLib.import(script, script.Parent, "smelter-header").SmelterHeader;
local v4 = u2.Component:extend("ChestInventoryAppBase");

function v4.init(p5) -- Line: 31
    p5.alive = true;
end;

function v4.didMount(u6) -- Line: 34
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), Players (copy), RuntimeLib (copy), ChestConstants (copy), Flamework (copy)
    SoundManager:playSound(GameSound.UI_OPEN);
    local v7 = not DeviceUtil.isHoarceKat();

    if v7 then
        v7 = Players.LocalPlayer;

        if v7 ~= nil then
            v7 = v7.Character;
        end;
    end;

    if v7 then
        RuntimeLib.Promise.defer(function() -- Line: 46
            -- upvalues: u6 (copy), Players (ref), ChestConstants (ref), Flamework (ref)
            while true do
                local v8 = task.wait(0.2);

                if v8 ~= 0 and (v8 == v8 and v8) then
                    v8 = u6.alive and u6.props.chestBlock;
                end;

                if v8 == 0 or (v8 ~= v8 or not v8) then
                    return;
                end;

                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:GetPivot().Position;
                end;

                if Character == nil then
                    Character = Vector3.new();
                end;

                if (Character - u6.props.chestBlock.Position).Magnitude > ChestConstants.MAX_DISTANCE_FROM_CHEST then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.props.AppId);
                end;
            end;
        end);
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("ObservedChestFolder");
    end;

    if Character then
        u6.smelterConnection = Character.Changed:Connect(function(p9) -- Line: 77
            -- upvalues: Character (copy), u6 (copy)
            local u10 = p9 and Character.Value;

            if u10 then
                u6:setState({
                    isSmelter = u10:GetAttribute("Smelter") ~= nil
                });

                if not u6.smelterPointsConnection then
                    u6.smelterPointsConnection = u10:GetAttributeChangedSignal("SmeltPoints"):Connect(function() -- Line: 85
                        -- upvalues: u6 (ref), u10 (copy)
                        local v11 = {};
                        local v12 = u10:GetAttribute("SmeltPoints");
                        v11.progress = v12 == nil and 0 or v12;
                        u6:setState(v11);
                    end);
                end;
            end;
        end);
    end;
end;

function v4.render(p13) -- Line: 102
    -- upvalues: Players (copy), u2 (copy), InventoryTile (copy), RuntimeLib (copy), default (copy), ClientStore (copy), ColorUtil (copy), Empty (copy), DarkBackground (copy), DeviceUtil (copy), SmelterHeader (copy), InventoryChest (copy), InventoryHeader (copy), EmptyButton (copy), SlideIn (copy)
    local v14 = {};
    local v15 = {};
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("ObservedChestFolder");
    end;

    local v16 = nil;
    local v17;

    if Character == nil then
        v17 = Character;
    else
        v17 = Character.Value;
    end;

    if v17 then
        v16 = Character.Value;
    end;

    local v18;

    if v16 == nil then
        v18 = v16;
    else
        v18 = v16:GetAttribute("Smelter");
    end;

    local v19 = v18 ~= nil;

    if v16 ~= nil then
        v16 = v16:GetAttribute("SmeltPoints");
    end;

    local v20 = v16 == nil and 0 or v16;
    local v21 = false;
    local v22 = 0;

    while true do
        if true then
            if v21 then
                v22 = v22 + 1;
            else
                v21 = true;
            end;
        end;

        if v22 >= 32 then
            table.sort(v15, function(p23, p24) -- Line: 173
                return p23.addedToBackpackTime < p24.addedToBackpackTime;
            end);
            local v25 = false;
            local v26 = 0;

            while true do
                if v25 then
                    v26 = v26 + 1;
                else
                    v25 = true;
                end;

                if v26 >= 24 then
                    local v27 = {
                        DisplayOrder = 1
                    };
                    local v28 = { u2.createElement(DarkBackground, {
                            Transparent = false,
                            AppId = p13.props.AppId
                        }) };
                    local v29 = {};
                    local v30 = {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.45 or 0.5, DeviceUtil.isSmallScreen() and 0.5 or 0.4),
                        Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.68 or 0.72),
                        AnchorPoint = Vector2.new(0.5, 1)
                    };
                    local v31 = { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1.5
                        }), u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.03, 0)
                        }) };
                    local v32 = #v31;

                    if v19 then
                        v19 = u2.createElement(SmelterHeader, {
                            SmeltPoints = v20
                        });
                    end;

                    if v19 then
                        v31[v32 + 1] = v19;
                    end;

                    local v33 = {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v34 = { u2.createElement(
                            "UIListLayout",
                            {
                                FillDirection = "Horizontal",
                                HorizontalAlignment = "Center",
                                VerticalAlignment = "Center"
                            }
                        ), u2.createElement(InventoryChest, {
                            ObservedChest = p13.props.Inventory.observedInventory.observedChest
                        }), u2.createElement(Empty, {
                            Size = UDim2.fromScale(0.08, 0)
                        }) };
                    local v35 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v36 = { u2.createElement("UIListLayout", {
                            FillDirection = "Vertical"
                        }), u2.createElement(InventoryHeader, {
                            Title = "Inventory"
                        }), u2.createElement(Empty, {
                            Size = UDim2.fromScale(0, 0.01)
                        }) };
                    local v37 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v38 = {};
                    local v39 = {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = ColorUtil.hexColor(1713718)
                    };
                    local v40 = { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 6)
                        }), u2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.02, 0),
                            PaddingRight = UDim.new(0.02, 0),
                            PaddingTop = UDim.new(0.03, 0),
                            PaddingBottom = UDim.new(0.03, 0)
                        }), u2.createElement("UIGridLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            CellSize = UDim2.fromScale(0.14666666666666667, 0.23),
                            CellPadding = UDim2.fromScale(0.02, 0.02)
                        }) };
                    local v41 = #v40;

                    for i, v in v14 do
                        v40[v41 + i] = v;
                    end;

                    v38[#v38 + 1] = u2.createElement("Frame", v39, v40);
                    v36[#v36 + 1] = u2.createElement(EmptyButton, v37, v38);
                    v34[#v34 + 1] = u2.createElement(Empty, v35, v36);
                    v31[#v31 + 1] = u2.createElement(Empty, v33, v34);
                    v29[#v29 + 1] = u2.createElement("Frame", v30, v31);
                    v28[#v28 + 1] = u2.createElement(SlideIn, {}, v29);

                    return u2.createElement("ScreenGui", v27, v28);
                end;

                local u42;

                if v26 < #v15 then
                    u42 = v15[v26 + 1];
                else
                    u42 = nil;
                end;

                local v43 = u42;

                if v43 ~= nil then
                    v43 = v43.tool:GetAttribute("Smeltable");
                end;

                local v44 = {
                    Size = UDim2.fromScale(1, 1),
                    LayoutOrder = v26
                };
                local v48 = { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.025),
                        PaddingBottom = UDim.new(0.025),
                        PaddingLeft = UDim.new(0.025),
                        PaddingRight = UDim.new(0.025)
                    }), u2.createElement(InventoryTile, {
                        ItemClickLoadingProgress = true,
                        InvItem = u42,
                        AutoSelect = v26 == 0,
                        LayoutOrder = v26,
                        OnClick = RuntimeLib.async(function() -- Line: 214
                            -- upvalues: u42 (ref), Players (ref), RuntimeLib (ref), default (ref)
                            if u42 and u42.tool then
                                local Character2 = Players.LocalPlayer.Character;

                                if Character2 ~= nil then
                                    Character2 = Character2:FindFirstChild("ObservedChestFolder");
                                end;

                                local v45 = RuntimeLib.await(Character2);
                                local v46;

                                if v45 == nil then
                                    v46 = v45;
                                else
                                    v46 = v45.Value;
                                end;

                                if v46 then
                                    return RuntimeLib.await(default.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v45.Value, u42.tool));
                                end;
                            end;
                        end),

                        SendToHotbarSlot = function(p47) -- Line: 233, Name: SendToHotbarSlot
                            -- upvalues: u42 (ref), ClientStore (ref)
                            if u42 then
                                ClientStore:dispatch({
                                    type = "InventoryAddToHotbar",
                                    slot = p47,
                                    item = u42
                                });
                            end;
                        end,

                        TileBorderColor = ColorUtil.hexColor(5331056)
                    }) };
                local v49 = #v48;
                local v50 = v19 and not (v43 == true) and u2.createFragment({
                    Overlay = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0.5,
                        ZIndex = 50,
                        Visible = true,
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = ColorUtil.BLACK
                    })
                });

                if v50 then
                    v48[v49 + 1] = v50;
                end;

                local v51 = u2.createElement(Empty, v44, v48);
                table.insert(v14, v51);
            end;
        end;

        local u52;

        if v22 < #p13.props.Inventory.observedInventory.inventory.items then
            u52 = p13.props.Inventory.observedInventory.inventory.items[v22 + 1];

            local function _(p53) -- Line: 148
                -- upvalues: u52 (ref)
                return p53.item == u52;
            end;

            local v54 = nil;

            for i, v in p13.props.Inventory.observedInventory.hotbar do
                local _ = i - 1;

                if v.item == u52 == true then
                    v54 = v;
                    break;
                end;
            end;

            if v54 then
                u52 = nil;
            end;
        else
            u52 = nil;
        end;

        if u52 then
            table.insert(v15, u52);
        end;
    end;
end;

function v4.willUnmount(u55) -- Line: 378
    -- upvalues: default (copy)
    task.spawn(function() -- Line: 379
        -- upvalues: default (ref), u55 (copy)
        default.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
        u55.alive = false;
        local smelterConnection = u55.smelterConnection;

        if smelterConnection ~= nil then
            smelterConnection:Disconnect();
        end;

        local smelterPointsConnection = u55.smelterPointsConnection;

        if smelterPointsConnection ~= nil then
            smelterPointsConnection:Disconnect();
        end;
    end);
end;

return {
    ChestInventoryApp = v3.connect(function(p56, p57) -- Line: 393
        local v58 = {
            Inventory = p56.Inventory
        };

        for i, v in p57 do
            v58[i] = v;
        end;

        return v58;
    end)(v4)
};