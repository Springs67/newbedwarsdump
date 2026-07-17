-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.HORIZONTAL_SLIDE = 0;
v4[0] = "HORIZONTAL_SLIDE";
u5.ROTATE = 1;
v4[1] = "ROTATE";

local function v19(u6, p7) -- Line: 20
    -- upvalues: u2 (copy), u1 (copy), u5 (ref), RunService (copy), default (copy), Linear (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8 = {};

    for i, v in u6 do
        v8[i] = v;
    end;

    v8.Animation = nil;
    local u9, _ = useState(u2.createRef());
    useEffect(function() -- Line: 30
        -- upvalues: u9 (copy), u1 (ref), u6 (copy), u5 (ref), RunService (ref), default (ref), Linear (ref)
        local u10 = u9:getValue();

        if not u10 then
            return nil;
        end;

        local u11 = u1.new();
        local Animation = u6.Animation;

        if Animation == u5.HORIZONTAL_SLIDE then
            local u12 = true;
            local Rotation = u10.Rotation;
            u11:GiveTask(function() -- Line: 42
                -- upvalues: u12 (ref)
                u12 = false;
            end);
            local u13 = 3;
            u11:GiveTask(RunService.Heartbeat:Connect(function(p14) -- Line: 46
                -- upvalues: u13 (ref), u10 (copy), Rotation (copy), default (ref), Linear (ref)
                u13 = u13 + p14;

                if u13 >= 3 then
                    if u10.Rotation == Rotation + 0 then
                        u10.Rotation = Rotation + 180;
                        u10.Offset = Vector2.new(1, 0);
                        default(3, Linear, function(p15) -- Line: 52
                            -- upvalues: u10 (ref)
                            u10.Offset = p15;
                        end, Vector2.new(1, 0), Vector2.new(-1, 0));
                    else
                        u10.Rotation = Rotation + 0;
                        u10.Offset = Vector2.new(1, 0);
                        default(3, Linear, function(p16) -- Line: 58
                            -- upvalues: u10 (ref)
                            u10.Offset = p16;
                        end, Vector2.new(1, 0), Vector2.new(-1, 0));
                    end;

                    u13 = 0;
                end;
            end));
        elseif Animation == u5.ROTATE then
            u11:GiveTask(RunService.Heartbeat:Connect(function(p17) -- Line: 69
                -- upvalues: u10 (copy)
                u10.Rotation = (u10.Rotation + 45 * p17) % 360;
            end));
        end;

        return function() -- Line: 76
            -- upvalues: u11 (copy)
            u11:DoCleaning();
        end;
    end, {});
    local v18 = {};

    for i, v in v8 do
        v18[i] = v;
    end;

    v18[u2.Ref] = u9;

    return u2.createElement("UIGradient", v18);
end;

return {
    GradientAnimationType = u5,
    Gradient = v3.new(u2)(v19)
};