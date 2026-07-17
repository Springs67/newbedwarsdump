-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local TooltipContainer = v1.TooltipContainer;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local LuckyBlockRotationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-rotation-util").LuckyBlockRotationUtil;
local v16 = v3.new(u2)(function(p5, p6) -- Line: 12
    -- upvalues: Workspace (copy), LuckyBlockRotationUtil (copy), u2 (copy), TopBarCard (copy), TooltipContainer (copy), AutoSizedText (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState("");
    local v9, u10 = useState("Lucky Blocks");
    useEffect(function() -- Line: 17
        -- upvalues: Workspace (ref), LuckyBlockRotationUtil (ref), u8 (copy), u10 (copy)
        local v11 = Workspace:GetAttribute("LuckyBlockTheme");

        if v11 ~= nil then
            local v12 = LuckyBlockRotationUtil.getLuckyBlockIcon(v11);
            u8(v12 == nil and "" or v12);
            u10(LuckyBlockRotationUtil.getNameOfTheme(v11));
        end;

        local u15 = Workspace:GetAttributeChangedSignal("LuckyBlockTheme"):Connect(function() -- Line: 27
            -- upvalues: Workspace (ref), LuckyBlockRotationUtil (ref), u8 (ref), u10 (ref)
            local v13 = Workspace:GetAttribute("LuckyBlockTheme");

            if v13 ~= nil then
                local v14 = LuckyBlockRotationUtil.getLuckyBlockIcon(v13);
                u8(v14 == nil and "" or v14);
                u10(LuckyBlockRotationUtil.getNameOfTheme(v13));
            end;
        end);

        return function() -- Line: 38
            -- upvalues: u15 (copy)
            u15:Disconnect();
        end;
    end, {});

    return u2.createElement(TopBarCard, {
        LayoutOrder = p5.LayoutOrder
    }, { u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = v7,
            Size = UDim2.new(0, 20, 0, 20),
            ImageColor3 = Color3.fromRGB(255, 255, 255)
        }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = v9,
                    Font = Enum.Font.SourceSansBold,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Limits = Vector2.new(300, 60)
                }) }) }) });
end);

return {
    LuckyBlockThemeHud = v4.connect(function(p17, p18) -- Line: 65
        local v19 = {};

        for i, v in p18 do
            v19[i] = v;
        end;

        return v19;
    end)(v16)
};