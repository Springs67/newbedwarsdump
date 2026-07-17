-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    KitContractRewardShowcase = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), u1 (copy), RunService (copy), Empty (copy), BedwarsImageId (copy), RewardShowcase (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local u7 = u2.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u6 (copy), u7 (copy), u1 (ref), RunService (ref)
            local u8 = u6:getValue();
            local u9 = u7:getValue();

            if not (u8 and u9) then
                return nil;
            end;

            local u10 = u1.new();
            u10:GiveTask(RunService.Heartbeat:Connect(function(p11) -- Line: 22
                -- upvalues: u8 (copy), u9 (copy)
                local v12 = u8;
                v12.Rotation = v12.Rotation + 10 * p11;
                local v13 = u9;
                v13.Rotation = v13.Rotation - 5 * p11;
            end));

            return function() -- Line: 26
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, {});
        local v14 = {};

        for i, v in p4 do
            v14[i] = v;
        end;

        v14.Reward = nil;
        local v15 = {};

        for i, v in v14 do
            v15[i] = v;
        end;

        return u2.createFragment({
            KitContractRewardShowcase = u2.createElement(Empty, v15, {
                BackgroundEffectsContainer = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1.3, 1.3),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.5,
                        ZIndex = 0,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.6666666666666666, 0.6666666666666666),
                        Image = BedwarsImageId.SOLID_BLURRED_CIRCLE
                    }), u2.createElement("ImageLabel", {
                        [u2.Ref] = u6,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.SOLID_BLURRED_12_POINT_STAR,
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.5,
                        ZIndex = 0
                    }), u2.createElement("ImageLabel", {
                        [u2.Ref] = u7,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.SOLID_BLURRED_7_POINT_STAR,
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.5,
                        ZIndex = 0
                    }) }),
                KitContractBodyCenterRewardShowcase = u2.createElement(RewardShowcase, {
                    Reward = p4.Reward,
                    Size = UDim2.fromScale(0.9, 0.9),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            })
        });
    end)
};