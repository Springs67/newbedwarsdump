-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    ObbyWinArea = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) -- Line: 10
        -- upvalues: u3 (copy), ColorUtil (copy), u2 (copy), PlayerRender (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = {
            Face = "Front",
            ResetOnSpawn = false,
            Adornee = p4.Adornee
        };
        local v7 = {};
        local _ = #v7;
        local v8 = {
            Size = UDim2.fromScale(0.5, 0.7),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v9 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local _ = #v9;
        local v10 = 0;
        local v11 = {};

        for _ in p4.WinningPlayers do
            v10 = v10 + 1;
        end;

        v11.Text = "<b>" .. tostring(v10) .. " / " .. tostring(p4.NumActivePlayers) .. "</b>";
        v11.TextColor3 = ColorUtil.WHITE;
        v11.TextScaled = true;
        v11.RichText = true;
        v11.BackgroundTransparency = 1;
        v11.TextXAlignment = "Center";
        v11.Size = UDim2.fromScale(0.95, 0.3);
        v11.LayoutOrder = 1;
        v9.Counter = u3.createElement("TextLabel", v11);
        local v12 = u2.keys(p4.WinningPlayers);

        local function v14(p13) -- Line: 51
            -- upvalues: u3 (ref), PlayerRender (ref)
            return u3.createFragment({
                PlayerRender = u3.createElement(PlayerRender, {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.21, 1),
                    PlayerUserId = p13.UserId
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) })
            });
        end;

        local v15 = table.create(#v12);

        for i, v in v12 do
            v15[i] = v14(v, i - 1, v12);
        end;

        local v16 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.3)
        };
        local v17 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.05, 0)
            }) };
        local v18 = #v17;

        for i, v in v15 do
            v17[v18 + i] = v;
        end;

        v9.PlayerRendersList = u3.createElement(Empty, v16, v17);
        v9.Description = u3.createElement("TextLabel", {
            Text = "<b>Next Scene</b>",
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            TextXAlignment = "Center",
            LayoutOrder = 3,
            TextColor3 = ColorUtil.WHITE,
            Size = UDim2.fromScale(0.95, 0.3),
            Position = UDim2.fromScale(0.5, 0.8),
            AnchorPoint = Vector2.new(0.5, 1)
        });
        v7.Container = u3.createElement(Empty, v8, v9);

        return u3.createFragment({
            ObbyWinAreaSurface = u3.createElement("SurfaceGui", v6, v7)
        });
    end)
};