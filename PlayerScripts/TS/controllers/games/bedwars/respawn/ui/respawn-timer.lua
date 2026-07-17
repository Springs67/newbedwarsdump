-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = u4.Component:extend("RespawnTimer");

function u6.init(u7, p8) -- Line: 23
    -- upvalues: u2 (copy), Players (copy), Workspace (copy), default2 (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy)
    u7.alive = true;
    u7.maid = u2.new();
    local RespawnDuration = u7.props.RespawnDuration;
    u7:setState({
        countdownText = u7:getCountdown(RespawnDuration)
    });

    if Players.LocalPlayer then
        u7.maid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("RespawningAtTime"):Connect(function() -- Line: 31
            -- upvalues: Players (ref), RespawnDuration (ref), Workspace (ref)
            local v9 = Players.LocalPlayer:GetAttribute("RespawningAtTime");

            if v9 == nil then
                return nil;
            end;

            local v10 = v9 - Workspace:GetServerTimeNow();
            RespawnDuration = math.max(v10, 0);
        end));
        u7.maid:GiveTask(default2.Client:Get("JailorImprisonSoul"):Connect(function(p11, p12, p13) -- Line: 38
            -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u7 (copy)
            if p13 == Players.LocalPlayer.UserId then
                SoundManager:playSound(GameSound.JAILOR_IMPRISON_SLAM);
                u7:setState({
                    imprisoned = true
                });
            end;
        end));
    end;

    RuntimeLib.Promise.defer(function() -- Line: 47
        -- upvalues: u7 (copy), RespawnDuration (ref)
        while true do
            local v14 = task.wait(0.1);

            if v14 ~= 0 and (v14 == v14 and v14) then
                v14 = u7.alive;
            end;

            if v14 == 0 or (v14 ~= v14 or not v14) then
                return;
            end;

            RespawnDuration = RespawnDuration - 0.1;
            u7:setState({
                countdownText = u7:getCountdown(RespawnDuration)
            });
        end;
    end);
end;

function u6.getCountdown(p15, p16) -- Line: 63
    local v17 = math.max(0, p16);

    return string.format("%.1f", v17);
end;

function u6.didUpdate(p18, p19, p20) -- Line: 67
    -- upvalues: u3 (copy), Lighting (copy), default (copy), InOutQuad (copy)
    if p20.imprisoned ~= p18.state.imprisoned and p18.state.imprisoned then
        local u21 = u3("ColorCorrectionEffect", {
            Parent = Lighting
        });
        local u23 = default(0.4, InOutQuad, function(p22) -- Line: 72
            -- upvalues: u21 (copy)
            if not u21.Parent then
                return nil;
            end;

            u21.Brightness = -0.1 * p22;
            u21.Saturation = -0.8 * p22;
        end);
        p18.maid:GiveTask(function() -- Line: 79
            -- upvalues: u23 (copy)
            return u23:Cancel();
        end);
        p18.maid:GiveTask(u21);
    end;
end;

function u6.render(p24) -- Line: 85
    -- upvalues: GamePlayerUtil (copy), DamageType (copy), u4 (copy), ColorUtil (copy), Empty (copy)
    local v25 = "<b>Respawning in <font color=\"#55FFFF\">" .. p24.state.countdownText .. "</font>s</b>";
    local v26;

    if p24.props.KilledByPlayer then
        v26 = GamePlayerUtil.getGamePlayer(p24.props.KilledByPlayer):getDisplayName();

        if p24.props.DamageType == DamageType.FLAMETHROWER then
            v26 = v26 .. "\'s Flamethrower";
        end;
    else
        v26 = p24.props.DamageType == DamageType.TNT and "TNT" or (p24.props.DamageType == DamageType.INVISIBLE_LANDMINE and "Invisible Landmine" or (p24.props.DamageType == DamageType.MAGMA_BLOCK and "Magma Block" or (p24.props.DamageType == DamageType.TENNIS_BALL and "Tennis Ball" or "Void")));
    end;

    local v27 = {
        Size = UDim2.fromScale(0.6, 0.4),
        Position = UDim2.fromScale(0.5, 0.2),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v28 = { u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 5.478947368421053,
            DominantAxis = "Height"
        }), u4.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            RichText = true,
            TextScaled = true,
            Text = "Killed by " .. v26,
            Size = UDim2.fromScale(1, 0.5),
            Font = Enum.Font.SourceSansBold,
            TextColor3 = ColorUtil.hexColor(16733525),
            AutoLocalize = p24.props.KilledByPlayer == nil
        }), u4.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            RichText = true,
            TextScaled = true,
            Font = "RobotoMono",
            Text = v25,
            Size = UDim2.fromScale(1, 0.25),
            Position = UDim2.fromScale(0, 0.7),
            TextColor3 = ColorUtil.hexColor(5635925)
        }) };
    local v29 = #v28;
    local v30 = p24.state.imprisoned and u4.createElement("TextLabel", {
        Text = "[IMPRISONED]",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        Size = UDim2.fromScale(1, 0.18),
        Position = UDim2.fromScale(0, 1),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextColor3 = ColorUtil.hexColor(16733525)
    });

    if v30 then
        v28[v29 + 1] = v30;
    end;

    return u4.createElement(Empty, v27, v28);
end;

function u6.willUnmount(p31) -- Line: 155
    p31.alive = false;
    p31.maid:DoCleaning();
end;

return {
    RespawnTimerWrapper = function(p32) -- Line: 160, Name: RespawnTimerWrapper
        -- upvalues: u4 (copy), u6 (ref)
        local v33 = {};
        local v34 = {};

        for i, v in p32 do
            v34[i] = v;
        end;

        v33[#v33 + 1] = u4.createElement(u6, v34);

        return u4.createElement("ScreenGui", {}, v33);
    end,

    RespawnTimer = u6
};