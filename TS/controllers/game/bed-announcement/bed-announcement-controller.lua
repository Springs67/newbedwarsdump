-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BedAnnouncementController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BedAnnouncementController";
end;

function u4.KnitStart(p7) -- Line: 34
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), ReplicatedStorage (copy), BlockEngine (copy), Workspace (copy), GameQueryUtil (copy)
    KnitController.KnitStart(p7);
    ClientSyncEvents.AnnouncementBegan:connect(function(p8) -- Line: 36
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient2 (ref), ReplicatedStorage (ref), BlockEngine (ref), Workspace (ref), GameQueryUtil (ref)
        local metadata = p8.announcement.metadata;
        local metadata2 = p8.announcement.metadata;

        if metadata2 ~= nil then
            metadata2 = metadata2.bedPosition;
        end;

        if metadata2 ~= nil then
            SoundManager:playSound(GameSound.BED_BREAK);
            KnitClient2.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                cleanupAfter = 1,
                particleEmitter = { ReplicatedStorage.Assets.Effects.BedBreakParticles }
            });
            local u9 = ReplicatedStorage.Assets.Effects.BedBreakWorld:Clone();
            u9.CFrame = CFrame.new(BlockEngine:getWorldPosition(metadata.bedPosition));
            u9.Parent = Workspace;
            GameQueryUtil:setQueryIgnored(u9, true);
            u9.CanCollide = false;

            for _, descendant in u9:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    local v10 = descendant:GetAttribute("EmitCount");

                    if v10 ~= 0 and (v10 == v10 and v10) then
                        descendant:Emit(v10);
                    end;
                end;
            end;

            task.delay(5, function() -- Line: 61
                -- upvalues: u9 (copy)
                u9:Destroy();
            end);
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;