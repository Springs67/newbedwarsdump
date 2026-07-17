-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;

return function(p2) -- Line: 9
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), EffectUtil (copy), TweenService (copy)
    local u3 = ReplicatedStorage.Assets.Effects.PirateTreasure:Clone();
    u3.Parent = Workspace;
    scaleModel(u3, 1.25);
    local v4 = ReplicatedStorage.Assets.Effects.MagicMirrorExplosion:Clone();
    v4.Parent = u3;
    v4:PivotTo(u3:GetPivot());
    EffectUtil:playEffects({ v4 }, nil, {
        destroyAfterSec = 1
    });

    local function u13(u5) -- Line: 20
        -- upvalues: TweenService (ref), ReplicatedStorage (ref), u3 (copy), EffectUtil (ref)
        local u6 = Color3.fromRGB(255, 79, 79);
        local PrimaryPart = u5.PrimaryPart;

        if PrimaryPart then
            local u7 = TweenService:Create(PrimaryPart, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                CFrame = PrimaryPart:GetPivot() * CFrame.Angles(0, 0, -0.03490658503988659)
            });
            local u8 = TweenService:Create(PrimaryPart, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                CFrame = PrimaryPart:GetPivot() * CFrame.Angles(0, 0, 0.03490658503988659)
            });
            local u9 = 0;
            u7:Play();
            u7.Completed:Connect(function() -- Line: 46
                -- upvalues: u8 (copy)
                u8:Play();
            end);
            u8.Completed:Connect(function() -- Line: 49
                -- upvalues: u9 (ref), u7 (copy)
                u9 = u9 + 1;

                if u9 == 6 then
                    return nil;
                end;

                u7:Play();
            end);
        end;

        local Main = u5:WaitForChild("Main", 3);

        if Main ~= nil then
            Main = Main:WaitForChild("neon", 3);
        end;

        if Main then
            TweenService:Create(Main, TweenInfo.new(0.7000000000000001), {
                Color = u6
            }):Play();
        end;

        task.delay(0.7000000000000001, function() -- Line: 67
            -- upvalues: u5 (copy), TweenService (ref), ReplicatedStorage (ref), u3 (ref), u6 (copy), EffectUtil (ref), Main (copy)
            local Main2 = u5:WaitForChild("Main", 3);

            if Main2 ~= nil then
                Main2 = Main2:WaitForChild("Hinge", 3);
            end;

            local v10 = Main2:FindFirstChildWhichIsA("WeldConstraint");

            if v10 ~= nil then
                v10:Destroy();
            end;

            Main2.Anchored = true;
            TweenService:Create(Main2, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                CFrame = Main2.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
            }):Play();
            local v11 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
            v11.Parent = u3;
            v11:PivotTo(u3:GetPivot());
            v11.Pulse.Color = ColorSequence.new(u6);
            EffectUtil:playEffects({ v11 }, nil, {
                destroyAfterSec = 1
            });
            local v12 = Main;

            if v12 ~= nil then
                v12:Destroy();
            end;

            task.delay(2, function() -- Line: 98
                -- upvalues: EffectUtil (ref), u5 (ref), TweenService (ref), Main2 (copy)
                EffectUtil:enableInstanceEffect(u5);
                TweenService:Create(Main2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    CFrame = Main2.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
                }):Play();
            end);
        end);
    end;

    task.delay(2, function() -- Line: 127
        -- upvalues: u13 (copy), u3 (copy)
        u13(u3);
    end);

    return function() -- Line: 130
        -- upvalues: u3 (copy)
        u3:Destroy();
    end;
end;