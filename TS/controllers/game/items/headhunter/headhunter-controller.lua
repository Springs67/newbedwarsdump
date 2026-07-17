-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "HeadhunterController";
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
    p4.Name = "HeadhunterController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Players (copy), KnitClient (copy), RuntimeLib (copy), default (copy), u1 (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 29
        -- upvalues: Players (ref), KnitClient (ref), RuntimeLib (ref), default (ref), u1 (ref)
        local v7 = p6:getShooterHandItem();

        if v7 ~= nil then
            v7 = string.match(v7.itemType, "headhunter");
        end;

        if v7 == 0 or (v7 ~= v7 or (v7 == "" or not v7)) then
            return nil;
        end;

        local v8 = p6.shooter == Players.LocalPlayer.Character;
        local shooter = p6.shooter;

        if shooter ~= nil then
            local function _(p9) -- Line: 41
                local v10;

                if string.match(p9.Name, "headhunter") == nil then
                    v10 = false;
                else
                    v10 = p9:IsA("Accessory");
                end;

                return v10;
            end;

            shooter = nil;

            for i, child in shooter:GetChildren() do
                local _ = i - 1;
                local v11;

                if string.match(child.Name, "headhunter") == nil then
                    v11 = false;
                else
                    v11 = child:IsA("Accessory");
                end;

                if v11 == true then
                    shooter = child;
                    break;
                end;
            end;
        end;

        local u12 = KnitClient.Controllers.ViewmodelController:getViewModel();

        if u12 ~= nil then
            local function _(p13) -- Line: 59
                local v14;

                if string.match(p13.Name, "headhunter") == nil then
                    v14 = false;
                else
                    v14 = p13:IsA("Accessory");
                end;

                return v14;
            end;

            u12 = nil;

            for i, child in u12:GetChildren() do
                local _ = i - 1;
                local v15;

                if string.match(child.Name, "headhunter") == nil then
                    v15 = false;
                else
                    v15 = child:IsA("Accessory");
                end;

                if v15 == true then
                    u12 = child;
                    break;
                end;
            end;
        end;

        if v8 then
            KnitClient.Controllers.ScreenShakeController:shake(p6.origin, Vector3.new(0, -1, 0), {
                magnitude = 0.1
            });
        end;

        if not shooter then
            return nil;
        end;

        local v18, v19 = RuntimeLib.try(function() -- Line: 84
            -- upvalues: shooter (copy)
            shooter.Handle.Arrow.Transparency = 1;

            local function _(p16) -- Line: 87
                if p16:IsA("BasePart") then
                    p16.Transparency = 1;
                end;
            end;

            for i, descendant in shooter.Handle.Arrow:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                end;
            end;
        end, function(p17) -- Line: 95
            -- upvalues: default (ref), u1 (ref), RuntimeLib (ref)
            default.Debug("Failed to get headhunter arrow model: {reason}", u1(p17));

            return RuntimeLib.TRY_RETURN, {};
        end);

        if v18 then
            return unpack(v19);
        end;

        if u12 and v8 then
            u12.Handle.Arrow.Transparency = 1;

            local function _(p20) -- Line: 106
                if p20:IsA("BasePart") then
                    p20.Transparency = 1;
                end;
            end;

            for i, descendant in u12.Handle.Arrow:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                end;
            end;

            task.delay(0.6, function() -- Line: 115
                -- upvalues: shooter (copy), u12 (copy)
                if shooter and u12 then
                    shooter.Handle.Arrow.Transparency = 0;
                    u12.Handle.Arrow.Transparency = 0;

                    local function _(p21) -- Line: 120
                        if p21:IsA("BasePart") then
                            p21.Transparency = 0;
                        end;
                    end;

                    for i, descendant in shooter.Handle.Arrow:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = 0;
                        end;
                    end;

                    local function _(p22) -- Line: 129
                        if p22:IsA("BasePart") then
                            p22.Transparency = 0;
                        end;
                    end;

                    for i, descendant in u12.Handle.Arrow:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = 0;
                        end;
                    end;
                end;
            end);
        end;

        local function _(u23) -- Line: 142
            if u23:IsA("ParticleEmitter") then
                u23.Enabled = true;
                task.delay(0.1, function() -- Line: 145
                    -- upvalues: u23 (copy)
                    u23.Enabled = false;
                end);
            end;
        end;

        for i, child in shooter.Handle.Arrow.Attachment:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
                task.delay(0.1, function() -- Line: 145
                    -- upvalues: child (copy)
                    child.Enabled = false;
                end);
            end;
        end;

        if u12 and v8 then
            local function _(u24) -- Line: 155
                if u24:IsA("ParticleEmitter") then
                    u24.Enabled = true;
                    task.delay(0.1, function() -- Line: 158
                        -- upvalues: u24 (copy)
                        u24.Enabled = false;
                    end);
                end;
            end;

            for i, child in u12.Handle.Arrow.Attachment:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Enabled = true;
                    task.delay(0.1, function() -- Line: 158
                        -- upvalues: child (copy)
                        child.Enabled = false;
                    end);
                end;
            end;
        end;

        if shooter.Handle.Arrow.SmokeAttachment then
            shooter.Handle.Arrow.SmokeAttachment.Smoke.Enabled = true;
            task.delay(0.6, function() -- Line: 170
                -- upvalues: shooter (copy)
                if shooter then
                    shooter.Handle.Arrow.SmokeAttachment.Smoke.Enabled = false;
                end;
            end);
        end;

        local v25;

        if u12 == nil then
            v25 = u12;
        else
            v25 = u12.Handle.Arrow.SmokeAttachment;
        end;

        if not v25 then
            v8 = v25;
        end;

        if v8 then
            u12.Handle.Arrow.SmokeAttachment.Smoke.Enabled = true;
            task.delay(0.6, function() -- Line: 186
                -- upvalues: u12 (copy)
                if u12 then
                    u12.Handle.Arrow.SmokeAttachment.Smoke.Enabled = false;
                end;
            end);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;