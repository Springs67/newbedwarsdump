-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    Searchbar = v4.new(u3)(function(u5, p6) -- Line: 12
        -- upvalues: u3 (copy), u2 (copy), Theme (copy), Padding (copy), DeviceUtil (copy), BedwarsImageId (copy), ColorUtil (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = {};

        for i, v in u5 do
            v7[i] = v;
        end;

        local MaxCharLength = v7.MaxCharLength;
        local u8 = MaxCharLength == nil and 50 or MaxCharLength;
        local u9 = u3.createRef();

        local function v11(p10) -- Line: 25
            -- upvalues: u8 (ref), u5 (copy)
            if u8 < #p10.Text then
                p10.Text = string.sub(p10.Text, 0, 50);

                return nil;
            end;

            local OnTextChange = u5.OnTextChange;

            if OnTextChange ~= nil then
                OnTextChange(p10.Text);
            end;
        end;

        useEffect(function() -- Line: 36
            -- upvalues: u9 (copy), u5 (copy)
            local v12 = u9;

            if v12 ~= nil then
                v12 = v12:getValue();
            end;

            local v13;

            if v12 then
                v13 = u5.InputText;
            else
                v13 = v12;
            end;

            if v13 ~= "" and v13 then
                v12.Text = u5.InputText;
            end;
        end, { u5.InputText });
        local v14 = {};

        for i, v in u5 do
            v14[i] = v;
        end;

        v14.MaxCharLength = nil;
        v14.InputText = nil;
        v14.OnTextChange = nil;
        v14.OnFocusLost = nil;
        v14.PlaceHolderText = nil;
        v14.DisplaySearchButton = nil;
        v14.HideSearchIcon = nil;
        v14.DisableEditing = nil;
        v14.BarColor = nil;
        v14.BarTransparency = nil;
        v14.CornerRadius = nil;
        v14[u3.Children] = nil;
        local v15;

        if u5[u3.Children] then
            v15 = u2.values(u5[u3.Children]);
        else
            v15 = nil;
        end;

        local v16 = {
            Size = UDim2.new(1, 0, 1, -26)
        };
        local v17;

        if u5.DisableEditing then
            v17 = 0.45;
        else
            local BarTransparency = u5.BarTransparency;
            v17 = BarTransparency == nil and 0 or BarTransparency;
        end;

        v16.BackgroundTransparency = v17;
        v16.BorderSizePixel = 0;
        v16.BackgroundColor3 = u5.BarColor or Theme.backgroundTertiary;
        v16.LayoutOrder = 1;

        for i, v in v14 do
            v16[i] = v;
        end;

        if v15 ~= nil then
            local function _(p18) -- Line: 88
                return string.lower(p18.component) == "uipadding";
            end;

            v15 = nil;

            for i, v in v15 do
                local _ = i - 1;

                if string.lower(v.component) == "uipadding" == true then
                    v15 = v;
                    break;
                end;
            end;
        end;

        local v19 = not v15 and u3.createElement(Padding, {
            Padding = {
                Vertical = 5,
                Horizontal = 8,
                Left = u5.HideSearchIcon and 10 or 0
            }
        });
        local v20 = { u3.createElement("UICorner", {
                CornerRadius = u5.CornerRadius or UDim.new(0.1, 0)
            }), u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }) };
        local v21 = #v20;

        if v19 then
            v20[v21 + 1] = v19;
        end;

        local v22 = #v20;
        local v23 = not u5.HideSearchIcon and u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            ImageTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.8 or 0.6),
            Image = BedwarsImageId.SEARCH_SOLID
        });

        if v23 then
            v20[v22 + 1] = v23;
        end;

        local v24 = #v20;
        local v25 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(0.99 - ((u5.DisplaySearchButton and 0.05 or 0) + (u5.HideSearchIcon and 0 or 0.05)), -((u5.DisplaySearchButton and 6 or 0) + (u5.HideSearchIcon and 0 or 6)), 1, 0)
        };
        local v26 = {};
        local v27 = {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 0.7),
            Text = "",
            PlaceholderText = u5.PlaceHolderText,
            BackgroundTransparency = 1,
            BackgroundColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v28;

        if u5.DisableEditing then
            v28 = Color3.fromRGB(89, 92, 117);
        else
            v28 = Color3.fromRGB(107, 110, 136);
        end;

        v27.PlaceholderColor3 = v28;
        v27.TextTransparency = u5.DisableEditing and 0.4 or 0;
        v27.TextScaled = true;
        v27.Font = Enum.Font.Roboto;
        v27.ClearTextOnFocus = false;
        v27[u3.Ref] = u9;
        v27.AutoLocalize = false;
        v27[u3.Change.Text] = v11;

        v27[u3.Event.FocusLost] = function(p29, p30, p31) -- Line: 168
            -- upvalues: u5 (copy)
            local OnFocusLost = u5.OnFocusLost;

            if OnFocusLost ~= nil then
                OnFocusLost(p29.Text, p30, p31);
            end;
        end;

        v27.TextEditable = not u5.DisableEditing;
        v27.Selectable = not u5.DisableEditing;
        local v32 = {};
        local v33 = {};
        local MaxTextSize = u5.MaxTextSize;

        if MaxTextSize == nil then
            MaxTextSize = nil;
        end;

        v33.MaxTextSize = MaxTextSize;
        v32[#v32 + 1] = u3.createElement("UITextSizeConstraint", v33);
        v26[#v26 + 1] = u3.createElement("TextBox", v27, v32);
        v20.SearchInput = u3.createElement("Frame", v25, v26);
        local DisplaySearchButton = u5.DisplaySearchButton;

        if DisplaySearchButton then
            local v35 = {
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = "RelativeYY",
                BackgroundColor3 = Color3.fromRGB(72, 168, 120),
                BorderSizePixel = 1,
                LayoutOrder = 3,

                [u3.Event.Activated] = function() -- Line: 196
                    -- upvalues: u9 (copy), u5 (copy)
                    local v34 = u9;

                    if v34 ~= nil then
                        v34 = v34:getValue();

                        if v34 ~= nil then
                            v34 = v34.Text;
                        end;
                    end;

                    if v34 ~= nil then
                        local OnFocusLost = u5.OnFocusLost;

                        if OnFocusLost ~= nil then
                            OnFocusLost(v34, true);
                        end;
                    end;
                end
            };
            local v36 = { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }), u3.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) };
            local _ = #v36;
            local v37 = {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local CustomSearchIcon = u5.CustomSearchIcon;

            if CustomSearchIcon == nil then
                CustomSearchIcon = BedwarsImageId.SEARCH_SOLID;
            end;

            v37.Image = CustomSearchIcon;
            v37.ImageColor3 = Color3.fromRGB(95, 224, 159);
            v37.BackgroundTransparency = 1;
            v36.SearchIcon = u3.createElement("ImageLabel", v37);
            DisplaySearchButton = u3.createFragment({
                SearchButton = u3.createElement("ImageButton", v35, v36)
            });
        end;

        if DisplaySearchButton then
            v20[v24 + 1] = DisplaySearchButton;
        end;

        local v38 = #v20;
        local v39 = u5[u3.Children];

        if v39 then
            for i, v in v39 do
                if type(i) == "number" then
                    v20[v38 + i] = v;
                else
                    v20[i] = v;
                end;
            end;
        end;

        return u3.createFragment({
            Searchbar = u3.createElement("Frame", v16, v20)
        });
    end)
};