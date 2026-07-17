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
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TrainingRoomKitList = RuntimeLib.import(script, script.Parent, "training-room-kit-list").TrainingRoomKitList;
local TrainingRoomKitSelectionRight = RuntimeLib.import(script, script.Parent, "training-room-kit-selection-right-container").TrainingRoomKitSelectionRight;
local v4 = u2.Component:extend("TrainingRoomKitSelectionAppBase");

function v4.init(p5, p6) -- Line: 21
    -- upvalues: u2 (copy)
    p5.alive = true;
    p5:setState({
        selectedBundle = u2.None
    });
end;

function v4.didMount(u7) -- Line: 27
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), RuntimeLib (copy), Flamework (copy)
    SoundManager:playSound(GameSound.UI_OPEN);
    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer ~= nil then
        LocalPlayer = LocalPlayer.Character;
    end;

    if LocalPlayer then
        local Position = Players.LocalPlayer.Character:GetPivot().Position;
        RuntimeLib.Promise.defer(function() -- Line: 35
            -- upvalues: u7 (copy), Players (ref), Position (copy), Flamework (ref)
            while true do
                local v8 = task.wait(0.2);

                if v8 ~= 0 and (v8 == v8 and v8) then
                    v8 = u7.alive;
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

                if (Character - Position).Magnitude > 6 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.props.AppId);
                end;
            end;
        end);
    end;
end;

function v4.render(u9) -- Line: 61
    -- upvalues: u2 (copy), DeviceUtil (copy), DarkBackground (copy), SlideIn (copy), EmptyButton (copy), Empty (copy), ColorUtil (copy), TrainingRoomKitList (copy), TrainingRoomKitSelectionRight (copy)
    return u2.createElement("ScreenGui", {
        DisplayOrder = 1500,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    }, { u2.createElement(DarkBackground, {
            AppId = u9.props.AppId
        }), u2.createElement(SlideIn, {}, { u2.createElement(EmptyButton, {
                Modal = true,
                Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.85 or 0.75, DeviceUtil.isSmallScreen() and 0.85 or 0.75),
                Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.02 or 0.1),
                AnchorPoint = Vector2.new(0.5, 0)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.6386036960985626
                }), u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.73, 1)
                }, { u2.createElement("UIListLayout", {
                        FillDirection = "Vertical"
                    }), u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.09),
                        BackgroundColor3 = ColorUtil.hexColor(3092550)
                    }, { u2.createElement("TextLabel", {
                            Text = "<b>Choose Any Kit!</b>",
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Font = "Roboto",
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Left",
                            Size = UDim2.fromScale(0.3, 0.5),
                            Position = UDim2.fromScale(0.03, 0.5),
                            AnchorPoint = Vector2.new(0, 0.5),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }) }), u2.createElement(TrainingRoomKitList, {
                        Size = UDim2.fromScale(1, 0.91),
                        store = u9.props.store,
                        SelectedKit = u9.state.selectedKit,

                        SetSelectedKit = function(p10) -- Line: 108, Name: SetSelectedKit
                            -- upvalues: u9 (copy), u2 (ref)
                            u9:setState({
                                selectedKit = p10 or u2.None,
                                selectedBundle = u2.None
                            });
                        end
                    }) }), u2.createElement(TrainingRoomKitSelectionRight, {
                    SelectedKit = u9.state.selectedKit,
                    SelectedBundle = u9.state.selectedBundle,
                    Size = UDim2.fromScale(0.27, 1),
                    Position = UDim2.fromScale(0.73, 0),
                    store = u9.props.store
                }) }) }) });
end;

function v4.willUnmount(p11) -- Line: 127
    p11.alive = false;
end;

return {
    TrainingRoomKitSelectionApp = v3.connect(function(p12, p13) -- Line: 131
        local v14 = {
            store = p12
        };

        for i, v in p13 do
            v14[i] = v;
        end;

        return v14;
    end)(v4)
};