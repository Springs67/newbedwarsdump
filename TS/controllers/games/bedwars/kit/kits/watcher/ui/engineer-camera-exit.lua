-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ContextActionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = u3.Component:extend("EngineerCameraExit");

function v4.init(u5, p6) -- Line: 15
    -- upvalues: u2 (copy), u1 (copy), u3 (copy), SoundManager (copy), GameSound (copy)
    u5.maid = u2.new();
    u5.sizeMotor = u1.GroupMotor.new({
        x = 120,
        y = 50
    });
    local v7, v8 = u3.createBinding({
        x = 120,
        y = 50
    });
    u5.size = v7;
    u5.setSize = v8;
    u5.sizeMotor:onStep(u5.setSize);

    function u5.activatedFunc() -- Line: 26
        -- upvalues: u5 (copy), u1 (ref), SoundManager (ref), GameSound (ref)
        u5.props.activated();
        u5.sizeMotor:setGoal({
            x = u1.Spring.new(140, {
                frequency = 4,
                dampingRatio = 1
            }),
            y = u1.Spring.new(70, {
                frequency = 4,
                dampingRatio = 1
            })
        });
        SoundManager:playSound(GameSound.UI_CLICK);
        task.delay(0.1, function() -- Line: 39
            -- upvalues: u5 (ref), u1 (ref)
            u5.sizeMotor:setGoal({
                x = u1.Spring.new(120, {
                    frequency = 4,
                    dampingRatio = 1
                }),
                y = u1.Spring.new(50, {
                    frequency = 4,
                    dampingRatio = 1
                })
            });
        end);
    end;
end;

function v4.render(p9) -- Line: 53
    -- upvalues: u3 (copy), Theme (copy)
    return u3.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = p9.size:map(function(p10) -- Line: 57
            return UDim2.fromOffset(p10.x, p10.y);
        end),
        BackgroundColor3 = Theme.backgroundPrimary
    }, { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), u3.createElement("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(1, 0, 0.4, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            Text = "<font color=\"rgb(255, 255, 255)\">Exit</font> (" .. p9.props.inputDisplay .. ")",
            RichText = true,
            TextScaled = true,
            Font = "SourceSansBold",
            TextColor3 = Theme.textPrimary,
            [u3.Event.MouseButton1Click] = p9.activatedFunc
        }) });
end;

function v4.didMount(u11) -- Line: 80
    -- upvalues: ContextActionService (copy)
    ContextActionService:BindAction("engineer-camera-exit", function(p12, p13, p14) -- Line: 81
        -- upvalues: u11 (copy)
        if p13 == Enum.UserInputState.End then
            u11.activatedFunc();
        end;
    end, false, unpack(u11.props.inputTypes));
    u11.maid:GiveTask(function() -- Line: 86
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("engineer-camera-exit");
    end);
end;

function v4.willUnmount(p15) -- Line: 90
    p15.maid:DoCleaning();
end;

return {
    EngineerCameraExit = v4
};