-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);

return {
    FireSheepHpBar = v2.new(u1)(function(u4, p5) -- Line: 10
        -- upvalues: u1 (copy), default (copy), TweenService (copy), u3 (copy), Theme (copy)
        local useEffect = p5.useEffect;
        local u6 = u1.createRef();
        local u7 = u1.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: default (ref), u4 (copy), u6 (copy), u7 (copy), TweenService (ref), u3 (ref)
            default.Client:WaitFor("FireSheepHpUpdate"):expect():Connect(function(p8) -- Line: 16
                -- upvalues: u4 (ref), u6 (ref), u7 (ref), TweenService (ref), u3 (ref)
                if p8.statue ~= u4.statue then
                    return nil;
                end;

                local v9 = u6:getValue();
                local v10 = u7:getValue();

                if not (v9 and v10) then
                    return nil;
                end;

                local v11 = p8.currentHp / p8.maxHp;
                v10.Size = UDim2.fromScale(v11, 1);
                TweenService:Create(v9, u3, {
                    Size = UDim2.fromScale(v11, 1)
                }):Play();
            end);
        end, {});

        return u1.createFragment({
            SheepHpBillboard = u1.createElement("BillboardGui", {
                AlwaysOnTop = true,
                StudsOffset = Vector3.new(0, 7, 0),
                MaxDistance = 35,
                Adornee = u4.statue,
                Size = UDim2.fromScale(6.5, 0.5)
            }, {
                InnerBar = u1.createElement("Frame", {
                    BackgroundTransparency = 0.8,
                    BorderSizePixel = 0,
                    ZIndex = 8,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }),
                MiddleBar = u1.createElement("Frame", {
                    [u1.Ref] = u6,
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 9
                }),
                OuterBar = u1.createElement("Frame", {
                    [u1.Ref] = u7,
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Theme.mcGreen,
                    BorderSizePixel = 0,
                    ZIndex = 10
                })
            })
        });
    end)
};