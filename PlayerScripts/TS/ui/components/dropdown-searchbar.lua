-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Searchbar = RuntimeLib.import(script, script.Parent, "searchbar").Searchbar;

return {
    DropdownSearchbar = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), DropdownComponent (copy), Searchbar (copy), Empty (copy)
        local u6, u7 = p5.useState(u4.DropdownItems[1].value);
        local v8 = {
            Size = u4.Size or UDim2.fromScale(1, 1)
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        local v9 = {};
        local v10 = #v9;
        local v12 = {
            MaxItemsPerDisplay = 8,
            Size = UDim2.fromScale(0.2, 1),
            Position = UDim2.fromOffset(0, 0),
            DefaultItem = u4.DropdownItems[1],
            BackgroundColor3 = Color3.fromRGB(21, 21, 38),
            Items = u4.DropdownItems,

            OnItemSelected = function(p11) -- Line: 29, Name: OnItemSelected
                -- upvalues: u7 (copy), u4 (copy)
                u7(p11);
                local OnDropdownValueChange = u4.OnDropdownValueChange;

                if OnDropdownValueChange ~= nil then
                    OnDropdownValueChange(p11);
                end;
            end
        };
        local DropdownProps = u4.DropdownProps;

        if DropdownProps then
            for i, v in DropdownProps do
                v12[i] = v;
            end;
        end;

        v9[v10 + 1] = u2.createElement(DropdownComponent, v12);
        local v13 = {
            PlaceHolderText = "SEARCH"
        };
        local Searchbar2 = u4.Searchbar;

        if Searchbar2 ~= nil then
            Searchbar2 = Searchbar2.Size;
        end;

        v13.Position = UDim2.new(not Searchbar2 and 0.2 or 1 - u4.Searchbar.Size.X.Scale, 0, 0, 0);

        function v13.OnFocusLost(p14, p15, p16) -- Line: 53
            -- upvalues: u4 (copy), u6 (copy)
            u4.OnFocusLost(p14, p15, u6, p16);
        end;

        local Searchbar3 = u4.Searchbar;

        if Searchbar3 then
            for i, v in Searchbar3 do
                v13[i] = v;
            end;
        end;

        v9[v10 + 2] = u2.createElement(Searchbar, v13);

        return u2.createFragment({
            DropdownSearchbar = u2.createElement(Empty, v8, v9)
        });
    end)
};