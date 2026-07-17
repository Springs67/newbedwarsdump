-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UIGlitchEffectInstance = RuntimeLib.import(script, script.Parent, "ui-glitch-effect-instance").UIGlitchEffectInstance;

return {
    UIGlitchEffect = v3.new(u2)(function(u4, p5) -- Line: 8
        -- upvalues: u2 (copy), u1 (copy), Empty (copy), UIGlitchEffectInstance (copy)
        local _ = p5.useState;
        local u6 = u4.GlitchColors or { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") };
        local v7 = u4.Disabled or u4[u2.Children] == nil;

        if not v7 then
            v7 = u4[u2.Children];

            if v7 ~= nil then
                v7 = next(v7) == nil;
            end;
        end;

        if v7 then
            local v8 = {};
            local v9 = #v8;
            local v10 = u4[u2.Children];

            if v10 then
                for i, v in v10 do
                    if type(i) == "number" then
                        v8[v9 + i] = v;
                    else
                        v8[i] = v;
                    end;
                end;
            end;

            return u2.createFragment(v8);
        end;

        local v11 = {
            Size = UDim2.fromScale(1, 1)
        };
        local ContainerProps = u4.ContainerProps;

        if ContainerProps then
            for i, v in ContainerProps do
                v11[i] = v;
            end;
        end;

        local v12 = u1.values(u4[u2.Children]);

        local function v17(p13) -- Line: 44
            -- upvalues: u1 (ref), u6 (copy), u2 (ref), Empty (ref), UIGlitchEffectInstance (ref), u4 (copy)
            local v14 = Instance.new(p13.component);

            if not v14:IsA("GuiObject") then
                return p13;
            end;

            local props = p13.props;
            local Size = props.Size;
            props.Size = UDim2.fromScale(1, 1);
            props.ZIndex = 2;
            local v15 = u1.deepCopy(p13);
            local v16 = u1.deepCopy(p13);

            if v14:IsA("TextLabel") then
                v15.props.TextColor3 = u6[1];
                v16.props.TextColor3 = u6[2];
            elseif v14:IsA("ImageLabel") then
                v15.props.ImageColor3 = u6[1];
                v16.props.ImageColor3 = u6[2];
            end;

            if props.BackgroundTransparency ~= 1 then
                v15.props.BackgroundColor3 = u6[1];
                v16.props.BackgroundColor3 = u6[2];
            end;

            v15.props.ZIndex = 1;
            v16.props.ZIndex = 1;

            return u2.createElement(Empty, {
                Position = props.Position,
                AnchorPoint = props.AnchorPoint,
                Size = Size
            }, { u2.createElement(UIGlitchEffectInstance, {
                    Element = p13,
                    AnimationConfig = {
                        DisableRandomMovement = true,
                        DisableRandomTransparency = true,
                        DisableRandomSpaz = true
                    }
                }), u2.createElement(UIGlitchEffectInstance, {
                    Element = v15,
                    AnimationConfig = u4.AnimationConfig
                }), u2.createElement(UIGlitchEffectInstance, {
                    Element = v16,
                    AnimationConfig = u4.AnimationConfig
                }) });
        end;

        local v18 = 0;
        local v19 = {};

        for i, v in v12 do
            local v20 = v17(v, i - 1, v12);

            if v20 ~= nil then
                v18 = v18 + 1;
                v19[v18] = v20;
            end;
        end;

        local v21 = {};
        local v22 = #v21;

        for i, v in v19 do
            v21[v22 + i] = v;
        end;

        return u2.createElement(Empty, v11, v21);
    end)
};