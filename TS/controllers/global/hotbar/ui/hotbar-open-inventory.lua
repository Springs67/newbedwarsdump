-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v3 = u2.Component:extend("HotbarOpenInventory");

function v3.init(p4) -- Line: 18
end;

function v3.render(p5) -- Line: 20
    -- upvalues: KnitClient (copy), KeybindDefaults (copy), UserInputService (copy), ColorUtil (copy), BedwarsAppIds (copy), u2 (copy), Flamework (copy), SoundManager (copy), GameSound (copy), ImageId (copy), Empty (copy)
    local v6 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    local v7;

    if v6 == nil then
        v7 = v6;
    else
        v7 = v6.keyboard;

        if v7 ~= nil then
            v7 = v7.controlActions.Inventory.Name;
        end;
    end;

    if v7 == nil then
        v7 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.Inventory.Name;
    end;

    local v8 = UserInputService.KeyboardEnabled or true;

    if UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled then
        if v6 ~= nil then
            v6 = v6.gamepad;

            if v6 ~= nil then
                v6 = v6.controlActions.Inventory.Name;
            end;
        end;

        if v6 == nil then
            v6 = KeybindDefaults.GAMEPAD_KEYBINDS.controlActions.Inventory.Name;
        end;
    else
        v6 = v7;
    end;

    local v9 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = p5.props.LayoutOrder
    };
    local v10 = {};
    local v12 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 0.4,
        BorderMode = "Inset",
        BorderSizePixel = 1,
        Image = nil,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ColorUtil.hexColor(1909806),
        BorderColor3 = ColorUtil.hexColor(7503788),
        LayoutOrder = p5.props.LayoutOrder,
        Selectable = table.find(p5.props.store.AppInfo.openApps, BedwarsAppIds.INVENTORY) ~= nil,

        [u2.Event.MouseButton1Click] = function() -- Line: 70
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.INVENTORY, {});
        end,

        [u2.Event.MouseEnter] = function(p11) -- Line: 73
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_HOVER);
        end
    };
    local createElement = u2.createElement;
    local v13 = {};
    local v14 = u2.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.88, 0.88),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.hexColor(5331056)
    }, { u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.7, 0.7),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = ImageId.ELLIPSIS
        }) });

    if v8 then
        v8 = u2.createElement("TextLabel", {
            BorderSizePixel = 0,
            TextScaled = true,
            Text = v6,
            Size = UDim2.fromScale(0.23, 0.23),
            Position = UDim2.fromScale(0, 0),
            BackgroundColor3 = ColorUtil.hexColor(7503788),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0)
            }) });
    end;

    v13[1], v13[2] = v14, v8;
    v10[#v10 + 1] = createElement("ImageButton", v12, v13);

    return u2.createElement(Empty, v9, v10);
end;

return {
    HotbarOpenInventory = v3
};