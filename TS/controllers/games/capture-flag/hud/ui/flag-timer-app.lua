-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = u1.Component:extend("FlagTimerApp");

function v2.init(p3, p4) -- Line: 8
    p3.alive = true;
end;

function v2.didMount(u5) -- Line: 11
    -- upvalues: RuntimeLib (copy)
    RuntimeLib.Promise.defer(function() -- Line: 17
        -- upvalues: u5 (copy)
        while true do
            local v6 = task.wait(0.2);

            if v6 ~= 0 and (v6 == v6 and v6) then
                v6 = u5.alive;
            end;

            if v6 == 0 or (v6 ~= v6 or not v6) then
                return;
            end;

            u5:setState({});
        end;
    end);
end;

function v2.willUnmount(p7) -- Line: 30
    p7.alive = false;
end;

function v2.render(p8) -- Line: 33
    -- upvalues: u1 (copy), Empty (copy)
    local v9 = Color3.fromRGB(255, 255, 255);

    return u1.createFragment({
        FlagTimer = u1.createElement(Empty, {
            Size = UDim2.fromScale(1, 1)
        }, {
            Flag = u1.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.9)
            }, {
                u1.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder"
                    }
                ),
                Countdown = u1.createElement("TextLabel", {
                    Text = "Flag returns in ",
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.55),
                    FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    TextColor3 = v9
                }, { u1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0)
                    }) }),
                Time = u1.createElement("TextLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    LayoutOrder = 1,
                    Text = "[" .. tostring(p8.props.Countdown) .. "]",
                    Size = UDim2.fromScale(1.5, 0.8),
                    FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    TextColor3 = v9
                }, { u1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0)
                    }) })
            })
        })
    });
end;

function v2.generatorLabel(p10, p11) -- Line: 85
    -- upvalues: u1 (copy)
    return u1.createFragment({
        Countdown = u1.createFragment({
            Countdown = u1.createElement("TextLabel", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextScaled = true,
                LayoutOrder = 1,
                Text = "Flag returns in [" .. tostring(p10.props.Countdown) .. "]",
                Size = UDim2.fromScale(1, 0.55),
                FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                TextColor3 = p11
            }, { u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0)
                }) })
        })
    });
end;

return {
    FlagTimerApp = v2
};