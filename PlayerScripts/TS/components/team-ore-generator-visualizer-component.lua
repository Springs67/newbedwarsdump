-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out");
local BaseComponent = v1.BaseComponent;
local Component = v1.Component;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent, "client-sync-events").ClientSyncEvents;
local InstanceCache = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "common", "instance-cache").InstanceCache;
local ItemDropCacheSanitizer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "common", "sanitizers", "item-drop-cache-sanitizer").ItemDropCacheSanitizer;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "TeamOreGeneratorVisualizerComponent";
    end,

    __index = BaseComponent
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: BaseComponent (copy), u3 (copy), Workspace (copy), InstanceCache (copy), ItemDropCacheSanitizer (copy), u2 (copy)
    BaseComponent.constructor(p7);
    p7.droppingItems = {};
    p7.lastDropsClearTime = 0;
    p7.nextClearTime = 0;
    local v8 = u3("Folder", {
        Name = "team-gen-drop-cache-" .. p7.attributes.teamId,
        Parent = Workspace
    });
    p7.dropItemCache = InstanceCache.new(v8, ItemDropCacheSanitizer.new(), 100, 30);
    p7.clearMaid = u2.new();
    p7.lastDrops = {};
    p7.dropIntervals = {};
end;

function u5.getTag(p9) -- Line: 56
    return "TeamOreGeneratorVisualizer";
end;

function u5.onStart(u10) -- Line: 59
    -- upvalues: CollectionService (copy), default2 (copy), RuntimeLib (copy), default (copy), KnitClient (copy), MatchState (copy), ClientSyncEvents (copy)
    CollectionService:GetInstanceRemovedSignal("team-ore-gen-drop:" .. u10.attributes.teamId):Connect(function(p11) -- Line: 61
        -- upvalues: u10 (copy)
        if u10.lastDropsClearTime <= time() + 0.7 then
            u10.clearMaid:DoCleaning();

            local function _(p12) -- Line: 65
                return p12.dropTime >= 0.4;
            end;

            local v13 = 0;
            local u14 = {};

            for i, v in u10.droppingItems do
                local _ = i - 1;

                if v.dropTime >= 0.4 == true then
                    v13 = v13 + 1;
                    u14[v13] = v;
                end;
            end;

            local function _(p15) -- Line: 79
                -- upvalues: u10 (ref)
                u10.dropItemCache:cacheOrDestroyInstance(p15.drop, p15.drop.Name);
            end;

            for i, v in u14 do
                local _ = i - 1;
                u10.dropItemCache:cacheOrDestroyInstance(v.drop, v.drop.Name);
            end;

            local function _(p16) -- Line: 86
                -- upvalues: u14 (copy)
                return table.find(u14, p16) == nil;
            end;

            local v17 = 0;
            local v18 = {};

            for i, v in u10.droppingItems do
                local _ = i - 1;

                if table.find(u14, v) == nil == true then
                    v17 = v17 + 1;
                    v18[v17] = v;
                end;
            end;

            u10.droppingItems = v18;
            u10.lastDropsClearTime = time();
        end;
    end);
    CollectionService:GetInstanceAddedSignal("team-ore-gen-drop:" .. u10.attributes.teamId):Connect(function(u19) -- Line: 104
        -- upvalues: u10 (copy)
        local Name = u19.Name;
        local v20 = u10.lastDrops[Name];

        if v20 == nil then
            u10.lastDrops[Name] = {
                time = 0,
                confirmationTime = time()
            };
        else
            v20.confirmationTime = time();
        end;

        u10.clearMaid:GiveTask(u19:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 117
            -- upvalues: u19 (copy), u10 (ref), Name (copy)
            local v21 = u19:GetAttribute("Amount");
            local v22 = (v21 == nil and 0 or v21) > 1 and u10.lastDrops[Name];

            if v22 then
                v22.confirmationTime = time();
            end;
        end));
    end);
    default2.Client:Get("TeamGenDropSpeedsUpdate"):Connect(function(p23) -- Line: 131
        -- upvalues: u10 (copy)
        if p23.id == u10.attributes.id then
            local function _(p24, p25) -- Line: 134
                -- upvalues: u10 (ref)
                u10.dropIntervals[p25] = p24;
            end;

            for i, v in p23.dropSpeeds do
                u10.dropIntervals[i] = v;
            end;
        end;
    end);
    default2.Client:Get("GetTeamGenDropSpeeds"):CallServerAsync(u10.attributes.id, u10.attributes.teamId):andThen(function(p26) -- Line: 146
        -- upvalues: u10 (copy)
        local function _(p27, p28) -- Line: 148
            -- upvalues: u10 (ref)
            u10.dropIntervals[p28] = p27;
        end;

        for i, v in p26 do
            u10.dropIntervals[i] = v;
        end;
    end);

    local function u36() -- Line: 159
        -- upvalues: RuntimeLib (ref), u10 (copy), default2 (ref), default (ref)
        RuntimeLib.Promise.retryWithDelay(function() -- Line: 160
            -- upvalues: RuntimeLib (ref), u10 (ref), default2 (ref)
            return RuntimeLib.Promise.new(function(p29, p30) -- Line: 161
                -- upvalues: u10 (ref), default2 (ref)
                if next(u10.dropIntervals) ~= nil then
                    return p29();
                end;

                local v31, v32 = default2.Client:Get("GetTeamGenDropSpeeds"):CallServerAsync(u10.attributes.id, u10.attributes.teamId):timeout(5):await();

                if not v31 then
                    return p30("Failed to get team gen drop intervals");
                end;

                if next(v32) == nil then
                    return p30("Received empty result when getting team gen drop intervals");
                end;

                local function _(p33, p34) -- Line: 172
                    -- upvalues: u10 (ref)
                    u10.dropIntervals[p34] = p33;
                end;

                for i, v in v32 do
                    u10.dropIntervals[i] = v;
                end;

                return p29();
            end);
        end, 6, 10):catch(function(p35) -- Line: 184
            -- upvalues: default (ref), u10 (ref)
            return default.Warn("Failed to set team gen " .. u10.attributes.id .. " with drop intervals with reason: " .. tostring(p35));
        end);
    end;

    if KnitClient.Controllers.MatchController:getMatchState() == MatchState.PRE then
        ClientSyncEvents.MatchStateChange:connect(function(p37) -- Line: 189
            -- upvalues: MatchState (ref), u36 (copy)
            if p37.matchState == MatchState.RUNNING then
                u36();
            end;
        end);

        return;
    end;

    u36();
end;

function u5.onTick(u38) -- Line: 198
    local u39 = time();
    local lastDrops = u38.lastDrops;

    local function v45(p40, p41) -- Line: 202
        -- upvalues: u38 (copy), u39 (copy)
        local v42 = u38.dropIntervals[p41];

        if v42 ~= 0 and (v42 == v42 and v42) then
            if v42 <= u39 - p40.time then
                v42 = u39 - p40.confirmationTime < 2;
            else
                v42 = false;
            end;
        end;

        if v42 ~= 0 and (v42 == v42 and v42) then
            local v43 = u38:dropItem(p41);
            local droppingItems = u38.droppingItems;
            local v44 = {
                drop = v43,
                dropTime = time()
            };
            table.insert(droppingItems, v44);
            p40.time = u39;
        end;
    end;

    for i, v in lastDrops do
        v45(v, i, lastDrops);
    end;

    if u38.nextClearTime < u39 then
        local u46 = {};

        local function _(p47) -- Line: 230
            -- upvalues: u38 (copy), u46 (copy)
            local v48 = (p47.drop.CFrame.Position - u38.attributes.position).Magnitude >= 4;
            local v49;

            if v48 then
                v49 = not (u46[p47.drop.Name] ~= nil);
            else
                v49 = v48;
            end;

            if not v49 then
                return v48;
            end;

            u46[p47.drop.Name] = true;

            return false;
        end;

        local v50 = {};
        local v51 = 0;

        for i, v in u38.droppingItems do
            local _ = i - 1;
            local v52 = (v.drop.CFrame.Position - u38.attributes.position).Magnitude >= 4;
            local v53;

            if v52 then
                v53 = not (u46[v.drop.Name] ~= nil);
            else
                v53 = v52;
            end;

            if v53 then
                u46[v.drop.Name] = true;
                v52 = false;
            end;

            if v52 == true then
                v51 = v51 + 1;
                v50[v51] = v;
            end;
        end;

        local function _(p54) -- Line: 257
            return p54.drop;
        end;

        local u55 = table.create(#v50);

        for i, v in v50 do
            local _ = i - 1;
            u55[i] = v.drop;
        end;

        local function _(p56) -- Line: 268
            -- upvalues: u55 (copy)
            return table.find(u55, p56.drop) == nil;
        end;

        local v57 = 0;
        local v58 = {};

        for i, v in u38.droppingItems do
            local _ = i - 1;

            if table.find(u55, v.drop) == nil == true then
                v57 = v57 + 1;
                v58[v57] = v;
            end;
        end;

        u38.droppingItems = v58;

        local function _(p59) -- Line: 283
            -- upvalues: u38 (copy)
            u38.dropItemCache:cacheOrDestroyInstance(p59, p59.Name);
        end;

        for i, v in u55 do
            local _ = i - 1;
            u38.dropItemCache:cacheOrDestroyInstance(v, v.Name);
        end;

        u38.nextClearTime = u39 + 2;
    end;

    local droppingItems = u38.droppingItems;

    local function v67(p60) -- Line: 293
        -- upvalues: u38 (copy)
        local v61 = time() - p60.dropTime;
        local v62 = math.clamp(v61, 0, 1);

        if v62 == 1 then
            return nil;
        end;

        local v63 = u38.attributes.position.Y - 7;
        local v64 = 8 - math.pow(21, v62);
        local v65 = v63 + math.clamp(v64, 0, 7);
        local CFrame2 = p60.drop.CFrame;
        local v66 = Vector3.new(0, p60.drop.CFrame.Position.Y - v65, 0);
        p60.drop.CFrame = CFrame2 - v66;
    end;

    for i, v in droppingItems do
        v67(v, i - 1, droppingItems);
    end;
end;

function u5.dropItem(p68, p69) -- Line: 315
    -- upvalues: getItemMeta (copy), ItemUtil (copy), GameQueryUtil (copy), scalePart (copy), WeldUtil (copy), u3 (copy), Workspace (copy)
    local v70 = false;
    local v71 = p68.dropItemCache:getInstance(p69);

    if v71 then
        v71.Size = Vector3.new(1, 1, 1);
        v71.Anchored = true;
        v71.CanCollide = false;
        v71.CanTouch = false;
        v71.CFrame = CFrame.new(p68.attributes.position);
        v71.Transparency = 1;
        (v71:FindFirstChild("Handle") or v71:FindFirstChild("HandleParent")).CFrame = v71.CFrame + Vector3.new(0, 1.5, 0);
    else
        local v72 = getItemMeta(p69).armor and true or v70;
        local v73 = ItemUtil.createItemInstance(p69);
        local v74 = v73:FindFirstChild("Handle"):Clone();
        local u75 = false;

        local function _(p76) -- Line: 327
            -- upvalues: u75 (ref), GameQueryUtil (ref)
            if p76:IsA("Bone") then
                u75 = true;
            end;

            if p76:IsA("BasePart") then
                p76.CanCollide = false;
                p76.CanTouch = false;
                p76.Massless = true;
                GameQueryUtil:setQueryIgnored(p76, false);
            end;
        end;

        for i, descendant in v74:GetDescendants() do
            local _ = i - 1;
            u75 = descendant:IsA("Bone") and true or u75;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanTouch = false;
                descendant.Massless = true;
                GameQueryUtil:setQueryIgnored(descendant, false);
            end;
        end;

        v74.CanCollide = false;
        v74.CanTouch = false;
        v74.Massless = true;
        GameQueryUtil:setQueryIgnored(v74, false);
        local Model = Instance.new("Model");
        v74:Clone().Parent = Model;
        local v77 = Model:GetExtentsSize();

        if (v77.X > 2.5 or (v77.Y > 2.5 or v77.Z > 3.5)) and not v72 then
            scalePart(v74, 0.5);

            for _, descendant in v74:GetDescendants() do
                if descendant:IsA("BasePart") then
                    WeldUtil:weldPartsWithJoint(v74, descendant, "Weld");
                end;
            end;
        end;

        Model:Destroy();
        v71 = u3("Part", {
            Size = Vector3.new(1, 1, 1),
            Anchored = true,
            CanCollide = false,
            CanTouch = false,
            Transparency = 1,
            Name = v73.Name,
            CFrame = CFrame.new(p68.attributes.position)
        });
        v74.CFrame = CFrame.new(p68.attributes.position + Vector3.new(0, 1.5, 0));
        local v78;

        if u75 then
            v78 = u3("Model", {
                Name = "HandleParent",
                Parent = v71
            });
        else
            v78 = v71;
        end;

        v74.Parent = v78;
        u3("Weld", {
            Part0 = v74,
            Part1 = v71,
            Parent = v74
        });
    end;

    assert(v71);
    v71.CollisionGroup = "ItemDrops";
    v71.Parent = Workspace;

    return v71;
end;

Reflect.defineMetadata(u5, "identifier", "client/components/team-ore-generator-visualizer-component@TeamOreGeneratorVisualizerComponent");
Reflect.defineMetadata(u5, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnTick" });
Reflect.decorate(u5, "$c:init@Component", Component, {
    {
        tag = "TeamOreGeneratorVisualizer",
        refreshAttributes = true,
        defaults = {},
        attributes = {
            id = t.string,
            teamId = t.string,
            position = t.Vector3
        }
    }
});

return {
    TeamOreGeneratorVisualizerComponent = u5
};