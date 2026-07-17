-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local UIGlitchEffect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    StatusEffectHudEnchantTile = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: Workspace (copy), StatusEffectMeta (copy), getItemMeta (copy), ColorUtil (copy), BedwarsImageId (copy), u2 (copy), TweenService (copy), Theme (copy), UIGlitchEffect (copy), AutoSizedText (copy), TooltipContainer (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local _, u7 = useState(false);
        local v8, _ = useState(false);
        local v9;

        if u5.ActiveStatusEffect.expireTime == nil then
            v9 = -1;
        else
            local v10 = u5.ActiveStatusEffect.expireTime - Workspace:GetServerTimeNow();
            v9 = math.max(0, v10);
        end;

        local u11, u12 = useState(v9);
        local v13 = u11 ~= -1;

        if u11 > 600 then
            v13 = false;
        end;

        local v14 = StatusEffectMeta[u5.ActiveStatusEffect.statusEffect];
        local image = v14.image;

        if v14.item then
            local v15 = getItemMeta(v14.item);

            if v14.image == nil then
                image = v15.image;
            end;
        end;

        local stacks = u5.ActiveStatusEffect.stacks;
        local v16;

        if stacks == 0 or (stacks ~= stacks or not stacks) then
            v16 = false;
        else
            v16 = u5.ActiveStatusEffect.stacks > 1;
        end;

        local v17 = v14.showZeroStacks and true or v16;
        local stacks2 = u5.ActiveStatusEffect.stacks;
        useEffect(function() -- Line: 43
            -- upvalues: u5 (copy), Workspace (ref), u12 (copy)
            local u18 = true;

            if u5.ActiveStatusEffect.expireTime ~= nil then
                task.spawn(function() -- Line: 46
                    -- upvalues: u5 (ref), Workspace (ref), u18 (ref), u12 (ref)
                    while true do
                        local v19 = u5.ActiveStatusEffect.expireTime - Workspace:GetServerTimeNow();
                        local v20 = math.max(0, v19);
                        local v21 = math.floor(v20);

                        if u18 then
                            u12(v21);
                        end;

                        local v22 = u18 and task.wait(1);

                        if v22 == 0 or (v22 ~= v22 or not v22) then
                            return;
                        end;
                    end;
                end);
            end;

            return function() -- Line: 62
                -- upvalues: u18 (ref)
                u18 = false;
            end;
        end, { u5.ActiveStatusEffect });

        local function v23() -- Line: 66
            -- upvalues: u11 (copy), ColorUtil (ref)
            if u11 >= 60 then
                return ColorUtil.hexColor(16777215);
            end;

            if u11 >= 10 then
                return ColorUtil.hexColor(16754518);
            end;

            if u11 >= 0 then
                return Color3.fromRGB(255, 41, 41);
            end;

            return ColorUtil.hexColor(16777215);
        end;

        local v26 = {
            Size = UDim2.new(1.2, 0, 1.2, 0),
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.STATUS_EFFECT_FRAME_2,
            ImageColor3 = ColorUtil.BLACK,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,

            [u2.Event.MouseEnter] = function(p24) -- Line: 85
                -- upvalues: u7 (copy), TweenService (ref), Theme (ref)
                u7(true);
                TweenService:Create(p24, TweenInfo.new(0.3), {
                    ImageColor3 = Theme.textPrimary
                }):Play();
            end,

            [u2.Event.MouseLeave] = function(p25) -- Line: 91
                -- upvalues: u7 (copy), TweenService (ref), ColorUtil (ref)
                u7(false);
                TweenService:Create(p25, TweenInfo.new(0.3), {
                    ImageColor3 = ColorUtil.BLACK
                }):Play();
            end
        };
        local v27 = { u2.createElement(UIGlitchEffect, {
                Disabled = not v8
            }, { u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    Image = image,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }) }) };
        local v28 = #v27;

        if v13 then
            v13 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextXAlignment = "Right",
                TextYAlignment = "Bottom",
                TextScaled = true,
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(0.7, 0.925),
                Size = UDim2.fromScale(0.5, 0.35),
                Text = tostring(u11),
                TextColor3 = v23(),
                FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
            });
        end;

        if v13 then
            v27[v28 + 1] = v13;
        end;

        local v29 = #v27;

        if v17 then
            v17 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextXAlignment = "Center",
                TextYAlignment = "Top",
                TextScaled = true,
                TextStrokeTransparency = 0,
                Position = UDim2.fromScale(0.5, -0.25),
                Size = UDim2.fromScale(0.75, 0.5),
                AnchorPoint = Vector2.new(0.5, 0),
                Text = tostring(stacks2),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
            });
        end;

        if v17 then
            v27[v29 + 1] = v17;
        end;

        local v30 = { u2.createElement(AutoSizedText, {
                TextSize = 16,
                Text = v14.displayName,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) };
        local v31 = #v30;

        if v8 then
            v8 = u2.createElement(AutoSizedText, {
                Text = "Glitched",
                TextSize = 14,
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(56, 255, 247),
                Limits = Vector2.new(300, 60)
            });
        end;

        if v8 then
            v30[v31 + 1] = v8;
        end;

        local v32 = #v30;
        local v33;

        if v14.description == nil then
            v33 = false;
        else
            v33 = u2.createElement(AutoSizedText, {
                TextSize = 14,
                Text = v14.description,
                Font = Enum.Font.SourceSans,
                Limits = Vector2.new(300, 60)
            });
        end;

        if v33 then
            v30[v32 + 1] = v33;
        end;

        v27[#v27 + 1] = u2.createElement(TooltipContainer, {}, v30);

        return u2.createElement("ImageLabel", v26, v27);
    end)
};