-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local UserInputService = v2.UserInputService;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "EntityHoverController";
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
    -- upvalues: KnitController (copy), u3 (copy), u1 (copy)
    KnitController.constructor(p6);
    p6.Name = "EntityHoverController";
    p6.hoverSignal = u3.new();
    p6.unhoverSignal = u3.new();
    p6.maid = u1.new();
    p6.hoveredEntity = nil;
end;

function u4.KnitStart(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.enable(u8) -- Line: 36
    -- upvalues: Players (copy), UserInputService (copy), EntityUtil (copy)
    u8.maid:DoCleaning();
    local u9 = Players.LocalPlayer:GetMouse();
    u8.maid:GiveTask(UserInputService.InputChanged:Connect(function(p10) -- Line: 40
        -- upvalues: u9 (copy), EntityUtil (ref), u8 (copy)
        if u9.Target then
            local v11 = EntityUtil:getEntityFromDescendant(u9.Target);

            if v11 then
                if u8.hoveredEntity == v11 then
                    return nil;
                end;

                u8.hoveredEntity = v11;
                u8.hoverSignal:Fire(v11);

                return;
            end;

            if u8.hoveredEntity == nil then
                return nil;
            end;

            u8.unhoverSignal:Fire(u8.hoveredEntity);
            u8.hoveredEntity = nil;
        end;
    end));
end;

function u4.disable(p12) -- Line: 59
    p12.maid:DoCleaning();
end;

function u4.watchEntityMouseHover(p13, u14) -- Line: 62
    local u16 = p13.hoverSignal:Connect(function(p15) -- Line: 63
        -- upvalues: u14 (copy)
        u14(p15);
    end);

    return function() -- Line: 66
        -- upvalues: u16 (copy)
        u16:Disconnect();
    end;
end;

function u4.watchEntityMouseUnHover(p17, u18) -- Line: 70
    local u20 = p17.unhoverSignal:Connect(function(p19) -- Line: 71
        -- upvalues: u18 (copy)
        u18(p19);
    end);

    return function() -- Line: 74
        -- upvalues: u20 (copy)
        u20:Disconnect();
    end;
end;

function u4.getMouseHoverSignal(p21) -- Line: 78
    return p21.hoverSignal;
end;

KnitClient.CreateController(u4.new());

return nil;