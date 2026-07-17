-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;

return {
    ScarabUIDisplay = v3.new(u2)(function(u4, p5) -- Line: 8
        -- upvalues: u1 (copy), Workspace (copy), u2 (copy), ColorUtil (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, _ = useState(u1.new());
        local v7, u8 = useState("");
        useEffect(function() -- Line: 13
            -- upvalues: u4 (copy), u8 (copy), Workspace (ref), u6 (copy)
            if u4.timer == nil then
                return nil;
            end;

            local u9 = true;

            local function u13() -- Line: 19
                -- upvalues: u9 (ref), u4 (ref), u8 (ref), Workspace (ref), u13 (ref)
                task.delay(1, function() -- Line: 20
                    -- upvalues: u9 (ref), u4 (ref), u8 (ref), Workspace (ref), u13 (ref)
                    if not u9 then
                        return nil;
                    end;

                    if u4.timer == nil or u4.timer == -1 then
                        u8("");

                        return nil;
                    end;

                    if u4.timer == (1 / 0) then
                        u8("Maxed");

                        return nil;
                    end;

                    local v10 = u4.timer - Workspace:GetServerTimeNow();
                    local v11 = math.floor(v10 / 60);
                    local v12 = v10 - v11 * 60;
                    u13();

                    if v12 == 0 and v11 == 0 then
                        u8("");

                        return;
                    end;

                    u8(string.format("%02i", v11) .. ":" .. string.format("%02i", v12));
                end);
            end;

            u13();
            u6:GiveTask(function() -- Line: 44
                -- upvalues: u9 (ref)
                u9 = false;
            end);

            return function() -- Line: 47
                -- upvalues: u9 (ref)
                u9 = false;
            end;
        end);
        local v14 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 1)
        };
        local v15 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.667
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 2)
            }) };
        local v16 = #v15;
        local v17 = {
            Size = UDim2.fromScale(1, 1)
        };
        local icon = u4.icon;
        v17.Image = icon == nil and "rbxassetid://15186577197" or icon;
        v17.BackgroundTransparency = 1;
        v15[v16 + 1] = u2.createElement("ImageLabel", v17, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v15[v16 + 2] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Font = "LuckiestGuy",
            TextYAlignment = "Center",
            Size = UDim2.fromScale(0.8, 0.8),
            Text = v7,
            AutomaticSize = Enum.AutomaticSize.X,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        });

        return u2.createElement("Frame", v14, v15);
    end)
};