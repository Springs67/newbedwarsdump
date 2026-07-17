-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    MissionsListTimer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 8
        -- upvalues: StringUtil (copy), RuntimeLib (copy), u2 (copy), ColorUtil (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState("");

        local function u9() -- Line: 12
            -- upvalues: u3 (copy), StringUtil (ref)
            local v7 = u3.EndTime - os.time();
            local v8 = math.max(0, v7);

            return StringUtil.formatCountdownTime(v8, {
                hours = true,
                days = true,
                seperator = " : "
            });
        end;

        useEffect(function() -- Line: 20
            -- upvalues: RuntimeLib (ref), u6 (copy), u9 (copy)
            local u10 = true;
            RuntimeLib.Promise.defer(function() -- Line: 22
                -- upvalues: u10 (ref), u6 (ref), u9 (ref)
                while true do
                    local v11 = task.wait(0.2);

                    if v11 ~= 0 and (v11 == v11 and v11) then
                        v11 = u10;
                    end;

                    if v11 == 0 or (v11 ~= v11 or not v11) then
                        return;
                    end;

                    u6(u9());
                end;
            end);

            return function() -- Line: 34
                -- upvalues: u10 (ref)
                u10 = false;

                return u10;
            end;
        end, {});

        return u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            RichText = true,
            TextSize = 18,
            AnchorPoint = u3.AnchorPoint,
            Position = u3.Position,
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = "<b>Expires in " .. v5 .. "</b>",
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });
    end)
};