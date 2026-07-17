-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local u5 = ColorSequence.new(ColorUtil.hexColor(16711726), ColorUtil.hexColor(10682368));
local v31 = v3.new(u2)(function(u6, p7) -- Line: 11
    -- upvalues: u1 (copy), default (copy), Linear (copy), u2 (copy), ColorUtil (copy), u5 (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local u8, u9 = useState(u6.Health);
    local u10, u11 = useState(u6.Health);
    local u12 = u1.new();
    useEffect(function() -- Line: 17
        -- upvalues: u1 (ref), u12 (copy), u6 (copy), u8 (copy), default (ref), Linear (ref), u9 (copy), u10 (copy), u11 (copy)
        local u13 = u1.new();
        local u14 = true;
        u12:DoCleaning();

        if u6.Health < u8 then
            local u17 = default(0.08, Linear, function(p15) -- Line: 22
                -- upvalues: u6 (ref), u8 (ref), u14 (ref), u9 (ref)
                local v16 = u6.Health * p15 + u8 * (1 - p15);

                if u14 then
                    u9(v16);
                end;
            end);
            u12:GiveTask(function() -- Line: 28
                -- upvalues: u17 (copy)
                u17:Cancel();
            end);
            task.delay(0.3, function() -- Line: 31
                -- upvalues: default (ref), Linear (ref), u6 (ref), u10 (ref), u14 (ref), u11 (ref)
                default(0.3, Linear, function(p18) -- Line: 33
                    -- upvalues: u6 (ref), u10 (ref), u14 (ref), u11 (ref)
                    local v19 = u6.Health * p18 + u10 * (1 - p18);

                    if u14 then
                        u11(v19);
                    end;
                end);
            end);
        else
            u9(u6.Health);
            u11(u6.Health);
        end;

        return function() -- Line: 48
            -- upvalues: u12 (ref), u13 (copy), u14 (ref)
            u12:DoCleaning();
            u13:DoCleaning();
            u14 = false;
        end;
    end, { u6.Health });
    useEffect(function() -- Line: 54
    end, { u6.DisplayStudRange });
    local v20 = {
        ResetOnSpawn = false
    };
    local v21 = {};
    local _ = #v21;
    local v22 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.3865546218487395, 0.055)
    };
    local OffsetY = u6.OffsetY;

    if OffsetY ~= nil then
        OffsetY = OffsetY.X;
    end;

    local OffsetY2 = u6.OffsetY;

    if OffsetY2 ~= nil then
        OffsetY2 = OffsetY2.Y;
    end;

    v22.Position = UDim2.fromScale(0.5 + (OffsetY == nil and 0 or OffsetY), 0.01 + (OffsetY2 == nil and 0.03 or OffsetY2));
    v22.AnchorPoint = Vector2.new(0.5, 0);
    v22.BorderSizePixel = 0;
    local v23 = { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 12.545454545454545
        }), u2.createElement(
            "UIListLayout",
            {
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                FillDirection = "Vertical"
            }
        ) };
    local v24 = #v23;
    local v25 = {
        LayoutOrder = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.8)
    };
    local DisplayName = u6.DisplayName;
    v25.Text = DisplayName == nil and "" or DisplayName;
    v25.Font = Enum.Font.JosefinSans;
    v25.TextColor3 = ColorUtil.WHITE;
    v25.TextScaled = true;
    v25.TextXAlignment = "Center";
    v25.TextYAlignment = "Center";
    v23[v24 + 1] = u2.createElement("TextLabel", v25);
    local v26 = {
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.5)
    };
    local v27 = {};
    local v28 = #v27;
    local v29 = {
        BorderSizePixel = 0,
        BackgroundColor3 = ColorUtil.WHITE
    };
    local MaxHealth = u6.MaxHealth;
    v29.Size = UDim2.fromScale(u10 / (MaxHealth == nil and 1 or MaxHealth), 1);
    v27[v28 + 1] = u2.createElement("Frame", v29);
    local v30 = {
        BackgroundColor3 = ColorUtil.WHITE
    };
    local MaxHealth2 = u6.MaxHealth;
    v30.Size = UDim2.fromScale(u8 / (MaxHealth2 == nil and 1 or MaxHealth2), 1);
    v30.BorderSizePixel = 0;
    v27[v28 + 2] = u2.createElement("Frame", v30, { u2.createElement("UIGradient", {
            Color = u6.Gradient or u5
        }) });
    v23[v24 + 2] = u2.createElement("Frame", v26, v27);
    v21.BossBar = u2.createElement("Frame", v22, v23);

    return u2.createFragment({
        BossBarScreenGui = u2.createElement("ScreenGui", v20, v21)
    });
end);

return {
    BossBarApp = v4.connect(function(p32, p33) -- Line: 154
        local v34 = {
            Health = p32.Bedwars.bossBar.health,
            MaxHealth = p32.Bedwars.bossBar.maxHealth
        };

        for i, v in p33 do
            v34[i] = v;
        end;

        return v34;
    end)(v31)
};