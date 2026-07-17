-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ContractCard = RuntimeLib.import(script, script.Parent, "contract-card").ContractCard;

return {
    BloodAssassinContracts = v4.new(u3)(function(p5, p6) -- Line: 10
        -- upvalues: u3 (copy), u2 (copy), ColorUtil (copy), Empty (copy), ContractCard (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(30);
        local u9 = u3.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u2 (ref), u9 (copy), u8 (copy)
            local u10 = u2.new();
            local u11 = u9:getValue();

            if u11 then
                u11:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 19
                    -- upvalues: u8 (ref), u11 (copy)
                    u8((math.round(u11.AbsoluteSize.Y / 172 * 30)));
                end);
                u8((math.round(u11.AbsoluteSize.Y / 172 * 30)));
            end;

            return function() -- Line: 24
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, {});
        local v12 = 3;

        if p5.activeContract then
            v12 = 2;
        elseif p5.availableContracts then
            v12 = 3 - #p5.availableContracts;
        end;

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
                local v16 = {
                    Size = UDim2.fromScale(0.948, 0.9513513513513514),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v17 = { u3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), u3.createElement("TextLabel", {
                        Size = UDim2.fromScale(0.9472573839662447, 0.24431818181818182),
                        [u3.Ref] = u9,
                        TextSize = u7,
                        Text = "Your decay will strengthen through the completion of contracts. Tougher opponents will unlock greater powers.",
                        BackgroundColor3 = ColorUtil.BLACK,
                        TextColor3 = ColorUtil.hexColor(13290186),
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextWrapped = true,
                        LayoutOrder = 0
                    }) };
                local v18 = {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.7102272727272727)
                };
                local v19 = { u3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDim.new(0.02, 0)
                    }), u3.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        RichText = true,
                        LayoutOrder = 0,
                        Text = p5.activeContract == nil and (#p5.availableContracts == 0 and "AWAITING MORE CONTRACTS..." or "CONTRACTS <font color=\"rgb(173, 173, 173)\">(PICK ONE)</font>") or "ACTIVE CONTRACT",
                        Size = UDim2.fromScale(1, 0.08),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        TextColor3 = ColorUtil.hexColor(16729156),
                        Font = Enum.Font.ArialBold
                    }), u3.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0, 0.048)
                    }) };
                local v20 = #v19;
                local v21;

                if p5.activeContract == nil then
                    v21 = false;
                else
                    v21 = u3.createElement(ContractCard, {
                        LayoutOrder = 2,
                        ActiveContract = true,
                        ContractInfo = p5.activeContract,
                        Size = UDim2.fromScale(0.9936708860759493, 0.284),
                        DescriptionTextSize = math.round(u7 * 0.75)
                    });
                end;

                if v21 then
                    v19[v20 + 1] = v21;
                end;

                local v22 = #v19;
                local v23 = p5.activeContract == nil;

                if v23 then
                    local availableContracts = p5.availableContracts;

                    local function v26(p24, p25) -- Line: 125
                        -- upvalues: u3 (ref), ContractCard (ref), u7 (copy)
                        return u3.createElement(ContractCard, {
                            ActiveContract = false,
                            ContractInfo = p24,
                            Size = UDim2.fromScale(0.9936708860759493, 0.284),
                            LayoutOrder = 2 + p25,
                            DescriptionTextSize = math.round(u7 * 0.75)
                        });
                    end;

                    v23 = table.create(#availableContracts);

                    for i, v in availableContracts do
                        v23[i] = v26(v, i - 1, availableContracts);
                    end;
                end;

                if v23 then
                    for i, v in v23 do
                        v19[v22 + i] = v;
                    end;
                end;

                local v27 = #v19;

                for i, v in v15 do
                    v19[v27 + i] = v;
                end;

                v17[#v17 + 1] = u3.createElement(Empty, v18, v19);

                return u3.createElement(Empty, v16, v17);
            end;

            local v28 = u3.createElement("Frame", {
                LayoutOrder = 4,
                BackgroundTransparency = 0.4,
                Size = UDim2.fromScale(0.9936708860759493, 0.284),
                BackgroundColor3 = ColorUtil.BLACK
            });
            table.insert(v15, v28);
        end;
    end)
};