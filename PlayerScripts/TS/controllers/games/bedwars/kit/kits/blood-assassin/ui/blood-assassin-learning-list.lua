-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BloodUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade;
local BloodUpgradeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade-meta").BloodUpgradeMeta;

return {
    BloodAssassinLearningList = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u1 (copy), BloodUpgrade (copy), BloodUpgradeMeta (copy), ColorUtil (copy), u2 (copy)
        local _ = p5.useState;
        local v6 = false;
        local v7 = 1;
        local v8 = {};

        while true do
            if v6 then
                v7 = v7 + 1;
            else
                v6 = true;
            end;

            if v7 > #u1.values(BloodUpgrade) then
                local v9 = {};
                local v10 = #v9;

                local function v18(p11, p12) -- Line: 44
                    -- upvalues: ColorUtil (ref), u2 (ref)
                    local v13 = {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = string.upper(p11.title),
                        LayoutOrder = p12,
                        Size = UDim2.fromScale(1, 0.08816705336426914),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Font = Enum.Font.ArialBold
                    };
                    local v14;

                    if p11.color then
                        v14 = ColorUtil.WHITE;
                    else
                        v14 = ColorUtil.hexColor(13158600);
                    end;

                    v13.TextColor3 = v14;
                    local v15 = {};
                    local v16 = #v15;
                    local v17;

                    if p11.color == nil then
                        v17 = false;
                    else
                        v17 = u2.createElement("UIGradient", {
                            Rotation = -88,
                            Color = p11.color
                        });
                    end;

                    if v17 then
                        v15[v16 + 1] = v17;
                    end;

                    return u2.createElement("TextLabel", v13, v15);
                end;

                local v19 = table.create(#v8);

                for i, v in v8 do
                    v19[i] = v18(v, i - 1, v8);
                end;

                local v20 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.6666666666666666, 0.9526881720430107),
                    Position = UDim2.fromScale(0.02631578947368421, 0.03225806451612903)
                };
                local v21 = { u2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        Padding = UDim.new(0.02320185614849188, 0)
                    }) };
                local v22 = #v21;

                for i, v in v19 do
                    v21[v22 + i] = v;
                end;

                v9[v10 + 1] = u2.createElement("Frame", v20, v21);

                local function v25(p23, p24) -- Line: 89
                    -- upvalues: u2 (ref), ColorUtil (ref)
                    return u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = p23.valueString,
                        LayoutOrder = p24,
                        Size = UDim2.fromScale(1, 0.08816705336426914),
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Font = Enum.Font.ArialBold,
                        TextColor3 = ColorUtil.hexColor(16731983)
                    });
                end;

                local v26 = table.create(#v8);

                for i, v in v8 do
                    v26[i] = v25(v, i - 1, v8);
                end;

                local v27 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.26842105263157895, 0.9526881720430107),
                    Position = UDim2.fromScale(0.9736842105263158, 0.03225806451612903),
                    AnchorPoint = Vector2.new(1, 0)
                };
                local v28 = { u2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        Padding = UDim.new(0.02320185614849188, 0)
                    }) };
                local v29 = #v28;

                for i, v in v26 do
                    v28[v29 + i] = v;
                end;

                v9[v10 + 2] = u2.createElement("Frame", v27, v28);

                return u2.createFragment(v9);
            end;

            local v30 = p4.bloodUpgrades[v7];
            local v31 = v30 == nil and 0 or v30;

            if v31 ~= 0 then
                local v32 = BloodUpgradeMeta[v7];
                local v33 = {
                    title = v32.display
                };
                local v34;

                if v32.summarize then
                    local summarize = v32.summarize;

                    if v31 > 10 then
                        v31 = math.round(v31);
                    end;

                    v34 = summarize(v31);
                elseif v32.perk then
                    v34 = "KNOWN";
                else
                    if v31 > 10 then
                        v31 = math.round(v31);
                    end;

                    v34 = tostring(v31);
                end;

                v33.valueString = v34;
                local v35;

                if v32.perk then
                    v35 = ColorSequence.new(ColorUtil.hexColor(15360512), ColorUtil.hexColor(16766464));
                else
                    v35 = nil;
                end;

                v33.color = v35;
                table.insert(v8, v33);
            end;
        end;
    end)
};