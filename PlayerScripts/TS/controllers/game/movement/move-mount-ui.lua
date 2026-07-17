-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MobileButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v3 = RuntimeLib.import(script, script.Parent, "event", "move-mount-event");
local InputActionType = v3.InputActionType;
local MoveMountDirection = v3.MoveMountDirection;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MoveMountUI = v2.new(u1)(function(p4, p5) -- Line: 13
        -- upvalues: Flamework (copy), u1 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy)
        local v6 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController");
        local v7 = string.gsub(v6:getActionKeycodes("MoveMountUp")[1].Name, "Button", "");
        local v8 = string.gsub(v6:getActionKeycodes("MoveMountDown")[1].Name, "Button", "");

        return u1.createFragment({ u1.createElement(MobileButton, {
                Image = BedwarsImageId.UP_MOBILE,
                Position = UDim2.fromScale(0.2, BedwarsUI:getActionBarPosition().Y.Scale),

                OnPressDown = function() -- Line: 21, Name: OnPressDown
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.UP, InputActionType.PRESS);
                end,

                OnPressUp = function() -- Line: 24, Name: OnPressUp
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.UP, InputActionType.RELEASE);
                end
            }, { u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Font = "RobotoCondensed",
                    TextStrokeTransparency = 0,
                    TextXAlignment = "Left",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.3, 0.3),
                    Position = UDim2.fromScale(1.2, 0.5),
                    Text = v7,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
                }) }), u1.createElement(MobileButton, {
                Image = BedwarsImageId.DOWN_MOBILE,
                Position = UDim2.fromScale(0.8, BedwarsUI:getActionBarPosition().Y.Scale),

                OnPressDown = function() -- Line: 45, Name: OnPressDown
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.DOWN, InputActionType.PRESS);
                end,

                OnPressUp = function() -- Line: 48, Name: OnPressUp
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.DOWN, InputActionType.RELEASE);
                end
            }, { u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Font = "RobotoCondensed",
                    TextXAlignment = "Right",
                    TextStrokeTransparency = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.3, 0.3),
                    Position = UDim2.fromScale(-0.2, 0.5),
                    Text = v8,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
                }) }) });
    end)
};