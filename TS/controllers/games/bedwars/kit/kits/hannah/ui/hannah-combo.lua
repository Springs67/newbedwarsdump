-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameTheme = v1.GameTheme;
local ProgressBar = v1.ProgressBar;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local v18 = v4.new(u3)(function(p6, p7) -- Line: 14
    -- upvalues: BalanceFile (copy), u2 (copy), default (copy), Linear (copy), ColorUtil (copy), GameTheme (copy), u3 (copy), ProgressBar (copy)
    local useEffect = p7.useEffect;
    local v8, u9 = p7.useState(BalanceFile.HANNAH_COMBO_EXPIRATION_SEC);
    useEffect(function() -- Line: 18
        -- upvalues: u2 (ref), default (ref), BalanceFile (ref), Linear (ref), u9 (copy)
        local u10 = u2.new();
        local u12 = default(BalanceFile.HANNAH_COMBO_EXPIRATION_SEC, Linear, function(p11) -- Line: 20
            -- upvalues: u9 (ref)
            u9(1 - p11);
        end);
        u10:GiveTask(function() -- Line: 23
            -- upvalues: u12 (copy)
            u12:Cancel();
        end);

        return function() -- Line: 26
            -- upvalues: u10 (copy)
            u10:DoCleaning();
        end;
    end, { p6.combo });
    local v13 = ColorUtil.hexColor(16686918);

    if p6.combo > 1 then
        v13 = ColorUtil.hexColor(16676678);
    end;

    if p6.combo > 2 then
        v13 = ColorUtil.hexColor(16664149);
    end;

    local v14 = {
        BorderSizePixel = 0,
        Size = GameTheme.actionBarButtonSize,
        BackgroundTransparency = p6.combo == 0 and 1 or 0.4,
        BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    };
    local v15 = {};
    local v16 = #v15;
    local v17;

    if p6.combo > 0 then
        v17 = u3.createFragment({
            HannahCombo = u3.createFragment({
                HannahCombo = u3.createElement("TextLabel", {
                    RichText = true,
                    LayoutOrder = 100,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.9, 0.9),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.WHITE) .. "\">COMBO:</font> <b><font color=\"" .. ColorUtil.richTextColor(v13) .. "\">" .. tostring(p6.combo) .. "</font></b>",
                    Font = Enum.Font.JosefinSans,
                    TextColor3 = ColorUtil.WHITE
                })
            }),
            u3.createElement(ProgressBar, {
                Size = UDim2.fromScale(1, 0.12),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0),
                BarColor = ColorUtil.hexColor(16772019),
                Progress = v8
            })
        });
    else
        v17 = false;
    end;

    if v17 then
        v15[v16 + 1] = v17;
    end;

    v15[#v15 + 1] = u3.createElement("UIAspectRatioConstraint", {
        AspectRatio = 4
    });

    return u3.createElement("ImageLabel", v14, v15);
end);

return {
    HannahCombo = v5.connect(function(p19, p20) -- Line: 78
        local v21 = {};

        for i, v in p20 do
            v21[i] = v;
        end;

        v21.combo = p19.Kit.hannahCombo;

        return v21;
    end)(v18)
};