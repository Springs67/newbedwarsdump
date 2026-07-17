-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;

return {
    VendingMachineFloater = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), ItemViewport (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local useMemo = p4.useMemo;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        local u7 = u1.createRef();

        local function _() -- Line: 14
            return UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
        end;

        local u8 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
        local u9 = math.random(-40, 40);
        useEffect(function() -- Line: 19
            -- upvalues: u5 (copy), TweenService (ref), u7 (copy), u8 (ref)
            local u10 = true;
            task.spawn(function() -- Line: 21
                -- upvalues: u10 (ref), u5 (ref), TweenService (ref), u7 (ref), u8 (ref)
                while u10 do
                    local u11 = u5:getValue();

                    if not u11 then
                        return nil;
                    end;

                    local v12 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
                    local v13 = math.random(-40, 40);
                    local u14 = math.random(800, 1600) / 100;
                    local v15 = TweenService:Create(u11, TweenInfo.new(u14, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Position = v12,
                        Rotation = v13
                    });
                    v15:Play();
                    local u16 = u7:getValue();

                    if u16 then
                        local v17 = TweenService:Create(u16, TweenInfo.new(u14 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            TextTransparency = 0
                        });
                        v17:Play();
                        v17.Completed:Connect(function() -- Line: 41
                            -- upvalues: u11 (copy), u10 (ref), TweenService (ref), u16 (copy), u14 (copy)
                            if not (u11 and u10) then
                                return nil;
                            end;

                            TweenService:Create(u16, TweenInfo.new(u14 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                TextTransparency = 1
                            }):Play();
                        end);
                    end;

                    v15.Completed:Wait();
                    u8 = v12;
                end;
            end);

            return function() -- Line: 55
                -- upvalues: u10 (ref)
                u10 = false;
            end;
        end, {});

        return useMemo(function() -- Line: 59
            -- upvalues: u1 (ref), u5 (copy), u8 (ref), u9 (copy), u3 (copy), ItemViewport (ref), u6 (copy), u7 (copy)
            local v18 = {
                [u1.Ref] = u5,
                Size = UDim2.fromScale(0.3, 0.3),
                Position = u8,
                Rotation = u9,
                AnchorPoint = Vector2.new(0.5, 0.5),
                SizeConstraint = "RelativeXX",
                BackgroundTransparency = 1,
                BorderSizePixel = 1
            };
            local v19 = {};
            local v20 = #v19;
            local v21;

            if u3.item == nil then
                v21 = false;
            else
                v21 = u1.createElement(ItemViewport, {
                    ImageTransparency = 0.1,
                    ItemType = u3.item
                });
            end;

            if v21 then
                v19[v20 + 1] = v21;
            end;

            local v22 = #v19;
            local v23;

            if u3.image == nil then
                v23 = false;
            else
                v23 = u1.createElement("ImageLabel", {
                    [u1.Ref] = u6,
                    Image = u3.image,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.2
                });
            end;

            if v23 then
                v19[v22 + 1] = v23;
            end;

            local v24 = #v19;
            local v25;

            if u3.item == nil and u3.image == nil then
                v25 = u1.createElement("TextLabel", {
                    [u1.Ref] = u7,
                    Text = "?",
                    Font = "LuckiestGuy",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextScaled = true,
                    TextTransparency = math.random(),
                    BorderSizePixel = 0,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1.5, 1.5),
                    BackgroundTransparency = 1
                });
            else
                v25 = false;
            end;

            if v25 then
                v19[v24 + 1] = v25;
            end;

            return u1.createElement("Frame", v18, v19);
        end, {});
    end)
};