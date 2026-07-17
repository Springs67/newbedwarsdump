-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "IceQueenEffectsController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "IceQueenEffectsController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), EntityUtil (copy), ReplicatedStorage (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), Players (copy), SoundManager (copy), GameSound (copy), Workspace (copy)
    KnitController.KnitStart(p6);
    default.Client:OnEvent("IceQueenFreeze", function(p7) -- Line: 36
        -- upvalues: EntityUtil (ref), ReplicatedStorage (ref), KnitClient2 (ref), BedwarsKitSkinMeta (ref), Players (ref), SoundManager (ref), GameSound (ref)
        local v8 = EntityUtil:getEntity(p7.to);
        local v9 = v8 and v8:getInstance():FindFirstChild("HumanoidRootPart");

        if v9 then
            local IceQueenFreezeParticles = ReplicatedStorage.Assets.Effects.IceQueenFreezeParticles;
            local freiya = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(p7.from)].freiya;
            local v10;

            if freiya == nil then
                v10 = freiya;
            else
                v10 = freiya.effects;

                if v10 ~= nil then
                    v10 = v10.maxStacks;
                end;
            end;

            if v10 then
                if freiya ~= nil then
                    freiya = freiya.effects;

                    if freiya ~= nil then
                        freiya = freiya.maxStacks;
                    end;
                end;
            else
                freiya = IceQueenFreezeParticles;
            end;

            for _, child in freiya:Clone():GetChildren() do
                if child:IsA("ParticleEmitter") then
                    child.Parent = v9;
                    child.Enabled = false;
                    child:Emit(p7.strong and 20 or 15);
                    task.delay(5, function() -- Line: 68
                        -- upvalues: child (copy)
                        child:Destroy();
                    end);
                end;
            end;

            local v11 = Players.LocalPlayer.Character == p7.to;
            local v12;

            if p7.strong then
                v12 = GameSound.FREIYA_STRONG_PROC;
            else
                v12 = GameSound.FREIYA_PROC;
            end;

            local v13 = {};
            local v14;

            if v11 then
                v14 = nil;
            else
                v14 = p7.to.PrimaryPart;

                if v14 ~= nil then
                    v14 = v14.Position;
                end;
            end;

            v13.position = v14;
            local v15;

            if v11 then
                v15 = nil;
            else
                v15 = p7.to.PrimaryPart;
            end;

            v13.parent = v15;
            SoundManager:playSound(v12, v13);
        end;
    end);
    default.Client:Get("IceQueenAbilityEffect"):Connect(function(u16) -- Line: 94
        -- upvalues: ReplicatedStorage (ref), GameSound (ref), KnitClient2 (ref), BedwarsKitSkinMeta (ref), Workspace (ref), SoundManager (ref)
        local FrostBiteExplode = ReplicatedStorage.Assets.Effects.FrostBiteExplode;
        local FREYA_EXPLOSION = GameSound.FREYA_EXPLOSION;
        local Character = u16.user.Character;
        local v17;

        if Character then
            v17 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)].freiya;
            local v18;

            if v17 == nil then
                v18 = v17;
            else
                v18 = v17.effects;

                if v18 ~= nil then
                    v18 = v18.explode;
                end;
            end;

            if v18 then
                if v17 == nil then
                    FrostBiteExplode = v17;
                else
                    FrostBiteExplode = v17.effects;

                    if FrostBiteExplode ~= nil then
                        FrostBiteExplode = FrostBiteExplode.explode;
                    end;
                end;
            end;

            local v19;

            if v17 == nil then
                v19 = v17;
            else
                v19 = v17.explodeSound;
            end;

            if v19 == "" or not v19 then
                v17 = FREYA_EXPLOSION;
            elseif v17 ~= nil then
                v17 = v17.explodeSound;
            end;
        else
            v17 = FREYA_EXPLOSION;
        end;

        local victim = u16.victim;

        if victim ~= nil then
            victim = victim.PrimaryPart;

            if victim ~= nil then
                victim = victim.Position;
            end;
        end;

        if not victim then
            return nil;
        end;

        local u20 = FrostBiteExplode:Clone();
        u20.Anchored = true;
        u20.Position = victim;
        u20.Parent = Workspace;
        local CrackAttachment = u20:WaitForChild("CrackAttachment", 1);

        if CrackAttachment ~= nil then
            CrackAttachment = CrackAttachment:WaitForChild("Crack");
        end;

        if u16.stacks >= 4 then
            CrackAttachment:Emit(1);
        end;

        local Attachment = u20:WaitForChild("Attachment", 1);

        if Attachment ~= nil then
            local function _(p21) -- Line: 157
                -- upvalues: u16 (copy)
                if p21:IsA("ParticleEmitter") then
                    p21:Emit(u16.stacks * 10);
                end;
            end;

            for i, child in Attachment:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child:Emit(u16.stacks * 10);
                end;
            end;
        end;

        SoundManager:playSound(v17, {
            position = victim
        });
        task.delay(1, function() -- Line: 169
            -- upvalues: u20 (ref)
            u20:Destroy();
        end);
    end);
end;

function u3.getAttackerKitSkin(p22, p23) -- Line: 174
    -- upvalues: Players (copy), KnitClient2 (copy)
    local v24 = p23:GetAttribute("IceQueenAttackerId");

    if v24 == 0 or (v24 ~= v24 or not v24) then
        return nil;
    end;

    local v25 = Players:GetPlayerByUserId(v24);

    if v25 ~= nil then
        v25 = v25.Character;
    end;

    if v25 then
        return KnitClient2.Controllers.KitSkinController:getKitSkin(v25);
    end;

    return nil;
end;

KnitClient.CreateController(u3.new());

return nil;