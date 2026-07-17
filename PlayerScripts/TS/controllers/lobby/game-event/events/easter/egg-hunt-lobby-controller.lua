-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local StoreProvider = u4.StoreProvider;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EggHuntBoardBase = RuntimeLib.import(script, script.Parent, "ui", "egg-hunt-board-base").EggHuntBoardBase;
local EggHuntBoardCore = RuntimeLib.import(script, script.Parent, "ui", "egg-hunt-board-core").EggHuntBoardCore;
local v6 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "EggHuntLobbyController";
    end,

    __index = KnitController
});
v6.__index = v6;

function v6.constructor(p7, p8, p9, p10, p11, p12) -- Line: 33
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p7);
    p7.eventType = p8;
    p7.eggMeta = p9;
    p7.milestoneMeta = p10;
    p7.milestoneRewardMeta = p11;
    p7.eggFolder = p12;
    p7.Name = "EggHuntLobbyController";
    local v13 = u1.entries(p9);
    table.sort(v13, function(p14, p15) -- Line: 42
        local _ = p14[1];
        local _ = p15[1];

        return p14[2].order < p15[2].order;
    end);
    p7.easterEggs = v13;
end;

function v6.KnitStart(u16) -- Line: 52
    -- upvalues: KnitController (copy), EventMeta (copy), default (copy), WatchCollectionTag (copy), EggHuntBoardCore (copy), KnitClient (copy)
    KnitController.KnitStart(u16);

    if not EventMeta[u16.eventType].active then
        return nil;
    end;

    default.Client:GetNamespace("Event"):Get("MissionClaimed"):Connect(function(p17) -- Line: 58
        -- upvalues: u16 (copy)
        local metaId = p17.mission.metaId;

        local function _(p18) -- Line: 61
            -- upvalues: metaId (copy)
            local _ = p18[2];

            return p18[1] == metaId;
        end;

        local v19 = nil;

        for i, v in u16.easterEggs do
            local _ = i - 1;
            local _ = v[2];

            if v[1] == metaId == true then
                v19 = v;
                break;
            end;
        end;

        if not v19 then
            return nil;
        end;

        u16:displayEgg(metaId);
    end);
    WatchCollectionTag("EventProgressBoard", function(p20) -- Line: 82
        -- upvalues: u16 (copy), EggHuntBoardCore (ref)
        u16.eventProgressBoardTree = u16:mountApp(EggHuntBoardCore, function(p21) -- Line: 83
            -- upvalues: u16 (ref)
            local v22 = p21.Event.profileData.events[u16.eventType];
            local v23 = {
                milestoneMeta = u16.milestoneMeta,
                milestoneRewardsMeta = u16.milestoneRewardMeta
            };

            if v22 ~= nil then
                local claimedEggs = v22.claimedEggs;
                v22 = claimedEggs ~= nil and #claimedEggs or claimedEggs;
            end;

            v23.numEggsCollected = v22 == nil and 0 or v22;

            return v23;
        end, {
            parent = p20
        });
    end);
    WatchCollectionTag("EasterEventEggStand", function(p24) -- Line: 108
        p24.Position = p24.Position + Vector3.new(0, 1, 0);
        p24.CanCollide = false;
        p24.Transparency = 1;
    end);
    KnitClient.Controllers.EventController:waitForEventDataAsync(u16.eventType):andThen(function(p25) -- Line: 118
        -- upvalues: WatchCollectionTag (ref), u16 (copy)
        WatchCollectionTag("EasterEventEggStand", function(p26) -- Line: 119
            -- upvalues: u16 (ref)
            local v27 = tonumber(p26.Name);
            local v28 = v27 == nil and -1 or v27;

            if v28 == -1 then
                return nil;
            end;

            if #u16.easterEggs < v28 then
                return nil;
            end;

            local v29 = u16.easterEggs[v28 - 1 + 1][1];

            if u16:hasCollectedEgg(v29) then
                u16:displayEgg(v29, p26);
            end;
        end);
    end);
end;

function v6.getEggModel(p30, p31) -- Line: 141
    local eggFolder = p30.eggFolder;

    if eggFolder ~= nil then
        eggFolder = eggFolder:FindFirstChild(p31);
    end;

    return eggFolder;
end;

function v6.hasCollectedEgg(p32, u33) -- Line: 148
    -- upvalues: ClientStore (copy)
    local v34 = ClientStore:getState().Event.profileData.events[p32.eventType];

    if not v34 then
        return false;
    end;

    if v34.claimedEggs == nil then
        return false;
    end;

    local claimedEggs = v34.claimedEggs;

    local function _(p35) -- Line: 157
        return p35.egg;
    end;

    local v36 = table.create(#claimedEggs);

    for i, v in claimedEggs do
        local _ = i - 1;
        v36[i] = v.egg;
    end;

    if v36 ~= nil then
        local function _(p37) -- Line: 168
            -- upvalues: u33 (copy)
            return p37 == u33;
        end;

        v36 = nil;

        for i, v in v36 do
            local _ = i - 1;

            if v == u33 == true then
                v36 = v;
                break;
            end;
        end;
    end;

    return v36 ~= nil;
end;

function v6.displayEgg(u38, u39, p40) -- Line: 184
    -- upvalues: ClientStore (copy), CollectionService (copy), scaleModel (copy)
    local _ = ClientStore:getState().Event.profileData.events[u38.eventType];

    if not p40 then
        local function _(p41) -- Line: 189
            -- upvalues: u38 (copy), u39 (copy)
            local v42 = tonumber(p41.Name);
            local v43 = v42 == nil and -1 or v42;

            if v43 == -1 then
                return false;
            end;

            if #u38.easterEggs < v43 then
                return false;
            end;

            return u39 == u38.easterEggs[v43 - 1 + 1][1];
        end;

        p40 = nil;

        for i, v in CollectionService:GetTagged("EasterEventEggStand") do
            local _ = i - 1;
            local v44 = tonumber(v.Name);
            local v45 = v44 == nil and -1 or v44;
            local v46;

            if v45 == -1 or #u38.easterEggs < v45 then
                v46 = false;
            else
                v46 = u39 == u38.easterEggs[v45 - 1 + 1][1];
            end;

            if v46 == true then
                p40 = v;
                break;
            end;
        end;
    end;

    if p40 then
        local v47 = u38:getEggModel(u39);

        if v47 ~= nil then
            v47 = v47:Clone();
        end;

        if not v47 then
            return nil;
        end;

        scaleModel(v47, 0.13);

        local function _(p48) -- Line: 230
            if p48:IsA("BasePart") then
                p48.Anchored = true;
            end;
        end;

        for i, descendant in v47:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
            end;
        end;

        if v47.PrimaryPart then
            v47.PrimaryPart.PivotOffset = CFrame.new(Vector3.new(0, 0, 0));
        end;

        local v49 = u38:getEggShowcaseLoc(p40, v47);
        v47.Parent = p40.Parent;
        v47:PivotTo(v49);

        return v47;
    end;
end;

function v6.getEggShowcaseLoc(p50, p51, p52) -- Line: 248
    -- upvalues: Players (copy), Workspace (copy)
    local v53 = RaycastParams.new();
    v53.IgnoreWater = true;
    v53.FilterType = Enum.RaycastFilterType.Blacklist;

    local function _(p54) -- Line: 254
        return p54.Character;
    end;

    local v55 = 0;
    local v56 = {};

    for i, v in Players:GetPlayers() do
        local _ = i - 1;
        local Character = v.Character;

        if Character ~= nil then
            v55 = v55 + 1;
            v56[v55] = Character;
        end;
    end;

    local v57 = { p52 };
    table.move(v56, 1, #v56, #v57 + 1, v57);
    v53.FilterDescendantsInstances = v57;
    local v58 = Workspace:Raycast(p51.Position, Vector3.new(-0, -20, -0), v53);

    if not v58 then
        return p51.CFrame;
    end;

    if not p52.PrimaryPart then
        return p51.CFrame;
    end;

    local v59 = v58.Position + Vector3.new(0, p52.PrimaryPart.Size.Y * 0.5, 0);

    return CFrame.new(v59) * CFrame.Angles(0, math.rad(p51.Orientation.Y), 0);
end;

function v6.playEffect(p60, u61, u62) -- Line: 289
    -- upvalues: Players (copy), u2 (copy), RunService (copy), Workspace (copy)
    if u62 == nil then
        u62 = Players.LocalPlayer.Character;
    end;

    local u63 = u2.new();
    local CFrame2 = u61.CFrame;
    local v64 = math.random() * 3.141592653589793 * 2;
    local v65 = math.cos(v64);
    local v66 = math.sin(v64);
    local u67 = Vector3.new(v65, 0, v66) * 3;
    local v68 = u62;

    if v68 ~= nil then
        v68 = v68.PrimaryPart;
    end;

    if not v68 then
        return nil;
    end;

    local u69 = u62:GetPrimaryPartCFrame();
    local _ = u61.CFrame - u61.Position;
    local u70 = 0;
    u63:GiveTask(RunService.Heartbeat:Connect(function(p71) -- Line: 313
        -- upvalues: u62 (ref), u63 (copy), u69 (ref), Workspace (ref), u70 (ref), u67 (copy), CFrame2 (copy), u61 (copy)
        local v72 = u62;

        if v72 ~= nil then
            v72 = v72.PrimaryPart;

            if v72 ~= nil then
                v72 = v72.CFrame;
            end;
        end;

        if not v72 then
            u63:DoCleaning();

            return nil;
        end;

        local v73 = p71 * 80;
        local Magnitude = (u69.Position - v72.Position).Magnitude;
        local v74 = v73 / Magnitude;

        if Magnitude > 20 then
            v74 = (Magnitude - 20 + v73) / Magnitude;
        end;

        u69 = u69:Lerp(v72, (math.clamp(v74, 0, 1)));
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u63:DoCleaning();

            return nil;
        end;

        local function _(p75) -- Line: 345
            -- upvalues: CurrentCamera (copy)
            local LookVector = CFrame.new(p75, CurrentCamera.Position).LookVector;
            local v76 = Vector3.new(LookVector.X, 0, LookVector.Z);

            return CFrame.new(Vector3.new(0, 0, 0), (v76.Magnitude == 0 and Vector3.new(1, 0, 0) or v76).Unit);
        end;

        u70 = u70 + p71;
        local u77 = 0;

        local function _(p78) -- Line: 357
            -- upvalues: u70 (ref), u77 (ref)
            return (u70 - (u77 - p78)) / p78;
        end;

        u77 = u77 + 0.14;

        if u70 < u77 then
            local v79 = v72 + (u67 + Vector3.new(0, 8, 0));
            local v80 = CFrame.new(v79.Position);
            local LookVector = CFrame.new(v79.Position, CurrentCamera.Position).LookVector;
            local v81 = Vector3.new(LookVector.X, 0, LookVector.Z);
            u61.CFrame = CFrame2:Lerp(v80 * CFrame.new(Vector3.new(0, 0, 0), (v81.Magnitude == 0 and Vector3.new(1, 0, 0) or v81).Unit), (math.pow((u70 - (u77 - 0.14)) / 0.14, 0.4)));
        else
            u77 = u77 + 0.12;

            if u70 < u77 then
                local v82 = (u67 + Vector3.new(0, 8, 0)):Lerp(u67 + Vector3.new(0, 6, 0), (math.pow((u70 - (u77 - 0.12)) / 0.12, 0.25)));
                u61.CFrame = CFrame.new(v82 + u69.Position);
            else
                u77 = u77 + 0.08;

                if u70 < u77 then
                    u61.CFrame = CFrame.new(u67 + Vector3.new(0, 6, 0) + u69.Position);
                else
                    u77 = u77 + 0.06;

                    if u70 >= u77 then
                        u63:DoCleaning();

                        return nil;
                    end;

                    local v83 = (u70 - (u77 - 0.06)) / 0.06;
                    local v84 = (u67 + Vector3.new(0, 6, 0)):Lerp(u67 + Vector3.new(0, 3, 0), v83);
                    u61.CFrame = CFrame.new(v84 + u69.Position);
                    u61.Size = u61.Size:Lerp(Vector3.new(0, 0, 0), v83);
                end;
            end;
        end;
    end));

    return u63;
end;

function v6.mountApp(p85, u86, u87, p88) -- Line: 425
    -- upvalues: Players (copy), u4 (copy), EggHuntBoardBase (copy), u3 (copy), StoreProvider (copy), ClientStore (copy)
    if p88 ~= nil then
        p88 = p88.parent;
    end;

    if p88 == nil then
        p88 = Players.LocalPlayer:WaitForChild("PlayerGui");
    end;

    local v91 = u4.connect(function(p89, p90) -- Line: 435
        -- upvalues: u86 (copy), u87 (copy)
        return {
            uiHook = u86,
            hookProps = u87(p89)
        };
    end)(EggHuntBoardBase);

    return u3.mount(u3.createElement(StoreProvider, {
        store = ClientStore
    }, { u3.createElement(v91) }), p88);
end;

return {
    EggHuntLobbyController = v6
};