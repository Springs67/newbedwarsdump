-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v3.Lighting;
local RunService = v3.RunService;
local CurrentCamera = v3.Workspace.CurrentCamera;
local u4 = u2.Component:extend("EngineerFilmEffect");

function u4.init(p5, p6) -- Line: 13
    -- upvalues: u1 (copy), u2 (copy)
    p5.maid = u1.new();
    p5.sizeX = 400;
    p5.sizeY = 400;
    local v7, v8 = u2.createBinding(UDim2.new(0.18, 0, 0.18, 0));
    p5.tileSize = v7;
    p5.setTileSize = v8;
end;

function u4.render(p9) -- Line: 19
    -- upvalues: u2 (copy), Lighting (copy)
    return u2.createFragment({ u2.createElement(u2.Portal, {
            target = Lighting
        }, { u2.createElement("ColorCorrectionEffect", {
                Contrast = 0.2,
                Saturation = -0.3,
                TintColor = p9.props.color or Color3.fromRGB(74, 107, 135),
                Enabled = p9.props.transparency ~= 1
            }) }), u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ScaleType = "Tile",
            Image = "http://www.roblox.com/asset/?id=28756351",
            Size = UDim2.fromScale(1.5, 1.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ImageTransparency = p9.props.transparency,
            TileSize = p9.tileSize
        }) });
end;

function u4.updateSize(p10) -- Line: 43
    -- upvalues: CurrentCamera (copy)
    p10.sizeX = 300000 / CurrentCamera.ViewportSize.X;
    p10.sizeY = 300000 / CurrentCamera.ViewportSize.Y;
end;

function u4.didMount(u11) -- Line: 47
    -- upvalues: RunService (copy), CurrentCamera (copy)
    u11.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 48
        -- upvalues: u11 (copy)
        u11.setTileSize(UDim2.fromScale(math.random(u11.sizeX * 0.9, u11.sizeX * 1.1) / 1000, math.random(u11.sizeY * 0.9, u11.sizeY * 1.1) / 1000));
    end));
    u11:updateSize();
    u11.maid:GiveTask(CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line: 52
        -- upvalues: u11 (copy)
        u11:updateSize();
    end));
end;

function u4.willUnmount(p12) -- Line: 56
    p12.maid:DoCleaning();
end;

return {
    EngineerFilmEffectWrapper = function(p13) -- Line: 60, Name: EngineerFilmEffectWrapper
        -- upvalues: u2 (copy), u4 (ref)
        local v14 = u2.createBinding(0.9);

        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        }, { u2.createElement(u4, {
                transparency = v14
            }) });
    end,

    EngineerFilmEffect = u4
};