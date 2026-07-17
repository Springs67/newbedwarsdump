-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "DizzyToadController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "DizzyToadController";
    p5.dizzyMaid = u1.new();
    p5.dizzinessAngle = 0;
    p5.effectMap = {};
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), RunService (copy), EntityUtil (copy), u1 (copy), ReplicatedStorage (copy), Workspace (copy)
    KnitController.KnitStart(u6);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.DIZZY_TOAD, {
        sounds = { GameSound.TOAD_CROAK }
    });
    ClientSyncEvents.StatusEffectAdded:connect(function(u7) -- Line: 42
        -- upvalues: StatusEffectType (ref), Players (ref), u6 (copy), RunService (ref), EntityUtil (ref), u1 (ref), ReplicatedStorage (ref), Workspace (ref)
        if u7.statusEffect ~= StatusEffectType.DIZZY then
            return nil;
        end;

        if u7.entityInstance == Players.LocalPlayer.Character then
            u6.dizzinessAngle = 0;
            RunService:BindToRenderStep("dizzy-status", Enum.RenderPriority.Character.Value + 1, function(p8) -- Line: 48
                -- upvalues: u6 (ref), Players (ref)
                local v9 = u6;
                v9.dizzinessAngle = v9.dizzinessAngle + p8 * math.random() * 2;
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChild("Humanoid");
                end;

                if not Character or Character.MoveDirection.Magnitude == 0 then
                    return nil;
                end;

                Character:Move(CFrame.Angles(0, math.sin(u6.dizzinessAngle * 2 * 3.141592653589793 / 1.2) * 0.5235987755982988, 0) * Character.MoveDirection);
            end);
            u6.dizzyMaid:GiveTask(function() -- Line: 63
                -- upvalues: RunService (ref)
                return RunService:UnbindFromRenderStep("dizzy-status");
            end);
        end;

        local u10 = Players:GetPlayerFromCharacter(u7.entityInstance);
        local PrimaryPart = u7.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        local u11 = EntityUtil:getEntity(u7.entityInstance);

        if u11 and (PrimaryPart and (u10 and u6.effectMap[u10] == nil)) then
            local u12 = u1.new();
            local u13 = ReplicatedStorage.Assets.Effects.DizzyEffect:Clone();
            u12:GiveTask(u13);
            u13.Parent = Workspace;
            u13:PivotTo(CFrame.new(PrimaryPart + Vector3.new(0, 6, 0)));
            u6.effectMap[u10] = u12;
            local u14 = 0;
            u12:GiveTask(RunService.Heartbeat:Connect(function(p15) -- Line: 85
                -- upvalues: u7 (copy), u6 (ref), u10 (copy), u11 (copy), u12 (copy), u13 (copy), u14 (ref)
                local PrimaryPart2 = u7.entityInstance.PrimaryPart;

                if PrimaryPart2 ~= nil then
                    PrimaryPart2 = PrimaryPart2.Position;
                end;

                if u6.effectMap[u10] == nil or (u11:isDead() or not PrimaryPart2) then
                    u12:DoCleaning();

                    return nil;
                end;

                u13:PivotTo(CFrame.new(PrimaryPart2 + Vector3.new(0, 6, 0)) * CFrame.Angles(0, -3.141592653589793 * u14 * 5, 0));
                u14 = u14 + p15;
            end));
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p16) -- Line: 105
        -- upvalues: StatusEffectType (ref), Players (ref), u6 (copy)
        if p16.statusEffect ~= StatusEffectType.DIZZY then
            return nil;
        end;

        local v17 = Players:GetPlayerFromCharacter(p16.entityInstance);

        if v17 then
            local v18 = u6.effectMap[v17];

            if v18 then
                v18:DoCleaning();
            end;

            u6.effectMap[v17] = nil;
        end;

        if p16.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        u6.dizzyMaid:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;