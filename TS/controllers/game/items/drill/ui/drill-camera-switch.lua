-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local HttpService = v4.HttpService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v5 = u3.Component:extend("EngineerCameraSwitch");

function v5.init(u6, p7) -- Line: 17
    -- upvalues: u2 (copy), u1 (copy), u3 (copy), SoundManager (copy), GameSound (copy)
    u6.maid = u2.new();
    u6.sizeMotor = u1.GroupMotor.new({
        x = 65,
        y = 50
    });
    local v8, v9 = u3.createBinding({
        x = 65,
        y = 50
    });
    u6.size = v8;
    u6.setSize = v9;
    u6.sizeMotor:onStep(u6.setSize);

    function u6.activatedFunc() -- Line: 28
        -- upvalues: u6 (copy), u1 (ref), SoundManager (ref), GameSound (ref)
        u6.props.clicked();
        u6.sizeMotor:setGoal({
            x = u1.Spring.new(85, {
                frequency = 4,
                dampingRatio = 1
            }),
            y = u1.Spring.new(70, {
                frequency = 4,
                dampingRatio = 1
            })
        });
        SoundManager:playSound(GameSound.UI_CLICK);
        task.delay(0.1, function() -- Line: 41
            -- upvalues: u6 (ref), u1 (ref)
            u6.sizeMotor:setGoal({
                x = u1.Spring.new(65, {
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

function v5.render(p10) -- Line: 55
    -- upvalues: Theme (copy), u3 (copy)
    local v12 = {
        BorderSizePixel = 0,
        AnchorPoint = p10.props.anchorPoint,
        Position = p10.props.position,
        Size = p10.size:map(function(p11) -- Line: 59
            return UDim2.fromOffset(p11.x, p11.y);
        end),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v13 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }) };
    local v14 = #v13;
    local v15 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5) + p10.props.iconShift,
        Size = UDim2.fromScale(0.6, 0.6),
        BackgroundTransparency = 1,
        Image = p10.props.imageId,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = "Fit",
        [u3.Event.MouseButton1Click] = p10.activatedFunc
    };
    v13[v14 + 1] = u3.createElement("ImageButton", v15);
    local v16 = #p10.props.inputDisplay > 0;

    if v16 then
        local v17 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(0.4, 0, 0.4, 0),
            Position = UDim2.fromScale(0.5, 0.5) + p10.props.textShift,
            BackgroundTransparency = 1,
            Text = "(" .. p10.props.inputDisplay .. ")",
            TextScaled = true,
            Font = "SourceSansBold",
            TextColor3 = Theme.textPrimary
        };
        v16 = u3.createElement("TextLabel", v17);
    end;

    if v16 then
        v13[v14 + 2] = v16;
    end;

    return u3.createElement("Frame", v12, v13);
end;

function v5.didMount(u18) -- Line: 105
    -- upvalues: HttpService (copy), ContextActionService (copy)
    local u19 = HttpService:GenerateGUID(false);
    ContextActionService:BindAction("switch-camera-" .. u19, function(p20, p21, p22) -- Line: 107
        -- upvalues: u18 (copy)
        if p21 == Enum.UserInputState.End then
            u18.activatedFunc();
        end;
    end, false, unpack(u18.props.inputTypes));
    u18.maid:GiveTask(function() -- Line: 112
        -- upvalues: ContextActionService (ref), u19 (copy)
        ContextActionService:UnbindAction("switch-camera-" .. u19);
    end);
end;

function v5.willUnmount(p23) -- Line: 116
    p23.maid:DoCleaning();
end;

return {
    EngineerCameraSwitch = v5
};