-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local teamBuffMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    SnakeShrineUpgradeFrame = v3.new(u2)(function(u4) -- Line: 13
        -- upvalues: teamBuffMeta (copy), DeviceUtil (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), u2 (copy), BedwarsImageId (copy), Button (copy)
        local v5 = teamBuffMeta[u4.TeamBuffType];
        local v6 = u4.TeamBuffType == u4.SelectedBuff;
        local v7 = DeviceUtil.isSmallScreen();
        local v8 = {
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, 46),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = v6 and 0.6 or 0.3,

            OnClick = function() -- Line: 21, Name: OnClick
                -- upvalues: u4 (copy), SoundManager (ref), GameSound (ref)
                if u4.OnClickedBuff then
                    u4.OnClickedBuff(u4.TeamBuffType);
                    SoundManager:playSound(GameSound.UI_CLICK);
                end;
            end
        };
        local v9 = {};
        local v10 = #v9;
        local v11;

        if v6 then
            local createElement = u2.createElement;
            local v12 = {
                Thickness = 2
            };
            local v13;

            if v6 then
                v13 = Color3.fromHex("#89f692");
            else
                v13 = ColorUtil.WHITE;
            end;

            v12.Color = v13;
            v11 = createElement("UIStroke", v12);
        else
            v11 = v6;
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        local v14 = {
            Position = UDim2.fromScale(-0.05, -0.3)
        };
        local image = v5.image;

        if image == nil then
            image = BedwarsImageId.SNAKE_ICON;
        end;

        v14.Image = image;
        v14.BackgroundTransparency = 1;
        v14.BackgroundColor3 = ColorUtil.BLACK;
        v14.BorderSizePixel = 0;
        v14.Size = UDim2.fromScale(0.3, 1.6);
        v14.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v14.ScaleType = Enum.ScaleType.Crop;
        v14.LayoutOrder = 1;
        v9.BlessingIcon = u2.createElement("ImageLabel", v14);
        local createElement = u2.createElement;
        local v15 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.85, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v16;

        if v6 then
            v16 = Color3.fromHex("#89f692");
        else
            v16 = ColorUtil.WHITE;
        end;

        v15.TextColor3 = v16;
        v15.Text = v5.displayName;
        v15.TextXAlignment = Enum.TextXAlignment.Right;
        v15.TextYAlignment = Enum.TextYAlignment.Center;
        v15.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v9[#v9 + 1] = createElement("TextLabel", v15, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = v7 and 12 or 18
            }) });

        return u2.createElement(Button, v8, v9);
    end)
};