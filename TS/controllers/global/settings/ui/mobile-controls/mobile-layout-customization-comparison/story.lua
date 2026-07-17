-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local HotbarApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp;
local MobileUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "mobile-ui", "ui", "mobile-ui").MobileUI;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MobileLayoutCustomizationApp = RuntimeLib.import(script, script.Parent, "mobile-layout-customization-app").MobileLayoutCustomizationApp;
local u5 = {};
local v6;

if DeviceUtil.isSmallScreen() then
    v6 = UDim2.fromScale(0.85, 0.51);
else
    v6 = UDim2.fromScale(0.835, 0.53);
end;

local v7;

if DeviceUtil.isSmallScreen() then
    v7 = UDim2.fromScale(0.79, 0.51);
else
    v7 = UDim2.fromScale(0.755, 0.53);
end;

local v8;

if DeviceUtil.isSmallScreen() then
    v8 = UDim2.fromScale(0.745, 0.61);
else
    v8 = UDim2.fromScale(0.69, 0.6);
end;

local v9;

if DeviceUtil.isSmallScreen() then
    v9 = UDim2.fromScale(0.745, 0.73);
else
    v9 = UDim2.fromScale(0.69, 0.705);
end;

local v10;

if DeviceUtil.isSmallScreen() then
    v10 = UDim2.fromScale(0.685, 0.665);
else
    v10 = UDim2.fromScale(0.615, 0.6);
end;

local v11;

if DeviceUtil.isSmallScreen() then
    v11 = UDim2.fromScale(0.69, 0.545);
else
    v11 = UDim2.fromScale(0.615, 0.705);
end;

u5[1], u5[2], u5[3], u5[4], u5[5], u5[6] = v6, v7, v8, v9, v10, v11;

return function(p12) -- Line: 20
    -- upvalues: u3 (copy), GameReducer (copy), u2 (copy), StoreProvider (copy), MobileLayoutCustomizationApp (copy), u4 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), DeviceUtil (copy), u5 (copy), MobileUI (copy), CreateRoduxApp (copy), HotbarApp (copy), ClientStore (copy), QueueType (copy)
    local v13 = u3.Store.new(u3.combineReducers({
        Game = GameReducer
    }), {});
    local u14 = u2.mount(u2.createElement(StoreProvider, {
        store = v13
    }, { u2.createElement(MobileLayoutCustomizationApp, {
            AppId = "MobileLayoutCustomizationApp"
        }) }), p12);
    local v15 = {
        isMoveMountEnabledSignal = u4.new()
    };
    local v16 = { u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(MobileButton, {
                Image = BedwarsImageId.UP_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition(),

                OnClick = function() -- Line: 42, Name: OnClick
                end
            }) }) };
    local v17 = #v16;
    local v18 = {
        Image = BedwarsImageId.DOWN_MOBILE,
        Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),

        OnClick = function() -- Line: 53
        end
    };
    v16[v17 + 1] = u2.createElement(MobileButton, v18);
    local v19 = {
        Image = BedwarsImageId.EXPLODE_MOBILE,
        Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.04, DeviceUtil.isSmallScreen() and 0.14 or 0.11),

        OnClick = function() -- Line: 61
        end
    };
    v16[v17 + 2] = u2.createElement(MobileButton, v19);
    local createElement = u2.createElement;
    local v20 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.HOME
    };
    local v21;

    if DeviceUtil.isSmallScreen() then
        v21 = UDim2.fromScale(0.11, 0.11);
    else
        v21 = UDim2.fromScale(0.09, 0.09);
    end;

    v20.Size = v21;
    v20.Position = u5[1];

    function v20.OnClick() -- Line: 68
    end;

    v16[v17 + 3] = createElement(MobileButton, v20);
    local createElement2 = u2.createElement;
    local v22 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_LEAP
    };
    local v23;

    if DeviceUtil.isSmallScreen() then
        v23 = UDim2.fromScale(0.11, 0.11);
    else
        v23 = UDim2.fromScale(0.09, 0.09);
    end;

    v22.Size = v23;
    v22.Position = u5[2];

    function v22.OnClick() -- Line: 75
    end;

    v16[v17 + 4] = createElement2(MobileButton, v22);
    local createElement3 = u2.createElement;
    local v24 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_SPIN
    };
    local v25;

    if DeviceUtil.isSmallScreen() then
        v25 = UDim2.fromScale(0.11, 0.11);
    else
        v25 = UDim2.fromScale(0.09, 0.09);
    end;

    v24.Size = v25;
    v24.Position = u5[3];

    function v24.OnClick() -- Line: 82
    end;

    v16[v17 + 5] = createElement3(MobileButton, v24);
    local createElement4 = u2.createElement;
    local v26 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_ULT
    };
    local v27;

    if DeviceUtil.isSmallScreen() then
        v27 = UDim2.fromScale(0.11, 0.11);
    else
        v27 = UDim2.fromScale(0.09, 0.09);
    end;

    v26.Size = v27;
    v26.Position = u5[4];

    function v26.OnClick() -- Line: 89
    end;

    v16[v17 + 6] = createElement4(MobileButton, v26);
    local u28 = u2.mount(u2.createElement(MobileUI, v15, v16), p12);
    local u29 = CreateRoduxApp("hotbar", HotbarApp, {}, {}, {
        Parent = p12
    });
    ClientStore:dispatch({
        type = "SetShowHotbarPartyControls",
        value = false
    });
    ClientStore:dispatch({
        type = "GameSetQueueType",
        queueType = QueueType.BEDWARS_TEST
    });

    return function() -- Line: 103
        -- upvalues: u2 (ref), u14 (copy), u28 (copy), u29 (copy)
        u2.unmount(u14);
        u2.unmount(u28);
        u2.unmount(u29);
    end;
end;