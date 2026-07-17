-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SoulReaverEnchantController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SoulReaverEnchantController";
    p5.effectMap = {};
    p5.effectEndTime = {};
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), default (copy), Workspace (copy), EnchantBalance (copy), u1 (copy), ReplicatedStorage (copy), KnitClient (copy), VignetteType (copy), SoundManager (copy), GameSound (copy), TweenService (copy), RunService (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.StatusEffectAdded:connect(function(p7) -- Line: 41
        -- upvalues: StatusEffectType (ref), Players (ref), u6 (copy)
        if p7.statusEffect ~= StatusEffectType.INVISIBILITY and (p7.statusEffect ~= StatusEffectType.SMOKE_INVISIBILITY and p7.statusEffect ~= StatusEffectType.NINJA_INVISIBLE) then
            return nil;
        end;

        local v8 = Players:GetPlayerFromCharacter(p7.entityInstance);

        if not v8 then
            return nil;
        end;

        u6.effectEndTime[v8] = nil;
    end);
    default.Client:Get("SoulReaverEnchantEffect"):Connect(function(u9) -- Line: 51
        -- upvalues: Workspace (ref), EnchantBalance (ref), u6 (copy), u1 (ref), ReplicatedStorage (ref), Players (ref), KnitClient (ref), VignetteType (ref), SoundManager (ref), GameSound (ref), TweenService (ref), RunService (ref)
        local Character = u9.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.CFrame;
            end;
        end;

        if not Character then
            return nil;
        end;

        local v10 = Workspace:GetServerTimeNow() + EnchantBalance.SOUL_REAVER_DURATION;
        u6.effectEndTime[u9.player] = v10;
        local u11 = u6.effectMap[u9.player];
        local u12 = u1.new();
        local u13, v14;

        if u11 then
            u13 = 1;
            v14 = false;
        else
            u11 = ReplicatedStorage.Assets.Effects.SoulReaverAura:Clone();
            u11.Parent = u9.player.Character;
            u11:PivotTo(Character - Vector3.new(0, 3, 0));
            u6.effectMap[u9.player] = u11;

            if u9.player == Players.LocalPlayer then
                KnitClient.Controllers.VignetteController:createVignette(VignetteType.SOUL_REAVER);
            end;

            u12:GiveTask(function() -- Line: 88
                -- upvalues: u6 (ref), u9 (copy), Players (ref), KnitClient (ref), VignetteType (ref)
                u6.effectMap[u9.player] = nil;

                if u9.player == Players.LocalPlayer then
                    KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.SOUL_REAVER);
                end;
            end);
            u13 = u9.stacks;
            local u15 = SoundManager:playModifiableSound(GameSound.SOUL_REAVER_LOOP, {
                looped = true,
                volumeMultiplier = 0.75,
                position = Character.Position,
                parent = u9.player.Character
            });
            u12:GiveTask(function() -- Line: 104
                -- upvalues: TweenService (ref), u15 (copy)
                TweenService:Create(u15, TweenInfo.new(0.25), {
                    Volume = 0
                }):Play();
                task.delay(0.4, function() -- Line: 108
                    -- upvalues: u15 (ref)
                    return u15:Destroy();
                end);
            end);
            v14 = true;
        end;

        u12:GiveTask(u11);
        local stacks = u9.stacks;

        if stacks ~= 0 and (stacks == stacks and stacks) then
            u11.Size = Vector3.new(u11.Size.X + u13 * 0.8, u11.Size.Y, u11.Size.Z + u13 * 0.8);
            local v16 = u11:GetDescendants();

            local function v22(p17) -- Line: 118
                -- upvalues: u13 (ref)
                if p17:IsA("Beam") then
                    p17.Width0 = p17.Width0 + u13 * 0.2;
                    p17.Width1 = p17.Width1 + u13 * 0.2;

                    if p17.CurveSize0 ~= 0 then
                        p17.CurveSize0 = p17.CurveSize0 + u13 * 0.2 * (p17.CurveSize0 < 0 and -1 or 1);
                    end;

                    if p17.CurveSize1 ~= 0 then
                        p17.CurveSize1 = p17.CurveSize1 + u13 * 0.2 * (p17.CurveSize1 < 0 and -1 or 1);
                    end;
                end;

                if p17:IsA("ParticleEmitter") then
                    local v18 = string.match(p17.Name, "Pulse");

                    if v18 ~= 0 and (v18 == v18 and (v18 ~= "" and v18)) then
                        local v19 = p17.Size.Keypoints[2];
                        p17.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, p17.Size.Keypoints[1].Value + u13 * 0.5), NumberSequenceKeypoint.new(1, v19.Value + u13 * 1.2) });

                        return;
                    end;

                    local v20 = string.match(p17.Name, "Smoke");

                    if v20 ~= 0 and (v20 == v20 and (v20 ~= "" and v20)) then
                        p17.Rate = p17.Rate + u13 * 3;

                        return;
                    end;

                    local v21 = string.match(p17.Name, "Souls");

                    if v21 ~= 0 and (v21 == v21 and (v21 ~= "" and v21)) then
                        p17.Rate = p17.Rate + u13;
                    end;
                end;
            end;

            for i, v in v16 do
                v22(v, i - 1, v16);
            end;
        end;

        if v14 then
            local u23 = nil;
            u23 = RunService.Heartbeat:Connect(function() -- Line: 156
                -- upvalues: u12 (copy), u23 (ref), u6 (ref), u9 (copy), Workspace (ref), u11 (ref)
                u12:GiveTask(u23);
                local v24 = u6.effectEndTime[u9.player];

                if v24 == 0 or (v24 ~= v24 or (not v24 or v24 < Workspace:GetServerTimeNow())) then
                    u12:DoCleaning();

                    return nil;
                end;

                local Character2 = u9.player.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;
                end;

                if not Character2 then
                    u12:DoCleaning();

                    return nil;
                end;

                if not u11 then
                    return nil;
                end;

                u11:PivotTo(Character2.CFrame - Vector3.new(0, 3, 0));
            end);
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;