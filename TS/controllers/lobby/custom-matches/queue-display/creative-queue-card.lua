-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    CreativeQueueCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) -- Line: 10
        -- upvalues: u3 (copy), GetTarmacAsset (copy), u2 (copy), ColorUtil (copy), Empty (copy)
        local useEffect = p5.useEffect;
        local useState = p5.useState;
        local v6, u7 = useState(false);
        local u8, _ = useState(u3.createRef());
        local DisplayDto = p4.DisplayDto;

        if DisplayDto ~= nil then
            DisplayDto = DisplayDto.blobData.thumbnailImage;
        end;

        local v9;

        if DisplayDto == "" or not DisplayDto then
            v9 = GetTarmacAsset("NoImage").Image;
        else
            v9 = "rbxassetid://" .. string.gsub(p4.DisplayDto.blobData.thumbnailImage, "rbxassetid://", "");
        end;

        useEffect(function() -- Line: 20
            -- upvalues: u2 (ref), u7 (copy), u8 (copy)
            local u10 = u2.new();
            local u11 = true;
            u10:GiveTask(function() -- Line: 23
                -- upvalues: u11 (ref)
                u11 = false;

                return u11;
            end);
            u7(false);
            task.delay(0.5, function() -- Line: 28
                -- upvalues: u11 (ref), u8 (ref), u7 (ref)
                if not u11 then
                    return nil;
                end;

                local v12 = u8:getValue();

                if v12 ~= nil then
                    v12 = v12.IsLoaded;
                end;

                if v12 ~= true then
                    u7(true);

                    while true do
                        local v13 = task.wait(0.05);

                        if v13 ~= 0 and (v13 == v13 and v13) then
                            v13 = u11;
                        end;

                        if v13 == 0 or (v13 ~= v13 or not v13) then
                            break;
                        end;

                        local v14 = u8:getValue();

                        if v14 ~= nil then
                            v14 = v14.IsLoaded;
                        end;

                        if v14 == true then
                            u7(false);

                            return;
                        end;
                    end;
                end;
            end);

            return function() -- Line: 59
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, { p4.DisplayDto });
        local DisplayDto2 = p4.DisplayDto;

        if DisplayDto2 then
            local v15 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7213114754098361, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v16 = { u3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0.03278688524590164, 0)
                }), u3.createElement("Frame", {
                    LayoutOrder = 1,
                    BackgroundTransparency = 0.45,
                    Size = UDim2.fromScale(1, 0.09836065573770492),
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        Padding = UDim.new(0.045454545454545456, 0)
                    }), u3.createElement("Frame", {
                        LayoutOrder = 1,
                        BackgroundColor3 = ColorUtil.hexColor(16719390),
                        Size = UDim2.fromScale(0.2727272727272727, 1)
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(0.08, 0)
                        }), u3.createElement("TextLabel", {
                            Text = "LIVE",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            Font = Enum.Font.ArialBold,
                            Size = UDim2.fromScale(0.95, 0.95),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            TextColor3 = ColorUtil.WHITE,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center
                        }) }), u3.createElement("TextLabel", {
                        LayoutOrder = 2,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Text = tostring(p4.DisplayDto.players) .. " playing",
                        Font = Enum.Font.ArialBold,
                        Size = UDim2.fromScale(0.7272727272727273, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }) }) };
            local v17 = #v16;
            local v18 = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.7213114754098361)
            };
            local v19 = { u3.createElement("ImageLabel", {
                    [u3.Ref] = u8,
                    Size = UDim2.fromScale(1, 1),
                    Image = v9,
                    ScaleType = Enum.ScaleType.Crop,
                    BackgroundColor3 = ColorUtil.BLACK,
                    BackgroundTransparency = v6 and 1 or 0.8,
                    ImageTransparency = v6 and 1 or 0.2
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.08, 0)
                    }) }) };
            local v20 = #v19;

            if v6 then
                v6 = u3.createElement("ImageLabel", {
                    Image = "rbxassetid://14721220192",
                    ImageTransparency = 0.2,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Crop
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.08, 0)
                    }) });
            end;

            if v6 then
                v19[v20 + 1] = v6;
            end;

            v16[v17 + 1] = u3.createElement(Empty, v18, v19);
            v16[v17 + 2] = u3.createElement("TextLabel", {
                LayoutOrder = 3,
                TextScaled = true,
                BackgroundTransparency = 0.45,
                AutoLocalize = false,
                Text = p4.DisplayDto.blobData.mapTitle,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(1, 0.19672131147540983),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                BackgroundColor3 = ColorUtil.BLACK
            });
            DisplayDto2 = u3.createElement("Frame", v15, v16);
        end;

        local v21 = {
            AlwaysOnTop = true,
            MaxDistance = 90,
            Adornee = p4.Adornee,
            Enabled = p4.DisplayDto ~= nil
        };
        local v22 = {};
        local v23 = #v22;

        if DisplayDto2 then
            v22[v23 + 1] = DisplayDto2;
        end;

        return u3.createElement("SurfaceGui", v21, v22);
    end)
};