-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MobileUI = RuntimeLib.import(script, script.Parent, "mobile-ui").MobileUI;
local u4 = {};
local v5;

if DeviceUtil.isSmallScreen() then
    v5 = UDim2.fromScale(0.85, 0.51);
else
    v5 = UDim2.fromScale(0.835, 0.53);
end;

local v6;

if DeviceUtil.isSmallScreen() then
    v6 = UDim2.fromScale(0.79, 0.51);
else
    v6 = UDim2.fromScale(0.755, 0.53);
end;

local v7;

if DeviceUtil.isSmallScreen() then
    v7 = UDim2.fromScale(0.745, 0.61);
else
    v7 = UDim2.fromScale(0.69, 0.6);
end;

local v8;

if DeviceUtil.isSmallScreen() then
    v8 = UDim2.fromScale(0.745, 0.73);
else
    v8 = UDim2.fromScale(0.69, 0.705);
end;

local v9;

if DeviceUtil.isSmallScreen() then
    v9 = UDim2.fromScale(0.685, 0.665);
else
    v9 = UDim2.fromScale(0.615, 0.6);
end;

local v10;

if DeviceUtil.isSmallScreen() then
    v10 = UDim2.fromScale(0.69, 0.545);
else
    v10 = UDim2.fromScale(0.615, 0.705);
end;

u4[1], u4[2], u4[3], u4[4], u4[5], u4[6] = v5, v6, v7, v8, v9, v10;

return function(p11) -- Line: 12
    -- upvalues: u2 (copy), u3 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), DeviceUtil (copy), u4 (copy), MobileUI (copy)
    local v12 = {
        isMoveMountEnabledSignal = u3.new()
    };
    local v13 = { u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(MobileButton, {
                Image = BedwarsImageId.UP_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition(),

                OnClick = function() -- Line: 25, Name: OnClick
                end
            }) }) };
    local v14 = #v13;
    local v15 = {
        Image = BedwarsImageId.DOWN_MOBILE,
        Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),

        OnClick = function() -- Line: 36
        end
    };
    v13[v14 + 1] = u2.createElement(MobileButton, v15);
    local v16 = {
        Image = BedwarsImageId.EXPLODE_MOBILE,
        Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.04, DeviceUtil.isSmallScreen() and 0.14 or 0.11),

        OnClick = function() -- Line: 44
        end
    };
    v13[v14 + 2] = u2.createElement(MobileButton, v16);
    local createElement = u2.createElement;
    local v17 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.HOME
    };
    local v18;

    if DeviceUtil.isSmallScreen() then
        v18 = UDim2.fromScale(0.11, 0.11);
    else
        v18 = UDim2.fromScale(0.09, 0.09);
    end;

    v17.Size = v18;
    v17.Position = u4[1];

    function v17.OnClick() -- Line: 51
    end;

    v13[v14 + 3] = createElement(MobileButton, v17);
    local createElement2 = u2.createElement;
    local v19 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_LEAP
    };
    local v20;

    if DeviceUtil.isSmallScreen() then
        v20 = UDim2.fromScale(0.11, 0.11);
    else
        v20 = UDim2.fromScale(0.09, 0.09);
    end;

    v19.Size = v20;
    v19.Position = u4[2];

    function v19.OnClick() -- Line: 58
    end;

    v13[v14 + 4] = createElement2(MobileButton, v19);
    local createElement3 = u2.createElement;
    local v21 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_SPIN
    };
    local v22;

    if DeviceUtil.isSmallScreen() then
        v22 = UDim2.fromScale(0.11, 0.11);
    else
        v22 = UDim2.fromScale(0.09, 0.09);
    end;

    v21.Size = v22;
    v21.Position = u4[3];

    function v21.OnClick() -- Line: 65
    end;

    v13[v14 + 5] = createElement3(MobileButton, v21);
    local createElement4 = u2.createElement;
    local v23 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_ULT
    };
    local v24;

    if DeviceUtil.isSmallScreen() then
        v24 = UDim2.fromScale(0.11, 0.11);
    else
        v24 = UDim2.fromScale(0.09, 0.09);
    end;

    v23.Size = v24;
    v23.Position = u4[4];

    function v23.OnClick() -- Line: 72
    end;

    v13[v14 + 6] = createElement4(MobileButton, v23);
    local createElement5 = u2.createElement;
    local v25 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_ULT
    };
    local v26;

    if DeviceUtil.isSmallScreen() then
        v26 = UDim2.fromScale(0.11, 0.11);
    else
        v26 = UDim2.fromScale(0.09, 0.09);
    end;

    v25.Size = v26;
    v25.Position = u4[5];

    function v25.OnClick() -- Line: 79
    end;

    v13[v14 + 7] = createElement5(MobileButton, v25);
    local createElement6 = u2.createElement;
    local v27 = {
        GenerateCircleBackground = true,
        Image = BedwarsImageId.JUGG_BARB_ULT
    };
    local v28;

    if DeviceUtil.isSmallScreen() then
        v28 = UDim2.fromScale(0.11, 0.11);
    else
        v28 = UDim2.fromScale(0.09, 0.09);
    end;

    v27.Size = v28;
    v27.Position = u4[6];

    function v27.OnClick() -- Line: 86
    end;

    v13[v14 + 8] = createElement6(MobileButton, v27);
    local u29 = u2.mount(u2.createElement(MobileUI, v12, v13), p11);

    return function() -- Line: 89
        -- upvalues: u2 (ref), u29 (copy)
        return u2.unmount(u29);
    end;
end;