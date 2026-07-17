-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CLUE_TO_TEXTURE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-scene-constants").CLUE_TO_TEXTURE;

return {
    ClueHud = v2.new(u1)(function(u3, p4) -- Line: 6
        -- upvalues: u1 (copy), CLUE_TO_TEXTURE (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState({});
        useEffect(function() -- Line: 10
            -- upvalues: u3 (copy), u6 (copy)
            local u12 = u3.clueDiscoveredSignal:Connect(function(u7) -- Line: 11
                -- upvalues: u6 (ref)
                u6(function(p8) -- Line: 12
                    -- upvalues: u7 (copy)
                    local v9 = {};
                    local v10 = #v9;
                    local v11 = #p8;
                    table.move(p8, 1, v11, v10 + 1, v9);
                    v9[v10 + v11 + 1] = u7;

                    return v9;
                end);
            end);

            return function() -- Line: 22
                -- upvalues: u12 (copy)
                u12:Disconnect();
            end;
        end, {});
        local v13 = {};
        local _ = #v13;
        local v14 = {
            BorderSizePixel = 0,
            Transparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v15 = {};
        local _ = #v15;

        local function v18(p16, p17) -- Line: 38
            -- upvalues: u1 (ref), CLUE_TO_TEXTURE (ref)
            return u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                Image = CLUE_TO_TEXTURE[p16],
                Size = UDim2.fromScale(1, 1),
                LayoutOrder = 2 + p17,
                ImageColor3 = Color3.fromRGB(78, 252, 223)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        local v19 = table.create(#v5);
        local v20 = {
            ResetOnSpawn = true
        };

        for i, v in v5 do
            v19[i] = v18(v, i - 1, v5);
        end;

        local v21 = {
            BorderSizePixel = 0,
            Transparency = 1,
            Size = UDim2.fromOffset(125, 50),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0.015, 0.985)
        };
        local v22 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }), u1.createElement("TextLabel", {
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Text = "CLUES: " .. tostring(#v5) .. "/3",
                Size = UDim2.fromScale(0.6, 1),
                Font = Enum.Font.RobotoMono,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) };
        local v23 = #v22;

        for i, v in v19 do
            v22[v23 + i] = v;
        end;

        v15.DiscoveredContainer = u1.createElement("Frame", v21, v22);
        v13.ScreenContainer = u1.createElement("Frame", v14, v15);

        return u1.createElement("ScreenGui", v20, v13);
    end)
};