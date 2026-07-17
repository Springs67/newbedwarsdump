-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local GameQueryUtil = v1.GameQueryUtil;
local MobileButton = v1.MobileButton;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Debris = v5.Debris;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GlitchItemBalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "glitch-item-balance").GlitchItemBalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "GlitchGuitarController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "GlitchGuitarController";
    p8.maid = u2.new();
    p8.playingMaid = u2.new();
    p8.lastClickTime = -1;
    p8.playing = false;
    p8.lastUseTime = -1;
end;

function u6.KnitStart(p9) -- Line: 58
    -- upvalues: HandKnitController (copy), default (copy), ItemType (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), SoundManager (copy), u3 (copy), Workspace (copy), GameQueryUtil (copy), ReplicatedStorage (copy), u2 (copy), RuntimeLib (copy), RunService (copy), TweenService (copy), Debris (copy), CollectionTagAdded (copy), KnitClient (copy), BedwarsKitSkin (copy), PlaceUtil (copy), CollectionService (copy)
    HandKnitController.KnitStart(p9);
    default.Client:WaitFor("GuitarDamage"):andThen(function(p10) -- Line: 61
        -- upvalues: ItemType (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), SoundManager (ref), u3 (ref), Workspace (ref), GameQueryUtil (ref), ReplicatedStorage (ref), u2 (ref), RuntimeLib (ref), RunService (ref), TweenService (ref), Debris (ref)
        p10:Connect(function(p11) -- Line: 62
            -- upvalues: ItemType (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), SoundManager (ref), u3 (ref), Workspace (ref), GameQueryUtil (ref), ReplicatedStorage (ref), u2 (ref), RuntimeLib (ref), RunService (ref), TweenService (ref), Debris (ref)
            local PrimaryPart = p11.targetEntity.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("RootRigAttachment");
            end;

            local u12 = p11.sourceEntity:FindFirstChild(ItemType.GLITCH_GUITAR);

            if u12 ~= nil then
                u12 = u12:FindFirstChild("Handle");

                if u12 ~= nil then
                    u12 = u12:FindFirstChild("HealBeamAttachment");
                end;
            end;

            if PrimaryPart and u12 then
                local v13 = p11.sourceEntity == Players.LocalPlayer.Character;

                if v13 then
                    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GUITAR_HEAL);
                end;

                local GUITAR_HEAL_1_ROCKSTAR = GameSound.GUITAR_HEAL_1_ROCKSTAR;

                if GUITAR_HEAL_1_ROCKSTAR ~= "" and GUITAR_HEAL_1_ROCKSTAR then
                    local v14 = {};
                    local v15;

                    if v13 then
                        v15 = nil;
                    else
                        v15 = p11.sourceEntity:GetPrimaryPartCFrame().Position;
                    end;

                    v14.position = v15;
                    v14.volumeMultiplier = v13 and 1 or 1.4;
                    SoundManager:playSound(GUITAR_HEAL_1_ROCKSTAR, v14);
                end;

                local u16 = u3("Part", {
                    Size = Vector3.new(1, 1, 1),
                    Transparency = 1,
                    Anchored = true,
                    CanCollide = false,
                    CFrame = p11.sourceEntity:GetPrimaryPartCFrame(),
                    Parent = Workspace.CurrentCamera
                });
                GameQueryUtil:setQueryIgnored(u16, true);
                local u17 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarDamage"):Clone();
                u17.Parent = u16;
                local u18 = u2.new();
                u18:GiveTask(function() -- Line: 103
                    -- upvalues: u17 (copy), RuntimeLib (ref), u16 (copy)
                    u17.Enabled = false;
                    RuntimeLib.Promise.delay(3):andThen(function() -- Line: 106
                        -- upvalues: u16 (ref)
                        u16:Destroy();
                    end);
                end);
                local u19 = tick();
                u18:GiveTask(RunService.Heartbeat:Connect(function(p20) -- Line: 113
                    -- upvalues: u19 (copy), u12 (copy), PrimaryPart (copy), u16 (copy), u18 (copy)
                    local v21 = (tick() - u19) / 0.8;
                    local v22 = math.min(1, v21);
                    u16.CFrame = u12.WorldCFrame:Lerp(PrimaryPart.WorldCFrame, v22);

                    if v22 == 1 then
                        u18:DoCleaning();
                    end;
                end));
                local u23 = u3("Beam", {
                    TextureSpeed = 10,
                    Width0 = 0,
                    Width1 = 0,
                    FaceCamera = true,
                    Attachment0 = u12,
                    Attachment1 = PrimaryPart,
                    Color = u17.Color,
                    Parent = Workspace.CurrentCamera
                });
                TweenService:Create(u23, TweenInfo.new(0.2), {
                    Width0 = 0.35,
                    Width1 = 0.35
                }):Play();
                RuntimeLib.Promise.defer(function() -- Line: 136
                    -- upvalues: TweenService (ref), u23 (copy), Debris (ref)
                    task.wait(0.2);
                    TweenService:Create(u23, TweenInfo.new(0.4), {
                        Width0 = 0,
                        Width1 = 0
                    }):Play();
                    Debris:AddItem(u23, 1);
                end);
            end;
        end);
    end);
    CollectionTagAdded("GlitchGuitarPlaying", function(u24) -- Line: 148
        -- upvalues: u2 (ref), Players (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkin (ref), PlaceUtil (ref), SoundManager (ref), TweenService (ref), RuntimeLib (ref), CollectionService (ref)
        local u25 = u2.new();
        local v26 = u24 == Players.LocalPlayer.Character;
        local GUITAR_LOOP_ROCKSTAR = GameSound.GUITAR_LOOP_ROCKSTAR;

        if KnitClient.Controllers.KitSkinController:getKitSkin(u24) == BedwarsKitSkin.MELODY_ROCKSTAR then
            GUITAR_LOOP_ROCKSTAR = GameSound.GUITAR_LOOP_ROCKSTAR;
        end;

        if PlaceUtil.isLobbyServer() and (Players.LocalPlayer:GetAttribute("GlitchGuitarPlayingNearSpawn") and not v26) then
            return nil;
        end;

        local v27 = {};
        local v28;

        if v26 then
            v28 = nil;
        else
            v28 = u24:GetPrimaryPartCFrame().Position;
        end;

        v27.position = v28;
        local v29;

        if v26 then
            v29 = nil;
        else
            v29 = u24.PrimaryPart;
        end;

        v27.parent = v29;
        v27.volumeMultiplier = v26 and 1 or 1.4;
        local u30 = SoundManager:playModifiableSound(GUITAR_LOOP_ROCKSTAR, v27);

        if u30 then
            u30.TimePosition = tick() % u30.TimeLength;
            u30.Looped = true;
            u25:GiveTask(function() -- Line: 172
                -- upvalues: TweenService (ref), u30 (copy), RuntimeLib (ref)
                TweenService:Create(u30, TweenInfo.new(0.4), {
                    Volume = 0
                }):Play();
                RuntimeLib.Promise.delay(0.4):andThen(function() -- Line: 177
                    -- upvalues: u30 (ref)
                    u30:Stop();
                end);
            end);
        end;

        u25:GiveTask(CollectionService:GetInstanceRemovedSignal("GlitchGuitarPlaying"):Connect(function(p31) -- Line: 183
            -- upvalues: u24 (copy), u25 (copy)
            if p31 == u24 then
                u25:DoCleaning();
            end;
        end));
    end);
end;

function u6.isRelevantItem(p32, p33) -- Line: 190
    -- upvalues: ItemType (copy)
    return p33.itemType == ItemType.GLITCH_GUITAR;
end;

function u6.onEnable(u34, p35) -- Line: 193
    -- upvalues: RuntimeLib (copy), u6 (copy), Flamework (copy), UserInputService (copy), u4 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), Players (copy)
    local function u38() -- Line: 194
        -- upvalues: u34 (copy), RuntimeLib (ref), u6 (ref)
        if not u34.playing then
            u34:startPlaying();
        end;

        local u36 = tick();
        u34.lastClickTime = u36;
        local u37 = RuntimeLib.Promise.delay(u6.CLICK_PLAY_TIME):andThen(function() -- Line: 201
            -- upvalues: u34 (ref), u36 (copy)
            if u34.lastClickTime == u36 then
                u34:stopPlaying();
            end;
        end);
        u34.playingMaid:GiveTask(function() -- Line: 207
            -- upvalues: u37 (copy)
            u37:cancel();
        end);

        if tick() - u34.lastUseTime > u6.COOLDOWN then
            u34:useAbility();
        end;
    end;

    local v42 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "glitch-guitar-click",

        boundFunction = function(p39, p40, p41) -- Line: 218, Name: boundFunction
            -- upvalues: u38 (copy)
            u38();
        end
    });
    u34.maid:GiveTask(v42);

    if UserInputService.TouchEnabled then
        u34:setupYield(function() -- Line: 224
            -- upvalues: u4 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u38 (copy), Players (ref)
            local u43 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = BedwarsImageId.GUITAR_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 231, Name: OnClick
                        -- upvalues: u38 (ref)
                        u38();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 236
                -- upvalues: u4 (ref), u43 (copy)
                u4.unmount(u43);
            end;
        end);
    end;
end;

function u6.onDisable(p44) -- Line: 242
    p44:stopPlaying();
    p44.maid:DoCleaning();
end;

function u6.startPlaying(p45) -- Line: 246
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    p45.playing = true;
    local u46 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GUITAR_PLAY, {
        looped = true
    });

    if u46 then
        p45.playingMaid:GiveTask(function() -- Line: 252
            -- upvalues: u46 (copy)
            u46:Stop();
        end);
    end;
end;

function u6.stopPlaying(p47) -- Line: 257
    -- upvalues: default (copy)
    p47.playing = false;
    p47.playingMaid:DoCleaning();
    task.spawn(function() -- Line: 260
        -- upvalues: default (ref)
        default.Client:Get("StopPlayingGlitchGuitar"):SendToServer();
    end);
end;

function u6.useAbility(p48) -- Line: 264
    -- upvalues: Players (copy), EntityUtil (copy), GlitchItemBalanceFile (copy), default (copy)
    p48.lastUseTime = tick();

    if Players.LocalPlayer.Character then
        local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
        local u49 = EntityUtil:getEntity(Players.LocalPlayer);

        local function _(p50) -- Line: 270
            -- upvalues: Players (ref)
            return p50 ~= Players.LocalPlayer.Character;
        end;

        local v51 = 0;
        local v52 = {};

        for i, v in EntityUtil:getAliveEntityInstances() do
            local _ = i - 1;

            if v ~= Players.LocalPlayer.Character == true then
                v51 = v51 + 1;
                v52[v51] = v;
            end;
        end;

        local function _(p53) -- Line: 283
            -- upvalues: EntityUtil (ref)
            return EntityUtil:getEntity(p53);
        end;

        local v54 = 0;
        local v55 = {};

        for i, v in v52 do
            local _ = i - 1;
            local v56 = EntityUtil:getEntity(v);

            if v56 ~= nil then
                v54 = v54 + 1;
                v55[v54] = v56;
            end;
        end;

        local function _(p57) -- Line: 297
            -- upvalues: Position (copy), GlitchItemBalanceFile (ref)
            local v58 = p57:getInstance().PrimaryPart and (p57:getInstance():GetPrimaryPartCFrame().Position - Position).Magnitude <= GlitchItemBalanceFile.GUITAR_RANGE;

            return v58;
        end;

        local v59 = 0;
        local v60 = {};

        for i, v in v55 do
            local _ = i - 1;
            local v61 = v:getInstance().PrimaryPart and (v:getInstance():GetPrimaryPartCFrame().Position - Position).Magnitude <= GlitchItemBalanceFile.GUITAR_RANGE;

            if v61 == true then
                v59 = v59 + 1;
                v60[v59] = v;
            end;
        end;

        local function _(p62) -- Line: 310
            -- upvalues: u49 (copy)
            local v63 = u49;

            if v63 ~= nil then
                v63 = v63:canAttack(p62);
            end;

            return v63;
        end;

        local v64 = 0;
        local v65 = {};

        for i, v in v60 do
            local _ = i - 1;
            local v66;

            if u49 == nil then
                v66 = u49;
            else
                v66 = u49:canAttack(v);
            end;

            if v66 == true then
                v64 = v64 + 1;
                v65[v64] = v;
            end;
        end;

        local function _(p67) -- Line: 327
            return p67:isAlive();
        end;

        local v68 = 0;
        local v69 = {};

        for i, v in v65 do
            local _ = i - 1;

            if v:isAlive() == true then
                v68 = v68 + 1;
                v69[v68] = v;
            end;
        end;

        table.sort(v69, function(p70, p71) -- Line: 340
            return p70:getHealth() > p71:getHealth();
        end);
        local v72 = false;
        local v73 = 0;
        local v74 = {};

        while true do
            if true then
                if v72 then
                    v73 = v73 + 1;
                else
                    v72 = true;
                end;
            end;

            if v73 >= 3 or v73 >= #v69 then
                break;
            end;

            local v75 = v69[v73 + 1]:getInstance();
            table.insert(v74, v75);
        end;

        default.Client:Get("PlayGlitchGuitar"):SendToServer({
            targets = v74
        });
    end;
end;

u6.CLICK_PLAY_TIME = 3;
u6.COOLDOWN = 2;
KnitClient.CreateController(u6.new());

return nil;