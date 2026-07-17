-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "CosmicLuckyBlockController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "CosmicLuckyBlockController";
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), default2 (copy), u2 (copy), Workspace (copy), ReplicatedStorage (copy), ItemType (copy), GameSound (copy), SoundManager (copy), default (copy), Linear (copy), EffectUtil (copy)
    KnitController.KnitStart(u7);
    default2.Client:Get("CosmicLuckyBlockSpawn"):Connect(function(p8) -- Line: 39
        -- upvalues: u2 (ref), Workspace (ref), ReplicatedStorage (ref), ItemType (ref), GameSound (ref), SoundManager (ref), default (ref), Linear (ref), EffectUtil (ref), u7 (copy)
        local v9 = u2.new();
        local v10 = Random.new(p8.randomSeed);
        local v11 = v10:NextNumber() * 3.141592653589793 * 2;
        local v12 = v10:NextNumber() < 0.5 and 1 or 2;
        local v13 = { p8.position + CFrame.Angles(0, v11, 0) * CFrame.Angles(-1.1344640137963142, 0, 0) * Vector3.new(0, 0, 180), p8.position };
        local v14 = false;
        local v15 = 0;

        while true do
            if v14 then
                v15 = v15 + 1;
            else
                v14 = true;
            end;

            if v15 >= 5 then
                break;
            end;

            local v16 = v13[1] + CFrame.Angles(0, v11 + math.pow(-1, v15 + v12) * 0.7853981633974483, 0) * CFrame.Angles(math.rad(v15 * 3 + -20), 0, 0) * Vector3.new(0, 0, 120);
            table.insert(v13, 1, v16);
        end;

        local v17 = p8.arriveTime - Workspace:GetServerTimeNow();
        local v18 = false;
        local v19 = 0;
        local v20 = 0;

        while true do
            if v18 then
                v19 = v19 + 1;
            else
                v18 = true;
            end;

            if v19 >= #v13 - 1 then
                break;
            end;

            v20 = v20 + (v13[v19 + 1] - v13[v19 + 1 + 1]).Magnitude;
        end;

        local u21 = ReplicatedStorage.Assets.Blocks:FindFirstChild(ItemType.COSMIC_LUCKY_BLOCK);

        if u21 ~= nil then
            u21 = u21:Clone();
        end;

        local Root = u21:FindFirstChild("Root");

        if Root ~= nil then
            local EntryEffects = Root:FindFirstChild("EntryEffects");

            if EntryEffects ~= nil then
                local function _(p22) -- Line: 100
                    if p22:IsA("ParticleEmitter") then
                        p22.Enabled = true;
                    end;

                    if p22:IsA("Trail") then
                        p22.Enabled = true;
                    end;
                end;

                for i, descendant in EntryEffects:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = true;
                    end;

                    if descendant:IsA("Trail") then
                        descendant.Enabled = true;
                    end;
                end;
            end;
        end;

        u21.Parent = Workspace;
        local u23 = os.clock();
        local _ = { GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_1, GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_2, GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_3 };
        local v24 = SoundManager:playSound(GameSound.COSMIC_LUCKY_BLOCK_FLY_LOOP, {
            rollOffMaxDistance = 1200,
            rollOffMinDistance = 150,
            looped = true,
            parent = u21.PrimaryPart
        });
        local v25 = false;
        local v26 = 0;

        while true do
            if v25 then
                v26 = v26 + 1;
            else
                v25 = true;
            end;

            if v26 >= #v13 - 1 then
                v9:DoCleaning();

                for _, descendant in u21:GetDescendants() do
                    if descendant:IsA("Decal") then
                        descendant.Transparency = 1;
                    end;

                    if descendant:IsA("BasePart") then
                        descendant.Transparency = 1;
                        descendant.CanCollide = false;
                        descendant.CanQuery = false;
                    end;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = false;
                    end;

                    if descendant:IsA("PointLight") then
                        descendant.Enabled = false;
                    end;

                    if descendant:IsA("Trail") then
                        descendant.Enabled = false;
                    end;
                end;

                if v24 then
                    SoundManager:tweenSoundVolume(v24, 0, 1);
                end;

                task.delay(15, function() -- Line: 212
                    -- upvalues: u21 (copy)
                    u21:Destroy();
                end);

                return;
            end;

            local u27 = v13[v26 + 1];
            local u28 = v13[v26 + 1 + 1];
            local Unit = (u28 - u27).Unit;
            local u29 = nil;
            u29 = default((u27 - u28).Magnitude / v20 * v17, Linear, function(p30) -- Line: 140
                -- upvalues: u21 (copy), u29 (ref), u23 (copy), Unit (copy), u27 (copy), u28 (copy)
                local v31 = math.pow(p30, 0.6666666666666666);
                local PrimaryPart = u21.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Parent;
                end;

                if not PrimaryPart then
                    u29:Cancel();

                    return nil;
                end;

                local _ = os.clock() - u23;
                local v32 = CFrame.new(Vector3.new(0, 0, 0), Unit);
                local v33 = math.sin(v31 * 3.141592653589793 * 2 * 2) * 5;
                local v34 = v32 * Vector3.new(v33, 0, 0);
                u21:PivotTo(CFrame.new(u27):Lerp(CFrame.new(u28) + v34, v31));
            end);
            u29:Wait();
            local Root2 = u21:FindFirstChild("Root");

            if Root2 ~= nil then
                Root2 = Root2:FindFirstChild("EntryEffects");

                if Root2 ~= nil then
                    Root2 = Root2:FindFirstChild("Blast");
                end;
            end;

            if Root2 then
                EffectUtil:playEffects({ Root2 }, nil);
            end;

            local v35 = #v13 - 2;
            local COSMIC_LUCKY_BLOCK_BOUNCE_1 = GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_1;

            if v35 / 2 < v26 then
                COSMIC_LUCKY_BLOCK_BOUNCE_1 = GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_2;
            end;

            if v26 == #v13 - 2 then
                COSMIC_LUCKY_BLOCK_BOUNCE_1 = GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_3;
            end;

            local v36 = COSMIC_LUCKY_BLOCK_BOUNCE_1 == GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_3 and 1 or v26 / (v35 - 1) * 0.2 + 0.9;
            SoundManager:playSound(COSMIC_LUCKY_BLOCK_BOUNCE_1, {
                rollOffMaxDistance = 1200,
                rollOffMinDistance = 150,
                position = u21:GetPrimaryPartCFrame().Position,
                playbackSpeedMultiplier = v36
            });
            u7:attemptScreenShake(u28, Unit);
        end;
    end);
end;

function u4.attemptScreenShake(p37, p38, p39) -- Line: 217
    -- upvalues: Workspace (copy), GameQueryUtil (copy), ScreenShakeUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local v40, v41 = CurrentCamera:WorldToScreenPoint(p38);

    if not v41 then
        return nil;
    end;

    local v42 = CurrentCamera:ScreenPointToRay(v40.X, v40.Y, (math.max((p38 - CurrentCamera.CFrame.Position).Magnitude - 9, 0)));
    local v43 = GameQueryUtil:raycast(v42.Origin, v42.Direction);

    if v43 ~= nil then
        v43 = v43.Instance;
    end;

    if v43 then
        return nil;
    end;

    local v44 = math.clamp(1 - (p38 - CurrentCamera.CFrame.Position).Magnitude / 500, 0, 1);
    ScreenShakeUtil.shake(p38, p39, {
        magnitude = v44 * 0.3 + 0.05,
        duration = v44 * 0.15 + 0.05
    });
end;

KnitClient.CreateController(u4.new());

return nil;