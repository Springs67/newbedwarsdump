-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "LassoEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "LassoEffectController";
    p5.lassoWrap = {};
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), CollectionService (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), WeldUtil (copy), u1 (copy), ClientSyncEvents (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    CollectionService:GetInstanceAddedSignal("LassoHooked"):Connect(function(u7) -- Line: 37
        -- upvalues: BedwarsKitSkin (ref), ReplicatedStorage (ref), WeldUtil (ref), u1 (ref), u6 (copy)
        local v8 = u7:GetAttribute("LassoHookedSkin") or BedwarsKitSkin.DEFAULT;
        local LassoWrap = ReplicatedStorage.Assets.Misc.LassoWrap;
        local v9 = (LassoWrap:FindFirstChild(v8) or LassoWrap.default):Clone();
        v9.Parent = u7;
        local UpperTorso = u7:FindFirstChild("UpperTorso");

        if not UpperTorso then
            return nil;
        end;

        local CFrame2 = UpperTorso.CFrame;
        local v10 = CFrame.Angles(0, 1.5707963267948966, 0);
        v9.Rope.CFrame = CFrame2 * v10;
        WeldUtil:weldParts(v9.Rope, UpperTorso);
        local v11 = u1.new();
        v11:GiveTask(v9);
        v11:GiveTask(u7.Destroying:Connect(function() -- Line: 53
            -- upvalues: u6 (ref), u7 (copy)
            u6.lassoWrap[u7] = nil;
        end));
        u6.lassoWrap[u7] = v11;
    end);
    CollectionService:GetInstanceRemovedSignal("LassoHooked"):Connect(function(p12) -- Line: 62
        -- upvalues: u6 (copy)
        local v13 = u6.lassoWrap[p12];

        if v13 ~= nil then
            v13:DoCleaning();
        end;

        u6.lassoWrap[p12] = nil;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p14) -- Line: 74
        -- upvalues: EntityUtil (ref), u1 (ref), SoundManager (ref), GameSound (ref)
        if p14:isCancelled() then
            return nil;
        end;

        if p14.projectileType ~= "lasso" then
            return nil;
        end;

        if not p14.shooter then
            return nil;
        end;

        local v15 = EntityUtil:getEntity(p14.shooter);

        if not v15 then
            return nil;
        end;

        local RightHand = v15:getInstance():FindFirstChild("RightHand");

        if RightHand ~= nil then
            RightHand = RightHand:FindFirstChild("RightGripAttachment");
        end;

        if not RightHand then
            return nil;
        end;

        local Handle = p14.projectile:FindFirstChild("Handle");

        if not Handle then
            return nil;
        end;

        local Handle2 = p14.projectile:FindFirstChild("Handle");

        if Handle2 ~= nil then
            Handle2 = Handle2:FindFirstChild("Beam");
        end;

        if not Handle2 then
            return nil;
        end;

        local u16 = u1.new();
        Handle2.Destroying:Connect(function() -- Line: 109
            -- upvalues: u16 (copy)
            u16:DoCleaning();
        end);
        local Handle3 = p14.projectile:FindFirstChild("Handle");

        if Handle3 ~= nil then
            Handle3 = Handle3:FindFirstChild("BeamPoint");
        end;

        if not Handle3 then
            return nil;
        end;

        Handle2.Attachment0 = RightHand;
        Handle2.Attachment1 = Handle3;
        local UpperTorso = v15:getInstance():FindFirstChild("UpperTorso");

        if UpperTorso ~= nil then
            UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
        end;

        RightHand.Destroying:Connect(function() -- Line: 128
            -- upvalues: UpperTorso (copy), Handle2 (copy)
            if UpperTorso and Handle2.Parent then
                Handle2.Attachment0 = UpperTorso;
            end;
        end);
        local u17 = SoundManager:playSound(GameSound.GRAPPLING_HOOK_EXTEND_LOOP, {
            rollOffMaxDistance = 150,
            looped = true,
            position = Handle.Position,
            parent = Handle
        });
        u16:GiveTask(function() -- Line: 139
            -- upvalues: u17 (copy)
            local v18 = u17;

            if v18 ~= nil then
                v18:Stop();
            end;

            local v19 = u17;

            if v19 ~= nil then
                v19:Destroy();
            end;
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;