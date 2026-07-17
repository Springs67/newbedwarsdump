-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "HoverboardAssetPreloaderController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "HoverboardAssetPreloaderController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), PlaceUtil (copy), KnitClient2 (copy), AnimationType (copy)
    KnitController.KnitStart(p5);

    if PlaceUtil.isLobbyServer() then
        KnitClient2.Controllers.PreloadController:runPreload({
            animations = {
                AnimationType.HOVER_BOARD_IDLE,
                AnimationType.HOVER_BOARD_MOVE,
                AnimationType.HOVER_BOARD_JUMP,
                AnimationType.HOVERBOARD_IDLE,
                AnimationType.HOVERBOARD_MOVEMENT
            }
        });
    end;
end;

KnitClient.CreateController(u2.new());

return nil;