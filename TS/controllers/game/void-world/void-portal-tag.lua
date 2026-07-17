-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    VoidPortalTag = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: Workspace (copy), u1 (copy), Theme (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;

        local function getRemainingTime() -- Line: 10
            -- upvalues: u3 (copy), Workspace (ref)
            local v5 = u3.closeTime - Workspace:GetServerTimeNow();

            return math.floor(v5);
        end;

        local v6 = u3.closeTime - Workspace:GetServerTimeNow();
        local v7, u8 = useState((math.floor(v6)));
        useEffect(function() -- Line: 14
            -- upvalues: u8 (copy), u3 (copy), Workspace (ref)
            local u9 = true;
            task.spawn(function() -- Line: 16
                -- upvalues: u9 (ref), u8 (ref), u3 (ref), Workspace (ref)
                while true do
                    local v10 = task.wait(1);

                    if v10 ~= 0 and (v10 == v10 and v10) then
                        v10 = u9;
                    end;

                    if v10 == 0 or (v10 ~= v10 or not v10) then
                        return;
                    end;

                    local v11 = u3.closeTime - Workspace:GetServerTimeNow();
                    u8((math.floor(v11)));
                end;
            end);

            return function() -- Line: 28
                -- upvalues: u9 (ref)
                u9 = false;
            end;
        end, {});

        return u1.createFragment({
            VoidPortalTag = u1.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 4, 0),
                AlwaysOnTop = true,
                MaxDistance = 150,
                ResetOnSpawn = false,
                AutoLocalize = false,
                Size = UDim2.fromScale(6, 1)
            }, {
                TagContainer = u1.createElement("Frame", {
                    BackgroundTransparency = 0.75,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.75, 0.75),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    u1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 6),
                        PaddingRight = UDim.new(0, 6)
                    }),
                    u1.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.01, 0)
                    }),
                    Stroke = u1.createElement("UIStroke", {
                        Thickness = 1,
                        Transparency = 1,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }),
                    Tag = u1.createElement("TextLabel", {
                        AutomaticSize = "X",
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        RichText = true,
                        AutoLocalize = false,
                        TextYAlignment = "Center",
                        LayoutOrder = 2,
                        Text = u3.getTag(v7),
                        Size = UDim2.fromScale(1, 1),
                        TextColor3 = Theme.mcPink,
                        Font = Enum.Font.ArialBold
                    })
                })
            })
        });
    end)
};