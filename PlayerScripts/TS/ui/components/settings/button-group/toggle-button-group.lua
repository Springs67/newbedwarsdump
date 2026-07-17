-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    ToggleButtonGroup = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 6
        -- upvalues: u1 (copy), Empty (copy)
        local useState = p3.useState;
        local useEffect = p3.useEffect;
        local u4, u5 = useState(u2.Value);
        local v6, u7 = useState({});
        useEffect(function() -- Line: 11
            -- upvalues: u2 (copy), u1 (ref), u5 (copy), u4 (copy), u7 (copy)
            local u8 = {};
            local v9 = u2[u1.Children];

            if v9 ~= nil then
                local function v15(p10) -- Line: 15
                    -- upvalues: u2 (ref), u1 (ref), u5 (ref), u4 (ref), u8 (copy)
                    local props = p10.props;
                    local v11 = {};
                    local FrameProps = props.FrameProps;

                    if type(FrameProps) == "table" then
                        for i, v in FrameProps do
                            v11[i] = v;
                        end;
                    end;

                    local v12 = u2[u1.Children];

                    if v12 ~= nil then
                        v12 = 0;

                        for _ in v12 do
                            v12 = v12 + 1;
                        end;
                    end;

                    v11.Size = UDim2.fromScale(1 / (v12 == nil and 2 or v12), 1);
                    props.FrameProps = v11;

                    function props.SetValue(p13) -- Line: 43
                        -- upvalues: u5 (ref), u2 (ref)
                        u5(p13);
                        u2.OnChange(p13);
                    end;

                    props.Active = u4 == props.Value;
                    local v14 = u1.createElement(p10.component, props);
                    table.insert(u8, v14);
                end;

                for i, v in v9 do
                    v15(v, i, v9);
                end;
            end;

            u7(u8);
        end, { u2[u1.Children], u4 });
        useEffect(function() -- Line: 58
            -- upvalues: u5 (copy), u2 (copy)
            u5(u2.Value);
        end, { u2.Value });
        local v16 = {
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u2.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v16[i] = v;
            end;
        end;

        local v17 = { u1.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ) };
        local v18 = #v17;

        for i, v in v6 do
            v17[v18 + i] = v;
        end;

        return u1.createElement(Empty, v16, v17);
    end)
};