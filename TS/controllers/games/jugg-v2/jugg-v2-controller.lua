-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local JuggHud = RuntimeLib.import(script, script.Parent, "ui", "jugg-hud").JuggHud;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "JuggV2Controller";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 36
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 40
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.JUGGERNAUT_V2 });
    p6.Name = "JuggV2Controller";
    p6.swordMap = {};
end;

function u4.KnitStart(p7) -- Line: 45
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 48
    -- upvalues: KnitClient (copy), GameSound (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), DeviceUtil (copy), Players (copy), EntityUtil (copy), Flamework (copy), ClientStore (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.JUGGERNAUT_GROUND_SMASH,
            GameSound.JUGGERNAUT_EXPLOSION_1,
            GameSound.JUGGERNAUT_LEAP,
            GameSound.JUGGERNAUT_SPIN
        }
    });
    u8:mountJuggHud();
    default.Client:Get("SpawnJuggnautSword"):Connect(function(p9) -- Line: 53
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u8 (copy), KnitClient2 (ref), DeviceUtil (ref), Players (ref), EntityUtil (ref), Flamework (ref)
        local u10 = ReplicatedStorage.Assets.Effects.JuggernautRageBlade:Clone();
        u10.Parent = Workspace;

        local function _(p11) -- Line: 58
            if p11:IsA("Sound") then
                p11:Play();
            end;
        end;

        for i, descendant in u10:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Sound") then
                descendant:Play();
            end;
        end;

        if u10 then
            local PrimaryPart = u10.PrimaryPart;

            if not PrimaryPart then
                return nil;
            end;

            u8.swordMap[p9.secret] = u10;
            u10:SetAttribute("Secret", p9.secret);
            p9.position = p9.position - Vector3.new(0, 1, 0);
            u10:PivotTo(CFrame.new(p9.position));
            local u12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                ActionText = "Collect",
                HoldDuration = 3,
                RequiresLineOfSight = false,
                MaxActivationDistance = 5,
                Parent = PrimaryPart,
                ClickablePrompt = DeviceUtil.isMobileControls()
            });
            u12.Triggered:Connect(function(p13) -- Line: 88
                -- upvalues: Players (ref), EntityUtil (ref), u8 (ref), u10 (copy), u12 (copy), Flamework (ref)
                if p13 == Players.LocalPlayer then
                    local v14 = EntityUtil:getEntity(p13);

                    if v14 ~= nil then
                        v14 = v14:isAlive();
                    end;

                    if not v14 then
                        return nil;
                    end;

                    if u8:useSword(u10) then
                        u12:Destroy();
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            message = "You are now the Juggernaut!"
                        });

                        return;
                    end;

                    u12:Destroy();
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "You are late! Somebody else has took the sword!"
                    });
                end;
            end);
        end;
    end);
    default.Client:Get("UseJuggernautSword"):Connect(function(p15) -- Line: 115
        -- upvalues: u8 (copy)
        local v16 = u8.swordMap[p15.secret];

        if v16 then
            u8:pullSwordAnimation(p15.player, v16);
            u8.swordMap[p15.secret] = nil;
        end;
    end);
    default.Client:Get("NewJuggernaut"):Connect(function(p17) -- Line: 126
        -- upvalues: u8 (copy), Players (ref), ClientStore (ref)
        u8:newJuggernautEffect(p17.player);

        if p17.player == Players.LocalPlayer then
            ClientStore:dispatch({
                type = "InventorySelectHotbarItemGroup",
                itemGroup = "sword"
            });
        end;
    end);
end;

function u4.mountJuggHud(p18) -- Line: 136
    -- upvalues: Flamework (copy), JuggHud (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "JuggHud",
        app = JuggHud
    }, {});
end;

function u4.useSword(p19, p20) -- Line: 142
    -- upvalues: default (copy)
    local v21 = p20:GetAttribute("Secret");

    return default.Client:Get("UseJuggnautSword"):CallServer({
        secret = v21
    });
end;

function u4.pullSwordAnimation(p22, u23, p24) -- Line: 148
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy), InventoryUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), ClientStore (copy)
    local Model = p24:FindFirstChild("Model");
    local u25 = ReplicatedStorage.Assets.Effects.SwordInStone:Clone();
    u25.Parent = u23.Character;

    if Model ~= nil then
        Model:Destroy();
    end;

    WeldUtil:weldCharacterAccessories(u23.Character);
    local hand = InventoryUtil.getInventory(u23).hand;

    if hand ~= nil then
        hand.tool:Destroy();
    end;

    local v26 = AnimationUtil:playAnimation(u23, GameAnimationUtil:getAssetId(AnimationType.JUGGERNAUT_PULL_SWORD));

    if v26 ~= nil then
        v26.Stopped:Connect(function() -- Line: 164
            -- upvalues: u25 (copy), u23 (copy), Players (ref), ClientStore (ref)
            u25:Destroy();

            if u23 == Players.LocalPlayer then
                ClientStore:dispatch({
                    type = "InventorySelectHotbarItemGroup",
                    itemGroup = "sword"
                });
            end;
        end);
    end;

    p24:Destroy();
end;

function u4.newJuggernautEffect(p27, p28) -- Line: 176
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local Character = p28.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u29 = ReplicatedStorage.Assets.Effects.NewJuggernaut:Clone();
    u29.Position = Character;
    u29.Parent = Workspace;

    local function _(p30) -- Line: 192
        if p30:IsA("ParticleEmitter") then
            p30:Emit(30);
        end;
    end;

    for i, descendant in u29:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    SoundManager:playSound(GameSound.JUGGERNAUT_EXPLOSION_1, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.7,
        position = Character
    });
    task.delay(1, function() -- Line: 205
        -- upvalues: u29 (copy)
        u29:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;