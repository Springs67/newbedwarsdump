-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getClanWarMedalMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").getClanWarMedalMetadata;

return {
    ClanWarMedalsDisplay = v4.new(u3)(function(u5) -- Line: 10
        -- upvalues: u2 (copy), getClanWarMedalMetadata (copy), u3 (copy), ColorUtil (copy), Empty (copy)
        local v6 = {
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = u2.entries(u5.Medals);
        table.sort(v7, function(p8, p9) -- Line: 21
            -- upvalues: getClanWarMedalMetadata (ref)
            return getClanWarMedalMetadata(p8[1]).points > getClanWarMedalMetadata(p9[1]).points;
        end);

        local function v17(p10, p11) -- Line: 25
            -- upvalues: getClanWarMedalMetadata (ref), u5 (copy), u3 (ref), ColorUtil (ref)
            local v12 = p10[2];
            local v13 = getClanWarMedalMetadata(p10[1]);
            local v14 = {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.85),
                Image = v13.icon,
                ScaleType = Enum.ScaleType.Fit,
                LayoutOrder = 3 + p11
            };
            local FrameProps2 = u5.FrameProps;

            if FrameProps2 ~= nil then
                FrameProps2 = FrameProps2.ZIndex;
            end;

            v14.ZIndex = (FrameProps2 == nil and 0 or FrameProps2) + 1;
            local v15 = {};
            local _ = #v15;
            local v16 = {
                TextXAlignment = "Right",
                TextYAlignment = "Bottom",
                TextSize = 10,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 1),
                Text = "x" .. tostring(v12),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            };
            local FrameProps3 = u5.FrameProps;

            if FrameProps3 ~= nil then
                FrameProps3 = FrameProps3.ZIndex;
            end;

            v16.ZIndex = (FrameProps3 == nil and 0 or FrameProps3) + 1;
            v15.Score = u3.createElement("TextLabel", v16, { u3.createElement("UIStroke", {
                    Color = ColorUtil.BLACK
                }) });

            return u3.createFragment({
                MedalIcon = u3.createElement("ImageLabel", v14, v15)
            });
        end;

        local v18 = table.create(#v7);

        for i, v in v7 do
            v18[i] = v17(v, i - 1, v7);
        end;

        local v19 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Right",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 3)
            }) };
        local v20 = #v19;

        for i, v in v18 do
            v19[v20 + i] = v;
        end;

        return u3.createFragment({
            ClanWarMedalsDisplay = u3.createElement(Empty, v6, v19)
        });
    end)
};