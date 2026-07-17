-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local VendingMachineRewardId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local VendingMachineRewardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local VendingMachineFloater = RuntimeLib.import(script, script.Parent.Parent, "vending-machine-floater").VendingMachineFloater;
local CarouselReward = RuntimeLib.import(script, script.Parent, "carousel-reward").CarouselReward;

return {
    VendingMachineIdle = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), VendingMachineFloater (copy), u1 (copy), VendingMachineRewardMeta (copy), VendingMachineRewardId (copy), CarouselReward (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = false;
        local v7 = 0;
        local v8 = {};

        while true do
            if v6 then
                v7 = v7 + 1;
            else
                v6 = true;
            end;

            if v7 >= 4 then
                break;
            end;

            local v9 = u2.createElement(VendingMachineFloater);
            table.insert(v8, v9);
        end;

        local v10 = false;
        local v11 = 0;
        local v12 = {};

        while true do
            if v10 then
                v11 = v11 + 1;
            else
                v10 = true;
            end;

            if v11 >= 10 then
                local v13 = {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0, 0)
                };
                local v14 = {};
                local v15 = #v14;

                for i, v in v8 do
                    v14[v15 + i] = v;
                end;

                local v16 = {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 0.45),
                    Position = UDim2.fromScale(0.5, 0.47),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v17 = { u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
                        Transparency = NumberSequence.new(0.6, 0.35)
                    }) };
                local v18 = {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v19 = {};
                local v20 = #v19;

                for i, v in v12 do
                    v19[v20 + i] = v;
                end;

                v17[#v17 + 1] = u2.createElement(Empty, v18, v19);
                v14[#v14 + 1] = u2.createElement("Frame", v16, v17);

                return u2.createElement(Empty, v13, v14);
            end;

            local function _(p21) -- Line: 51
                -- upvalues: VendingMachineRewardId (ref)
                local v22;

                if p21.id == VendingMachineRewardId.NONE then
                    v22 = false;
                else
                    v22 = not p21.disabled;
                end;

                return v22;
            end;

            local v23 = 0;
            local v24 = {};

            for i, v in u1.values(VendingMachineRewardMeta) do
                local _ = i - 1;
                local v25;

                if v.id == VendingMachineRewardId.NONE then
                    v25 = false;
                else
                    v25 = not v.disabled;
                end;

                if v25 == true then
                    v23 = v23 + 1;
                    v24[v23] = v;
                end;
            end;

            local v26 = u2.createElement(CarouselReward, {
                totalRewardCount = 10,
                rewardId = v24[v11 % #v24 + 1].id,
                Position = UDim2.fromScale(v11 - 5, 0.5)
            });
            table.insert(v12, v26);
        end;
    end)
};