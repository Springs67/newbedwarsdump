-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SLICE_META = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "radial-wheel", "radial-wheel-type").SLICE_META;
local RadialWheel = RuntimeLib.import(script, script.Parent, "radial-wheel").RadialWheel;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "RadialWheelController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 21
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 25
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "RadialWheelController";
    p6.radialWheelMaid = u2.new();
    p6.opened = false;
end;

function u4.KnitStart(p7) -- Line: 31
    -- upvalues: KnitController (copy), KnitClient (copy), u1 (copy), SLICE_META (copy)
    KnitController.KnitStart(p7);
    local PreloadController = KnitClient.Controllers.PreloadController;
    local v8 = u1.values(SLICE_META);

    local function _(p9) -- Line: 37
        return p9.image;
    end;

    local v10 = table.create(#v8);
    local v11 = {};

    for i, v in v8 do
        local _ = i - 1;
        v10[i] = v.image;
    end;

    v11.imageIds = v10;
    PreloadController:runPreload(v11);
end;

function u4.openRadialWheel(u12, p13, p14, p15, u16, p17, p18, u19) -- Line: 49
    -- upvalues: Players (copy), u3 (copy), RadialWheel (copy)
    u12:closeRadialWheel();
    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui");

    if not PlayerGui then
        return nil;
    end;

    local u21 = u3.mount(u3.createElement("ScreenGui", {
        IgnoreGuiInset = true
    }, { u3.createElement("ImageButton", {
            Size = UDim2.fromScale(1, 1),
            ImageTransparency = 1,
            BackgroundTransparency = 1,
            Modal = true,

            [u3.Event.Activated] = function() -- Line: 63
                -- upvalues: u16 (copy), u12 (copy)
                if u16 then
                    u12:closeRadialWheel();
                end;
            end
        }, { u3.createElement(RadialWheel, {
                angleOffset = 270,
                entries = p13,
                numSlices = p14,
                Position = p17,
                Size = p18 or UDim2.fromScale(0.4, 0.4),
                inputObject = p15,
                limitHoverDistance = p15 == nil,
                enableClickToSelect = p15 == nil,

                onClose = function() -- Line: 78, Name: onClose
                    -- upvalues: u19 (copy)
                    local v20 = u19;

                    if v20 ~= nil then
                        v20();
                    end;
                end
            }) }) }), PlayerGui);
    u12.opened = true;
    u12.radialWheelMaid:GiveTask(function() -- Line: 88
        -- upvalues: u3 (ref), u21 (copy), u12 (copy)
        u3.unmount(u21);
        u12.opened = false;
    end);
end;

function u4.closeRadialWheel(p22) -- Line: 93
    p22.radialWheelMaid:DoCleaning();
end;

function u4.isRadialWheelOpen(p23) -- Line: 96
    return p23.opened;
end;

KnitClient.CreateController(u4.new());

return nil;