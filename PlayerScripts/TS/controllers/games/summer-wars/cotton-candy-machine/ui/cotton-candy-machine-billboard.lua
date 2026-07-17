-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local CottonCandyMachineConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "cotton-candy-machine", "cotton-candy-machine-config").CottonCandyMachineConfig;

return {
    CottonCandyMachineBillboard = v2.new(u1)(function(u4, p5) -- Line: 9
        -- upvalues: u1 (copy), CottonCandyMachineConfig (copy), Workspace (copy), TweenService (copy)
        local useEffect = p5.useEffect;
        local u6 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u6 (copy), u4 (copy), CottonCandyMachineConfig (ref), Workspace (ref), TweenService (ref)
            local u7 = nil;

            local function v14() -- Line: 14
                -- upvalues: u6 (ref), u7 (ref), u4 (ref), CottonCandyMachineConfig (ref), Workspace (ref), TweenService (ref)
                local v8 = u6:getValue();

                if not v8 then
                    return nil;
                end;

                local v9 = u7;

                if v9 ~= nil then
                    v9:Cancel();
                end;

                local v10 = u4.cottonCandyMachine:GetAttribute(CottonCandyMachineConfig.BLOCK_GIVE_NEXT_TIME_ATTRIBUTE);

                if v10 == nil then
                    v8.Size = UDim2.fromScale(0, 1);

                    return nil;
                end;

                local v11 = v10 - Workspace:GetServerTimeNow();
                local v12 = math.max(0, v11);
                local v13 = math.clamp(1 - v12 / CottonCandyMachineConfig.BLOCK_GIVE_INTERVAL, 0, 1);
                v8.Size = UDim2.fromScale(v13, 1);

                if v12 <= 0 then
                    return nil;
                end;

                u7 = TweenService:Create(v8, TweenInfo.new(v12, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(1, 1)
                });
                u7:Play();
            end;

            v14();
            local u15 = u4.cottonCandyMachine:GetAttributeChangedSignal(CottonCandyMachineConfig.BLOCK_GIVE_NEXT_TIME_ATTRIBUTE):Connect(v14);

            return function() -- Line: 41
                -- upvalues: u7 (ref), u15 (copy)
                local v16 = u7;

                if v16 ~= nil then
                    v16:Cancel();
                end;

                u15:Disconnect();
            end;
        end, {});

        return u1.createFragment({
            CottonCandyMachineBillboard = u1.createElement("BillboardGui", {
                AlwaysOnTop = true,
                MaxDistance = 35,
                StudsOffset = Vector3.new(0, 5, 0),
                Adornee = u4.cottonCandyMachine,
                Size = UDim2.fromScale(5, 1)
            }, {
                Container = u1.createElement("Frame", {
                    BackgroundTransparency = 0.15,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(36, 24, 38),
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }),
                    u1.createElement("UIStroke", {
                        Thickness = 1.5,
                        Transparency = 0.15,
                        Color = Color3.fromRGB(255, 208, 84)
                    }),
                    Title = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        RichText = true,
                        TextScaled = true,
                        Font = Enum.Font.RobotoMono,
                        Size = UDim2.fromScale(1, 0.48),
                        Text = "<b>x" .. tostring(CottonCandyMachineConfig.BLOCK_GIVE_AMOUNT) .. "</b> blocks",
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }, { u1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.08, 0),
                            PaddingRight = UDim.new(0.08, 0)
                        }) }),
                    BarBackground = u1.createElement("Frame", {
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundColor3 = Color3.fromRGB(64, 47, 67),
                        Position = UDim2.fromScale(0.5, 0.56),
                        Size = UDim2.fromScale(0.84, 0.26)
                    }, {
                        u1.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }),
                        BarFill = u1.createElement("Frame", {
                            BackgroundColor3 = Color3.fromRGB(255, 126, 205),
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(0, 1),
                            [u1.Ref] = u6
                        }, { u1.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 4)
                            }) })
                    })
                })
            })
        });
    end)
};