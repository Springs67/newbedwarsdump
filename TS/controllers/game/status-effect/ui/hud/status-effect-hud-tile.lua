-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;

return {
    StatusEffectHudTile = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: Workspace (copy), StatusEffectMeta (copy), getItemMeta (copy), ColorUtil (copy), u2 (copy), AutoSizedText (copy), TooltipContainer (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local _, u6 = useState(false);
        local v7;

        if u4.ActiveStatusEffect.expireTime == nil then
            v7 = -1;
        else
            local v8 = u4.ActiveStatusEffect.expireTime - Workspace:GetServerTimeNow();
            v7 = math.max(0, v8);
        end;

        local v9, u10 = useState(v7);
        local v11, _ = useState(false);
        local v12 = StatusEffectMeta[u4.ActiveStatusEffect.statusEffect];
        local image = v12.image;

        if v12.item then
            local v13 = getItemMeta(v12.item);

            if v12.image == nil then
                image = v13.image;
            end;
        end;

        useEffect(function() -- Line: 27
            -- upvalues: u4 (copy), Workspace (ref), u10 (copy)
            local u14 = true;

            if u4.ActiveStatusEffect.expireTime ~= nil then
                task.spawn(function() -- Line: 30
                    -- upvalues: u4 (ref), Workspace (ref), u14 (ref), u10 (ref)
                    while true do
                        local v15 = u4.ActiveStatusEffect.expireTime - Workspace:GetServerTimeNow();
                        local v16 = math.max(0, v15);
                        local v17 = math.floor(v16);

                        if u14 then
                            u10(v17);
                        end;

                        local v18 = u14 and task.wait(1);

                        if v18 == 0 or (v18 ~= v18 or not v18) then
                            return;
                        end;
                    end;
                end);
            end;

            return function() -- Line: 46
                -- upvalues: u14 (ref)
                u14 = false;
            end;
        end, { u4.ActiveStatusEffect });
        v9 = v9;
        local u19;

        if v11 then
            u19 = math.floor(v9 / 60);
        else
            u19 = v9;
        end;

        local v20 = v9 ~= -1;

        if v9 > 600 then
            v20 = false;
        end;

        local stacks = u4.ActiveStatusEffect.stacks;
        local v21 = v12.showZeroStacks and true or (stacks == nil and 0 or stacks) >= 1;
        local stacks2 = u4.ActiveStatusEffect.stacks;

        local function v22() -- Line: 69
            -- upvalues: u19 (ref), ColorUtil (ref)
            if u19 >= 60 then
                return ColorUtil.hexColor(16777215);
            end;

            if u19 >= 10 then
                return ColorUtil.hexColor(16754518);
            end;

            if u19 >= 0 then
                return Color3.fromRGB(255, 41, 41);
            end;

            return ColorUtil.hexColor(16777215);
        end;

        local v23 = {
            Size = UDim2.new(1, 0, 1, 0),
            SizeConstraint = "RelativeYY",
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,

            [u2.Event.MouseEnter] = function() -- Line: 86
                -- upvalues: u6 (copy)
                u6(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 89
                -- upvalues: u6 (copy)
                u6(false);
            end
        };
        local v24 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u2.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                Color = Color3.fromRGB(255, 255, 255)
            }), u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 1,
                Size = UDim2.new(0.75, 0, 0.75, 0),
                Image = image,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }) };
        local v25 = #v24;

        if v20 then
            v20 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextXAlignment = "Right",
                TextYAlignment = "Bottom",
                TextScaled = true,
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(0.925, 0.925),
                Size = UDim2.fromScale(0.5, 0.35),
                Text = tostring(u19),
                TextColor3 = v22(),
                FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
            });
        end;

        if v20 then
            v24[v25 + 1] = v20;
        end;

        local v26 = #v24;

        if v21 then
            local v27 = {
                Position = UDim2.fromScale(0.5, -0.25),
                Size = UDim2.fromScale(0.75, 0.5),
                AnchorPoint = Vector2.new(0.5, 0),
                Text = tostring(stacks2 == nil and 0 or stacks2),
                TextColor3 = ColorUtil.WHITE,
                BackgroundTransparency = 1,
                FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
                TextXAlignment = "Center",
                TextYAlignment = "Top",
                TextScaled = true,
                TextStrokeTransparency = 0
            };
            v21 = u2.createElement("TextLabel", v27);
        end;

        if v21 then
            v24[v26 + 1] = v21;
        end;

        local v28 = { u2.createElement(AutoSizedText, {
                TextSize = 16,
                Text = v12.displayName,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) };
        local v29 = #v28;
        local v30;

        if v12.description == nil then
            v30 = false;
        else
            v30 = u2.createElement(AutoSizedText, {
                TextSize = 14,
                Text = v12.description,
                Font = Enum.Font.SourceSans,
                Limits = Vector2.new(300, 60)
            });
        end;

        if v30 then
            v28[v29 + 1] = v30;
        end;

        v24[#v24 + 1] = u2.createElement(TooltipContainer, {}, v28);

        return u2.createElement("ImageLabel", v23, v24);
    end)
};