-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local SLICE_META = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "radial-wheel", "radial-wheel-type").SLICE_META;

return {
    RadialWheel = v4.new(u3)(function(u5, p6) -- Line: 12
        -- upvalues: u3 (copy), SLICE_META (copy), u2 (copy), UserInputService (copy), KnitClient (copy), DeviceUtil (copy), Empty (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(-1);
        local u9 = u3.createRef();
        local numSlices = u5.numSlices;
        local u10 = SLICE_META[numSlices];

        if not u10 then
            return u3.createFragment();
        end;

        local u11 = 250 - u10.imageSize.X;
        local u12 = 360 / numSlices - 1;
        local image = u10.image;
        local v13 = false;
        local v14 = 0;
        local v15 = {};

        while true do
            if v13 then
                v14 = v14 + 1;
            else
                v13 = true;
            end;

            if v14 >= numSlices then
                useEffect(function() -- Line: 42
                    -- upvalues: u2 (ref), u9 (copy), UserInputService (ref), u11 (copy), u8 (copy), u5 (copy), u12 (copy), numSlices (copy)
                    local u16 = u2.new();
                    local u17 = u9:getValue();
                    local u18 = { Enum.UserInputType.MouseMovement };
                    u16:GiveTask(UserInputService.InputChanged:Connect(function(p19) -- Line: 47
                        -- upvalues: u18 (copy), u17 (copy), u11 (ref), u8 (ref), u5 (ref), u12 (ref), numSlices (ref)
                        if table.find(u18, p19.UserInputType) == nil then
                            return nil;
                        end;

                        if table.find({ Enum.UserInputState.Begin, Enum.UserInputState.Change }, p19.UserInputState) == nil then
                            return nil;
                        end;

                        local v20 = u17;

                        if v20 ~= nil then
                            v20 = v20.Parent;
                        end;

                        if not v20 then
                            return nil;
                        end;

                        local v21 = (Vector2.new(p19.Position.X, p19.Position.Y) - u17.AbsolutePosition) / u17.AbsoluteSize - Vector2.new(0.5, 0.5);

                        if v21.Magnitude < u11 / 250 / 2 then
                            u8(-1);

                            return nil;
                        end;

                        if u5.limitHoverDistance and v21.Magnitude > 0.5 then
                            u8(-1);

                            return nil;
                        end;

                        local v22 = math.atan2(v21.Y, v21.X);
                        local v23 = math;
                        local v24 = math.deg(v22);
                        local angleOffset = u5.angleOffset;
                        u8(v23.floor((v24 - (angleOffset == nil and 0 or angleOffset)) / (u12 + 1)) % numSlices);
                    end));

                    return function() -- Line: 94
                        -- upvalues: u16 (copy), u5 (ref)
                        u16:DoCleaning();
                        local onClose = u5.onClose;

                        if onClose ~= nil then
                            onClose();
                        end;
                    end;
                end, {});
                useEffect(function() -- Line: 102
                    -- upvalues: u2 (ref), UserInputService (ref), u5 (copy), u7 (copy), KnitClient (ref)
                    local u25 = u2.new();
                    u25:GiveTask(UserInputService.InputEnded:Connect(function(p26) -- Line: 105
                        -- upvalues: u5 (ref), u7 (ref), KnitClient (ref)
                        if p26 ~= u5.inputObject then
                            return nil;
                        end;

                        if u7 >= 0 then
                            u5.entries[u7 + 1].onSelect();
                        end;

                        KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                    end));

                    return function() -- Line: 114
                        -- upvalues: u25 (copy)
                        u25:DoCleaning();
                    end;
                end, { u7 });

                local function _(p27) -- Line: 118
                    return p27.UserInputType == Enum.UserInputType.MouseButton1 or p27.UserInputType == Enum.UserInputType.Touch or p27.KeyCode == Enum.KeyCode.ButtonR2;
                end;

                useEffect(function() -- Line: 137
                    -- upvalues: u5 (copy), u2 (ref), u9 (copy), UserInputService (ref), u11 (copy), u12 (copy), numSlices (copy)
                    if not u5.enableClickToSelect then
                        return nil;
                    end;

                    local u28 = u2.new();
                    local u29 = u9:getValue();
                    u28:GiveTask(UserInputService.InputEnded:Connect(function(p30) -- Line: 143
                        -- upvalues: u29 (copy), u11 (ref), u5 (ref), u12 (ref), numSlices (ref)
                        if p30.UserInputType ~= Enum.UserInputType.MouseButton1 and p30.UserInputType ~= Enum.UserInputType.Touch and p30.KeyCode ~= Enum.KeyCode.ButtonR2 then
                            return nil;
                        end;

                        local v31 = u29;

                        if v31 ~= nil then
                            v31 = v31.Parent;
                        end;

                        if not v31 then
                            return nil;
                        end;

                        local v32 = (Vector2.new(p30.Position.X, p30.Position.Y) - u29.AbsolutePosition) / u29.AbsoluteSize - Vector2.new(0.5, 0.5);

                        if v32.Magnitude < u11 / 250 / 2 then
                            return nil;
                        end;

                        if u5.limitHoverDistance and v32.Magnitude > 0.5 then
                            return nil;
                        end;

                        local v33 = math.atan2(v32.Y, v32.X);
                        local v34 = math;
                        local v35 = math.deg(v33);
                        local angleOffset = u5.angleOffset;
                        local v36 = v34.floor((v35 - (angleOffset == nil and 0 or angleOffset)) / (u12 + 1)) % numSlices;
                        u5.entries[v36 + 1].onSelect();
                    end));

                    return function() -- Line: 181
                        -- upvalues: u28 (copy)
                        u28:DoCleaning();
                    end;
                end, { u7 });
                local v37 = {
                    Size = u5.Size or UDim2.fromScale(1, 1),
                    Position = u5.Position,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    [u3.Ref] = u9
                };
                local v38 = { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) };
                local v39 = #v38;
                local v40;

                if u7 == -1 then
                    v40 = false;
                else
                    v40 = (function() -- Line: 198
                        -- upvalues: u5 (copy), u7 (copy), u3 (ref), DeviceUtil (ref)
                        local v41;

                        if u7 < #u5.entries then
                            v41 = u5.entries[u7 + 1];
                        else
                            v41 = nil;
                        end;

                        if not v41 then
                            return u3.createFragment();
                        end;

                        local v42 = {
                            BackgroundTransparency = 0.45,
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = UDim2.fromScale(0.528, 0.528),
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        };
                        local v43 = {};
                        local v44 = #v43;
                        local v45 = {
                            Text = v41.title
                        };
                        local description = v41.description;
                        v45.Position = UDim2.fromScale(0.5, (description == "" or not description) and 0.5 or 0.15);
                        local description2 = v41.description;
                        v45.AnchorPoint = Vector2.new(0.5, (description2 == "" or not description2) and 0.5 or 0);
                        v45.Size = UDim2.fromScale(0.75, 0.2);
                        v45.FontFace = Font.new("Roboto", Enum.FontWeight.SemiBold);
                        v45.TextScaled = true;
                        v45.BackgroundTransparency = 1;
                        v45.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v43[v44 + 1] = u3.createElement("TextLabel", v45);
                        local v46;

                        if v41.description == nil then
                            v46 = false;
                        else
                            v46 = u3.createElement("TextLabel", {
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Text = v41.description,
                                Position = UDim2.fromScale(0.5, 0.37),
                                AnchorPoint = Vector2.new(0.5, 0),
                                Size = UDim2.fromScale(0.925, 0.45),
                                Font = Enum.Font.Roboto,
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }, { u3.createElement("UITextSizeConstraint", {
                                    MaxTextSize = DeviceUtil.isSmallScreen() and 16 or 22
                                }) });
                        end;

                        if v46 then
                            v43[v44 + 2] = v46;
                        end;

                        v43[#v43 + 1] = u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        });

                        return u3.createElement("Frame", v42, v43);
                    end)();
                end;

                if v40 then
                    v38[v39 + 1] = v40;
                end;

                local v47 = #v38;

                local function v60(u48) -- Line: 253
                    -- upvalues: u5 (copy), u12 (copy), u11 (copy), u10 (copy), image (copy), u7 (copy), u3 (ref), DeviceUtil (ref), Empty (ref)
                    local v49;

                    if u48 < #u5.entries then
                        v49 = u5.entries[u48 + 1];
                    else
                        v49 = nil;
                    end;

                    local angleOffset = u5.angleOffset;
                    local v50 = (angleOffset == nil and 0 or angleOffset) + 0.5 + u48 + u12 * u48 + u12 / 2;
                    local v51 = math.rad(v50);
                    local v52 = 0.5 + math.cos(v51) * (u11 / 250 / 2 + u10.imageSize.X / 2 / 500);
                    local v53 = 0.5 + math.sin(v51) * (u11 / 250 / 2 + u10.imageSize.X / 2 / 500);
                    local v54 = UDim2.fromScale(u10.imageSize.X / 500, u10.imageSize.Y / 500);
                    local v55 = UDim2.fromScale((192 - (250 - u10.imageSize.X)) / u10.imageSize.X, 0.5);
                    local v56 = {
                        Image = image,
                        Position = UDim2.fromScale(v52, v53),
                        Rotation = v50,
                        Size = v54,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1
                    };
                    local v57;

                    if u5.highlightSlice == u48 then
                        v57 = Color3.fromRGB(255, 255, 255);
                    else
                        v57 = Color3.fromRGB(0, 0, 0);
                    end;

                    v56.ImageColor3 = v57;
                    v56.ImageTransparency = u7 == u48 and 0.05 or (u5.highlightSlice == u48 and 0.15 or 0.45);
                    v56.ScaleType = Enum.ScaleType.Fit;

                    v56[u3.Event.Activated] = function() -- Line: 275
                        -- upvalues: DeviceUtil (ref), u5 (ref), u48 (copy)
                        if DeviceUtil.isGamepadControls() then
                            u5.entries[u48 + 1].onSelect();
                        end;
                    end;

                    local v58 = { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = u10.imageSize.X / u10.imageSize.Y
                        }) };
                    local v59 = #v58;

                    if v49 then
                        v49 = u3.createElement(Empty, {
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.174 / v54.X.Scale, 0.174 / v54.Y.Scale),
                            Rotation = -v50,
                            Position = v55,
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        }, { u3.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }), v49.element });
                    end;

                    if v49 then
                        v58[v59 + 1] = v49;
                    end;

                    return u3.createElement("ImageButton", v56, v58);
                end;

                local v61 = table.create(#v15);

                for i, v in v15 do
                    v61[i] = v60(v, i - 1, v15);
                end;

                for i, v in v61 do
                    v38[v47 + i] = v;
                end;

                return u3.createElement("Frame", v37, v38);
            end;

            table.insert(v15, v14);
        end;
    end)
};