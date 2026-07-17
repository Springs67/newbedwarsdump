-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CollectionItemFrame = RuntimeLib.import(script, script.Parent, "collection-item-frame").CollectionItemFrame;
local CollectionSectionMeta = RuntimeLib.import(script, script.Parent, "collection-sections").CollectionSectionMeta;

return {
    CollectionItemsSection = v2.new(u1)(function(u3, p4) -- Line: 10
        -- upvalues: CollectionSectionMeta (copy), u1 (copy), CollectionItemFrame (copy), Empty (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local u5, u6 = useState(u3.Section);
        local v7, u8 = useState(nil);
        useEffect(function() -- Line: 15
            -- upvalues: u6 (copy), u3 (copy), u8 (copy), CollectionSectionMeta (ref), u5 (copy)
            u6(u3.Section);
            u8(CollectionSectionMeta[u5]);
        end, { u3.Section });
        local v9 = {
            BackgroundTransparency = 1,
            Size = u3.Size or UDim2.fromScale(1, 1)
        };
        local v10 = {};
        local v11 = #v10;
        local v12 = {
            Size = UDim2.fromScale(1, 0.16)
        };
        local v13;

        if v7 == nil then
            v13 = v7;
        else
            v13 = v7.title;

            if v13 ~= nil then
                v13 = string.upper(v13);
            end;
        end;

        v12.Text = v13;
        v12.TextScaled = true;
        v12.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v12.TextColor3 = Color3.fromRGB(255, 255, 255);
        v12.TextXAlignment = "Left";
        v12.BackgroundTransparency = 1;
        v10.Title = u1.createElement("TextLabel", v12);
        local v14;

        if v7 == nil then
            v14 = v7;
        else
            local skinBaseItemTypes = v7.skinBaseItemTypes;

            if skinBaseItemTypes == nil then
                v14 = skinBaseItemTypes;
            else
                local function v16(u15) -- Line: 46
                    -- upvalues: u1 (ref), CollectionItemFrame (ref), u3 (copy)
                    return u1.createElement(CollectionItemFrame, {
                        AppId = "CollectionItemFrame",
                        BaseItemSkinType = u15,

                        OnClick = function() -- Line: 51, Name: OnClick
                            -- upvalues: u3 (ref), u15 (copy)
                            local SetSelectedBaseItemSkin = u3.SetSelectedBaseItemSkin;

                            if SetSelectedBaseItemSkin ~= nil then
                                SetSelectedBaseItemSkin(u15);
                            end;
                        end,

                        GamepadShouldAutoSelect = u3.GamepadShouldAutoSelect
                    }, { u1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) });
                end;

                v14 = table.create(#skinBaseItemTypes);

                for i, v in skinBaseItemTypes do
                    v14[i] = v16(v, i - 1, skinBaseItemTypes);
                end;
            end;
        end;

        local v17 = {
            Size = UDim2.fromScale(1, 0.74),
            Position = UDim2.fromScale(0, 0.26)
        };
        local v18 = { u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = UDim.new(0.01, 0)
            }) };
        local v19 = #v18;

        if v14 then
            for i, v in v14 do
                v18[v19 + i] = v;
            end;
        end;

        local v20 = #v18;
        local v21;

        if v7 == nil then
            v21 = v7;
        else
            v21 = v7.lockerCategory;
        end;

        if v21 then
            v21 = u1.createElement(CollectionItemFrame, {
                AppId = "CollectionItemFrame",
                LockerCategory = v7.lockerCategory,
                Size = UDim2.fromScale(1, 1),

                OnClick = function() -- Line: 101, Name: OnClick
                    -- upvalues: u3 (copy)
                    local OnLockerClick = u3.OnLockerClick;

                    if OnLockerClick ~= nil then
                        OnLockerClick();
                    end;
                end,

                GamepadShouldAutoSelect = u3.GamepadShouldAutoSelect
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 2.14
                }) });
        end;

        if v21 then
            v18[v20 + 1] = v21;
        end;

        v10.ItemList = u1.createElement(Empty, v17, v18);
        local v22 = u3[u1.Children];

        if v22 then
            for i, v in v22 do
                if type(i) == "number" then
                    v10[v11 + i] = v;
                else
                    v10[i] = v;
                end;
            end;
        end;

        return u1.createFragment({
            Section = u1.createElement("Frame", v9, v10)
        });
    end)
};