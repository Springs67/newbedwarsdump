-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
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
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ConquerorBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u5 = {
    [ItemType.DAMAGE_BANNER] = Color3.fromRGB(255, 113, 78),
    [ItemType.HEAL_BANNER] = Color3.fromRGB(112, 189, 92),
    [ItemType.DEFENSE_BANNER] = Color3.fromRGB(80, 137, 188)
};
local u6 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u7 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u8 = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut);
local BannerPoint = ReplicatedStorage.Assets.Effects.BannerPoint;
local BannerConnection = ReplicatedStorage.Assets.Effects.BannerConnection;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "FlagManController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 58
    -- upvalues: u9 (copy)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 62
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p11);
    p11.Name = "FlagManController";
    p11.flagViewMap = {};
    p11.beamMap = {};
    p11.playerBeamMap = {};
    p11.beamTickRate = 1;
    p11.tickAccumulator = 0;
    p11.audioIsLooping = false;
    p11.audioLoopMaid = u2.new();
end;

function u9.KnitStart(u12) -- Line: 73
    -- upvalues: WatchCollectionTag (copy), CollectionService (copy), Players (copy)
    u12:startBeamTicker();
    WatchCollectionTag("flag-kit", function(p13) -- Line: 75
        -- upvalues: u12 (copy)
        u12:hideFlagForAnimation(p13);

        if not u12:isClientPrediction(p13) then
            local v14 = u12:animateFlag(p13);
            local v15 = u12:createRadius(p13);
            local v16 = u12:createPointLight(p13);
            u12:playFlagDropSound(p13);
            u12:playFlagShockwave(p13);
            local v17 = {
                radius = v15,
                flagClone = v14,
                pointLight = v16
            };

            if not u12:isFriendlyFlag(p13) then
                v17.teamIndicator = u12:createTeamIndicator(p13);
            end;

            u12.flagViewMap[p13] = v17;
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("flag-kit"):Connect(function(u18) -- Line: 97
        -- upvalues: u12 (copy), Players (ref)
        if not u12:isClientPrediction(u18) then
            local v19 = u12.flagViewMap[u18];
            local v20;

            if v19 == nil then
                v20 = v19;
            else
                v20 = v19.radius;
            end;

            if v20 then
                v19.radius:Destroy();
            end;

            local v21;

            if v19 == nil then
                v21 = v19;
            else
                v21 = v19.teamIndicator;
            end;

            if v21 then
                v19.teamIndicator:Destroy();
            end;

            local v22;

            if v19 == nil then
                v22 = v19;
            else
                v22 = v19.flagClone;
            end;

            if v22 then
                v19.flagClone:Destroy();
            end;

            local v23;

            if v19 == nil then
                v23 = v19;
            else
                v23 = v19.pointLight;
            end;

            if v23 then
                v19.pointLight:Destroy();
            end;

            local v24 = Players:GetPlayers();

            local function v29(p25) -- Line: 130
                -- upvalues: u12 (ref), u18 (copy)
                local v26 = u12.playerBeamMap[p25];
                local v27 = v26 and v26[u18];

                if v27 then
                    local function _(p28) -- Line: 137
                        p28.Parent = nil;
                        p28:Destroy();
                    end;

                    for i, v in v27 do
                        local _ = i - 1;
                        v.Parent = nil;
                        v:Destroy();
                    end;

                    if u12:isLocalPlayer(p25) and u12.audioIsLooping then
                        u12.audioLoopMaid:DoCleaning();
                        u12.audioIsLooping = false;
                    end;
                end;
            end;

            for i, v in v24 do
                v29(v, i - 1, v24);
            end;

            u12.flagViewMap[u18] = nil;
        end;
    end);
end;

function u9.createRadius(p30, p31) -- Line: 159
    -- upvalues: u5 (copy), Workspace (copy), BLOCK_SIZE (copy), u3 (copy), TweenService (copy), u6 (copy), ConquerorBalance (copy), u7 (copy)
    local v32 = u5[p31.Name];
    local u33 = u3("Part", {
        Name = "RadiusCircle",
        Size = Vector3.new(0.2, 0, 0),
        Parent = Workspace,
        CFrame = CFrame.new(p31.Position) - Vector3.new(0, BLOCK_SIZE / 2, 0),
        Orientation = Vector3.new(0, 0, 90),
        Shape = Enum.PartType.Cylinder,
        Color = v32,
        Transparency = 0,
        CastShadow = false,
        Material = Enum.Material.ForceField,
        Reflectance = 0,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false
    });
    local v34 = TweenService:Create(u33, u6, {
        Size = Vector3.new(0.2, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS)
    });
    v34:Play();
    local u35 = nil;
    u35 = v34.Completed:Connect(function() -- Line: 187
        -- upvalues: TweenService (ref), u33 (copy), u7 (ref), ConquerorBalance (ref), u35 (ref)
        TweenService:Create(u33, u7, {
            Size = Vector3.new(0.5, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS),
            Position = Vector3.new(u33.Position.X, u33.Position.Y + 0.25 + 0.1, u33.Position.Z)
        }):Play();
        u35:Disconnect();
    end);

    return u33;
end;

function u9.createTeamIndicator(p36, p37) -- Line: 196
    -- upvalues: u3 (copy), Workspace (copy), BedwarsImageId (copy)
    return u3("BillboardGui", {
        AlwaysOnTop = true,
        MaxDistance = 100,
        StudsOffset = Vector3.new(0, 7, 0),
        Parent = Workspace,
        Adornee = p37,
        Size = UDim2.fromScale(1, 1),
        Children = { u3("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.SKULL_VECTOR_ICON,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit
            }) }
    });
end;

function u9.animateFlag(p38, p39) -- Line: 212
    -- upvalues: CollectionService (copy), TweenService (copy), BLOCK_SIZE (copy), u8 (copy), Workspace (copy)
    local v40 = p39:Clone();
    CollectionService:RemoveTag(v40, "flag-kit");
    local Banner = v40:WaitForChild("Banner", 3);
    Banner.Transparency = 0;
    Banner.Position = p39.Position + Vector3.new(0, 40, 0);
    local v41 = {};
    local Position = p39.CFrame.Position;
    local v42 = Vector3.new(0, BLOCK_SIZE / 2, 0);
    v41.CFrame = CFrame.new(Position + v42);
    TweenService:Create(Banner, u8, v41):Play();

    local function _(p43) -- Line: 231
        p43.Transparency = 0;
    end;

    for i, child in Banner:GetChildren() do
        local _ = i - 1;
        child.Transparency = 0;
    end;

    Banner.Parent = Workspace;

    return Banner;
end;

function u9.createPointLight(p44, p45) -- Line: 240
    -- upvalues: BannerPoint (copy), u5 (copy), Workspace (copy), EffectUtil (copy)
    local v46 = BannerPoint:Clone();
    v46.CFrame = CFrame.new(p45.Position);
    v46.Anchored = true;
    v46.CanCollide = false;
    local v47 = u5[p45.Name];
    v46.Point.Cubes.Color = ColorSequence.new(v47);
    v46.Point.Gradient.Color = ColorSequence.new(v47);
    v46.Point.PointLight.Color = v47;
    v46.Point.Shine.Color = ColorSequence.new(v47);
    v46.Parent = Workspace;
    EffectUtil:playEffects({ v46 }, nil);

    return v46;
end;

function u9.playFlagDropSound(p48, p49) -- Line: 254
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.FLAG_DROP, {
        position = p49.Position
    });
end;

function u9.playBuffLoop(p50) -- Line: 259
    -- upvalues: SoundManager (copy), GameSound (copy)
    local v51 = SoundManager:playSound(GameSound.FLAG_BUFF, {
        position = nil,
        looped = true
    });
    p50.audioLoopMaid:GiveTask(v51);
end;

function u9.playFlagShockwave(p52, p53) -- Line: 266
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local v54 = ReplicatedStorage.Assets.Effects.FlagShockwave:Clone();
    v54.Parent = Workspace;
    v54.CFrame = CFrame.new(p53.Position);
    EffectUtil:playEffects({ v54 }, nil, {
        destroyAfterSec = 3
    });
end;

function u9.hideFlagForAnimation(p55, p56) -- Line: 274
    local Banner = p56:WaitForChild("Banner", 3);

    if Banner then
        Banner.Transparency = 1;

        local function _(p57) -- Line: 279
            p57.Transparency = 1;
        end;

        for i, child in Banner:GetChildren() do
            local _ = i - 1;
            child.Transparency = 1;
        end;
    end;
end;

function u9.startBeamTicker(u58) -- Line: 288
    -- upvalues: RunService (copy)
    RunService.Heartbeat:Connect(function(p59) -- Line: 289
        -- upvalues: u58 (copy)
        local v60 = u58;
        v60.tickAccumulator = v60.tickAccumulator + p59;

        if u58.tickAccumulator >= u58.beamTickRate then
            local function _(p61, p62) -- Line: 293
                -- upvalues: u58 (ref)
                u58:createBeams(p62, (u58:getBeamEligibleEntities(p62)));
            end;

            for i, _ in u58.flagViewMap do
                u58:createBeams(i, (u58:getBeamEligibleEntities(i)));
            end;

            u58.tickAccumulator = 0;
        end;
    end);
end;

function u9.createBeams(u63, u64, u65) -- Line: 304
    -- upvalues: u5 (copy), BannerConnection (copy)
    local u66 = u63.beamMap[u64];
    local u67 = u63.flagViewMap[u64];

    local function v77(p68) -- Line: 312
        -- upvalues: u66 (copy), u5 (ref), u64 (copy), BannerConnection (ref), u67 (copy), u63 (copy)
        local v69 = u66;

        if v69 ~= nil then
            v69 = table.find(v69, p68) ~= nil;
        end;

        local v70 = u5[u64.Name];

        if not v69 then
            local v71 = BannerConnection.Beam1:Clone();
            local v72 = BannerConnection.Beam2:Clone();
            local Character = p68.Character;

            if Character ~= nil then
                Character = Character:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
            end;

            local v73 = u67;

            if v73 ~= nil then
                v73 = v73.pointLight;
            end;

            local v74 = v73 and u67.pointLight:WaitForChild("Point", 3);

            if v74 then
                v71.Color = ColorSequence.new(v70);
                v71.Attachment0 = v74;
                v71.Attachment1 = Character;
                v71.Parent = Character;
                v72.Color = ColorSequence.new(v70);
                v72.Attachment0 = v74;
                v72.Attachment1 = Character;
                v72.Parent = Character;

                if u63:isLocalPlayer(p68) and not u63.audioIsLooping then
                    u63.audioIsLooping = true;
                    u63:playBuffLoop();
                end;

                local v75 = u63.playerBeamMap[p68];

                if not v75 then
                    u63.playerBeamMap[p68] = {
                        [u64] = { v71, v72 }
                    };

                    return;
                end;

                local v76 = v75[u64];

                if v76 then
                    table.insert(v76, v71);
                    table.insert(v76, v72);

                    return;
                end;

                v75[u64] = { v71, v72 };
            end;
        end;
    end;

    for i, v in u65 do
        v77(v, i - 1, u65);
    end;

    if u66 ~= nil then
        local function v82(p78) -- Line: 384
            -- upvalues: u65 (copy), u63 (copy), u64 (copy)
            if table.find(u65, p78) == nil then
                local v79 = u63.playerBeamMap[p78];
                local v80 = v79 and v79[u64];

                if v80 then
                    local function _(p81) -- Line: 396
                        p81.Parent = nil;
                        p81:Destroy();
                    end;

                    for i, v in v80 do
                        local _ = i - 1;
                        v.Parent = nil;
                        v:Destroy();
                    end;

                    if u63:isLocalPlayer(p78) and u63.audioIsLooping then
                        u63.audioLoopMaid:DoCleaning();
                        u63.audioIsLooping = false;
                    end;
                end;
            end;
        end;

        for i, v in u66 do
            v82(v, i - 1, u66);
        end;
    end;

    u63.beamMap[u64] = u65;
end;

function u9.getBeamEligibleEntities(u83, u84) -- Line: 420
    -- upvalues: GameWorldUtil (copy), ConquerorBalance (copy), RuntimeLib (copy), PlayerEntity (copy)
    local v85 = u83.flagViewMap[u84];

    if not v85 then
        return {};
    end;

    local function _(p86) -- Line: 429
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref)
        return RuntimeLib.instanceof(p86, PlayerEntity);
    end;

    local v87 = 0;
    local v88 = {};
    local u89 = {};

    for i, v in GameWorldUtil.getEntitiesWithinRadius(v85.radius.Position, ConquerorBalance.CONQUEROR_FLAG_RADIUS / 2) do
        local _ = i - 1;

        if RuntimeLib.instanceof(v, PlayerEntity) == true then
            v87 = v87 + 1;
            v88[v87] = v;
        end;
    end;

    local function _(p90) -- Line: 442
        -- upvalues: u84 (copy)
        return {
            entity = p90,
            distance = (p90:getInstance():GetPivot().Position - u84.Position).Magnitude
        };
    end;

    local v91 = table.create(#v88);

    for i, v in v88 do
        local _ = i - 1;
        v91[i] = {
            entity = v,
            distance = (v:getInstance():GetPivot().Position - u84.Position).Magnitude
        };
    end;

    table.sort(v91, function(p92, p93) -- Line: 458
        return p92.distance < p93.distance;
    end);
    local u94 = 0;

    local function v97(p95) -- Line: 464
        -- upvalues: u94 (ref), ConquerorBalance (ref), RuntimeLib (ref), PlayerEntity (ref), u83 (copy), u84 (copy), u89 (copy)
        if u94 < ConquerorBalance.CONQUEROR_FLAG_MAX_PLAYERS_BUFFED and (RuntimeLib.instanceof(p95.entity, PlayerEntity) and u83:wasPlacedByTeammate(p95.entity:getPlayer(), u84)) then
            local v96 = p95.entity:getPlayer();
            table.insert(u89, v96);
            u94 = u94 + 1;
        end;
    end;

    for i, v in v91 do
        v97(v, i - 1, v91);
    end;

    return u89;
end;

function u9.wasPlacedByTeammate(p98, p99, p100) -- Line: 479
    local v101 = p100:GetAttribute("FlagTeam");
    local Team = p99.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    return v101 == Team;
end;

function u9.isFriendlyFlag(p102, p103) -- Line: 487
    -- upvalues: Players (copy)
    local v104 = p103:GetAttribute("FlagTeam");
    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    return Team == v104;
end;

function u9.isClientPrediction(p105, p106) -- Line: 495
    return p106:GetAttribute("ClientPlaced");
end;

function u9.isLocalPlayer(p107, p108) -- Line: 498
    -- upvalues: Players (copy)
    return p108.Character == Players.LocalPlayer.Character;
end;

KnitClient.CreateController(u9.new());

return nil;