-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local GamepadAction = v1.GamepadAction;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    DroneTntUi = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), ActionButton (copy), default (copy), GamepadAction (copy)
        local useEffect = p5.useEffect;
        local useValue = p5.useValue;
        local v6, u7 = p5.useState(0);
        local u8 = useValue(-1);
        useEffect(function() -- Line: 15
            -- upvalues: u4 (copy), u7 (copy)
            local v9 = u4.Drone:GetAttribute("AmountStoredTNT");
            u7(v9 == nil and 0 or v9);
            local u11 = u4.Drone:GetAttributeChangedSignal("AmountStoredTNT"):Connect(function() -- Line: 22
                -- upvalues: u4 (ref), u7 (ref)
                local v10 = u4.Drone:GetAttribute("AmountStoredTNT");
                u7(v10 == nil and 0 or v10);
            end);

            return function() -- Line: 30
                -- upvalues: u11 (copy)
                u11:Disconnect();
            end;
        end, {});

        if v6 > 0 then
            return u2.createElement(ActionButton, {
                actionName = "drop-tnt",
                priority = 80,

                onActivated = function() -- Line: 37, Name: onActivated
                    -- upvalues: u8 (copy), default (ref)
                    if time() - u8.value > 0.3 then
                        u8.value = time();
                        default.Client:Get("DropTnt"):SendToServer();
                    end;
                end,

                interactionKey = Enum.KeyCode.Z,
                gamepadInteractionKey = GamepadAction.CloseMenu,
                text = "Drop TNT (" .. tostring(v6) .. ") "
            });
        end;

        return u2.createFragment();
    end)
};