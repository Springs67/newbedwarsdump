-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "collection-util").WatchCollectionTag;
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "player-util").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out", "sync-event-priority").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AprilFools2026 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "april-fools", "april-fools-2026").AprilFools2026;
local ItemSkinType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "AprilFools2026Controller";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "AprilFools2026Controller";
    p6.bedSkinMap = {};
    p6.matchStarted = false;
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), AprilFools2026 (copy), default (copy), PlaceUtil (copy), WatchCharacter (copy), ClientSyncEvents (copy), SyncEventPriority (copy), MatchState (copy), KnitClient2 (copy), WatchCollectionTag (copy), ReplicatedStorage (copy), Workspace (copy), StatefulEntityTag (copy)
    KnitController.KnitStart(u7);

    if not AprilFools2026.ENABLED then
        return nil;
    end;

    default.Client:Get("SendPlayerBedSkin"):Connect(function(u8) -- Line: 49
        -- upvalues: u7 (copy), PlaceUtil (ref)
        u7.bedSkinMap[u8.player] = {
            bedSkin = u8.bedSkin,
            color = u8.color
        };
        local v9 = u8.player:GetAttribute("IsBed");

        if v9 == 0 or v9 ~= v9 then
            v9 = false;
        elseif v9 == "" then
            v9 = false;
        end;

        local u10 = (not v9 or u8.player:GetAttribute("IsBedSkin") ~= u8.bedSkin) and (PlaceUtil.isLobbyServer() or u7.matchStarted) and u8.player.Character;

        if u10 then
            task.spawn(function() -- Line: 66
                -- upvalues: u8 (copy), u7 (ref), u10 (copy)
                if not u8.player:HasAppearanceLoaded() then
                    u8.player.CharacterAppearanceLoaded:Wait();
                end;

                u7:turnPlayerIntoBed(u8.player, u10);
            end);
        end;
    end);

    if PlaceUtil.isLobbyServer() then
        WatchCharacter(function(u11, u12) -- Line: 77
            -- upvalues: u7 (copy)
            task.spawn(function() -- Line: 78
                -- upvalues: u11 (copy), u7 (ref), u12 (copy)
                if not u11:HasAppearanceLoaded() then
                    u11.CharacterAppearanceLoaded:Wait();
                end;

                u7:turnPlayerIntoBed(u11, u12);
            end);
        end);
    end;

    ClientSyncEvents.MatchStateChange:setPriority(SyncEventPriority.MONITOR):connect(function(p13) -- Line: 86
        -- upvalues: MatchState (ref), KnitClient2 (ref), u7 (copy), WatchCharacter (ref), WatchCollectionTag (ref), default (ref), ReplicatedStorage (ref), Workspace (ref), StatefulEntityTag (ref)
        if p13.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        local v14 = KnitClient2.Controllers.MatchController:getQueueMeta();

        if not v14 then
            return nil;
        end;

        if v14.rankCategory then
            return nil;
        end;

        u7.matchStarted = true;
        WatchCharacter(function(u15, u16) -- Line: 100
            -- upvalues: u7 (ref)
            task.spawn(function() -- Line: 101
                -- upvalues: u15 (copy), u7 (ref), u16 (copy)
                if not u15:HasAppearanceLoaded() then
                    u15.CharacterAppearanceLoaded:Wait();
                end;

                u7:turnPlayerIntoBed(u15, u16);
            end);
        end);

        local function _(p17) -- Line: 110
            -- upvalues: u7 (ref)
            local id = p17.id;
            u7:turnShopkeeperIntoBed("item_shop", id);
            u7:turnShopkeeperIntoBed("upgrade_shop", id);
        end;

        for i, v in KnitClient2.Controllers.TeamController:getTeams() do
            local _ = i - 1;
            local id = v.id;
            u7:turnShopkeeperIntoBed("item_shop", id);
            u7:turnShopkeeperIntoBed("upgrade_shop", id);
        end;

        WatchCollectionTag("armor", function(p18) -- Line: 119
            if p18:GetAttribute("ArmorSlot") ~= 0 then
                p18:Destroy();
            end;
        end);
        default.Client:Get("PillowHitEffect"):Connect(function(p19) -- Line: 126
            -- upvalues: ReplicatedStorage (ref), Workspace (ref)
            local u20 = ReplicatedStorage.Assets.Effects.SmallWhiteFeatherEffect:Clone();
            u20.Parent = Workspace;
            u20:PivotTo(p19.position);

            if u20 ~= nil then
                local function _(p21) -- Line: 133
                    if p21:IsA("ParticleEmitter") then
                        p21.LightEmission = 1;
                        p21:Emit(10);
                    end;
                end;

                for i, child in u20:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child.LightEmission = 1;
                        child:Emit(10);
                    end;
                end;
            end;

            task.delay(4, function() -- Line: 143
                -- upvalues: u20 (copy)
                u20:Destroy();
            end);
        end);
        WatchCollectionTag("GameEntity_" .. StatefulEntityTag.GOLEM_BOSS, function(p22) -- Line: 148
            -- upvalues: u7 (ref)
            local Body = p22:FindFirstChild("Body");

            if not Body then
                return nil;
            end;

            local v23 = p22:GetChildren();

            local function v25(p24) -- Line: 154
                if p24:IsA("MeshPart") then
                    if p24.Name == "WingNeon" then
                        p24.Material = Enum.Material.Neon;
                        p24.Color = Color3.fromRGB(171, 124, 53);

                        return;
                    end;

                    p24:SetAttribute("TransparencyOverride", 1);
                    p24.Transparency = 1;
                end;
            end;

            for i, v in v23 do
                v25(v, i - 1, v23);
            end;

            u7:createBedModel("0", p22, Body, {
                scale = 3,
                bedTransparency = 0.5,
                bedMaterial = Enum.Material.Neon,
                bedColor = Color3.fromRGB(171, 124, 53)
            });
        end);
        WatchCollectionTag("GameEntity_" .. StatefulEntityTag.DIAMOND_GUARDIAN, function(p26) -- Line: 176
            -- upvalues: u7 (ref)
            local RootPart = p26:FindFirstChild("RootPart");

            if not RootPart then
                return nil;
            end;

            local function _(p27) -- Line: 182
                if p27:IsA("MeshPart") then
                    p27:SetAttribute("TransparencyOverride", 1);
                    p27.Transparency = 1;
                end;
            end;

            for i, child in p26:GetChildren() do
                local _ = i - 1;

                if child:IsA("MeshPart") then
                    child:SetAttribute("TransparencyOverride", 1);
                    child.Transparency = 1;
                end;
            end;

            u7:createBedModel("0", p26, RootPart, {
                bedMaterial = Enum.Material.Neon,
                bedColor = Color3.fromRGB(0, 157, 157),
                blanketColor = Color3.fromRGB(255, 131, 8)
            });
        end);
    end);
end;

function u4.turnPlayerIntoBed(p28, p29, p30) -- Line: 199
    -- upvalues: GamePlayerUtil (copy)
    local v31 = GamePlayerUtil.getGamePlayer(p29):getTeamId();
    local Head = p30:WaitForChild("Head");

    if not Head then
        return nil;
    end;

    local v32 = p28.bedSkinMap[p29];

    if v32 ~= nil then
        v32 = v32.bedSkin;
    end;

    local v33 = p28.bedSkinMap[p29];

    if v33 ~= nil then
        v33 = v33.color;
    end;

    p28:createBedModel(v31 == nil and "0" or v31, p30, Head, {
        bedSkin = v32,
        color = v33
    });
    local v34 = p30:GetChildren();

    local function v40(p35) -- Line: 230
        if p35.Name == "3DClothing" then
            local v36 = p35:GetChildren();

            local function v39(p37) -- Line: 233
                if p37.Name ~= "Welding" then
                    p37:Destroy();
                end;

                if p37.Name == "Head" then
                    local function _(p38) -- Line: 239
                        if p38:IsA("BasePart") then
                            p38:Destroy();
                        end;
                    end;

                    for i, descendant in p37:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant:Destroy();
                        end;
                    end;
                end;
            end;

            for i, v in v36 do
                v39(v, i - 1, v36);
            end;
        end;

        if p35:IsA("BasePart") or p35:IsA("MeshPart") then
            p35.Transparency = 1;
        end;

        if p35:IsA("Accessory") and p35:GetAttribute("InvItem") ~= true then
            local AccessoryWeld = p35:FindFirstChild("AccessoryWeld", true);

            if AccessoryWeld ~= nil then
                AccessoryWeld = AccessoryWeld.Part1;

                if AccessoryWeld ~= nil then
                    AccessoryWeld = AccessoryWeld.Name;
                end;
            end;

            if AccessoryWeld ~= "Head" then
                p35:Destroy();
            end;
        end;
    end;

    for i, v in v34 do
        v40(v, i - 1, v34);
    end;

    p29:SetAttribute("IsBed", true);
    p29:SetAttribute("IsBedSkin", v32);
    print("[APRIL FOOLS] Turning " .. p29.Name .. " into bed" .. (not v32 and "" or " (" .. v32 .. ")"));
end;

function u4.turnShopkeeperIntoBed(p41, p42, p43) -- Line: 277
    -- upvalues: KnitClient2 (copy), CollectionService (copy)
    local v44 = KnitClient2.Controllers.ShopkeeperController:getShopkeeperModel(p42, p43);

    if not v44 then
        return nil;
    end;

    local Head = v44:WaitForChild("Head");

    if not Head then
        return nil;
    end;

    local Parent = v44.Parent;

    if not Parent then
        return nil;
    end;

    Parent.Transparency = 1;
    p41:createBedModel(p43, v44, Head, {
        scale = 1.1,
        bedSkin = CollectionService:GetTagged("bed:" .. p43)[1]:GetAttribute("BedSkin")
    });
    local v45 = v44:GetChildren();

    local function v48(p46) -- Line: 298
        if p46.Name == "3D Clothing" then
            local function _(p47) -- Line: 301
                if p47.Name ~= "Mesh/Head" and (p47.Name ~= "Mesh/Mustach" and p47.Name ~= "Weld") then
                    p47:Destroy();
                end;
            end;

            for i, child in p46:GetChildren() do
                local _ = i - 1;

                if child.Name ~= "Mesh/Head" and (child.Name ~= "Mesh/Mustach" and child.Name ~= "Weld") then
                    child:Destroy();
                end;
            end;
        end;

        if (p46:IsA("Part") or p46:IsA("MeshPart")) and p46.Name ~= "Head" then
            p46.Transparency = 1;
        end;
    end;

    for i, v in v45 do
        v48(v, i - 1, v45);
    end;
end;

function u4.createBedModel(p49, u50, p51, p52, u53) -- Line: 320
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), KnitClient2 (copy), ItemSkinType (copy), scaleModel (copy), u2 (copy)
    local v54;

    if u53 == nil then
        v54 = u53;
    else
        v54 = u53.bedSkin;
    end;

    local v55;

    if v54 then
        v55 = ReplicatedStorage.Assets.Blocks:FindFirstChild(u53.bedSkin);

        if v55 ~= nil then
            v55 = v55:Clone();
        end;
    else
        local v56;

        if u53 == nil then
            v56 = u53;
        else
            v56 = u53.color;
        end;

        v55 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(u50, nil, v56);
    end;

    if not v55 then
        return nil;
    end;

    local AprilFoolsBed = p51:FindFirstChild("AprilFoolsBed");

    if AprilFoolsBed ~= nil then
        AprilFoolsBed:Destroy();
    end;

    local v57;

    if u53 == nil then
        v57 = u53;
    else
        v57 = u53.bedSkin;
    end;

    if v57 then
        local v58 = v55:GetDescendants();

        local function v61(p59) -- Line: 355
            -- upvalues: KnitClient2 (ref), u50 (copy), u53 (copy)
            if p59:IsA("MeshPart") or p59:IsA("SurfaceAppearance") then
                local v60 = KnitClient2.Controllers.TeamController:getTeamById(u50);

                if v60 ~= nil then
                    v60 = v60.color;
                end;

                if v60 == nil then
                    v60 = u53;

                    if v60 ~= nil then
                        v60 = v60.color;
                    end;

                    if v60 == nil then
                        v60 = Color3.fromRGB(0, 0, 0);
                    end;
                end;

                p59.Color = v60;
            end;
        end;

        for i, v in v58 do
            v61(v, i - 1, v58);
        end;
    end;

    v55.Name = "AprilFoolsBed";
    v55:PivotTo(p52:GetPivot() * CFrame.Angles(1.5707963267948966, 0, -3.141592653589793));
    v55:PivotTo(CFrame.new(p51:GetPivot().Position) * v55:GetPivot().Rotation);
    v55:PivotTo(v55:GetPivot() * CFrame.new(0, -0.5, -1.35));
    v55:SetAttribute("TransparencyOverride", 0);

    local function _(p62) -- Line: 394
        if p62:IsA("BasePart") then
            p62.Massless = true;
        end;
    end;

    for i, descendant in v55:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Massless = true;
        end;
    end;

    v55.Parent = p51;
    local v63;

    if u53 == nil then
        v63 = u53;
    else
        v63 = u53.bedSkin;
    end;

    if v63 == ItemSkinType.BED_PRESENT then
        local Lights = v55:FindFirstChild("Lights", true);

        if Lights ~= nil then
            Lights:Destroy();
        end;
    end;

    local Carpet = v55:FindFirstChild("Carpet", true);

    if Carpet ~= nil then
        Carpet:Destroy();
    end;

    local v64;

    if u53 == nil then
        v64 = u53;
    else
        v64 = u53.scale;
    end;

    if v64 ~= 0 and (v64 == v64 and v64) then
        scaleModel(v55, u53.scale);
    end;

    local Root = v55:FindFirstChild("Root");

    if Root then
        Root:SetAttribute("TransparencyOverride", 1);
        Root.Anchored = false;
        Root.CanCollide = false;
        Root.CanQuery = false;
        u2("WeldConstraint", {
            Part0 = p52,
            Part1 = Root,
            Parent = Root
        });
    end;

    if Root ~= nil then
        local v65 = Root:GetChildren();

        local function v74(p66) -- Line: 440
            -- upvalues: u2 (ref), Root (copy), u53 (copy)
            p66:SetAttribute("TransparencyOverride", 0);

            if p66:IsA("MeshPart") then
                p66.Anchored = false;
                p66.CanCollide = false;
                p66.CanQuery = false;
                u2("WeldConstraint", {
                    Part0 = p66,
                    Part1 = Root,
                    Parent = Root
                });

                if p66.Name == "Bed" then
                    local v67 = u53;

                    if v67 ~= nil then
                        v67 = v67.bedColor;
                    end;

                    if v67 then
                        local v68 = u53;

                        if v68 ~= nil then
                            v68 = v68.bedColor;
                        end;

                        p66.Color = v68;
                    end;

                    local v69 = u53;

                    if v69 ~= nil then
                        v69 = v69.bedMaterial;
                    end;

                    if v69 then
                        p66.Material = u53.bedMaterial;
                    end;

                    local v70 = u53;

                    if v70 ~= nil then
                        v70 = v70.bedTransparency;
                    end;

                    if v70 ~= 0 and (v70 == v70 and v70) then
                        p66.Transparency = u53.bedTransparency;
                        p66:SetAttribute("TransparencyOverride", u53.bedTransparency);
                    end;
                end;

                if p66.Name == "Blanket" then
                    local v71 = u53;

                    if v71 ~= nil then
                        v71 = v71.blanketColor;
                    end;

                    if v71 then
                        local v72 = u53;

                        if v72 ~= nil then
                            v72 = v72.blanketColor;
                        end;

                        p66.Color = v72;
                    end;

                    local v73 = u53;

                    if v73 ~= nil then
                        v73 = v73.blanketMaterial;
                    end;

                    if v73 then
                        p66.Material = u53.blanketMaterial;
                    end;
                end;
            end;
        end;

        for i, v in v65 do
            v74(v, i - 1, v65);
        end;
    end;

    return v55;
end;

KnitClient.CreateController(u4.new());

return nil;