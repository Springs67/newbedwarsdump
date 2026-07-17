-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local ImageGrid = v1.ImageGrid;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getMapMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local u4 = GetTarmacAsset("NoImage");

return {
    CustomMatchesClassicMaps = v3.new(u2)(function(u5, p6) -- Line: 11
        -- upvalues: u4 (copy), getMapMeta (copy), u2 (copy), Empty (copy), ImageGrid (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local maps = u5.SelectedGamemode.metadata.maps;

        local function _(p7) -- Line: 16
            return p7.mapName;
        end;

        local v8 = table.create(#maps);

        for i, v in maps do
            local _ = i - 1;
            v8[i] = v.mapName;
        end;

        table.sort(v8);

        local function v14(p9) -- Line: 28
            -- upvalues: u4 (ref), getMapMeta (ref)
            local v10 = u4;
            local v11 = string.split(p9, "_")[1];
            local v12 = getMapMeta(p9);

            if v12 ~= nil then
                v12 = v12.mapImage;
            end;

            local v13;

            if v11 == "" then
                v13 = v11;
            elseif v11 then
                v13 = v12;
            else
                v13 = v11;
            end;

            if v13 ~= "" and v13 then
                v10 = v12[v11] or u4;
            end;

            return {
                asset = v10,
                alt = string.gsub(string.split(p9, "_")[2], "-", " "),
                id = p9
            };
        end;

        local v15 = table.create(#v8);

        for i, v in v8 do
            v15[i] = v14(v, i - 1, v8);
        end;

        table.sort(v15, function(p16, p17) -- Line: 56
            if p16.id == "to4_Sandbox" then
                return true;
            end;

            if p17.id == "to4_Sandbox" then
                return false;
            end;

            return p16.id < p17.id;
        end);
        table.insert(v15, 1, {
            alt = "Random",
            id = "",
            asset = u4
        });
        useEffect(function() -- Line: 73
            -- upvalues: u5 (copy)
            u5.setMapInfo({
                queueType = u5.SelectedGamemode.queueType,
                selectedMap = {
                    name = "Random",
                    id = ""
                }
            });
        end, { u5.SelectedGamemode });
        local v18 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v18[i] = v;
            end;
        end;

        return u2.createFragment({
            CustomMatchesDefaultMaps = u2.createElement(Empty, v18, {
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextTransparency = 0.1,
                    TextSize = 14,
                    Size = UDim2.new(1, 0, 0, 14),
                    Text = "<b>SELECT A MAP (" .. tostring(#v15) .. ")</b>",
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.new(1, 1, 1),
                    Font = Enum.Font.Roboto
                }),
                [u5.SelectedGamemode.metadata.title] = u2.createElement(ImageGrid, {
                    UpdateContainerSize = false,
                    ToFriendlyCase = false,
                    Size = UDim2.new(1, 0, 1, -10),
                    Position = UDim2.fromOffset(0, 22),
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                    Images = v15,

                    OnSelectionChange = function(p19, p20, p21) -- Line: 111, Name: OnSelectionChange
                        -- upvalues: u5 (copy)
                        u5.setMapInfo({
                            queueType = u5.SelectedGamemode.queueType,
                            selectedMap = {
                                id = p19,
                                name = p20,
                                thumbnail = p21
                            }
                        });
                    end,

                    ImageSize = UDim2.new(0.24, 0, 0, 86)
                })
            })
        });
    end)
};