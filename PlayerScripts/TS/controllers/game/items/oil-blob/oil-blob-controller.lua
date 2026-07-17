-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v5.Debris;
local HttpService = v5.HttpService;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local OilClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "oil-client-status-effect-handler").OilClientStatusEffectHandler;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "OilBlobController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 35
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "OilBlobController";
    p8.spillMap = {};
end;

function u6.KnitStart(u9) -- Line: 44
    -- upvalues: KnitController (copy), KnitClient2 (copy), StatusEffectType (copy), OilClientStatusEffectHandler (copy), default (copy), u3 (copy), Workspace (copy), ReplicatedStorage (copy)
    KnitController.KnitStart(u9);
    KnitClient2.Controllers.StatusEffectController:setHandler(StatusEffectType.OIL_SPILLED, OilClientStatusEffectHandler);
    default.Client:OnEvent("OilSpill", function(u10) -- Line: 47
        -- upvalues: u3 (ref), u9 (copy), Workspace (ref)
        local v11 = Random.new(u10.seed);
        local radius = u10.radius;
        local u12 = u3.new();
        local u13 = u9:createOilSplashPart(u10.position + Vector3.new(0, 0.05, 0), 4, Vector3.new(0, 1, 0), v11);
        u12:GiveTask(u13);
        u9:makeOilSlippery(u13, v11);
        u12:GiveTask(function() -- Line: 57
            -- upvalues: u9 (ref), u10 (copy)
            u9.spillMap[u10.seed] = nil;
        end);
        u9.spillMap[u10.seed] = u13;
        u9:oilSpillInTween(u13, radius):andThen(function() -- Line: 66
            -- upvalues: u9 (ref), u13 (copy), u10 (copy), Workspace (ref), u12 (copy)
            u9:oilSpillOutTween(u13, u10.expirationTime - Workspace:GetServerTimeNow()):expect();
            u12:DoCleaning();
        end);
        local v14 = v11:NextInteger(6, 15);
        local v15 = false;
        local v16 = 0;

        while true do
            if v15 then
                v16 = v16 + 1;
            else
                v15 = true;
            end;

            if v16 >= v14 then
                return;
            end;

            local v17 = v11:NextNumber() * 3.141592653589793 * 2;
            local v18 = u10.position + Vector3.new(0, 3, 0);
            local v19 = math.cos(v17) * v11:NextNumber(30, 60);
            local v20 = v11:NextInteger(15, 50);
            local v21 = math.sin(v17) * v11:NextNumber(30, 60);
            u9:launchOilSplash(v18, Vector3.new(v19, v20, v21), u10.expirationTime - Workspace:GetServerTimeNow(), v11);
        end;
    end);
    default.Client:Get("OilFlame"):Connect(function(p22) -- Line: 92
        -- upvalues: u9 (copy), ReplicatedStorage (ref)
        local v23 = u9.spillMap[p22.seed];

        if v23 then
            for _, child in ReplicatedStorage.Assets.Effects.Burn:GetChildren() do
                local v24 = child:Clone();
                v24.Parent = v23;

                if v24:IsA("ParticleEmitter") then
                    v24.Rate = 45;
                end;
            end;
        end;
    end);
end;

u6.oilSpillInTween = RuntimeLib.async(function(p25, p26, p27) -- Line: 107
    -- upvalues: TweenService (copy)
    local v28 = TweenService:Create(p26, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = Vector3.new(p27, p26.Size.Y, p27)
    });
    v28:Play();
    v28.Completed:Wait();
end);
u6.oilSpillOutTween = RuntimeLib.async(function(p29, p30, p31) -- Line: 114
    -- upvalues: TweenService (copy)
    local v32 = TweenService:Create(p30, TweenInfo.new(p31, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        Size = Vector3.new(0, 0, 0)
    });
    v32:Play();
    v32.Completed:Wait();
end);

function u6.makeOilSlippery(p33, p34, p35) -- Line: 121
    p34.CanCollide = true;
    local v36 = p35:NextNumber(-1, 1);
    local v37 = p35:NextNumber(-1, 1);
    p34.AssemblyLinearVelocity = Vector3.new(v36, v37, p35:NextNumber(-1, 1)) * 20;
    p34.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0);
end;

function u6.launchOilSplash(u38, u39, p40, u41, u42) -- Line: 126
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), u4 (copy), ProjectileUtil (copy), EntityUtil (copy), HttpService (copy), BlockEngine (copy), Debris (copy)
    if u42 == nil then
        u42 = Random.new();
    end;

    local u43 = u42:NextNumber(0.5, 2);
    local v44 = ReplicatedStorage.Assets.Effects.OilPart:Clone();
    v44.Anchored = false;
    v44.Size = Vector3.new(u43, u43, u43);
    GameQueryUtil:setQueryIgnored(v44, true);
    local u45 = u4("Model", {
        Children = { v44 }
    });
    u45.PrimaryPart = v44;
    ProjectileUtil.fireProjectile(EntityUtil:getLocalPlayerEntity(), u45, "oil:" .. HttpService:GenerateGUID(false), u39, p40, 196.2, function(u46, p47) -- Line: 139
        -- upvalues: BlockEngine (ref), u39 (copy), u38 (copy), u43 (copy), u42 (ref), u41 (copy), u45 (copy)
        local v48 = BlockEngine:getHandlerRegistry():getHandler(p47.Name);

        if v48 then
            local function _(p49) -- Line: 143
                -- upvalues: BlockEngine (ref), u46 (copy)
                return (BlockEngine:getWorldPosition(p49) - u46).Magnitude <= 3.1;
            end;

            local v50 = nil;

            for i, v in v48:getContainedPositions(p47) do
                local _ = i - 1;

                if (BlockEngine:getWorldPosition(v) - u46).Magnitude <= 3.1 == true then
                    v50 = v;
                    break;
                end;
            end;

            if v50 then
                local u51 = nil;

                for _, v in Enum.NormalId:GetEnumItems() do
                    if BlockEngine:getStore():getBlockAt(v50 + Vector3.FromNormalId(v)) == nil then
                        local v52 = BlockEngine:getWorldPosition(v50) + Vector3.FromNormalId(v) * 1.5;
                        local Magnitude = (v52 - (u46 + (u39 - u46).Unit)).Magnitude;

                        if u51 == nil or Magnitude < u51.distance then
                            u51 = {
                                surface = v,
                                distance = Magnitude,
                                surfacePosition = v52
                            };
                        end;
                    end;
                end;

                task.spawn(function() -- Line: 182
                    -- upvalues: u51 (ref), u46 (copy), u38 (ref), u43 (ref), u42 (ref), u41 (ref)
                    if u51 then
                        local v53 = Vector3.FromNormalId(u51.surface);
                        local v54;

                        if math.abs(v53.X) == 1 then
                            v54 = u51.surfacePosition.X;
                        else
                            v54 = u46.X;
                        end;

                        local v55;

                        if math.abs(v53.Y) == 1 then
                            v55 = u51.surfacePosition.Y;
                        else
                            v55 = u46.Y;
                        end;

                        local v56;

                        if math.abs(v53.Z) == 1 then
                            v56 = u51.surfacePosition.Z;
                        else
                            v56 = u46.Z;
                        end;

                        local u57 = u38:createOilSplashPart(Vector3.new(v54, v55, v56), u43, v53, u42);
                        u38:makeOilSlippery(u57, u42);
                        u38:oilSpillInTween(u57, u43 * 2):andThen(function() -- Line: 191
                            -- upvalues: u38 (ref), u57 (copy), u41 (ref)
                            u38:oilSpillOutTween(u57, u41):expect();
                            u57:Destroy();
                        end);
                    end;
                end);
            end;
        end;

        u45:Destroy();
    end);
    Debris:AddItem(u45, 10);
end;

function u6.createOilSplashPart(p58, p59, p60, p61, p62) -- Line: 204
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), SoundManager (copy), GameSound (copy), Workspace (copy)
    if p62 == nil then
        p62 = Random.new();
    end;

    local v63 = ReplicatedStorage.Assets.Effects.OilPart:Clone();
    GameQueryUtil:setQueryIgnored(v63, true);
    SoundManager:playSound(GameSound.GOO_SPLAT, {
        rollOffMaxDistance = 150,
        position = p59,
        playbackSpeedMultiplier = p62:NextNumber(1, 1.5)
    });
    local v64 = p62:NextNumber(0.1, 0.5);
    v63.Size = Vector3.new(p60, v64, p60);
    v63.CFrame = CFrame.lookAt(p59, p59 + p61) * CFrame.Angles(-1.5707963267948966, 0, 0);
    v63.Parent = Workspace;

    return v63;
end;

KnitClient.CreateController(u6.new());

return nil;