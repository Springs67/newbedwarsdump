-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local v11 = v3.new(u2)(function(p5, p6) -- Line: 12
    -- upvalues: Workspace (copy), u2 (copy), TopBarCard (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy)
    local useEffect = p6.useEffect;
    local v7, u8 = p6.useState(1);
    useEffect(function() -- Line: 16
        -- upvalues: Workspace (ref), u8 (copy)
        local u10 = Workspace:GetAttributeChangedSignal("LuckyBlockLuck"):Connect(function() -- Line: 17
            -- upvalues: Workspace (ref), u8 (ref)
            local v9 = Workspace:GetAttribute("LuckyBlockLuck");

            if v9 ~= nil then
                u8((math.round(v9)));
            end;
        end);

        return function() -- Line: 23
            -- upvalues: u10 (copy)
            u10:Disconnect();
        end;
    end, {});

    return u2.createElement(TopBarCard, {
        LayoutOrder = p5.LayoutOrder
    }, { u2.createElement("ImageLabel", {
            Image = "rbxassetid://17172512131",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 16, 0, 16),
            ImageColor3 = Color3.fromRGB(54, 158, 15)
        }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Current Luck",
                    TextSize = 14,
                    Font = Enum.Font.SourceSansBold,
                    TextColor3 = Color3.fromRGB(54, 158, 15),
                    Limits = Vector2.new(300, 60)
                }) }) }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 16,
            Text = tostring(v7),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        }) });
end);

return {
    HudLuckyBlockLuckHud = v4.connect(function(p12, p13) -- Line: 60
        local v14 = {};

        for i, v in p13 do
            v14[i] = v;
        end;

        return v14;
    end)(v11)
};