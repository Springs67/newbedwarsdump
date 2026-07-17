-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    RPSResult = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), u1 (copy), TweenService (copy), KnitClient (copy), ColorUtil (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 13
            -- upvalues: u6 (copy), u1 (ref), TweenService (ref), KnitClient (ref), u2 (ref)
            local v7 = u6:getValue();

            if not v7 then
                return nil;
            end;

            local u8 = u1.new();
            TweenService:Create(v7, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
            }):Play();
            TweenService:Create(v7, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                Size = UDim2.fromScale(1.5, 1.5)
            }):Play();
            local u9 = TweenService:Create(v7, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
            });
            local u10 = TweenService:Create(v7, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                Size = UDim2.fromScale(0, 0)
            });
            task.delay(3, function() -- Line: 34
                -- upvalues: KnitClient (ref), u9 (copy), u10 (copy), u8 (copy), u2 (ref)
                local rpsTree = KnitClient.Controllers.RockPaperScissorsHandlerController.rpsTree;

                if rpsTree then
                    u9:Play();
                    u10:Play();
                    u8:GiveTask(u10.Completed:Connect(function() -- Line: 39
                        -- upvalues: u2 (ref), rpsTree (copy)
                        u2.unmount(rpsTree);
                    end));
                end;
            end);

            return function() -- Line: 44
                -- upvalues: u8 (copy)
                u8:DoCleaning();
            end;
        end, {});

        return u2.createFragment({
            RockPaperScissorsEmoteGui = u2.createElement("BillboardGui", {
                Size = UDim2.fromScale(0, 0),
                StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0),
                Adornee = p4.Character.Head,
                [u2.Ref] = u6
            }, {
                RockPaperScissorsEmoteResult = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }),
                    Result = u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.7, 0.7),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Image = p4.ResultImage,
                        ImageColor3 = Color3.fromRGB(51, 51, 51)
                    })
                })
            })
        });
    end)
};