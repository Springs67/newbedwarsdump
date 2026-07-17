-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;

return {
    StatusEffectTag = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: StatusEffectMeta (copy), getItemMeta (copy), u1 (copy), StatusEffectUtil (copy), u2 (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local v6 = StatusEffectMeta[u4.ActiveStatusEffect.statusEffect];
        local v7, u8 = p5.useState(u4.ActiveStatusEffect.stacks);
        local v9;

        if v6.item then
            v9 = getItemMeta(v6.item);
        else
            v9 = nil;
        end;

        local v10 = v6.showOnTagList and true or false;
        useEffect(function() -- Line: 23
            -- upvalues: u1 (ref), u4 (copy), StatusEffectUtil (ref), u8 (copy)
            local u11 = u1.new();
            u11:GiveTask(u4.EntityInstance:GetAttributeChangedSignal(StatusEffectUtil:getAttributeName(u4.ActiveStatusEffect.statusEffect) .. "_stacks"):Connect(function() -- Line: 25
                -- upvalues: u4 (ref), StatusEffectUtil (ref), u8 (ref)
                local v12 = u4.EntityInstance:GetAttribute(StatusEffectUtil:getAttributeName(u4.ActiveStatusEffect.statusEffect) .. "_stacks");
                u8(v12 == nil and 0 or v12);
            end));

            return function() -- Line: 33
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end;
        end, {});
        local v13 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            Size = UDim2.fromScale(1, 1)
        };

        if v10 then
            v9 = v6.image;
        elseif v9 ~= nil then
            v9 = v9.image;
        end;

        v13.Image = v9;
        v13.BackgroundTransparency = 1;
        local v14 = {};
        local v15 = #v14;

        if v7 > 0 then
            if v10 then
                v10 = u2.createFragment({
                    StatusEffectStacks = u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextXAlignment = "Center",
                        TextYAlignment = "Top",
                        TextScaled = true,
                        TextStrokeTransparency = 0,
                        Position = UDim2.fromScale(0.5, -0.25),
                        Size = UDim2.fromScale(0.75, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0),
                        Text = tostring(v7),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
                    })
                });
            end;
        else
            v10 = false;
        end;

        if v10 then
            v14[v15 + 1] = v10;
        end;

        return u2.createFragment({
            StatusEffectTag = u2.createElement("ImageLabel", v13, v14)
        });
    end)
};