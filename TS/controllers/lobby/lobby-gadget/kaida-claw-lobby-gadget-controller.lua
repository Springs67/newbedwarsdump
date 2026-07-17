-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local MobileTouchType = v1.MobileTouchType;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchPlayer = v1.WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "KaidaClawLobbyGadgetController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 36
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 40
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "KaidaClawLobbyGadgetController";
    p6.maid = u2.new();
    p6.lastAttackTime = 0;
    p6.enableTime = 0;
    p6.playerCastingDataMap = {};
    p6.clawColors = {
        Color3.fromRGB(75, 75, 75),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(43, 229, 229),
        Color3.fromRGB(49, 229, 94)
    };
end;

function u4.KnitStart(u7) -- Line: 49
    -- upvalues: KnitController (copy), PlaceUtil (copy), WatchPlayer (copy), Players (copy), LobbyGadgetType (copy), default (copy)
    KnitController.KnitStart(u7);

    if not PlaceUtil.isLobbyServer() then
        return nil;
    end;

    WatchPlayer(function(u8, p9) -- Line: 54
        -- upvalues: Players (ref), LobbyGadgetType (ref), u7 (copy)
        if u8 ~= Players.LocalPlayer then
            return nil;
        end;

        if u8:GetAttribute("LobbyGadgetType") == LobbyGadgetType.KAIDA_CLAW then
            u7:equip();
        else
            u7:unequip();
        end;

        p9:GiveTask(u8:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 66
            -- upvalues: u8 (copy), LobbyGadgetType (ref), u7 (ref)
            if u8:GetAttribute("LobbyGadgetType") == LobbyGadgetType.KAIDA_CLAW then
                u7:equip();

                return;
            end;

            u7:unequip();
        end));
    end);
    default.Client:Get("SummonerClawAttackFromServer"):Connect(function(p10, p11, p12) -- Line: 75
        -- upvalues: Players (ref), u7 (copy)
        if p10 ~= Players.LocalPlayer then
            u7:clawAttack(p10, p11, p12);
        end;
    end);
end;

function u4.equip(u13) -- Line: 81
    -- upvalues: Workspace (copy), Flamework (copy), MobileTouchType (copy), ClientSyncEvents (copy)
    u13.enableTime = Workspace:GetServerTimeNow();
    local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Summoner Claw Attack",

        boundFunction = function(p14, p15, p16) -- Line: 87, Name: boundFunction
            -- upvalues: u13 (copy)
            if p15 == Enum.UserInputState.Begin then
                u13:attack();
            end;
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 94, Name: mobileBoundFunction
                -- upvalues: u13 (copy)
                u13:attack();
            end
        }
    });
    u13.maid:GiveTask(v17);
    u13.maid:GiveTask(ClientSyncEvents.MobileSwordButtonPressed:connect(function(p18) -- Line: 101
        -- upvalues: u13 (copy)
        u13:attack();
    end));
end;

function u4.unequip(p19) -- Line: 105
    p19.maid:DoCleaning();
end;

function u4.attack(u20) -- Line: 108
    -- upvalues: Workspace (copy), PlaceUtil (copy), Players (copy), LobbyGadgetType (copy), default (copy)
    if Workspace:GetServerTimeNow() - u20.enableTime < 0.1 then
        return nil;
    end;

    if not PlaceUtil.isLobbyServer() then
        return nil;
    end;

    if Players.LocalPlayer:GetAttribute("LobbyGadgetType") ~= LobbyGadgetType.KAIDA_CLAW then
        return nil;
    end;

    if Workspace:GetServerTimeNow() - u20.lastAttackTime < 1 then
        return nil;
    end;

    u20.lastAttackTime = Workspace:GetServerTimeNow();
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
    local Position = Players.LocalPlayer.Character.PrimaryPart.Position;
    task.spawn(function() -- Line: 127
        -- upvalues: u20 (copy), Players (ref), Position (copy), LookVector (copy)
        u20:clawAttack(Players.LocalPlayer, Position, LookVector);
    end);
    default.Client:Get("SummonerClawAttackRequest"):SendToServer({
        position = Position,
        direction = LookVector,
        clientTime = Workspace:GetServerTimeNow()
    });
end;

function u4.clawAttack(p21, p22, p23, p24) -- Line: 136
    -- upvalues: u2 (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), RandomUtil (copy), GameSound (copy), SoundManager (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local Character = p22.Character;

    if not Character then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local u25 = u2.new();
    local v26 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];
    local Summoner_DragonClaw = ReplicatedStorage.Assets.Misc.Kaida.Summoner_DragonClaw;
    local kaida = v26.kaida;

    if kaida ~= nil then
        kaida = kaida.dragon_claw;
    end;

    if kaida then
        Summoner_DragonClaw = v26.kaida.dragon_claw;
    end;

    local u27 = Summoner_DragonClaw:Clone();
    u27.Parent = Workspace;

    local function _(p28) -- Line: 162
        return p28:IsA("MeshPart");
    end;

    local v29 = 0;
    local u30 = {};

    for i, child in u27:GetChildren() do
        local _ = i - 1;

        if child:IsA("MeshPart") == true then
            v29 = v29 + 1;
            u30[v29] = child;
        end;
    end;

    local v31 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;

    if p22 == Players.LocalPlayer and v31 then
        local function _(p32) -- Line: 180
            p32.Transparency = 0.6;
        end;

        for i, v in u30 do
            local _ = i - 1;
            v.Transparency = 0.6;
        end;
    end;

    local v33 = Color3.fromRGB(49, 229, 94);
    u27.dragon_claw_nail_mesh.Color = v33;
    SoundManager:playSound(RandomUtil.fromList(GameSound.SUMMONER_CLAW_ATTACK_1, GameSound.SUMMONER_CLAW_ATTACK_2, GameSound.SUMMONER_CLAW_ATTACK_3, GameSound.SUMMONER_CLAW_ATTACK_4), {
        position = PrimaryPart.Position
    });

    if p22 == Players.LocalPlayer then
        AnimationUtil:playAnimation(p22, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_CHARACTER_SWIPE), {
            looped = false
        });
    end;

    local Unit = Vector3.new(p24.X, 0, p24.Z).Unit;
    local v34 = Unit:Cross(Vector3.new(0, 1, 0)).Unit * -1;
    local v35 = PrimaryPart.Position + v34 * 5 + Unit * 6;
    u27:PivotTo((CFrame.new(v35, v35 + (v35 + p24 * 13 - v35).Unit)));
    u27.PrimaryPart.Anchored = true;
    local u37 = RunService.Heartbeat:Connect(function() -- Line: 224
        -- upvalues: u27 (ref)
        local TransformedWorldCFrame = u27.RootPart.root.fore_arm.TransformedWorldCFrame;
        local Portal1 = u27.Portal1;

        if Portal1 ~= nil then
            Portal1:PivotTo(TransformedWorldCFrame);
        end;

        local v36 = TransformedWorldCFrame * CFrame.Angles(3.141592653589793, 0, 0);
        local Portal2 = u27.Portal2;

        if Portal2 ~= nil then
            Portal2:PivotTo(v36);
        end;
    end);
    AnimationUtil:playAnimation(u27.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_CLAW_ATTACK), {
        looped = false,
        speed = 1
    });
    task.wait(0.5);
    local u38 = 0;
    local u39 = v31 and 0.6 or 0;
    local u43 = RunService.Heartbeat:Connect(function(p40) -- Line: 250
        -- upvalues: u38 (ref), u39 (copy), u30 (copy)
        u38 = u38 + p40;
        local u41 = math.clamp(u38 / 0.25, u39, 1);

        local function _(p42) -- Line: 253
            -- upvalues: u41 (copy)
            p42.Transparency = u41;
        end;

        for i, v in u30 do
            local _ = i - 1;
            v.Transparency = u41;
        end;
    end);
    task.delay(0.25, function() -- Line: 260
        -- upvalues: u25 (copy), u43 (copy), u37 (copy), u27 (ref)
        u25:DoCleaning();
        u43:Disconnect();
        u37:Disconnect();
        u27:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;