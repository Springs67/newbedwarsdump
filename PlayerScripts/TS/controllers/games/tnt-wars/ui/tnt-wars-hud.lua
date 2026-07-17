-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TNTWarsBlockCounter = RuntimeLib.import(script, script.Parent, "tnt-wars-block-counter").TNTWarsBlockCounter;
local TNTWarsHpBar = RuntimeLib.import(script, script.Parent, "tnt-wars-hp-bar").TNTWarsHpBar;
local TNTWarsLogo = RuntimeLib.import(script, script.Parent, "tnt-wars-logo").TNTWarsLogo;
local u2 = UDim2.fromScale(0.1, -2);
local u3 = UDim2.fromScale(0.175, 0.2);
local u4 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v5 = u1.Component:extend("TNTWarsHud");

function v5.init(p6) -- Line: 18
    -- upvalues: u1 (copy)
    p6.hudRef = u1.createRef();
end;

function v5.render(p7) -- Line: 21
    -- upvalues: u1 (copy), u2 (copy), TNTWarsHpBar (copy), Theme (copy), TNTWarsLogo (copy), TNTWarsBlockCounter (copy)
    return u1.createFragment({
        TNTWarsHud = u1.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, {
            HudContainer = u1.createElement("Frame", {
                [u1.Ref] = p7.hudRef,
                Size = UDim2.fromScale(0.65, 0.4),
                Position = u2,
                BackgroundTransparency = 1,
                BorderSizePixel = 0
            }, {
                u1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.1, 0),
                    PaddingRight = UDim.new(0.1, 0)
                }),
                u1.createElement(TNTWarsHpBar, {
                    teamLabel = "FRIENDLY",
                    cores = p7.props.friendlyCores,
                    containerPosition = UDim2.fromScale(0.2, 0.2),
                    barAnchorPoint = Vector2.new(0, 0),
                    barColor = Theme.mcGreen,
                    teamLabelPos = UDim2.fromScale(0.4, -0.085)
                }),
                u1.createElement(TNTWarsLogo),
                u1.createElement(TNTWarsBlockCounter),
                u1.createElement(TNTWarsHpBar, {
                    teamLabel = "ENEMY",
                    cores = p7.props.enemyCores,
                    containerPosition = UDim2.fromScale(0.8, 0.2),
                    barAnchorPoint = Vector2.new(1, 0),
                    barColor = Theme.mcRed,
                    teamLabelPos = UDim2.fromScale(0.075, -0.085)
                })
            })
        })
    });
end;

function v5.didMount(p8) -- Line: 59
    -- upvalues: TweenService (copy), u4 (copy), u3 (copy)
    local v9 = p8.hudRef:getValue();

    if not v9 then
        return nil;
    end;

    TweenService:Create(v9, u4, {
        Position = u3
    }):Play();
end;

return {
    TNTWarsHud = v5
};