-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local useSpring = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-spring", "src").useSpring;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;

return {
    SurvivalUi = v3.new(u2)(function(u5, p6) -- Line: 13
        -- upvalues: useSpring (copy), RunService (copy), Workspace (copy), u2 (copy), GetTarmacAsset (copy), ColorUtil (copy), Empty (copy)
        local u7 = p6.useMemo(function() -- Line: 14
            -- upvalues: u5 (copy)
            return u5.health / u5.maxHealth;
        end, { u5.health, u5.maxHealth });
        local v8 = p6.useMemo(function() -- Line: 17
            -- upvalues: u7 (copy)
            return 1 / u7;
        end, { u7 });
        local v9 = useSpring(p6, {
            config = {
                tension = 440,
                friction = 26,
                mass = 0.6
            },
            to = {
                size1 = UDim2.fromScale(u7, 1),
                size2 = UDim2.fromScale(v8, 1)
            }
        }, { u7, v8 });
        local v10, u11 = useSpring(p6, function() -- Line: 31
            return {
                alpha = 0
            };
        end);
        p6.useEffect(function() -- Line: 36
            -- upvalues: u11 (copy)
            u11.start({
                alpha = 0.9,
                config = {
                    tension = 250,
                    friction = 14,
                    mass = 1
                }
            });
            task.delay(0.1, function() -- Line: 45
                -- upvalues: u11 (ref)
                u11.start({
                    alpha = 0,
                    config = {
                        tension = 300,
                        friction = 14,
                        mass = 1
                    }
                });
            end);
        end, { u5.health });
        local v12, u13 = p6.useBinding(0);
        p6.useEffect(function() -- Line: 57
            -- upvalues: RunService (ref), u5 (copy), Workspace (ref), u13 (copy)
            local u15 = RunService.Heartbeat:Connect(function() -- Line: 59
                -- upvalues: u5 (ref), Workspace (ref), u13 (ref)
                if os.clock() - -1 > 1 then
                    local v14 = u5.endTime - Workspace:GetServerTimeNow();
                    u13(v14 < 0 and 0 or math.floor(v14));
                end;
            end);

            return function() -- Line: 65
                -- upvalues: u15 (copy)
                u15:Disconnect();
            end;
        end, { u5.endTime });
        local v16 = p6.useMemo(function() -- Line: 69
            -- upvalues: u5 (copy)
            return u5.state == 1 and "DEFENDING" or (u5.state == 0 and "INTERMISSION" or "DEFENDING");
        end, { u5.state });
        local createElement = u2.createElement;
        local v17 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.08),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.05)
        };
        local v18 = {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 6.069306930693069
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 3,
                Image = GetTarmacAsset("healthbarstroke").Image,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1)
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0.8,
                Image = GetTarmacAsset("healthbarfill").Image,
                AnchorPoint = Vector2.new(0, 0.5),
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0, 0.5),
                ImageColor3 = Color3.fromRGB(41, 41, 41)
            }),
            HealthBarIcon = u2.createElement("ImageLabel", {
                Image = "rbxassetid://10320211982",
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.1, 0.5)
            })
        };
        local createElement2 = u2.createElement;
        local v19 = {
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            Font = "RobotoCondensed",
            ZIndex = 2,
            Size = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.56)
        };
        local v20;

        if u5.health > 0 then
            v20 = "<b>" .. tostring(u5.health) .. "<font transparency=\".3\"> / " .. tostring(u5.maxHealth) .. "</font></b>";
        else
            v20 = "<stroke color=\"#000000\" thickness=\"2\"><font color=\"" .. ColorUtil.richTextColor(Color3.fromHex("FC4545")) .. "\"><b>BED GONE! RUN!</b></font></stroke>";
        end;

        v19.Text = v20;
        v19.TextColor3 = Color3.fromRGB(255, 255, 255);
        v18.HealthBarText = createElement2("TextLabel", v19);
        v18[4] = u2.createElement("Frame", {
    ClipsDescendants = true,
    BackgroundTransparency = 1,
    Size = v9.size1,
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.fromScale(0, 0.5)
}, { u2.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = GetTarmacAsset("healthbarfill").Image,
        AnchorPoint = Vector2.new(0, 0.5),
        Size = v9.size2,
        Position = UDim2.fromScale(0, 0.5),
        ImageColor3 = Color3.fromRGB(255, 255, 255)
    }, { u2.createElement("UIGradient", {
            Rotation = 90,
            Color = v10.alpha:map(function(p21) -- Line: 142
                return ColorSequence.new(Color3.fromRGB(252, 48, 85):Lerp(Color3.fromRGB(255, 0, 0), p21), Color3.fromRGB(255, 101, 138):Lerp(Color3.fromRGB(255, 0, 0), p21));
            end)
        }) }) });
        v18.WaveCount = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Rotation = -1,
            Image = GetTarmacAsset("FunnyShape2").Image,
            Size = UDim2.fromScale(0.7, 0.6),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.07, 1.1),
            ImageColor3 = ColorUtil.hexColor(16632616)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 2.5247524752475248
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                Font = "GothamBold",
                Size = UDim2.fromScale(0.8, 0.7),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "<b>WAVE <font color=\"" .. ColorUtil.richTextColor(Color3.fromHex("fdcb28")) .. "\">" .. tostring(u5.waveCount) .. "</font></b>",
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) });
        v18.Timer = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = GetTarmacAsset("FunnyShape1").Image,
            Size = UDim2.fromScale(0.45, 0.45),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 1.02),
            ImageColor3 = ColorUtil.hexColor(1037307)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 2.1363636363636362
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Font = "GothamBold",
                Size = UDim2.fromScale(1, 0.6),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v12:map(function(p22) -- Line: 188
                    return tostring(p22) .. "s";
                end),
                TextColor3 = Color3.fromHex("363636") or Color3.fromRGB(255, 255, 255)
            }) });
        v18.WaveStatus = u2.createElement(Empty, {
            Size = UDim2.fromScale(0.6, 0.45),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.83, 1.02)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.3333333333333335
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Font = "GothamBold",
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v16,
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UIStroke", {
                    Thickness = 1,
                    Color = Color3.fromRGB(0, 0, 0)
                }) }) });

        return createElement("Frame", v17, v18);
    end, {
        componentType = "PureComponent"
    })
};