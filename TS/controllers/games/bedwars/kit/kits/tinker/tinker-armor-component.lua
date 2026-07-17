-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local TinkerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "tinker", "tinker-util").TinkerBalance;
local ShieldType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TinkerArmorComponent = v4.new(u3)(function(p5, p6) -- Line: 13
        -- upvalues: EntityUtil (copy), u3 (copy), ProgressBar (copy), Theme (copy), TinkerBalance (copy), ColorUtil (copy), u2 (copy), ShieldType (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(0);
        local u9 = EntityUtil:getEntity(p5.player);

        if not u9 then
            return u3.createElement(ProgressBar, {
                AcceptZero = true,
                Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
                Progress = 0 / TinkerBalance:getMaxShield(p5.player),
                BarGradient = ColorSequence.new(ColorUtil.hexColor(16773050), ColorUtil.hexColor(16777215))
            });
        end;

        useEffect(function() -- Line: 26
            -- upvalues: u2 (ref), u9 (copy), ShieldType (ref), u8 (copy)
            local u10 = u2.new();

            if u9 then
                u10:GiveTask(u9:onShieldChanged(ShieldType.TINKER_MACHINE):Connect(function() -- Line: 29
                    -- upvalues: u9 (ref), ShieldType (ref), u8 (ref)
                    local v11 = u9:getShield(ShieldType.TINKER_MACHINE);
                    u8(v11 == nil and 0 or v11);
                end));
            end;

            return function() -- Line: 37
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, {});
        local createElement = u3.createElement;
        local v12 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.fromScale(0.5, -0.2),
            AnchorPoint = Vector2.new(0.5, 1)
        };
        local v13 = { (u3.createElement(ProgressBar, {
                AcceptZero = true,
                Size = UDim2.new(0.7, 0, 0.1, 0),
                Progress = v7 / TinkerBalance:getMaxShield(p5.player),
                BarGradient = ColorSequence.new(Color3.new(1, 0.53, 0.04), Color3.new(1, 0.53, 0.04))
            })) };
        local createElement2 = u3.createElement;
        local v14 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            Font = "LuckiestGuy",
            ZIndex = 11
        };
        local v15 = math.round(v7);
        v14.Text = tostring(v15) .. "/" .. tostring(TinkerBalance:getMaxShield(p5.player)) .. " SHIELD";
        v14.Size = UDim2.fromScale(0.4, 0.15);
        v14.Position = UDim2.fromScale(0.5, 0.75);
        v14.AnchorPoint = Vector2.new(0.5, 0.35);
        v14.TextColor3 = Color3.fromRGB(255, 255, 255);
        v13.Progress = createElement2("TextLabel", v14);

        return createElement("Frame", v12, v13);
    end)
};