-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PoisonController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "PoisonController";
    p6.effectMap = {};
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), u2 (copy), BedwarsImageId (copy), CollectionService (copy), u1 (copy)
    KnitController.KnitStart(u7);
    ClientSyncEvents.StatusEffectAdded:connect(function(p8) -- Line: 34
        -- upvalues: StatusEffectType (ref), Players (ref), u7 (copy), u2 (ref), BedwarsImageId (ref), CollectionService (ref), u1 (ref)
        if p8.statusEffect ~= StatusEffectType.POISON then
            return nil;
        end;

        local v9 = Players:GetPlayerFromCharacter(p8.entityInstance);

        if not v9 or u7.effectMap[v9] ~= nil then
            return nil;
        end;

        local RootAttachment = p8.entityInstance.HumanoidRootPart:WaitForChild("RootAttachment", 3);

        if not RootAttachment then
            return nil;
        end;

        local v10 = u2("ParticleEmitter", {
            Enabled = true,
            LockedToPart = true,
            Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
            Texture = BedwarsImageId.SMOKE,
            Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.5), NumberSequenceKeypoint.new(1, 3, 1) }),
            Lifetime = NumberRange.new(5, 10),
            SpreadAngle = Vector2.new(180, 180),
            Speed = NumberRange.new(1, 2),
            Parent = RootAttachment
        });
        v10:SetAttribute("FirstPersonVisible", false);
        CollectionService:AddTag(v10, "FirstPersonHidden");
        local v11 = u1.new();
        v11:GiveTask(v10);
        u7.effectMap[v9] = v11;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p12) -- Line: 64
        -- upvalues: StatusEffectType (ref), Players (ref), u7 (copy)
        if p12.statusEffect ~= StatusEffectType.POISON then
            return nil;
        end;

        local v13 = Players:GetPlayerFromCharacter(p12.entityInstance);

        if v13 then
            local v14 = u7.effectMap[v13];

            if v14 then
                v14:DoCleaning();
            end;

            u7.effectMap[v13] = nil;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;