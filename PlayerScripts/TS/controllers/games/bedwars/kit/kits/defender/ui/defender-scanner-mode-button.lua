-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance");
local DefenderScannerMode = v3.DefenderScannerMode;
local DefenderScannerUtil = v3.DefenderScannerUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;

local function getModeColor(p4) -- Line: 10
    -- upvalues: DefenderScannerMode (copy)
    if p4 == DefenderScannerMode.REFUND then
        return Color3.fromRGB(72, 190, 108);
    end;

    if p4 == DefenderScannerMode.UPGRADE then
        return Color3.fromRGB(255, 203, 75);
    end;

    local _ = p4 == DefenderScannerMode.PLACE;

    return Color3.fromRGB(94, 190, 255);
end;

return {
    DefenderScannerModeButton = v2.new(u1)(function(u5) -- Line: 24
        -- upvalues: getModeColor (copy), u1 (copy), DefenderScannerUtil (copy), getItemMeta (copy), ItemType (copy)
        local v6 = u5.activeMode == u5.mode;
        local v7 = getModeColor(u5.mode);
        local v8 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v9 = { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.8
            }) };
        local _ = #v9;
        local v10 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v7,
            BackgroundTransparency = v6 and 0.72 or 1,
            BorderSizePixel = 0,

            [u1.Event.Activated] = function() -- Line: 45
                -- upvalues: u5 (copy)
                u5.ChangeMode(u5.mode);
            end
        };
        local v11 = { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v12 = #v11;
        local v13;

        if v6 then
            v13 = u1.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0,
                Color = v7
            });
        else
            v13 = v6;
        end;

        if v13 then
            v11[v12 + 1] = v13;
        end;

        local _ = #v11;
        local v14 = {
            Size = UDim2.fromScale(0.82, 0.82),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v15 = DefenderScannerUtil.getModeIcon(u5.mode);

        if v15 == nil then
            local image = getItemMeta(ItemType.DEFENSE_SCANNER).image;
            v15 = image == nil and "" or image;
        end;

        v14.Image = v15;
        local v16;

        if v6 then
            v16 = Color3.fromRGB(255, 255, 255);
        else
            v16 = Color3.fromRGB(190, 208, 222);
        end;

        v14.ImageColor3 = v16;
        v14.ImageTransparency = v6 and 0 or 0.35;
        v14.ScaleType = Enum.ScaleType.Fit;
        v14.BorderSizePixel = 0;
        v14.BackgroundTransparency = 1;
        v11.ModeIcon = u1.createElement("ImageLabel", v14, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v9.ScannerModeButton = u1.createElement("ImageButton", v10, v11);

        return u1.createFragment({
            ScannerModeButtonContainer = u1.createElement("Frame", v8, v9)
        });
    end)
};