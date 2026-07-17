-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CaretToggle = RuntimeLib.import(script, script.Parent, "caret-toggle").CaretToggle;

return {
    DragWindow = v3.new(u2)(function(p4, p5) -- Line: 8
        -- upvalues: u2 (copy), u1 (copy), ColorUtil (copy), CaretToggle (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, _ = useState(u2.createRef());
        local u7, _ = useState(u2.createRef());
        local u8, u9 = useState(false);
        local WindowFrameProps = p4.WindowFrameProps;

        if WindowFrameProps ~= nil then
            WindowFrameProps = WindowFrameProps.BackgroundColor3;
        end;

        if WindowFrameProps == nil then
            WindowFrameProps = Color3.fromRGB(4, 5, 8);
        end;

        useEffect(function() -- Line: 23
            -- upvalues: u6 (copy), u1 (ref), u7 (copy)
            local v10 = u6:getValue();

            if v10 ~= nil then
                v10 = v10.Position;
            end;

            local u11 = v10;
            u1("UIDragDetector", {
                Parent = u6:getValue(),
                DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,

                DragContinue = function(p12) -- Line: 32, Name: DragContinue
                    -- upvalues: u7 (ref), u6 (ref), u11 (ref)
                    local v13 = u7:getValue();
                    local v14 = u6:getValue();

                    if not (v13 and v14) then
                        return false;
                    end;

                    local AbsolutePosition = v13.AbsolutePosition;
                    local AbsoluteSize = v13.AbsoluteSize;
                    local v15;

                    if p12.X >= AbsolutePosition.X then
                        v15 = p12.X <= AbsolutePosition.X + AbsoluteSize.X;
                    else
                        v15 = false;
                    end;

                    local v16;

                    if p12.Y >= AbsolutePosition.Y then
                        v16 = p12.Y <= AbsolutePosition.Y + AbsoluteSize.Y;
                    else
                        v16 = false;
                    end;

                    if not (v15 and v16) and u11 then
                        v14.Position = u11;
                    end;
                end,

                DragStart = function(p17) -- Line: 48, Name: DragStart
                end,

                DragEnd = function(p18) -- Line: 49, Name: DragEnd
                    -- upvalues: u6 (ref), u11 (ref)
                    local v19 = u6:getValue();

                    if v19 ~= nil then
                        v19 = v19.Position;
                    end;

                    u11 = v19;
                end
            });
        end, {});
        local v20 = {
            Size = UDim2.fromScale(0.3, 0.3),
            BackgroundTransparency = 1,
            [u2.Ref] = u6
        };
        local WindowFrameProps2 = p4.WindowFrameProps;

        if WindowFrameProps2 then
            for i, v in WindowFrameProps2 do
                v20[i] = v;
            end;
        end;

        local v21 = not u8;

        if v21 then
            local v22 = {
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1),
                Size = UDim2.fromScale(1, 0.935),
                BackgroundColor3 = WindowFrameProps
            };
            local v23 = {};
            local v24 = #v23;
            local v25 = p4[u2.Children];

            if v25 then
                for i, v in v25 do
                    if type(i) == "number" then
                        v23[v24 + i] = v;
                    else
                        v23[i] = v;
                    end;
                end;
            end;

            v21 = u2.createFragment({
                WindowContent = u2.createElement("Frame", v22, v23)
            });
        end;

        local v27 = {
            WindowHeader = u2.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 0.065),
                BackgroundColor3 = WindowFrameProps,
                BorderSizePixel = 0,
                [u2.Ref] = u7,

                [u2.Event.Activated] = function() -- Line: 101
                    -- upvalues: u9 (copy), u8 (copy)
                    u9(not u8);
                end,

                ZIndex = 100
            }, { u2.createElement("TextLabel", {
                    TextScaled = true,
                    TextTransparency = 0.3,
                    BackgroundTransparency = 1,
                    ZIndex = 100,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.75, 0.7),
                    Text = u8 and "OPEN" or "HIDE",
                    TextColor3 = ColorUtil.WHITE
                }), u2.createElement(CaretToggle, {
                    InitialValue = u8,

                    OnClick = function(p26) -- Line: 119, Name: OnClick
                        -- upvalues: u9 (copy)
                        u9(p26);
                    end,

                    FrameProps = {
                        ZIndex = 100
                    }
                }) })
        };
        local v28 = #v27;

        if v21 then
            v27[v28 + 1] = v21;
        end;

        return u2.createFragment({
            DragWindow = u2.createElement("Frame", v20, v27)
        });
    end)
};