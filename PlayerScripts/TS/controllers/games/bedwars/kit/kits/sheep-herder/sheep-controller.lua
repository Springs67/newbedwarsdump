-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SheepState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-state").SheepState;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "SheepController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u3 (copy), Workspace (copy)
    BaseKitController.constructor(p7, BedwarsKit.SHEEP_HERDER);
    p7.Name = "SheepController";
    p7.sheepModelFolder = u3("Folder", {
        Name = "SheepModel",
        Parent = Workspace
    });
    p7.untamedSheep = {};
    p7.highlightedSheep = {};
end;

function u5.KnitStart(p8) -- Line: 49
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p8);
end;

function u5.onKitLocalActivated(p9, p10) -- Line: 52
end;

function u5.onKitLocalDeactivated(p11) -- Line: 54
end;

function u5.onKitReplicationActivated(u12, p13) -- Line: 56
    -- upvalues: WatchCollectionTag (copy)
    WatchCollectionTag("SheepData", function(p14) -- Line: 57
        -- upvalues: u12 (copy)
        u12:createSheepModel(p14);
    end);
end;

function u5.onKitReplicationDeactivated(p15) -- Line: 61
end;

function u5.onInnateAbilityEnabled(p16, p17, p18) -- Line: 63
end;

function u5.onAbilityUsed(p19, p20, p21) -- Line: 65
end;

function u5.createSheepModel(u22, u23) -- Line: 67
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), TweenService (copy), u3 (copy), CollectionService (copy), u2 (copy), SheepState (copy), Players (copy)
    u23:WaitForChild("SheepModel");
    u23:WaitForChild("Owner");

    if u23.Parent == nil then
        return nil;
    end;

    local u24 = ReplicatedStorage.Assets.Misc.Sheep.Sheep1:Clone();
    u24.PrimaryPart.Anchored = true;

    for _, descendant in u24:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            GameQueryUtil:setQueryIgnored(descendant, true);

            if descendant.Transparency == 0 then
                TweenService:Create(descendant, TweenInfo.new(0.3), {
                    Transparency = 0
                });
            end;
        end;
    end;

    u23.SheepModel.Value = u24;
    u3("ObjectValue", {
        Name = "SheepData",
        Value = u23,
        Parent = u24
    });
    u24.Parent = u22.sheepModelFolder;
    CollectionService:AddTag(u24, "SheepModel");
    local u25 = u2.new();
    u23.AncestryChanged:Connect(function(p26, p27) -- Line: 97
        -- upvalues: u25 (copy)
        if p27 == nil then
            u25:DoCleaning();
        end;
    end);
    u25:GiveTask(function() -- Line: 102
        -- upvalues: u24 (ref)
        u24:Destroy();
    end);
    local u28 = u2.new();
    local u29 = u23:GetAttribute("SheepState");

    local function _(p30) -- Line: 107
        -- upvalues: u28 (ref), SheepState (ref), u22 (copy), u23 (copy), u24 (ref), u29 (copy)
        u28:DoCleaning();

        if p30 == SheepState.IDLE then
            u28 = u22:idleSheep(u23, u24);

            return;
        end;

        if p30 == SheepState.TAMED then
            u28 = u22:tameSheep(u23, u24, u29 ~= SheepState.TAMED);
        end;
    end;

    u23:GetAttributeChangedSignal("SheepState"):Connect(function(p31) -- Line: 115
        -- upvalues: u23 (copy), u28 (ref), SheepState (ref), u22 (copy), u24 (ref), u29 (copy)
        local v32 = u23:GetAttribute("SheepState");
        u28:DoCleaning();

        if v32 == SheepState.IDLE then
            u28 = u22:idleSheep(u23, u24);

            return;
        end;

        if v32 == SheepState.TAMED then
            u28 = u22:tameSheep(u23, u24, u29 ~= SheepState.TAMED);
        end;
    end);
    local v33 = u23:GetAttribute("SheepState");
    u28:DoCleaning();

    if v33 == SheepState.IDLE then
        u28 = u22:idleSheep(u23, u24);
    elseif v33 == SheepState.TAMED then
        u28 = u22:tameSheep(u23, u24, u29 ~= SheepState.TAMED);
    end;

    if u23:GetAttribute("SheepOwnerUserId") == Players.LocalPlayer.UserId then
        u22.untamedSheep[u23] = true;
        u22:highlightRandomUntamedSheeps();
    end;

    return u24;
end;

function u5.highlightRandomUntamedSheeps(u34) -- Line: 127
    -- upvalues: u5 (ref), RandomUtil (copy), SheepState (copy), u3 (copy)
    if u34.thread then
        task.cancel(u34.thread);
        u34.thread = nil;
    end;

    u34.thread = task.delay(20, function() -- Line: 132
        -- upvalues: u34 (copy), u5 (ref), RandomUtil (ref), SheepState (ref), u3 (ref)
        local v35 = 0;

        while true do
            local v36 = 0;

            for _ in u34.highlightedSheep do
                v36 = v36 + 1;
            end;

            local v37 = v36 < u5.MAX_HIGHLIGHTED_SHEEP;

            if v37 then
                local v38 = 0;

                for _ in u34.untamedSheep do
                    v38 = v38 + 1;
                end;

                v37 = v38 > 0;

                if v37 then
                    if v35 < 2 then
                        v37 = true;
                    else
                        v37 = false;
                    end;
                end;
            end;

            if not v37 then
                u34.thread = nil;

                return;
            end;

            v35 = v35 + 1;
            local v39 = 0;
            local v40 = {};

            for i in u34.untamedSheep do
                v39 = v39 + 1;
                v40[v39] = i;
            end;

            local u41 = RandomUtil.fromList(unpack(v40));
            u34.untamedSheep[u41] = nil;
            local Value = u41.SheepModel.Value;

            if Value and u41:GetAttribute("SheepState") ~= SheepState.TAMED then
                u34.highlightedSheep[u41] = true;
                local u42 = u3("Highlight", {
                    Name = "SheepHighlight",
                    FillTransparency = 1,
                    OutlineTransparency = 0,
                    Parent = Value,
                    OutlineColor = Color3.fromRGB(255, 255, 255),
                    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                });

                local function _() -- Line: 181
                    -- upvalues: u34 (ref), u41 (copy), u42 (copy)
                    u34.highlightedSheep[u41] = nil;
                    u42:Destroy();
                    u34:highlightRandomUntamedSheeps();
                end;

                u41:GetAttributeChangedSignal("SheepState"):Connect(function() -- Line: 186
                    -- upvalues: u41 (copy), SheepState (ref), u34 (ref), u42 (copy)
                    if u41:GetAttribute("SheepState") == SheepState.TAMED then
                        u34.highlightedSheep[u41] = nil;
                        u42:Destroy();
                        u34:highlightRandomUntamedSheeps();
                    end;
                end);
                u41.AncestryChanged:Connect(function(p43, p44) -- Line: 192
                    -- upvalues: u34 (ref), u41 (copy), u42 (copy)
                    if p44 == nil then
                        u34.highlightedSheep[u41] = nil;
                        u42:Destroy();
                        u34:highlightRandomUntamedSheeps();
                    end;
                end);
            end;
        end;
    end);
end;

function u5.idleSheep(p45, p46, u47) -- Line: 202
    -- upvalues: u2 (copy), Players (copy), KnitClient (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u48 = true;
    local u49 = u2.new();
    u49:GiveTask(function() -- Line: 205
        -- upvalues: u48 (ref)
        u48 = false;
    end);
    p46.AncestryChanged:Connect(function(p50, p51) -- Line: 208
        -- upvalues: u49 (copy)
        if p51 == nil then
            u49:DoCleaning();
        end;
    end);
    u47:PivotTo(CFrame.new(p46:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p46:GetAttribute("RandomFloat") * 3.141592653589793 * 2, 0));

    if Players.LocalPlayer.UserId ~= p46:GetAttribute("SheepOwnerUserId") then
        for _, descendant in u47:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Transparency = 1;
            end;
        end;
    end;

    task.spawn(function() -- Line: 224
        -- upvalues: u48 (ref), Players (ref), u47 (copy), KnitClient (ref)
        local v52 = 0;

        while true do
            local v53 = task.wait(0.2);

            if v53 ~= 0 and (v53 == v53 and v53) then
                v53 = u48;
            end;

            if v53 == 0 or (v53 ~= v53 or not v53) then
                return;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if Character and (u47.PrimaryPart and ((Character.Position - u47.PrimaryPart.Position).Magnitude <= 10 and tick() >= v52 + 2)) then
                v52 = tick();
                task.spawn(function() -- Line: 252
                    -- upvalues: KnitClient (ref), u47 (ref)
                    KnitClient.Controllers.SheepHerderKitController:tameSheep(u47);
                end);
            end;
        end;
    end);
    local v54 = GameAnimationUtil:getAnimation(AnimationType.SHEEP_IDLE);
    local u55 = u47.AnimationController.Animator:LoadAnimation(v54);
    u55:Play();
    u49:GiveTask(function() -- Line: 261
        -- upvalues: u55 (copy)
        u55:Stop();
        u55:Destroy();
    end);

    return u49;
end;

function u5.tameSheep(p56, u57, u58, p59) -- Line: 267
    -- upvalues: Players (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), u2 (copy), WatchCharacter (copy), RunService (copy), GameQueryUtil (copy)
    local u60 = tick();
    local Position = u58.PrimaryPart.Position;
    local v61 = u57:GetAttribute("SheepOwnerUserId") == Players.LocalPlayer.UserId;

    if p59 then
        local v62 = RandomUtil.fromList(GameSound.SHEEP_TAME_1, GameSound.SHEEP_TAME_2, GameSound.SHEEP_TAME_3);
        local v63 = {};
        local v64;

        if v61 then
            v64 = nil;
        else
            v64 = Position;
        end;

        v63.position = v64;
        local v65;

        if v61 then
            v65 = nil;
        else
            v65 = u58.PrimaryPart;
        end;

        v63.parent = v65;
        SoundManager:playSound(v62, v63);

        if v61 then
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.TAME_SHEEP);
        end;
    end;

    local u66 = true;
    local u67 = u2.new();
    u67:GiveTask(function() -- Line: 282
        -- upvalues: u66 (ref)
        u66 = false;
    end);
    u57.AncestryChanged:Connect(function(p68, p69) -- Line: 285
        -- upvalues: u67 (copy)
        if p69 == nil then
            u67:DoCleaning();
        end;
    end);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local u70 = Character;
    u67:GiveTask(WatchCharacter(function(p71, p72, p73) -- Line: 295
        -- upvalues: Players (ref), u70 (ref)
        if p71 ~= Players.LocalPlayer then
            return nil;
        end;

        if not p72.PrimaryPart then
            p72:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        u70 = p72.PrimaryPart;
    end));
    local u74 = u57:GetAttribute("SheepIndex");
    u67:GiveTask(u57:GetAttributeChangedSignal("SheepIndex"):Connect(function() -- Line: 305
        -- upvalues: u74 (ref), u57 (copy)
        u74 = u57:GetAttribute("SheepIndex");
    end));
    local u75 = u57:GetAttribute("RandomFloat");
    local Y = Position.Y;
    local u76 = 0;
    u67:GiveTask(RunService.Heartbeat:Connect(function(p77) -- Line: 311
        -- upvalues: u76 (ref), u70 (ref), u74 (ref), GameQueryUtil (ref), Y (ref), u75 (copy), u60 (copy), Position (copy), u58 (copy)
        u76 = u76 + p77;

        if u70 == nil then
            return nil;
        end;

        local v78 = u74 % 2 == 0;

        if u74 == 0 then
            v78 = false;
        end;

        local v79 = Vector3.new(0, -0.5, 3);

        if u74 > 0 then
            local v80 = math.floor((u74 + 1) / 2) * 2.1;
            local v81 = v79 + Vector3.new(v80 * (v78 and 1 or -1), 0, 0);
            local v82 = math.floor((u74 + 1) / 2) * 2.7;
            v79 = v81 + Vector3.new(0, 0, v82);
        end;

        local v83 = u70.CFrame * v79;
        local v84 = RaycastParams.new();
        v84.CollisionGroup = "Players";
        local v85 = GameQueryUtil:raycast(v83 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v84);
        local Y2 = v83.Y;
        local v86;

        if v85 == nil then
            v86 = v85;
        else
            v86 = v85.Position;
        end;

        if v86 then
            Y2 = v85.Position.Y + 2;
        end;

        local v87 = Y2 - Y;
        local v88 = math.abs(v87) / 3;
        local v89 = math.max(v88, 1);
        local v90 = math.clamp(v87, p77 * -40 * v89, p77 * 40 * v89);
        local v91 = Vector3.new(v83.X, Y + v90, v83.Z);
        Y = v91.Y;
        local v92 = math.sin(u76 * 2 + 6.283185307179586 * u75) * 0.8;
        local v93 = v91 + Vector3.new(0, v92, 0);
        local v94 = CFrame.new(v93, v93 + u70.CFrame.LookVector);

        if tick() - u60 < 1 then
            local v95 = CFrame.new(Position, Position + u70.CFrame.LookVector);
            local Position2 = v94.Position;
            local v96 = v95:Lerp(v94, (tick() - u60) / 1);
            v94 = CFrame.new(v96.Position, Position2);
        end;

        u58:PivotTo(v94);
    end));
    local v97 = GameAnimationUtil:getAnimation(AnimationType.SHEEP_WALK);
    local u98 = u58.AnimationController.Animator:LoadAnimation(v97);
    u98:Play();
    u98:AdjustSpeed(0.5);
    u98.TimePosition = u75 * u98.Length;
    u67:GiveTask(function() -- Line: 377
        -- upvalues: u98 (copy)
        u98:Stop();
        u98:Destroy();
    end);

    return u67;
end;

u5.MAX_HIGHLIGHTED_SHEEP = 2;
KnitClient.CreateController(u5.new());

return nil;