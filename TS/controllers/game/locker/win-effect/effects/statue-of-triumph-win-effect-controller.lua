-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u5 = {
    CFrame.Angles(0, 0, 0),
    CFrame.Angles(0, 1.5707963267948966, 0),
    CFrame.Angles(0, 3.141592653589793, 0),
    CFrame.Angles(0, 4.71238898038469, 0)
};
local u6 = {
    AnimationType.TRIUMPH_STATUE_1_FRAME,
    AnimationType.TRIUMPH_STATUE_2_FRAME,
    AnimationType.TRIUMPH_STATUE_3_FRAME,
    AnimationType.TRIUMPH_STATUE_4_FRAME
};
local u7 = {
    AnimationType.TRIUMPH_STATUE_1,
    AnimationType.TRIUMPH_STATUE_2,
    AnimationType.TRIUMPH_STATUE_3,
    AnimationType.TRIUMPH_STATUE_4
};
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "StatueOfTriumphWinEffectController";
    end,

    __index = WinEffect
});
u8.__index = u8;

function u8.new(...) -- Line: 39
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 43
    -- upvalues: WinEffect (copy), WinEffectType (copy)
    WinEffect.constructor(p10, WinEffectType.STATUE_OF_TRIUMPH);
    p10.Name = "StatueOfTriumphWinEffectController";
    p10.characterClones = {};
    p10.statuePositions = {};
    p10.statuePrimaryParts = {};
    p10.statueHighlightMaids = {};
    p10.playersThatHaveWinEffect = {};
    p10.statueAnimMap = {};
    p10.playersCheckedForPreload = {};
    p10.isPreloaded = false;
end;

function u8.KnitStart(u11) -- Line: 55
    -- upvalues: WinEffect (copy), Players (copy), WinEffectType (copy), KnitClient (copy), AnimationType (copy), WatchCharacter (copy), default (copy)
    WinEffect.KnitStart(u11);
    Players.LocalPlayer.CharacterAdded:Connect(function(p12) -- Line: 57
        -- upvalues: Players (ref), u11 (copy), WinEffectType (ref), KnitClient (ref), AnimationType (ref)
        local v13 = Players:GetPlayerFromCharacter(p12);

        if v13 and u11.playersThatHaveWinEffect[v13] == nil then
            u11.playersCheckedForPreload[v13] = true;

            if p12:GetAttribute("WinEffect") == WinEffectType.STATUE_OF_TRIUMPH and not u11.isPreloaded then
                KnitClient.Controllers.PreloadController:runPreload({
                    animations = {
                        AnimationType.TRIUMPH_STATUE_1,
                        AnimationType.TRIUMPH_STATUE_2,
                        AnimationType.TRIUMPH_STATUE_3,
                        AnimationType.TRIUMPH_STATUE_4,
                        AnimationType.TRIUMPH_STATUE_1_FRAME,
                        AnimationType.TRIUMPH_STATUE_2_FRAME,
                        AnimationType.TRIUMPH_STATUE_3_FRAME,
                        AnimationType.TRIUMPH_STATUE_4_FRAME
                    }
                });
                u11.isPreloaded = true;
            end;
        end;
    end);
    WatchCharacter(function(p14, p15) -- Line: 69
        -- upvalues: u11 (copy)
        if u11.playersThatHaveWinEffect[p14] ~= nil then
            u11:createGoldCrownOnDeath(p14);
            u11:createStatueHitbox(p14);
        end;
    end);
    default.Client:Get("GetStatueWinEffectClone"):Connect(function(p16) -- Line: 77
        -- upvalues: u11 (copy)
        local function _(p17) -- Line: 79
            -- upvalues: u11 (ref)
            table.insert(u11.characterClones, p17);
        end;

        for i, v in p16.clones do
            local _ = i - 1;
            table.insert(u11.characterClones, v);
        end;

        u11:createStatues();
    end);
    default.Client:Get("GetStatueWinEffectPositions"):Connect(function(p18) -- Line: 89
        -- upvalues: u11 (copy)
        table.insert(u11.statuePositions, p18.statuePosition);
    end);
end;

function u8.onWin(u19, u20) -- Line: 95
    -- upvalues: TweenService (copy), default (copy), SoundManager (copy), GameSound (copy), Workspace (copy), RunService (copy), WeldUtil (copy)
    u19.playersThatHaveWinEffect[u20] = true;
    local u21 = u19:createGoldCrown(u20);
    local u22 = u19:createSpotLight(u20);
    local u23 = false;
    local v24 = TweenService:Create(u22.Root.LightBeam, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        Transparency = 0.9
    });
    v24:Play();
    v24.Completed:Connect(function() -- Line: 106
        -- upvalues: u23 (ref), default (ref), u19 (copy), u20 (copy)
        u23 = true;
        default.Client:Get("StatueWinEffectAddClone"):SendToServer({});
        u19:createStatueHitbox(u20);
    end);
    task.delay(1, function() -- Line: 111
        -- upvalues: u20 (copy), SoundManager (ref), GameSound (ref)
        local Character = u20.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character then
            SoundManager:playSound(GameSound.TRIUMPH_WIN_EFFECT_LIGHT, {
                parent = u20.Character.PrimaryPart,
                position = u20.Character.PrimaryPart.Position
            });
        end;
    end);
    TweenService:Create(u22.Root.LightPart.LightAttachment.PointLight, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        Brightness = 2.5
    }):Play();
    TweenService:Create(u22.Root.LightSource, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        Transparency = 0
    }):Play();
    task.delay(1.75, function() -- Line: 129
        -- upvalues: u22 (copy), TweenService (ref)
        u22.Root.LightBeam.WeldConstraint.Enabled = true;
        TweenService:Create(u22.Root.Ground.TopSurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            ImageTransparency = 0.5
        }):Play();
        TweenService:Create(u22.Root.Ground.BottomSurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            ImageTransparency = 0.5
        }):Play();
    end);
    local u25 = 0;
    local u26 = Workspace:GetServerTimeNow();
    local u27 = 0;
    local Y = u21.Handle.Position.Y;
    local u28 = false;
    RunService.Heartbeat:Connect(function() -- Line: 145
        -- upvalues: u20 (copy), u22 (copy), u23 (ref), u25 (ref), Workspace (ref), u26 (copy), u28 (ref), u27 (ref), u21 (copy), WeldUtil (ref), Y (copy)
        if u20.Character then
            local PrimaryPart = u20.Character.PrimaryPart;

            if not PrimaryPart then
                return nil;
            end;

            u22:PivotTo(PrimaryPart.CFrame);

            if not u23 then
                u25 = Workspace:GetServerTimeNow() - u26;
                local v29 = math.clamp(u25 / 2, 0, 1);
                local v30 = u22.Root.LightBeam.Position:Lerp(u22.Root.Ground.Position, v29);
                u22.Root.LightBeam.CFrame = CFrame.new(u22.Root.Ground.CFrame.Position.X, v30.Y + 56.5, u22.Root.Ground.CFrame.Position.Z);

                return;
            end;

            if u23 and not u28 then
                if u27 > 4 then
                    u28 = true;
                    u21.Handle.CanCollide = true;
                    u21.Handle.CanTouch = true;
                    WeldUtil:weldAccessory(u20.Character, u21);
                end;

                u27 = Workspace:GetServerTimeNow() - u26;
                local v31 = 1 - math.clamp(u27 / 4, 0, 1);
                local v32 = 1 - math.pow(v31, 2);
                u21.Handle.CFrame = CFrame.new(u20.Character.PrimaryPart.Position.X, Y + (u20.Character.PrimaryPart.Position.Y + 2.5 - Y) * v32, u20.Character.PrimaryPart.Position.Z);
            end;
        end;
    end);
end;

function u8.createGoldCrown(p33, p34) -- Line: 176
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local v35 = ReplicatedStorage.Assets.Misc.GoldCrownWearable:Clone();
    v35.Parent = Workspace;
    v35.Handle:PivotTo(p34.Character.PrimaryPart.CFrame + Vector3.new(0, 115, 0));
    v35.Handle.CanCollide = false;
    v35.Handle.CanTouch = false;

    return v35;
end;

function u8.createSpotLight(p36, p37) -- Line: 187
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local v38 = ReplicatedStorage.Assets.Effects.TriumphLight:Clone();
    v38.Parent = Workspace;
    v38:PivotTo(p37.Character.PrimaryPart.CFrame);

    return v38;
end;

function u8.createGoldCrownOnDeath(p39, p40) -- Line: 193
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy)
    local v41 = ReplicatedStorage.Assets.Misc.GoldCrownWearable:Clone();

    if not p40.Character then
        return nil;
    end;

    v41.Parent = p40.Character;
    v41.Handle.CanCollide = true;
    v41.Handle.CanTouch = true;
    WeldUtil:weldAccessory(p40.Character, v41);
end;

function u8.createStatues(p42) -- Line: 203
    -- upvalues: KnitClient2 (copy), ArmorSlot (copy), Workspace (copy), u5 (copy), SoundManager (copy), GameSound (copy), TweenService (copy), u4 (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local characterClones = p42.characterClones;

    local function v48(p43) -- Line: 205
        -- upvalues: KnitClient2 (ref), ArmorSlot (ref)
        local function _(p44) -- Line: 207
            if not p44:IsA("BasePart") or p44.Name == "HumanoidRootPart" then
                if p44:IsA("Decal") then
                    p44.Transparency = 0;
                end;

                return;
            end;

            p44.Transparency = 0;
            p44.Material = Enum.Material.Concrete;
        end;

        for i, descendant in p43:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
                descendant.Transparency = 0;
                descendant.Material = Enum.Material.Concrete;
            elseif descendant:IsA("Decal") then
                descendant.Transparency = 0;
            end;
        end;

        KnitClient2.Controllers.EntityHighlightController:highlight(p43, {
            transparency = 0,
            lastsForever = true,
            color = Color3.fromRGB(120, 120, 120),

            shouldApplyToPart = function(p45) -- Line: 222, Name: shouldApplyToPart
                -- upvalues: ArmorSlot (ref)
                local v46 = p45:FindFirstAncestorWhichIsA("Accessory");

                if not v46 or v46:GetAttribute("ArmorSlot") ~= ArmorSlot.HELMET then
                    return p45.Name ~= "StatuePodium";
                end;

                local function _(p47) -- Line: 227
                    if p47:IsA("Texture") then
                        p47.Transparency = 1;
                    end;
                end;

                for i, descendant in v46:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("Texture") then
                        descendant.Transparency = 1;
                    end;
                end;

                return false;
            end
        });
    end;

    for i, v in characterClones do
        v48(v, i - 1, characterClones);
    end;

    local v49 = false;
    local v50 = 0;

    while true do
        if v49 then
            v50 = v50 + 1;
        else
            v49 = true;
        end;

        if v50 >= #p42.statuePositions then
            local function _(p51) -- Line: 319
                return p51:Destroy();
            end;

            for i, v in p42.characterClones do
                local _ = i - 1;
                v:Destroy();
            end;

            return;
        end;

        local v52 = p42.characterClones[v50 % #p42.characterClones + 1]:Clone();
        v52.Parent = Workspace;
        p42:playFreezeAnimation(v52);

        if v52.PrimaryPart then
            v52.PrimaryPart.CollisionGroup = "Statue";
            p42.statuePrimaryParts[v52.PrimaryPart] = v52;
        end;

        local v53 = math.random() * #u5;
        local v54 = u5[math.floor(v53) + 1];
        SoundManager:playSound(GameSound.TRIUMPH_WIN_EFFECT_STATUE, {
            position = p42.statuePositions[v50 + 1]
        });
        v52:PivotTo(CFrame.new(p42.statuePositions[v50 + 1] + Vector3.new(0, -8, 0)) * v54);
        TweenService:Create(v52.HumanoidRootPart, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            CFrame = CFrame.new(p42.statuePositions[v50 + 1] + Vector3.new(0, 7.7, 0)) * v54
        }):Play();
        local u55 = {};

        local function _(p56) -- Line: 291
            -- upvalues: u4 (ref), u55 (copy)
            if p56:IsA("BasePart") and p56.Name ~= "HolyRays" then
                p56.CanCollide = true;

                return;
            end;

            if p56:IsA("Texture") and u4.startsWith(p56.Name, "entity-highlight-texture:") then
                table.insert(u55, p56);
            end;
        end;

        for i, descendant in v52:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.Name ~= "HolyRays" then
                descendant.CanCollide = true;
            elseif descendant:IsA("Texture") and u4.startsWith(descendant.Name, "entity-highlight-texture:") then
                table.insert(u55, descendant);
            end;
        end;

        p42.statueHighlightMaids[v52] = u55;
        local u57 = ReplicatedStorage.Assets.Effects.StatueSummon:Clone();
        u57.Parent = v52;
        u57.Position = p42.statuePositions[v50 + 1] + Vector3.new(0, -5, 0);
        EffectUtil:enableInstanceEffect(u57);
        task.delay(6, function() -- Line: 312
            -- upvalues: u57 (copy)
            u57:Destroy();
        end);
        task.wait(0.5);
    end;
end;

function u8.createStatueHitbox(u58, p59) -- Line: 326
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy), EffectUtil (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    local v60 = ReplicatedStorage.Assets.Misc.StatueHitbox:Clone();

    if not p59.Character then
        return nil;
    end;

    WeldUtil:weldAccessory(p59.Character, v60);
    v60.Handle.Touched:Connect(function(p61) -- Line: 332
        -- upvalues: u58 (copy), EffectUtil (ref), TweenService (ref), SoundManager (ref), GameSound (ref)
        if u58.statuePrimaryParts[p61] ~= nil then
            local u62 = u58.statuePrimaryParts[p61];
            u58.statuePrimaryParts[p61] = nil;
            local u63;

            if u62 == nil then
                u63 = u62;
            else
                u63 = u62:FindFirstChild("StatuePodium");

                if u63 ~= nil then
                    u63 = u63:FindFirstChild("HolyRays");
                end;
            end;

            if not (u62 and u63) then
                return nil;
            end;

            EffectUtil:enableInstanceEffect(u63);
            local v64 = u58.statueHighlightMaids[u62];

            if v64 ~= nil then
                local function v66(p65) -- Line: 356
                    -- upvalues: TweenService (ref)
                    TweenService:Create(p65, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Transparency = 1
                    }):Play();
                end;

                for i, v in v64 do
                    v66(v, i - 1, v64);
                end;
            end;

            SoundManager:playSound(GameSound.TRIUMPH_WIN_EFFECT_PURIFY, {
                position = u63.Position
            });
            task.delay(2, function() -- Line: 368
                -- upvalues: u63 (copy), u58 (ref), u62 (copy)
                local function _(p67) -- Line: 370
                    if p67:IsA("ParticleEmitter") then
                        p67.Enabled = false;
                    end;
                end;

                for i, descendant in u63:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = false;
                    end;
                end;

                u58:playStatueAnimation(u62);
            end);
        end;
    end);
end;

function u8.playFreezeAnimation(p68, p69) -- Line: 383
    -- upvalues: u6 (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    local v70 = math.random() * #u6;
    local v71 = math.floor(v70);
    local v72 = u6[v71 + 1];
    local Humanoid = p69:FindFirstChild("Humanoid");

    if Humanoid ~= nil then
        Humanoid = Humanoid:FindFirstChild("Animator");
    end;

    local v73 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(v72), {
        looped = true
    });
    p68.statueAnimMap[p69] = v71;

    return v73;
end;

function u8.playStatueAnimation(p74, u75) -- Line: 399
    -- upvalues: u7 (copy), AnimationUtil (copy), GameAnimationUtil (copy), TweenService (copy)
    local v76 = p74.statueAnimMap[u75];

    if v76 == nil then
        return nil;
    end;

    local v77 = u7[v76 + 1];
    local Humanoid = u75:FindFirstChild("Humanoid");

    if Humanoid ~= nil then
        Humanoid = Humanoid:FindFirstChild("Animator");
    end;

    local u78 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(v77), {
        looped = false
    });

    if not u78 then
        return nil;
    end;

    u78:GetMarkerReachedSignal("end"):Connect(function() -- Line: 418
        -- upvalues: u78 (copy), u75 (copy), TweenService (ref)
        u78:AdjustSpeed(0);
        local v79 = u75:GetDescendants();

        local function v81(p80) -- Line: 421
            -- upvalues: TweenService (ref)
            if p80:IsA("BasePart") and (p80.Name ~= "HumanoidRootPart" and p80.Name ~= "StatuePodium") then
                TweenService:Create(p80, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Transparency = 1,
                    CanCollide = false
                }):Play();

                return;
            end;

            if p80:IsA("Decal") then
                TweenService:Create(p80, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Transparency = 1
                }):Play();
            end;
        end;

        for i, v in v79 do
            v81(v, i - 1, v79);
        end;
    end);

    return u78;
end;

KnitClient.CreateController(u8.new());

return nil;