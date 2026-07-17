-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MapSaveCard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "map-tab", "map-save-card").MapSaveCard;
local MapSaveUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomMatchesMapSaves = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: MapSaveUtil (copy), u2 (copy), Theme (copy), ColorUtil (copy), DeviceUtil (copy), KnitClient (copy), CircularSpinner (copy), MapSaveCard (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(not u4.MapSaves);
        local v8;

        if u4.MapSaves then
            v8 = u4.MapSaves[1];
        else
            v8 = nil;
        end;

        local u9, u10 = useState(v8);

        local function v17() -- Line: 20
            -- upvalues: MapSaveUtil (ref), u4 (copy), u2 (ref), Theme (ref), ColorUtil (ref)
            local MapSaves = u4.MapSaves;
            local v11 = MapSaves ~= nil and #MapSaves or MapSaves;
            local v12 = MapSaveUtil.MAX_MAP_SAVES - (v11 == nil and 0 or v11);
            local v13 = false;
            local v14 = 0;
            local v15 = {};

            while true do
                if v13 then
                    v14 = v14 + 1;
                else
                    v13 = true;
                end;

                if v14 >= v12 then
                    return v15;
                end;

                local v16 = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Theme.backgroundTertiary,
                    LayoutOrder = os.time() + 1
                }, { u2.createElement("TextLabel", {
                        Text = "<b>EMPTY SAVE SLOT</b>",
                        RichText = true,
                        TextScaled = true,
                        TextTransparency = 0.5,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.75, 0.3),
                        TextColor3 = ColorUtil.hexColor(9541119)
                    }) });
                table.insert(v15, v16);
            end;
        end;

        useEffect(function() -- Line: 67
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u7 (copy), u4 (copy)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.CustomMatchController:getMySavedMaps():andThen(function() -- Line: 70
                    -- upvalues: u7 (ref)
                    u7(false);
                end);
            end;

            local MapSaves = u4.MapSaves;

            if MapSaves ~= nil then
                MapSaves = MapSaves[1];
            end;

            if MapSaves then
                u4.setMapInfo({
                    queueType = MapSaves.queueType,
                    selectedMap = {
                        id = MapSaves.code,
                        name = MapSaves.name,
                        thumbnail = "rbxassetid://" .. tostring(MapSaves.image)
                    }
                });

                return;
            end;

            u4.setMapInfo(nil);
        end, {});
        local v18 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 8)
            }) };
        local v20 = #v19;
        local v21 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 14)
        };
        local MapSaves = u4.MapSaves;
        local v22 = MapSaves ~= nil and #MapSaves or MapSaves;
        v21.Text = "<b>SELECT MAP SAVE (" .. tostring(v22 == nil and 0 or v22) .. "/" .. tostring(MapSaveUtil.MAX_MAP_SAVES) .. ")</b>";
        v21.TextXAlignment = Enum.TextXAlignment.Left;
        v21.RichText = true;
        v21.TextColor3 = Color3.new(1, 1, 1);
        v21.Font = Enum.Font.Roboto;
        v21.TextTransparency = 0.1;
        v21.TextSize = 14;
        v19[v20 + 1] = u2.createElement("TextLabel", v21);
        local v23;

        if v6 then
            v23 = u2.createElement(CircularSpinner, {
                Size = UDim2.fromScale(0.5, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        else
            local MapSaves2 = u4.MapSaves;
            local v24;

            if MapSaves2 == nil then
                v24 = MapSaves2;
            else
                local function v36(u25, p26) -- Line: 136
                    -- upvalues: u9 (copy), u2 (ref), MapSaveCard (ref), u10 (copy), u4 (copy), Theme (ref), ColorUtil (ref)
                    local u27 = u9 and u9.code == u25.code;
                    local createElement = u2.createElement;
                    local v32 = {
                        MapSave = u25,

                        OnClick = function() -- Line: 140, Name: OnClick
                            -- upvalues: u10 (ref), u25 (copy), u4 (ref)
                            u10(u25);
                            u4.setMapInfo({
                                queueType = u25.queueType,
                                selectedMap = {
                                    id = u25.code,
                                    name = u25.name
                                }
                            });
                        end,

                        OnHover = function(p28) -- Line: 150, Name: OnHover
                            -- upvalues: u27 (copy)
                            if u27 then
                                return nil;
                            end;

                            local v29 = p28:FindFirstChildWhichIsA("UIStroke");

                            if v29 then
                                v29.Enabled = true;
                            end;
                        end,

                        OnHoverOut = function(p30) -- Line: 159, Name: OnHoverOut
                            -- upvalues: u27 (copy)
                            if u27 then
                                return nil;
                            end;

                            local v31 = p30:FindFirstChildWhichIsA("UIStroke");

                            if v31 then
                                v31.Enabled = false;
                            end;
                        end,

                        FrameProps = {
                            LayoutOrder = p26
                        }
                    };
                    local v33 = {};
                    local createElement2 = u2.createElement;
                    local v34 = {};
                    local v35;

                    if u27 then
                        v35 = Theme.textPrimary;
                    else
                        v35 = ColorUtil.WHITE;
                    end;

                    v34.Color = v35;
                    v34.Thickness = u27 and 2 or 1;
                    v34.Enabled = u27 and true or false;
                    v33[1] = createElement2("UIStroke", v34);

                    return createElement(MapSaveCard, v32, v33);
                end;

                v24 = table.create(#MapSaves2);

                for i, v in MapSaves2 do
                    v24[i] = v36(v, i - 1, MapSaves2);
                end;
            end;

            local v37 = {
                WaitForAbsoluteSize = true,
                ScrollingFrameProps = {
                    LayoutOrder = 3,
                    Size = UDim2.new(1, 0, 1, 0)
                }
            };
            local v38 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2),
                    PaddingLeft = UDim.new(0, 4)
                }), u2.createElement("UIGridLayout", {
                    FillDirectionMaxCells = 4,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    CellPadding = UDim2.new(0, 6, 0, 6),
                    CellSize = UDim2.new(0.24, -7, 0, 205),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v39 = #v38;

            if v24 then
                for i, v in v24 do
                    v38[v39 + i] = v;
                end;
            end;

            local v40 = #v38;

            for i, v in v17() do
                v38[v40 + i] = v;
            end;

            v23 = u2.createElement(AutoCanvasScrollingFrame, v37, v38);
        end;

        local v41 = {
            Size = UDim2.new(1, 0, 1, -22)
        };
        local v42 = {
            [#v42 + 1] = v23
        };
        v19[v20 + 2] = u2.createElement(Empty, v41, v42);

        return u2.createFragment({
            CustomMatchesMapSaves = u2.createElement(Empty, v18, v19)
        });
    end)
};