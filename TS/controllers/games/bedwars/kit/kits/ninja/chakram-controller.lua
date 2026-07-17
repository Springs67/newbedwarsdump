-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local NinjaKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-util").NinjaKitUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = { GameSound.NINJA_CHAKRAM_HIT_BLOCK_1, GameSound.NINJA_CHAKRAM_HIT_BLOCK_2, GameSound.NINJA_CHAKRAM_HIT_BLOCK_3 };
local u3 = { GameSound.NINJA_CHAKRAM_HIT_PLAYER_1, GameSound.NINJA_CHAKRAM_HIT_PLAYER_2, GameSound.NINJA_CHAKRAM_HIT_PLAYER_3 };
local u4 = { GameSound.NINJA_CHAKRAM_RETURN_1, GameSound.NINJA_CHAKRAM_RETURN_2, GameSound.NINJA_CHAKRAM_RETURN_3 };
local u5 = { GameSound.NINJA_CHAKRAM_THROW_1, GameSound.NINJA_CHAKRAM_THROW_2, GameSound.NINJA_CHAKRAM_THROW_3 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "ChakramController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 30
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "ChakramController";
    p8.chakramIsLaunched = false;
end;

function u6.KnitStart(u9) -- Line: 39
    -- upvalues: KnitController (copy), KnitClient (copy), u2 (copy), u3 (copy), u4 (copy), u5 (copy), ClientSyncEvents (copy), NinjaKitUtil (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SyncEventPriority (copy), default (copy), Players (copy)
    KnitController.KnitStart(u9);
    local PreloadController = KnitClient.Controllers.PreloadController;
    local v10 = {};
    local v11 = {};
    local v12 = #v11;
    local v13 = #u2;
    table.move(u2, 1, v13, v12 + 1, v11);
    local v14 = v12 + v13;
    local v15 = #u3;
    table.move(u3, 1, v15, v14 + 1, v11);
    local v16 = v14 + v15;
    local v17 = #u4;
    table.move(u4, 1, v17, v16 + 1, v11);
    table.move(u5, 1, #u5, v16 + v17 + 1, v11);
    v10.sounds = v11;
    PreloadController:runPreload(v10);
    ClientSyncEvents.ProjectileHit:connect(function(p18) -- Line: 59
        -- upvalues: NinjaKitUtil (ref), SoundManager (ref), u2 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if p18:isCancelled() then
            return nil;
        end;

        if not NinjaKitUtil:isProjectileTypeChakram(p18.projectileType) then
            return nil;
        end;

        if p18.projectileModel:GetAttribute("ChakramHitBlock") then
            return nil;
        end;

        if p18.hitData.part and p18.hitData.part:GetAttribute("Block") then
            SoundManager:playSound(u2[math.random(0, #u2 - 1) + 1], {
                position = p18.hitData.hitCFrame.Position
            });
            local u19 = ReplicatedStorage.Assets.Effects.ChakramHitWallParticle:Clone();
            u19.Parent = Workspace;
            u19:PivotTo(p18.hitData.hitCFrame);
            EffectUtil:playEffects({ u19 }, nil);
            task.delay(0.3, function() -- Line: 83
                -- upvalues: EffectUtil (ref), u19 (copy)
                EffectUtil:disableEffects({ u19 });
            end);
            task.delay(1, function() -- Line: 86
                -- upvalues: u19 (copy)
                u19:Destroy();
            end);
            p18.projectileModel:SetAttribute("ChakramHitBlock", true);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p20) -- Line: 95
        -- upvalues: NinjaKitUtil (ref)
        if not NinjaKitUtil:isProjectileTypeChakram(p20.projectileType) then
            return nil;
        end;

        local PrimaryPart = p20.projectile.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:FindFirstChild("Trail");
        end;

        if PrimaryPart then
            PrimaryPart.Enabled = true;
        end;
    end);
    ClientSyncEvents.BeginProjectileTargeting:setPriority(SyncEventPriority.HIGHEST):connect(function(p21) -- Line: 110
        -- upvalues: NinjaKitUtil (ref), u9 (copy)
        if not NinjaKitUtil:isItemTypeChakram(p21.handItem.itemType) then
            return nil;
        end;

        if u9.chakramIsLaunched then
            p21:setCancelled(true);

            return nil;
        end;
    end);
    default.Client:Get("NinjaSetChakramLaunchedState"):Connect(function(p22) -- Line: 121
        -- upvalues: Players (ref), u9 (copy), SoundManager (ref), u5 (ref), u4 (ref)
        if p22.player == Players.LocalPlayer then
            u9.chakramIsLaunched = p22.isLaunched;
        end;

        if p22.isLaunched then
            local Character = p22.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if Character then
                local v23 = u5[math.random(0, #u5 - 1) + 1];
                local v24 = {};
                local PrimaryPart = p22.player.Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                v24.position = PrimaryPart;
                SoundManager:playSound(v23, v24);
            end;
        else
            local Character = p22.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if Character then
                local v25 = u4[math.random(0, #u4 - 1) + 1];
                local v26 = {};
                local PrimaryPart = p22.player.Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                v26.position = PrimaryPart;
                SoundManager:playSound(v25, v26);
            end;
        end;

        u9:setVisibilityOfThirdPersonChakram(p22.player, p22.isLaunched);

        if p22.player == Players.LocalPlayer then
            u9:setVisibilityOfFirstPersonChakram(p22.player, p22.isLaunched);
        end;
    end);
end;

function u6.setVisibilityOfThirdPersonChakram(p27, p28, p29) -- Line: 170
    local v30 = p27:getChakramChildPart(p28.Character);
    local v31 = v30 and v30:FindFirstChild("Handle");

    if v31 then
        v31.Transparency = p29 and 1 or 0;
        local Spikes = v31:FindFirstChild("Spikes");

        if Spikes then
            Spikes.Transparency = p29 and 1 or 0;
        end;

        local Trail = v31:FindFirstChild("Trail");

        if Trail then
            Trail.Enabled = not p29;
        end;
    end;
end;

function u6.setVisibilityOfFirstPersonChakram(p32, p33, p34) -- Line: 189
    -- upvalues: Workspace (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera:FindFirstChild("Viewmodel");
    end;

    if CurrentCamera then
        local v35 = p32:getChakramChildPart(CurrentCamera);
        local v36 = v35 and v35:FindFirstChild("Handle");

        if v36 then
            v36.Transparency = p34 and 1 or 0;
            local Spikes = v36:FindFirstChild("Spikes");

            if Spikes then
                Spikes.Transparency = p34 and 1 or 0;
            end;

            local Trail = v36:FindFirstChild("Trail");

            if Trail then
                Trail.Enabled = not p34;
            end;
        end;
    end;
end;

function u6.getChakramChildPart(p37, p38) -- Line: 215
    if p38 then
        return p38:FindFirstChild("ninja_chakram") or p38:FindFirstChild("ninja_chakram_1") or p38:FindFirstChild("ninja_chakram_2") or p38:FindFirstChild("ninja_chakram_3") or p38:FindFirstChild("ninja_chakram_4");
    end;

    return nil;
end;

KnitClient.CreateController(u6.new());

return nil;