-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "BoostPotionController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3, ...);
    p3.Name = "BoostPotionController";
end;

function u1.KnitStart(u4) -- Line: 26
    -- upvalues: KnitController (copy), WatchCharacter (copy), Players (copy), KnitClient (copy), default (copy)
    KnitController.KnitStart(u4);
    WatchCharacter(function(u5, u6) -- Line: 28
        -- upvalues: Players (ref), u4 (copy), KnitClient (ref)
        u6:GetAttributeChangedSignal("JumpBoost"):Connect(function() -- Line: 29
            -- upvalues: u6 (copy), Players (ref), u5 (copy), u4 (ref), KnitClient (ref)
            if u6:GetAttribute("JumpBoost") == nil then
                if Players.LocalPlayer == u5 and u4.jumpMaid then
                    u4.jumpMaid:Destroy();
                    u4.jumpMaid = nil;
                end;
            elseif Players.LocalPlayer == u5 then
                u4.jumpMaid = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
                    jumpHeightMultiplier = u6:GetAttribute("JumpBoost")
                });
            end;
        end);
        u6:GetAttributeChangedSignal("SpeedBoost"):Connect(function() -- Line: 43
            -- upvalues: u6 (copy), Players (ref), u5 (copy), u4 (ref), KnitClient (ref)
            if u6:GetAttribute("SpeedBoost") == nil then
                if Players.LocalPlayer == u5 and u4.speedMaid then
                    u4.speedMaid:Destroy();
                    u4.speedMaid = nil;
                end;
            elseif Players.LocalPlayer == u5 then
                u4.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = true,
                    moveSpeedMultiplier = u6:GetAttribute("SpeedBoost")
                });
            end;
        end);
    end);
    default.Client:Get("SetPotionBoostMovementMultiplier"):Connect(function(p7) -- Line: 60
        -- upvalues: u4 (copy), KnitClient (ref)
        if p7.speedMultiplier == nil then
            if u4.speedMaid then
                u4.speedMaid:Destroy();
                u4.speedMaid = nil;
            end;
        else
            u4.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = true,
                moveSpeedMultiplier = p7.speedMultiplier
            });
        end;

        if p7.jumpMultiplier == nil then
            if u4.jumpMaid then
                u4.jumpMaid:Destroy();
                u4.jumpMaid = nil;
            end;

            return;
        end;

        u4.jumpMaid = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = p7.jumpMultiplier
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;