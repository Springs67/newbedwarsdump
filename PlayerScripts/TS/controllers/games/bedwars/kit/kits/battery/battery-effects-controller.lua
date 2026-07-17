-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BatteryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "battery", "battery-util").BatteryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BatteryEffectsController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy)
    BaseKitController.constructor(p6, BedwarsKit.BATTERY, {
        sounds = {
            GameSound.OVERLOAD_BEEP,
            GameSound.OVERLOAD_LOOP,
            GameSound.MIDNIGHT_ATTACK_3,
            GameSound.TRINITY_VOID_ORB_HEAL
        }
    });
    p6.Name = "BatteryEffectsController";
    p6.batteryIds = {};
    p6.liveBatteries = {};
end;

function u4.onKitLocalActivated(p7, p8) -- Line: 45
end;

function u4.onKitLocalDeactivated(p9) -- Line: 47
end;

function u4.onKitReplicationActivated(u10, p11) -- Line: 49
    -- upvalues: default (copy), u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), BLOCK_SIZE (copy), Workspace (copy), SoundManager (copy), GameSound (copy), Players (copy), EffectUtil (copy), KnitClient (copy), BatteryUtil (copy), WatchCharacter (copy), isUsingKit (copy), BedwarsKit (copy), WeldUtil (copy)
    p11:GiveTask((default.Client:WaitFor("BatterySpawn"):expect():Connect(function(u12) -- Line: 50
        -- upvalues: u2 (ref), ReplicatedStorage (ref), u10 (copy), GameQueryUtil (ref), BLOCK_SIZE (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        local u13 = u2.new();
        local u14 = true;
        u13:GiveTask(function() -- Line: 53
            -- upvalues: u14 (ref)
            u14 = false;
        end);
        local u15 = ReplicatedStorage.Assets.Misc.Battery.Closed:Clone();
        u13:GiveTask(u15);
        u10.liveBatteries[u12.batteryId] = {
            consumeTime = 0,
            maid = u13,
            activateTime = u12.activateTime,
            position = u12.position
        };
        u13:GiveTask(function() -- Line: 67
            -- upvalues: u10 (ref), u12 (copy)
            u10.liveBatteries[u12.batteryId] = nil;
        end);
        GameQueryUtil:setQueryIgnored(u15, true);
        local position = u12.position;
        local v16 = Vector3.new(0, BLOCK_SIZE / 2, 0);
        u15:PivotTo(CFrame.new(position - v16));
        u15.Parent = Workspace;
        local delay = task.delay;
        local v17 = u12.activateTime - Workspace:GetServerTimeNow();
        delay(math.max(0, v17), function() -- Line: 78
            -- upvalues: u14 (ref), SoundManager (ref), GameSound (ref), u15 (copy), ReplicatedStorage (ref), u13 (copy), u10 (ref), u12 (copy), GameQueryUtil (ref), Workspace (ref)
            if not u14 then
                return nil;
            end;

            SoundManager:playSound(GameSound.MIDNIGHT_ATTACK_3, {
                volumeMultiplier = 0.25,
                position = u15:GetPrimaryPartCFrame().Position
            });
            local v18 = ReplicatedStorage.Assets.Misc.Battery.Open:Clone();
            u13:GiveTask(v18);
            u10:registerBattery(v18, u12.batteryId);
            GameQueryUtil:setQueryIgnored(v18, true);
            v18:PivotTo(u15:GetPrimaryPartCFrame());
            u15:Destroy();
            v18.Parent = Workspace;
        end);
        local delay2 = task.delay;
        local v19 = u12.despawnTime - Workspace:GetServerTimeNow();
        delay2(math.max(0, v19), function() -- Line: 94
            -- upvalues: u13 (copy)
            u13:DoCleaning();
        end);
    end)));
    p11:GiveTask((default.Client:WaitFor("BatteryConsumed"):expect():Connect(function(p20) -- Line: 99
        -- upvalues: u10 (copy), SoundManager (ref), GameSound (ref), Players (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local v21 = u10.liveBatteries[p20.batteryId];

        if v21 then
            v21.maid:DoCleaning();
            local TRINITY_VOID_ORB_HEAL = GameSound.TRINITY_VOID_ORB_HEAL;
            local v22 = {};
            local v23;

            if p20.player == Players.LocalPlayer then
                v23 = nil;
            else
                v23 = v21.position;
            end;

            v22.position = v23;
            SoundManager:playSound(TRINITY_VOID_ORB_HEAL, v22);
            local v24 = ReplicatedStorage.Assets.Misc.Battery.BatteryPop:Clone();
            v24.Position = v21.position;
            v24.Parent = Workspace;
            EffectUtil:playEffects({ v24 }, nil, {
                destroyAfterSec = 4
            });
        end;

        u10.liveBatteries[p20.batteryId] = nil;
    end)));
    p11:GiveTask((default.Client:WaitFor("BatteryOverload"):expect():Connect(function(u25) -- Line: 120
        -- upvalues: Workspace (ref), Players (ref), u2 (ref), KnitClient (ref), BatteryUtil (ref), SoundManager (ref), GameSound (ref), u10 (copy)
        local v26 = u25.endTime - Workspace:GetServerTimeNow();
        local u27 = u25.character == Players.LocalPlayer.Character;
        local u28 = u2.new();
        local u29 = true;
        u28:GiveTask(function() -- Line: 125
            -- upvalues: u29 (ref)
            u29 = false;
        end);

        if u27 then
            u28:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = BatteryUtil.OVERLOAD_SPEED_MULT
            }));
        end;

        if u27 or u25.character.PrimaryPart then
            local OVERLOAD_LOOP = GameSound.OVERLOAD_LOOP;
            local v30 = {
                volumeMultiplier = 0.2
            };
            local v31;

            if u27 then
                v31 = nil;
            else
                v31 = u25.character.PrimaryPart;
            end;

            v30.parent = v31;
            local u32 = SoundManager:playSound(OVERLOAD_LOOP, v30);
            task.delay(v26 - 2, function() -- Line: 138
                -- upvalues: u32 (copy), SoundManager (ref)
                if u32 then
                    SoundManager:tweenSoundVolume(u32, 0, 2);
                end;
            end);
        end;

        local u33 = {};

        for _, descendant in u25.character:GetDescendants() do
            if descendant:IsA("BasePart") and (descendant.Material == Enum.Material.Neon and descendant.Color == BatteryUtil.BATTERY_BLUE) then
                table.insert(u33, descendant);
            end;
        end;

        task.spawn(function() -- Line: 154
            -- upvalues: SoundManager (ref), GameSound (ref), u25 (copy), u27 (copy), u10 (ref), u33 (copy), u28 (copy), u29 (ref)
            while true do
                local OVERLOAD_BEEP = GameSound.OVERLOAD_BEEP;
                local v34 = {
                    volumeMultiplier = 0.2
                };
                local v35;

                if u25.character.PrimaryPart and not u27 then
                    v35 = u25.character:GetPrimaryPartCFrame().Position;
                else
                    v35 = nil;
                end;

                v34.position = v35;
                SoundManager:playSound(OVERLOAD_BEEP, v34);
                u10:flashParts(u33, u28);
                local v36 = task.wait(1.8);

                if v36 ~= 0 and (v36 == v36 and v36) then
                    v36 = u29;
                end;

                if v36 == 0 or (v36 ~= v36 or not v36) then
                    return;
                end;
            end;
        end);
        task.delay(v26, function() -- Line: 169
            -- upvalues: u28 (copy), u33 (copy), BatteryUtil (ref)
            u28:DoCleaning();

            for _, v in u33 do
                if v.Parent then
                    v.Color = BatteryUtil.BATTERY_BLUE;
                end;
            end;
        end);
    end)));
    p11:GiveTask(WatchCharacter(function(p37, u38, p39) -- Line: 179
        -- upvalues: isUsingKit (ref), BedwarsKit (ref), ReplicatedStorage (ref), WeldUtil (ref)
        if not isUsingKit(p37, BedwarsKit.BATTERY) then
            return nil;
        end;

        local u40 = ReplicatedStorage.Assets.Misc.Battery.battery_pack:Clone();
        u40.Parent = u38;
        WeldUtil:weldCharacterAccessories(u38);
        p39:GiveTask(u38:GetAttributeChangedSignal("ActiveBatteries"):Connect(function() -- Line: 186
            -- upvalues: u38 (copy), u40 (copy)
            local v41 = u38:GetAttribute("ActiveBatteries");
            local v42 = v41 == nil and 0 or v41;
            local v43 = false;
            local v44 = 0;

            while true do
                if v43 then
                    v44 = v44 + 1;
                else
                    v43 = true;
                end;

                if v44 >= 3 then
                    return;
                end;

                local u45 = v44 < v42;

                local function _(p46) -- Line: 206
                    -- upvalues: u40 (ref), u45 (copy)
                    u40:FindFirstChild("Handle"):FindFirstChild(p46).Transparency = u45 and 0 or 1;
                end;

                for i, v in { "Battery" .. tostring(v44 + 1), "Neon" .. tostring(v44 + 1) } do
                    local _ = i - 1;
                    u40:FindFirstChild("Handle"):FindFirstChild(v).Transparency = u45 and 0 or 1;
                end;
            end;
        end));
    end));
end;

function u4.onKitReplicationDeactivated(p47) -- Line: 217
end;

function u4.onInnateAbilityEnabled(p48, p49, p50) -- Line: 219
end;

function u4.onAbilityUsed(p51, p52, p53) -- Line: 221
end;

function u4.flashParts(p54, p55, p56) -- Line: 223
    -- upvalues: TweenService (copy), BatteryUtil (copy)
    for _, v in p55 do
        if v.Parent then
            v.Color = Color3.fromRGB(255, 255, 255);
            local u57 = TweenService:Create(v, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Color = BatteryUtil.BATTERY_RED
            });
            u57:Play();
            p56:GiveTask(function() -- Line: 233
                -- upvalues: u57 (copy)
                u57:Cancel();
            end);
        end;
    end;
end;

function u4.registerBattery(u58, p59, p60) -- Line: 238
    for _, descendant in p59:GetDescendants() do
        if descendant:IsA("BasePart") then
            u58.batteryIds[descendant] = p60;
            local u61 = nil;
            u61 = descendant.AncestryChanged:Connect(function() -- Line: 245
                -- upvalues: descendant (copy), u58 (copy), u61 (ref)
                if descendant.Parent then
                    return nil;
                end;

                u58.batteryIds[descendant] = nil;
                u61:Disconnect();
            end);
        end;
    end;
end;

function u4.getBatteryIdFromPart(p62, p63) -- Line: 255
    return p62.batteryIds[p63];
end;

function u4.getBatteryInfo(p64, p65) -- Line: 260
    return p64.liveBatteries[p65];
end;

KnitClient.CreateController(u4.new());

return nil;