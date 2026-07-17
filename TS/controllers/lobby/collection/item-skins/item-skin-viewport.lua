-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;

return {
    ItemSkinViewport = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), getItemSkinMeta (copy), u1 (copy), ItemUtil (copy), ModelUtil (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local useBinding = p5.useBinding;
        local u6 = u2.createRef();
        local u7, _ = useBinding(u2.createRef());
        local u8, u9 = useBinding(false);
        local u10 = getItemSkinMeta(u4.ItemSkin);
        local renderImage = u10.renderImage;
        useEffect(function() -- Line: 18
            -- upvalues: u6 (copy), u8 (copy), u7 (copy), u1 (ref), ItemUtil (ref), u10 (copy), u4 (copy), ModelUtil (ref), u9 (copy)
            local v11 = u6:getValue();

            if not v11 then
                return nil;
            end;

            if not u8:getValue() then
                v11.Ambient = Color3.fromRGB(162, 162, 162);
                v11.LightColor = Color3.fromRGB(255, 255, 255);
                v11.LightDirection = Vector3.new(0, -1, 0);
                v11.CurrentCamera = u7:getValue():getValue();
            end;

            (function() -- Line: 29
                -- upvalues: u6 (ref), u1 (ref), ItemUtil (ref), u10 (ref), u4 (ref), ModelUtil (ref), u7 (ref)
                local v12 = u6:getValue();

                if v12 == nil then
                    return nil;
                end;

                local v13 = v12:FindFirstChildWhichIsA("Model");

                if v13 ~= nil then
                    v13:Destroy();
                end;

                local u14 = v12:FindFirstChildWhichIsA("WorldModel") or u1("WorldModel", {
                    Name = "ItemSkin",
                    Parent = v12
                });
                local u15 = ItemUtil.createItemInstance(u10.itemType, 1, u4.ItemSkin);

                if not u15 then
                    return nil;
                end;

                local function _(p16) -- Line: 73
                    if p16:IsA("BasePart") then
                        p16.Anchored = false;
                    end;

                    local v17 = p16:GetAttribute("DisableInPlayerViewport");

                    if v17 ~= 0 and (v17 == v17 and (v17 ~= "" and v17)) then
                        p16:Destroy();
                    end;
                end;

                for i, descendant in u15:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        descendant.Anchored = false;
                    end;

                    local v18 = descendant:GetAttribute("DisableInPlayerViewport");

                    if v18 ~= 0 and (v18 == v18 and (v18 ~= "" and v18)) then
                        descendant:Destroy();
                    end;
                end;

                local function _(p19) -- Line: 87
                    if p19:IsA("LocalScript") then
                        p19:Destroy();
                    end;
                end;

                for i, descendant in u15:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("LocalScript") then
                        descendant:Destroy();
                    end;
                end;

                task.defer(function() -- Line: 95
                    -- upvalues: u15 (ref), u14 (copy), ModelUtil (ref), u7 (ref)
                    if not u15 then
                        return nil;
                    end;

                    u15.Parent = u14;
                    local Handle = u15:FindFirstChild("Handle");

                    if Handle then
                        Handle:PivotTo(CFrame.new() * CFrame.Angles(0, -0.3490658503988659, 0));
                    else
                        warn("No primary part found");
                    end;

                    task.wait(0.01);
                    local CFrame2 = Handle.CFrame;

                    local function _(p20) -- Line: 114
                        return p20:IsA("BasePart");
                    end;

                    local v21 = 0;
                    local v22 = {};

                    for i, descendant in u15:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") == true then
                            v21 = v21 + 1;
                            v22[v21] = descendant;
                        end;
                    end;

                    local function _(p23) -- Line: 128
                        return p23:IsA("Attachment");
                    end;

                    local v24 = 0;
                    local v25 = {};

                    for i, descendant in u15:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("Attachment") == true then
                            v24 = v24 + 1;
                            v25[v24] = descendant;
                        end;
                    end;

                    local v26 = ModelUtil.computeBoundingBox(CFrame2, v22, v25);
                    local v27 = v26[1];
                    local v28 = v26[2];
                    local v29 = (math.max(v28.X, v28.Y, v28.Z) * -1 / 1.3 - 3) * 50;
                    local v30 = Handle.CFrame * v27;
                    local v31 = v30 + Vector3.new(0, 0.8 * 50, v29);
                    local v32 = u7:getValue():getValue();

                    if v32 then
                        v32.CFrame = CFrame.new(v31, v30);
                    end;
                end);
            end)();
            u9(true);
        end, { u4.ItemSkin });
        local createElement = u2.createElement;
        local v33 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v34 = {};
        local v35;

        if renderImage == nil then
            v35 = u2.createFragment({
                Viewport = u2.createElement("ViewportFrame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = u4.ViewportTransparency,
                    [u2.Ref] = u6
                }, { u2.createElement("Camera", {
                        FieldOfView = 1,
                        [u2.Ref] = u7:getValue()
                    }) })
            });
        else
            v35 = u2.createElement("ImageLabel", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = renderImage
            });
        end;

        v34[1] = v35;

        return createElement("Frame", v33, v34);
    end)
};