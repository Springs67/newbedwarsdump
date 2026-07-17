-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    LanternFlicker = v3.new(u2)(function(p4, p5) -- Line: 7
        -- upvalues: u2 (copy), u1 (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 11
            -- upvalues: u6 (copy), u1 (ref)
            local u7 = u6:getValue();

            if not u7 then
                return nil;
            end;

            local u8 = u1.new();
            local u9 = 0.5;
            u8:GiveTask(task.spawn(function() -- Line: 18
                -- upvalues: u9 (ref), u7 (copy)
                while true do
                    local v10 = task.wait(0.05);

                    if v10 == 0 or (v10 ~= v10 or not v10) then
                        break;
                    end;

                    u9 = u9 + (math.random() - 0.5 < 0 and 0.05 or -0.05);
                    u9 = math.clamp(u9, 0.4, 0.6);
                    u7.ImageTransparency = u9;
                end;
            end));

            return function() -- Line: 29
                -- upvalues: u8 (copy)
                u8:Destroy();
            end;
        end, {});

        return u2.createElement("BillboardGui", {
            Size = UDim2.fromScale(10, 10)
        }, { u2.createElement("ImageLabel", {
                [u2.Ref] = u6,
                ImageColor3 = Color3.fromRGB(255, 204, 153),
                ImageTransparency = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.SOLID_BLURRED_CIRCLE,
                BackgroundTransparency = 1
            }) });
    end)
};