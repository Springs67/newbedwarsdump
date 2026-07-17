-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "MouseIconController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 16
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 20
    -- upvalues: u1 (copy)
    p5.mouseMaid = u1.new();
end;

function u3.onStart(p6) -- Line: 23
end;

function u3.setMouseIcon(p7, p8) -- Line: 25
    -- upvalues: Players (copy), u2 (copy)
    local u9 = Players.LocalPlayer:GetMouse();
    local u10 = u2("ScreenGui", {
        Name = "MouseIcon",
        DisplayOrder = 10000,
        Children = { u2("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 10000,
                Size = UDim2.new(0, 48, 0, 48),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromOffset(u9.X, u9.Y),
                Image = p8,
                ScaleType = Enum.ScaleType.Fit
            }) },
        Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    });
    local v12 = u9.Move:Connect(function() -- Line: 41
        -- upvalues: u10 (copy), u9 (copy)
        local v11 = u10:FindFirstChildWhichIsA("ImageLabel");

        if v11 then
            v11.Position = UDim2.fromOffset(u9.X, u9.Y);
        end;
    end);
    p7.mouseMaid:GiveTask(v12);
    p7.mouseMaid:GiveTask(function() -- Line: 48
        -- upvalues: u10 (copy)
        u10:Destroy();
    end);
end;

function u3.clearMouseIcon(p13) -- Line: 52
    p13.mouseMaid:DoCleaning();
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/global/mouse/mouse-icon-controller@MouseIconController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    MouseIconController = u3
};