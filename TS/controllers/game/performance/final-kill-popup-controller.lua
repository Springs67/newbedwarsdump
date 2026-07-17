-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local FinalKillPopup = RuntimeLib.import(script, script.Parent, "ui", "final-kill-popup").FinalKillPopup;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "FinalKillPopupController";
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
    p4.Name = "FinalKillPopupController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), Players (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("PlayerEliminated", function(p6, p7) -- Line: 29
        -- upvalues: KnitClient (ref), Players (ref), u5 (copy)
        if KnitClient.Controllers.MatchController:getCustomMatchConfig() ~= nil then
            return nil;
        end;

        if p6 ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        if p7 == false then
            u5:showPopup();
            task.delay(20, function() -- Line: 39
                -- upvalues: u5 (ref)
                u5:hidePopup();
            end);
        end;
    end);
    default.Client:OnEvent("PerformanceFinalized", function(p8) -- Line: 44
        -- upvalues: Players (ref), u5 (copy)
        if p8 ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u5:hidePopup();
    end);
end;

function u2.showPopup(p9) -- Line: 51
    -- upvalues: Players (copy), u1 (copy), FinalKillPopup (copy)
    print("SHOWING FINAL KILL POPUP FOR PLAYER", Players.LocalPlayer.Name);
    p9.menuTree = u1.mount(u1.createElement(FinalKillPopup), Players.LocalPlayer:WaitForChild("PlayerGui"), "FinalKillPopup");
end;

function u2.hidePopup(p10) -- Line: 55
    -- upvalues: u1 (copy)
    if p10.menuTree then
        u1.unmount(p10.menuTree);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;