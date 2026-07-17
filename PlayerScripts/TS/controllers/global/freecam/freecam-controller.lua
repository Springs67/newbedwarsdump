-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "FreecamController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 20
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 24
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p6);
    p6.Name = "FreecamController";
    p6.freecamMaid = u1.new();
end;

function u4.KnitStart(u7) -- Line: 29
    -- upvalues: KnitController (copy), Workspace (copy)
    KnitController.KnitStart(u7);
    Workspace:GetAttributeChangedSignal("FreecamEnabled"):Connect(function(p8) -- Line: 31
        -- upvalues: Workspace (ref), u7 (copy)
        if not Workspace:GetAttribute("FreecamEnabled") then
            u7:disableFreecam();
        end;
    end);
end;

function u4.enableFreecamController(u9) -- Line: 38
    -- upvalues: Workspace (copy), u2 (copy), Players (copy)
    Workspace:SetAttribute("FreecamControllerEnabled", true);
    local u10 = u2.mount(u2.createFragment({
        ExitFreecamGui = u2.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 1000
        }, {
            ExitFreecamButton = u2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 0.95),
                Size = UDim2.fromScale(0.1, 0.1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,

                [u2.Event.Activated] = function() -- Line: 53
                    -- upvalues: u9 (copy)
                    u9:disableFreecam();
                end
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 3.8545454545454545
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), u2.createElement("TextLabel", {
                    Text = "Exit Freecam",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.8, 0.6),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.GothamMedium
                }) })
        })
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u9.freecamMaid:GiveTask(function() -- Line: 76
        -- upvalues: u2 (ref), u10 (copy)
        u2.unmount(u10);
    end);
end;

function u4.disableFreecam(p11) -- Line: 80
    -- upvalues: Workspace (copy)
    Workspace:SetAttribute("FreecamControllerEnabled", false);
    p11.freecamMaid:DoCleaning();
end;

KnitClient.CreateController(u4.new());

return nil;