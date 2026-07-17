-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    MapCreditsBillboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 6
        -- upvalues: u1 (copy), Empty (copy)
        local _ = p3.useState;
        local v4 = {
            MapCreditsBillboardTitle = u1.createFragment({
                MapCreditsBillboardTitle = u1.createElement("BillboardGui", {
                    Brightness = 2.5,
                    MaxDistance = 100,
                    StudsOffset = Vector3.new(0, 6.25, 0),
                    Size = UDim2.new(15, 0, 2, 0)
                }, {
                    Title = u1.createElement("TextLabel", {
                        Text = "MAP CREDITS",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(255, 204, 0)
                    })
                })
            })
        };
        local _ = #v4;
        local v5 = {
            Brightness = 1.25,
            MaxDistance = 100,
            StudsOffset = Vector3.new(0, 1.5, 0),
            Size = UDim2.new(15, 0, 7, 0)
        };
        local v6 = {};
        local v7 = {
            BackgroundTransparency = 0.8,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v8 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0)
            }), u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }) };
        local v9 = #v8;
        local v10;

        if u2.Image == nil then
            v10 = false;
        else
            v10 = u1.createFragment({
                MapName = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.4),
                    Image = "rbxassetid://" .. u2.Image
                }, { u1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        end;

        if v10 then
            v8[v9 + 1] = v10;
        end;

        local _ = #v8;
        v8.MapName = u1.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.25),
            Text = u2.MapName,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        });
        local Creators = u2.Creators;

        local function v14(p11, p12) -- Line: 86
            -- upvalues: u2 (copy), u1 (ref)
            local v13 = {
                Size = UDim2.new(1, 0, 1 / #u2.Creators, 0)
            };
            local username = p11.username;
            v13.Text = ((p12 == 0 and "By " or "") .. p11.displayName) .. ((username == "" or not username) and "" or " (@" .. p11.username .. ")");
            v13.TextScaled = true;
            v13.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
            v13.TextColor3 = Color3.fromRGB(253, 253, 32);
            v13.BackgroundTransparency = 1;
            v13.LayoutOrder = 4;

            return u1.createFragment({
                CreatorName = u1.createElement("TextLabel", v13)
            });
        end;

        local v15 = table.create(#Creators);

        for i, v in Creators do
            v15[i] = v14(v, i - 1, Creators);
        end;

        local v16 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, u2.Image == nil and 0.6 or 0.2)
        };
        local v17 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }) };
        local v18 = #v17;

        for i, v in v15 do
            v17[v18 + i] = v;
        end;

        v8.CreatorsList = u1.createElement(Empty, v16, v17);
        v6[#v6 + 1] = u1.createElement("Frame", v7, v8);
        v4.MapCreditsBillboardBody = u1.createFragment({
            MapCreditsBillboardBody = u1.createElement("BillboardGui", v5, v6)
        });

        return u1.createFragment(v4);
    end)
};