-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TweenService = v2.TweenService;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "FadeUtil";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 17
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 21
end;

function u3.fade(p6, u7, u8, u9, u10, u11) -- Line: 23
    -- upvalues: RuntimeLib (copy), u1 (copy), Players (copy), TweenService (copy)
    return RuntimeLib.Promise.new(function(u12) -- Line: 24
        -- upvalues: u1 (ref), u10 (copy), u11 (copy), Players (ref), TweenService (ref), u7 (copy), u8 (copy), u9 (copy)
        local u13 = u1("Frame", {
            BorderSizePixel = 0,
            Transparency = 1,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = u10 or Color3.fromRGB(0, 0, 0)
        });

        if u11 then
            u1("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                Text = u11.text,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                TextColor3 = u11.color,
                Font = u11.font
            }).Parent = u13;
        end;

        local u14 = u1("ScreenGui", {
            Name = "FadeScreenGui",
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
            Children = { u13 }
        });
        local v15 = TweenService:Create(u13, TweenInfo.new(u7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0
        });
        v15:Play();
        local u16 = nil;
        u16 = v15.Completed:Connect(function() -- Line: 60
            -- upvalues: u16 (ref), u8 (ref), TweenService (ref), u13 (copy), u9 (ref), u14 (copy), u12 (copy)
            u16:Disconnect();
            task.delay(u8, function() -- Line: 62
                -- upvalues: TweenService (ref), u13 (ref), u9 (ref), u14 (ref), u12 (ref)
                local v17 = TweenService:Create(u13, TweenInfo.new(u9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Transparency = 1
                });
                v17:Play();
                local u18 = nil;
                u18 = v17.Completed:Connect(function() -- Line: 68
                    -- upvalues: u18 (ref), u14 (ref), u12 (ref)
                    u18:Disconnect();
                    u14:Destroy();
                    u12();
                end);
            end);
        end);
    end);
end;

return {
    FadeUtil = u3
};