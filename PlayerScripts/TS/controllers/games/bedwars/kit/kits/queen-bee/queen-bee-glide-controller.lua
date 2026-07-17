-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CloudEnchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local QueenBeeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "queen-bee", "queen-bee-util").QueenBeeUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BeeParticle = RuntimeLib.import(script, script.Parent, "bee-particle").BeeParticle;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "QueenBeeGlideController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p7, BedwarsKit.QUEEN_BEE);
    p7.Name = "QueenBeeGlideController";
    p7.gliding = false;
    p7.glideEffects = {};
    p7.wingOriginalState = {};
end;

function u5.onKitLocalActivated(u8, p9) -- Line: 49
    -- upvalues: default2 (copy), RunService (copy), Flamework (copy), AbilityId (copy), Players (copy), EntityUtil (copy), CloudEnchantUtil (copy), AbilityState (copy)
    p9:GiveTask((default2.Client:Get("EndGlide"):Connect(function() -- Line: 50
        -- upvalues: u8 (copy)
        local glideMaid = u8.glideMaid;

        if glideMaid ~= nil then
            glideMaid:DoCleaning();
        end;
    end)));
    p9:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 57
        -- upvalues: Flamework (ref), AbilityId (ref), Players (ref), EntityUtil (ref), CloudEnchantUtil (ref), AbilityState (ref), u8 (copy)
        local v10 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.QUEEN_BEE_GLIDE);

        if not v10 then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local v11 = EntityUtil:getEntity(Players.LocalPlayer);

        if v11 ~= nil then
            v11 = v11:getInstance();
        end;

        if not (Character and v11) then
            return nil;
        end;

        if not CloudEnchantUtil:isAboveVoid(v11, 15) then
            if v10.abilityState == AbilityState.READY then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v10, AbilityState.DISABLED);
            end;

            return nil;
        end;

        if Character.AssemblyLinearVelocity.Y > -8 then
            return nil;
        end;

        if not u8.gliding then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v10, AbilityState.READY);
        end;
    end));
end;

function u5.onKitLocalDeactivated(p12) -- Line: 89
end;

function u5.onKitReplicationActivated(u13, p14) -- Line: 91
    -- upvalues: WatchCharacter (copy), QueenBeeUtil (copy)
    p14:GiveTask(WatchCharacter(function(p15, u16, p17) -- Line: 92
        -- upvalues: QueenBeeUtil (ref), u13 (copy)
        local function _() -- Line: 93
            -- upvalues: u16 (copy), QueenBeeUtil (ref), u13 (ref)
            local v18 = u16:GetAttribute(QueenBeeUtil.GLIDE_ATTRIBUTE);

            if v18 == nil then
                v18 = false;
            end;

            u13:setGlideEffectEnabled(u16, v18);
        end;

        p17:GiveTask(u16:GetAttributeChangedSignal(QueenBeeUtil.GLIDE_ATTRIBUTE):Connect(function() -- Line: 101
            -- upvalues: u16 (copy), QueenBeeUtil (ref), u13 (ref)
            local v19 = u16:GetAttribute(QueenBeeUtil.GLIDE_ATTRIBUTE);

            if v19 == nil then
                v19 = false;
            end;

            u13:setGlideEffectEnabled(u16, v19);
        end));
        p17:GiveTask(function() -- Line: 104
            -- upvalues: u13 (ref), u16 (copy)
            return u13:setGlideEffectEnabled(u16, false);
        end);
        local v20 = u16:GetAttribute(QueenBeeUtil.GLIDE_ATTRIBUTE);

        if v20 == nil then
            v20 = false;
        end;

        u13:setGlideEffectEnabled(u16, v20);
    end));
end;

function u5.onKitReplicationDeactivated(p21) -- Line: 110
end;

function u5.onInnateAbilityEnabled(p22, p23, p24) -- Line: 112
end;

function u5.onAbilityUsed(p25, p26, p27) -- Line: 114
    -- upvalues: Players (copy), AbilityId (copy)
    if p27.userCharacter ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p27.ability ~= AbilityId.QUEEN_BEE_GLIDE then
        return nil;
    end;

    p25:enableGlide();
end;

function u5.setGlideEffectEnabled(u28, u29, p30) -- Line: 123
    -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), BeeParticle (copy), RunService (copy), default (copy), Linear (copy)
    local v31 = u28.glideEffects[u29];

    if v31 ~= nil then
        v31:DoCleaning();
    end;

    if p30 then
        local u32 = true;
        local u33 = u2.new();
        u33:GiveTask(function() -- Line: 133
            -- upvalues: u32 (ref)
            u32 = false;
        end);
        u28.glideEffects[u29] = u33;
        local u34 = SoundManager:playSound(GameSound.QUEEN_BEE_GLIDE, {
            looped = true,
            volumeMultiplier = 3.4,
            parent = u29.PrimaryPart
        });
        u33:GiveTask(function() -- Line: 144
            -- upvalues: u34 (copy)
            local v35 = u34;

            if v35 ~= nil then
                v35:Stop();
            end;
        end);
        local v36 = false;
        local v37 = 0;

        while true do
            if true then
                if v36 then
                    v37 = v37 + 1;
                else
                    v36 = true;
                end;
            end;

            if v37 >= 4 then
                break;
            end;

            u33:GiveTask(BeeParticle.new(u29));
        end;

        task.spawn(function() -- Line: 167
            -- upvalues: u29 (copy), u32 (ref), RunService (ref), u28 (copy), u33 (copy), default (ref), Linear (ref)
            local v38 = u29:FindFirstChild("3DClothing");

            if v38 ~= nil then
                v38 = v38:FindFirstChild("UpperTorso");
            end;

            if v38 then
                local v39 = false;
                local v40 = 0;

                while true do
                    if true then
                        if v39 then
                            v40 = v40 + 1;
                        else
                            v39 = true;
                        end;
                    end;

                    if v40 >= 3 or not u32 then
                        break;
                    end;

                    local u41 = v38:FindFirstChild("transparent" .. (v40 == 0 and "" or tostring(v40 + 1)));

                    if u41 then
                        local u42 = 0;
                        local u44 = RunService.Heartbeat:Connect(function(p43) -- Line: 192
                            -- upvalues: u42 (ref), u28 (ref), u41 (copy)
                            u42 = u42 + p43;
                            u28:lerpWingNeon(u41, (math.sin(u42 * 2.5)));
                        end);
                        u33:GiveTask(function() -- Line: 196
                            -- upvalues: u44 (copy), u42 (ref), default (ref), Linear (ref), u28 (ref), u41 (copy)
                            u44:Disconnect();
                            local u45 = math.sin(u42 * 2.5);
                            default(0.4, Linear, function(p46) -- Line: 199
                                -- upvalues: u28 (ref), u41 (ref), u45 (copy)
                                u28:lerpWingNeon(u41, (1 - p46) * u45);
                            end);
                        end);
                        task.wait(0.12);
                    end;
                end;
            end;
        end);
    end;
end;

function u5.enableGlide(u47) -- Line: 210
    -- upvalues: Players (copy), u2 (copy), u3 (copy), Workspace (copy), RunService (copy), EntityUtil (copy), CloudEnchantUtil (copy), QueenBeeUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local glideMaid = u47.glideMaid;

    if glideMaid ~= nil then
        glideMaid:DoCleaning();
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u47.glideMaid = u2.new();
    u47.gliding = true;
    u47.glideMaid:GiveTask(function() -- Line: 225
        -- upvalues: u47 (copy)
        u47.gliding = false;
    end);
    local u48 = u3("BodyForce", {
        Parent = Character,
        Force = Vector3.new(0, Character.AssemblyMass * Workspace.Gravity / 2, 0)
    });
    u47.glideMaid:GiveTask(function() -- Line: 232
        -- upvalues: u48 (copy)
        u48:Destroy();
    end);
    u47.glideMaid:GiveTask(function() -- Line: 235
        -- upvalues: RunService (ref), EntityUtil (ref), Players (ref), Character (copy), u47 (copy), CloudEnchantUtil (ref)
        RunService.Heartbeat:Connect(function() -- Line: 236
            -- upvalues: EntityUtil (ref), Players (ref), Character (ref), u47 (ref), CloudEnchantUtil (ref)
            local v49 = EntityUtil:getEntity(Players.LocalPlayer);

            if v49 ~= nil then
                v49 = v49:getInstance();
            end;

            if not (Character and v49) then
                local glideMaid2 = u47.glideMaid;

                if glideMaid2 ~= nil then
                    glideMaid2:DoCleaning();
                end;

                return nil;
            end;

            if not CloudEnchantUtil:isAboveVoid(v49, 8) then
                local glideMaid2 = u47.glideMaid;

                if glideMaid2 ~= nil then
                    glideMaid2:DoCleaning();
                end;

                return nil;
            end;
        end);
    end);
    u47.glideMaid:GiveTask(QueenBeeUtil:runGlidePhysics(function(p50) -- Line: 258
        -- upvalues: Character (copy), u47 (copy)
        if not Character.Parent then
            local glideMaid2 = u47.glideMaid;

            if glideMaid2 ~= nil then
                glideMaid2:DoCleaning();
            end;

            return nil;
        end;

        if Character.AssemblyLinearVelocity.Y < p50 then
            local AssemblyLinearVelocity = Character.AssemblyLinearVelocity;
            local v51 = Vector3.new(0, p50, 0);
            Character.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(1, 0, 1) + v51;
        end;
    end));
    local u52 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.QUEEN_BEE_FLOAT, {
        looped = true
    });

    if u52 then
        u47.glideMaid:GiveTask(function() -- Line: 278
            -- upvalues: u52 (copy)
            return u52:Stop();
        end);
    end;

    local u53 = true;
    u47.glideMaid:GiveTask(function() -- Line: 284
        -- upvalues: u53 (ref)
        u53 = false;
    end);
    task.delay(QueenBeeUtil.GLIDE_DURATION_SEC, function() -- Line: 287
        -- upvalues: u53 (ref), u47 (copy)
        if not u53 then
            return nil;
        end;

        local glideMaid2 = u47.glideMaid;

        if glideMaid2 ~= nil then
            glideMaid2:DoCleaning();
        end;
    end);
end;

function u5.lerpWingNeon(p54, p55, p56) -- Line: 297
    for _, child in p55:GetChildren() do
        if child:IsA("BasePart") or child:IsA("Decal") then
            p54:lerpWingNeon(child, p56);
        end;
    end;

    local v57 = math.clamp(p56, 0, 1);
    local v58 = p54.wingOriginalState[p55];

    if not v58 then
        if p55:IsA("BasePart") then
            v58 = {
                transparency = p55.Transparency,
                color = p55.Color
            };
            p54.wingOriginalState[p55] = v58;
        end;

        if p55:IsA("Decal") then
            v58 = {
                transparency = p55.Transparency
            };
            p54.wingOriginalState[p55] = v58;
        end;
    end;

    local v59 = p55:IsA("BasePart");

    if v59 then
        if v58 == nil then
            v59 = v58;
        else
            v59 = v58.color;
        end;
    end;

    if v59 then
        local color = v58.color;

        if color ~= nil then
            color = color:Lerp(Color3.fromRGB(250, 166, 83), v57);
        end;

        p55.Color = color;
    end;

    local v60 = p55:IsA("BasePart");

    if v60 then
        if v58 == nil then
            v60 = v58;
        else
            v60 = v58.transparency;
        end;
    end;

    if v60 ~= 0 and (v60 == v60 and v60) then
        p55.Transparency = (1 - v57) * v58.transparency + v57 * 0;
    end;

    local v61 = p55:IsA("Decal");

    if v61 then
        if v58 == nil then
            v61 = v58;
        else
            v61 = v58.transparency;
        end;
    end;

    if v61 ~= 0 and (v61 == v61 and v61) then
        p55.Transparency = (1 - v57) * v58.transparency + v57 * 1;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;