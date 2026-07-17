-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local WindWalkerStatus = RuntimeLib.import(script, script.Parent, "ui", "wind-walker-status").WindWalkerStatus;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "WindWalkerController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy)
    BaseKitController.constructor(p8, BedwarsKit.WIND_WALKER);
    p8.Name = "WindWalkerController";
    p8.hudMounted = false;
    p8.jumpMaid = u2.new();
    p8.doubleJumpActive = false;
    p8.doubleJumpSoundLastPlay = 0;
end;

function u6.onKitLocalActivated(u9, u10) -- Line: 49
    -- upvalues: default2 (copy), ClientSyncEvents (copy)
    default2.Client:OnEvent("WindWalkerSpawned", function() -- Line: 50
        -- upvalues: u9 (copy)
        if not u9.hudMounted then
            u9.hudMounted = true;
            u9:mountHud();
        end;
    end):andThen(function(p11) -- Line: 55
        -- upvalues: u10 (copy)
        u10:GiveTask(p11);
    end);
    default2.Client:OnEvent("WindWalkerSpeedUpdate", function(p12) -- Line: 58
        -- upvalues: ClientSyncEvents (ref), u9 (copy)
        ClientSyncEvents.WindWalkerOrbUpdate:fire(p12.orbCount);
        u9:updateSpeed(p12.multiplier);
        u9:updateJump(p12.orbCount);
    end):andThen(function(p13) -- Line: 62
        -- upvalues: u10 (copy)
        u10:GiveTask(p13);
    end);
end;

function u6.onKitLocalDeactivated(p14) -- Line: 66
end;

function u6.onKitReplicationActivated(u15, u16) -- Line: 68
    -- upvalues: default2 (copy), u3 (copy)
    default2.Client:OnEvent("WindWalkerEffect", function(p17) -- Line: 69
        -- upvalues: u15 (copy), u3 (ref)
        local Character = p17.player.Character;

        if Character then
            local UpperTorso = Character:WaitForChild("UpperTorso", 3);

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:WaitForChild("BodyFrontAttachment");
            end;

            local UpperTorso2 = Character:WaitForChild("UpperTorso", 3);

            if UpperTorso2 ~= nil then
                UpperTorso2 = UpperTorso2:WaitForChild("BodyBackAttachment");
            end;

            local v18 = u15:getKitSkinMeta(p17.player);
            local v19;

            if v18 == nil then
                v19 = v18;
            else
                v19 = v18.effects;

                if v19 ~= nil then
                    v19 = v19.trail;

                    if v19 ~= nil then
                        local function _(p20) -- Line: 90
                            return p20:IsA("Trail");
                        end;

                        local v21 = 0;
                        local v22 = {};

                        for i, child in v19:GetChildren() do
                            local _ = i - 1;

                            if child:IsA("Trail") == true then
                                v21 = v21 + 1;
                                v22[v21] = child;
                            end;
                        end;

                        local function _(p23) -- Line: 103
                            return p23:Clone();
                        end;

                        v19 = table.create(#v22);

                        for i, v in v22 do
                            local _ = i - 1;
                            v19[i] = v:Clone();
                        end;
                    end;
                end;
            end;

            if v18 ~= nil then
                v18 = v18.effects;

                if v18 ~= nil then
                    v18 = v18.trail;
                end;
            end;

            if not v18 then
                local v24 = u3("Trail", {
                    LightEmission = 0.5,
                    Lifetime = 0.33,
                    MaxLength = 50,
                    Transparency = NumberSequence.new(0.75)
                });
                table.insert(v19, v24);
            end;

            local function _(p25) -- Line: 133
                -- upvalues: UpperTorso (copy), UpperTorso2 (copy), Character (copy)
                p25:SetAttribute("FirstPersonVisible", false);
                p25.Attachment0 = UpperTorso;
                p25.Attachment1 = UpperTorso2;
                p25.Parent = Character;
            end;

            for i, v in v19 do
                local _ = i - 1;
                v:SetAttribute("FirstPersonVisible", false);
                v.Attachment0 = UpperTorso;
                v.Attachment1 = UpperTorso2;
                v.Parent = Character;
            end;
        end;
    end):andThen(function(p26) -- Line: 143
        -- upvalues: u16 (copy)
        u16:GiveTask(p26);
    end);
    default2.Client:OnEvent("SpawnWindWalkerOrb", function(p27) -- Line: 146
        -- upvalues: u15 (copy)
        u15:spawnOrb(p27.entity, p27.position);
    end):andThen(function(p28) -- Line: 148
        -- upvalues: u16 (copy)
        u16:GiveTask(p28);
    end);
end;

function u6.onKitReplicationDeactivated(p29) -- Line: 152
end;

function u6.onInnateAbilityEnabled(p30, p31, p32) -- Line: 154
end;

function u6.onAbilityUsed(p33, p34, p35) -- Line: 156
end;

function u6.mountHud(p36) -- Line: 158
    -- upvalues: Players (copy), u4 (copy), WindWalkerStatus (copy)
    local StatusEffectHud = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StatusEffectHudScreen"):WaitForChild("StatusEffectHud");
    u4.mount(u4.createElement(WindWalkerStatus), StatusEffectHud);
end;

function u6.updateSpeed(p37, p38) -- Line: 162
    -- upvalues: KnitClient (copy)
    if p37.currentSpeedModifier then
        p37.currentSpeedModifier:Destroy();
    end;

    if p38 == 1 then
        return nil;
    end;

    p37.currentSpeedModifier = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = p38
    });
end;

function u6.updateJump(u39, p40) -- Line: 173
    -- upvalues: KnitClient2 (copy), Players (copy), Workspace (copy), SoundManager (copy)
    if p40 >= 5 and not u39.doubleJumpActive then
        u39.doubleJumpActive = true;
        local v41 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
            airJumps = 2
        });
        u39.jumpMaid:GiveTask(v41);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChildOfClass("Humanoid");
        end;

        if Character then
            u39.jumpMaid:GiveTask(Character.StateChanged:Connect(function(p42, p43) -- Line: 186
                -- upvalues: Workspace (ref), u39 (copy), Players (ref), SoundManager (ref)
                if p42 ~= Enum.HumanoidStateType.Freefall or p43 ~= Enum.HumanoidStateType.Jumping then
                    return nil;
                end;

                local v44 = Workspace:GetServerTimeNow();

                if v44 - u39.doubleJumpSoundLastPlay < 0.2 then
                    return nil;
                end;

                u39.doubleJumpSoundLastPlay = v44;
                local v45 = u39:getKitSkinMeta(Players.LocalPlayer);

                if v45 ~= nil then
                    v45 = v45.sounds;

                    if v45 ~= nil then
                        v45 = v45.doubleJump;
                    end;
                end;

                if v45 == nil or #v45 < 1 then
                    return nil;
                end;

                SoundManager:playSound(v45[math.random(0, #v45 - 1) + 1]);
            end));
        end;
    elseif p40 < 5 and u39.doubleJumpActive then
        u39.doubleJumpActive = false;
        u39.jumpMaid:DoCleaning();
    end;
end;

function u6.spawnOrb(u46, u47, u48) -- Line: 214
    -- upvalues: u2 (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), default (copy), Linear (copy), RunService (copy), KnitClient (copy), EffectUtil (copy), u3 (copy), RuntimeLib (copy), TweenService (copy)
    local UpperTorso = u47:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
    end;

    if UpperTorso then
        local u49 = u2.new();
        local u50 = false;
        u49:GiveTask(function() -- Line: 223
            -- upvalues: u50 (ref)
            u50 = true;
        end);
        local u51 = u47 == Players.LocalPlayer.Character;
        local v52 = u46:getKitSkinMeta(Players.LocalPlayer);

        if v52 ~= nil then
            v52 = v52.sounds;

            if v52 ~= nil then
                v52 = v52.orbSpawn;
            end;
        end;

        if v52 == nil then
            v52 = GameSound.WIND_ORB_SPAWN;
        end;

        local v53 = {};
        local v54;

        if u51 then
            v54 = nil;
        else
            v54 = u47:GetPivot().Position;
        end;

        v53.position = v54;
        SoundManager:playSound(v52, v53);
        local u55 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("WindWalkerOrb"):Clone();
        u55:WaitForChild("Spirit");
        u55:PivotTo(CFrame.new(u48));
        u55.Parent = Workspace;
        u49:GiveTask(function() -- Line: 261
            -- upvalues: u55 (copy)
            local v56 = u55;

            if v56 ~= nil then
                v56:Destroy();
            end;
        end);
        local v57 = math.random() * 3.141592653589793 * 2;
        local v58 = math.cos(v57) * 3;
        local v59 = math.sin(v57) * 3;
        local u60 = Vector3.new(v58, 2, v59);
        local u63 = default(0.5, Linear, function(p61) -- Line: 269
            -- upvalues: u48 (copy), u60 (copy), u55 (copy)
            local v62 = u48:Lerp(u48 + u60, p61);
            u55:PivotTo(CFrame.new(v62));
        end);
        u49:GiveTask(function() -- Line: 274
            -- upvalues: u63 (copy)
            return u63:Cancel();
        end);
        task.delay(0.5, function() -- Line: 277
            -- upvalues: u50 (ref), RunService (ref), u47 (copy), u49 (copy), u55 (copy), u51 (copy), u46 (copy), Players (ref), SoundManager (ref), GameSound (ref), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
            if u50 then
                return nil;
            end;

            local u64 = os.clock();
            local u65 = nil;
            u65 = RunService.Heartbeat:Connect(function(p66) -- Line: 283
                -- upvalues: u47 (ref), u49 (ref), u64 (copy), u55 (ref), u51 (ref), u46 (ref), Players (ref), SoundManager (ref), GameSound (ref), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u65 (ref)
                if not u47.PrimaryPart then
                    u49:DoCleaning();

                    return nil;
                end;

                local v67 = 30 + (os.clock() - u64) * 100;
                local Position = u47.PrimaryPart.Position;
                local v68 = Position - u55:GetPrimaryPartCFrame().Position;

                if v68.Magnitude > v67 * p66 then
                    v68 = v68.Unit * (v67 * p66);
                else
                    if u51 then
                        local v69 = u46:getKitSkinMeta(Players.LocalPlayer);

                        if v69 ~= nil then
                            v69 = v69.sounds;

                            if v69 ~= nil then
                                v69 = v69.orbGet;
                            end;
                        end;

                        if v69 == nil then
                            v69 = GameSound.WIND_ORB_GET;
                        end;

                        local v70 = {};
                        local v71;

                        if u51 then
                            v71 = nil;
                        else
                            v71 = u47:GetPrimaryPartCFrame().Position;
                        end;

                        v70.position = v71;
                        local v72;

                        if u51 then
                            v72 = nil;
                        else
                            v72 = u47.PrimaryPart;
                        end;

                        v70.parent = v72;
                        SoundManager:playSound(v69, v70);
                        KnitClient.Controllers.ScreenShakeController:shake(u55:GetPivot().Position, v68.Unit, {
                            magnitude = 0.3,
                            cycles = 2
                        });
                    end;

                    local v73 = u46:getKitSkinMeta(Players.LocalPlayer);

                    if v73 ~= nil then
                        v73 = v73.effects;

                        if v73 ~= nil then
                            v73 = v73.hitEffect;

                            if v73 ~= nil then
                                v73 = v73:Clone();
                            end;
                        end;
                    end;

                    if v73 == nil then
                        v73 = ReplicatedStorage.Assets.Effects.WindHitEffect:Clone();
                    end;

                    v73.CFrame = CFrame.new(Position, Position + v68);
                    v73.Parent = Workspace;
                    EffectUtil:playEffects({ v73 }, nil, {
                        destroyAfterSec = 2
                    });
                    u65:Disconnect();
                    u55:Destroy();
                end;

                u55:PivotTo(u55:GetPivot() + v68);
            end);
            u49:GiveTask(u65);
        end);
        local u74 = u3("Beam", {
            LightEmission = 0.6,
            LightInfluence = 1,
            Width0 = 0.4,
            Width1 = 0.2,
            CurveSize0 = 3,
            CurveSize1 = -3,
            FaceCamera = true,
            Attachment0 = u55:FindFirstChild("Spirit"):FindFirstChild("Attachment"),
            Attachment1 = UpperTorso,
            Transparency = NumberSequence.new(0.8),
            Parent = u55
        });
        local u75 = u74:Clone();
        u75.FaceCamera = false;
        u75.Parent = u55;

        local function _() -- Line: 369
            -- upvalues: RuntimeLib (ref), u74 (copy), TweenService (ref), u75 (copy)
            RuntimeLib.Promise.defer(function() -- Line: 370
                -- upvalues: u74 (ref), TweenService (ref), u75 (ref)
                local v76 = 1;

                while u74.Parent do
                    local v77 = 0.4 + 0.2 * math.random();
                    local v78 = TweenService:Create(u74, TweenInfo.new(v77), {
                        CurveSize0 = v76 * -3,
                        CurveSize1 = v76 * 3
                    });
                    TweenService:Create(u75, TweenInfo.new(v77), {
                        CurveSize0 = v76 * -3,
                        CurveSize1 = v76 * 3
                    }):Play();
                    v78:Play();
                    v78.Completed:Wait();
                    v76 = v76 * -1;
                end;
            end);
        end;

        RuntimeLib.Promise.defer(function() -- Line: 370
            -- upvalues: u74 (copy), TweenService (ref), u75 (copy)
            local v79 = 1;

            while u74.Parent do
                local v80 = 0.4 + 0.2 * math.random();
                local v81 = TweenService:Create(u74, TweenInfo.new(v80), {
                    CurveSize0 = v79 * -3,
                    CurveSize1 = v79 * 3
                });
                TweenService:Create(u75, TweenInfo.new(v80), {
                    CurveSize0 = v79 * -3,
                    CurveSize1 = v79 * 3
                }):Play();
                v81:Play();
                v81.Completed:Wait();
                v79 = v79 * -1;
            end;
        end);
        RuntimeLib.Promise.delay(2.5):andThen(function() -- Line: 391
            -- upvalues: u49 (copy)
            u49:DoCleaning();
        end);
    end;
end;

function u6.getKitSkinMeta(p82, p83) -- Line: 397
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    local v84 = KnitClient.Controllers.KitSkinController:getKitSkin(p83);

    if v84 == nil then
        return nil;
    end;

    local v85 = BedwarsKitSkinMeta[v84];

    if v85 == nil then
        return nil;
    end;

    return v85.windWalker;
end;

KnitClient.CreateController(u6.new());

return nil;