-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local VendingMachineRewardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;

return {
    CarouselReward = v2.new(u1)(function(u3, p4) -- Line: 8
        -- upvalues: u1 (copy), TweenService (copy), VendingMachineRewardMeta (copy), ItemViewport (copy)
        local _ = p4.useState;
        local useMemo = p4.useMemo;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 13
            -- upvalues: u5 (copy), u3 (copy), TweenService (ref)
            local u6 = true;
            task.spawn(function() -- Line: 16
                -- upvalues: u5 (ref), u3 (ref), TweenService (ref), u6 (ref)
                local v7 = u5:getValue();

                if v7 == nil then
                    return nil;
                end;

                local v8 = TweenService:Create(v7, TweenInfo.new((u3.Position.X.Scale + u3.totalRewardCount / 2) * 2, Enum.EasingStyle.Linear), {
                    Position = UDim2.fromScale(-u3.totalRewardCount / 2, 0.5)
                });
                v8:Play();
                v8.Completed:Wait();

                while u6 do
                    local u9 = u5:getValue();

                    if u9 == nil then
                        return nil;
                    end;

                    u9.Position = UDim2.fromScale(u3.totalRewardCount / 2, 0.5);
                    (function() -- Line: 33
                        -- upvalues: TweenService (ref), u9 (copy), u3 (ref)
                        local v10 = TweenService:Create(u9, TweenInfo.new(2 * u3.totalRewardCount, Enum.EasingStyle.Linear), {
                            Position = UDim2.fromScale(-u3.totalRewardCount / 2, 0.5)
                        });
                        v10:Play();
                        v10.Completed:Wait();
                    end)();
                end;
            end);

            return function() -- Line: 43
                -- upvalues: u6 (ref)
                u6 = false;
            end;
        end, {});
        local u11 = VendingMachineRewardMeta[u3.rewardId];

        return useMemo(function() -- Line: 48
            -- upvalues: u1 (ref), u5 (copy), u3 (copy), u11 (copy), ItemViewport (ref)
            local v12 = {
                [u1.Ref] = u5,
                Position = u3.Position,
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local v13 = {};
            local v14 = #v13;
            local v15;

            if u11.item == nil then
                v15 = false;
            else
                v15 = u1.createElement(ItemViewport, {
                    ImageTransparency = 0,
                    Size = UDim2.fromScale(0.85, 0.85),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ItemType = u11.item.itemType
                });
            end;

            if v15 then
                v13[v14 + 1] = v15;
            end;

            local v16 = #v13;
            local v17;

            if u11.custom == nil then
                v17 = false;
            else
                v17 = u1.createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 0,
                    Image = u11.custom.image,
                    Size = UDim2.fromScale(0.85, 0.85),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                });
            end;

            if v17 then
                v13[v16 + 1] = v17;
            end;

            return u1.createElement("Frame", v12, v13);
        end);
    end)
};