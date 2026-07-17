-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
local u4 = UDim2.new(1, 0, 0, 50);

return {
    HostPanelOreGeneratorsTab = v3.new(u2)(function(p5, p6) -- Line: 14
        -- upvalues: DeviceUtil (copy), KnitClient (copy), u2 (copy), DropdownComponent (copy), u4 (copy), HostPanelTextBox (copy), HostPanelSetting (copy), ItemType (copy), Empty (copy)
        local useState = p6.useState;
        local v7 = DeviceUtil.isHoarceKat() and {
            map = {
                Blue = {
                    text = "<font color=\"#49B4F2\">Blue</font>",
                    value = "1"
                },
                Red = {
                    text = "<font color=\"#E32743\">Red</font>",
                    value = "2"
                }
            },
            dropDownItems = { {
                    text = "<font color=\"#49B4F2\">Blue</font>",
                    value = "1"
                }, {
                    text = "<font color=\"#E32743\">Red</font>",
                    value = "2"
                } }
        } or KnitClient.Controllers.TeamController:getTeamDropdown();
        local u8, v9 = useState(p5.store.Game.teams[1].id);

        local function _(p10) -- Line: 36
            -- upvalues: KnitClient (ref), u8 (copy)
            local v11 = tonumber(p10);

            if v11 ~= 0 and (v11 == v11 and v11) then
                KnitClient.Controllers.CustomMatchController:setTeamOreGenerators(v11, u8);
            end;
        end;

        local function _(p12, p13) -- Line: 42
            -- upvalues: KnitClient (ref)
            local v14 = tonumber(p12);

            if v14 ~= 0 and (v14 == v14 and v14) then
                KnitClient.Controllers.CustomMatchController:setGlobalOreGenerators(v14, p13);
            end;
        end;

        local v15 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0, 10)
            }) };
        local v17 = #v16;

        if v7 then
            local v18 = {
                Size = UDim2.fromScale(0.4, 1),
                DefaultItem = v7.map[p5.store.Game.teams[1].name]
            };
            local v19 = v7.map[p5.store.Game.teams[1].name];

            if v19 ~= nil then
                v19 = v19.text;
            end;

            v18.PlaceholderText = v19;
            v18.Items = v7.dropDownItems;
            v18.OnItemSelected = v9;
            v18.LayoutOrder = 1;
            v7 = u2.createElement(DropdownComponent, v18);
        end;

        local v20 = {
            Name = "Team Generator Speed Multiplier",
            Hint = "(multiplier)",
            Size = u4
        };
        local v21 = {
            [#v21 + 1] = v7
        };
        local v22 = {
            Size = UDim2.fromScale(0.6, 1)
        };
        local v23 = p5.store.CustomMatch.teamGenerators[u8];
        v22.Text = tostring(v23 == nil and 1 or v23);
        local v24 = p5.store.CustomMatch.teamGenerators[u8];
        v22.PlaceholderText = tostring(v24 == nil and 1 or v24);
        v22.NumbersOnly = true;

        function v22.OnFocusLost(p25) -- Line: 103
            -- upvalues: KnitClient (ref), u8 (copy)
            local v26 = tonumber(p25);

            if v26 ~= 0 and (v26 == v26 and v26) then
                KnitClient.Controllers.CustomMatchController:setTeamOreGenerators(v26, u8);
            end;
        end;

        v22.LayoutOrder = 2;
        v21[#v21 + 1] = u2.createElement(HostPanelTextBox, v22);
        v16[v17 + 1] = u2.createElement(HostPanelSetting, v20, v21);
        v16[v17 + 2] = u2.createElement(HostPanelSetting, {
            Name = "Emerald Generator Speed Multiplier",
            Hint = "(multiplier)",
            Size = u4
        }, { u2.createElement(HostPanelTextBox, {
                NumbersOnly = true,
                Text = tostring(p5.store.CustomMatch.globalGenerators.emerald),
                PlaceholderText = tostring(p5.store.CustomMatch.globalGenerators.emerald),

                OnFocusLost = function(p27) -- Line: 118, Name: OnFocusLost
                    -- upvalues: ItemType (ref), KnitClient (ref)
                    local EMERALD = ItemType.EMERALD;
                    local v28 = tonumber(p27);

                    if v28 ~= 0 and (v28 == v28 and v28) then
                        KnitClient.Controllers.CustomMatchController:setGlobalOreGenerators(v28, EMERALD);
                    end;
                end
            }) });
        v16[v17 + 3] = u2.createElement(HostPanelSetting, {
            Name = "Diamond Generator Speed Multiplier",
            Hint = "(multiplier)",
            Size = u4
        }, { u2.createElement(HostPanelTextBox, {
                NumbersOnly = true,
                Text = tostring(p5.store.CustomMatch.globalGenerators.diamond),
                PlaceholderText = tostring(p5.store.CustomMatch.globalGenerators.diamond),

                OnFocusLost = function(p29) -- Line: 132, Name: OnFocusLost
                    -- upvalues: ItemType (ref), KnitClient (ref)
                    local DIAMOND = ItemType.DIAMOND;
                    local v30 = tonumber(p29);

                    if v30 ~= 0 and (v30 == v30 and v30) then
                        KnitClient.Controllers.CustomMatchController:setGlobalOreGenerators(v30, DIAMOND);
                    end;
                end
            }) });

        return u2.createElement(Empty, v15, v16);
    end)
};