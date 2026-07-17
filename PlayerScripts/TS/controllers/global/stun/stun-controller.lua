-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "StunController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "StunController";
end;

function u4.KnitStart(u7) -- Line: 30
    -- upvalues: KnitController (copy), WatchCharacter (copy), Players (copy), u2 (copy), KnitClient (copy), ClientSyncEvents (copy), KnitClient2 (copy)
    KnitController.KnitStart(u7);
    WatchCharacter(function(p8, u9, p10) -- Line: 32
        -- upvalues: Players (ref), u2 (ref), KnitClient (ref), ClientSyncEvents (ref), KnitClient2 (ref), u7 (copy)
        if p8 == Players.LocalPlayer then
            local u11 = u2.new();
            p10:GiveTask(u11);
            u9:GetAttributeChangedSignal("SnaredUntilTime"):Connect(function() -- Line: 36
                -- upvalues: u11 (copy), u9 (copy), KnitClient (ref), ClientSyncEvents (ref), KnitClient2 (ref)
                u11:DoCleaning();

                if u9:GetAttribute("SnaredUntilTime") ~= -1 then
                    u11:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        moveSpeedMultiplier = 0
                    }));
                    u11:GiveTask(ClientSyncEvents.PlaceBlock:connect(function(p12) -- Line: 43
                        p12:setCancelled(true);
                    end));
                    u11:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                        jumpHeightMultiplier = 0
                    }));
                end;
            end);
            local u13 = u2.new();
            p10:GiveTask(u13);
            u9:GetAttributeChangedSignal("StunnedUntilTime"):Connect(function() -- Line: 53
                -- upvalues: u13 (copy), u9 (copy), ClientSyncEvents (ref), KnitClient (ref), KnitClient2 (ref)
                u13:DoCleaning();

                if u9:GetAttribute("StunnedUntilTime") ~= -1 then
                    u13:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p14) -- Line: 57
                        p14:setCancelled(true);
                    end));
                    u13:GiveTask(ClientSyncEvents.SwordChargedSwing:connect(function(p15) -- Line: 60
                        p15:setCancelled(true);
                    end));
                    u13:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p16) -- Line: 63
                        p16:setCancelled(true);
                    end));
                    u13:GiveTask(ClientSyncEvents.PlaceBlock:connect(function(p17) -- Line: 66
                        p17:setCancelled(true);
                    end));
                    u13:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p18) -- Line: 69
                        p18:setCancelled(true);
                    end));
                    u13:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        moveSpeedMultiplier = 0
                    }));
                    u13:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                        jumpHeightMultiplier = 0
                    }));
                end;
            end);
            local u19 = u2.new();
            p10:GiveTask(u19);
            u9:GetAttributeChangedSignal("Locked"):Connect(function() -- Line: 82
                -- upvalues: u7 (ref), u9 (copy), u19 (copy)
                u7:lockUpdate(u9, u19);
            end);
            local v20 = u9:GetAttribute("Locked");

            if v20 ~= 0 and (v20 == v20 and (v20 ~= "" and v20)) then
                u7:lockUpdate(u9, u19);
            end;
        end;
    end);
end;

function u4.showStatusBubble(p21, p22, p23) -- Line: 92
    -- upvalues: u2 (copy), u3 (copy)
    local v24 = u2.new();
    local Head = p22:FindFirstChild("Head");

    if Head then
        local u25 = u3("BillboardGui", {
            StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0),
            LightInfluence = 0,
            Parent = Head,
            Size = UDim2.fromScale(1, 1),
            Adornee = Head,
            Children = { u3("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = p23,
                    Size = UDim2.fromScale(1, 1)
                }) }
        });
        v24:GiveTask(function() -- Line: 109
            -- upvalues: u25 (copy)
            u25:Destroy();
        end);
    end;

    return v24;
end;

function u4.lockUpdate(p26, p27, p28) -- Line: 115
    -- upvalues: ClientSyncEvents (copy), KnitClient (copy), KnitClient2 (copy)
    p28:DoCleaning();
    local v29 = p27:GetAttribute("Locked");

    if v29 ~= 0 and (v29 == v29 and (v29 ~= "" and v29)) then
        p28:GiveTask(ClientSyncEvents.DamageBlock:connect(function(p30) -- Line: 119
            p30:setCancelled(true);
        end));
        p28:GiveTask(ClientSyncEvents.PlaceBlock:connect(function(p31) -- Line: 122
            p31:setCancelled(true);
        end));
        p28:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p32) -- Line: 125
            p32:setCancelled(true);
        end));
        p28:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p33) -- Line: 128
            p33:setCancelled(true);
        end));
        p28:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = 0
        }));
        p28:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = 0
        }));
    end;
end;

KnitClient.CreateController(u4.new());

return nil;