-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local MarketplaceService = v1.MarketplaceService;
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getArmorTrimTierDevProduct = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-dev-products").getArmorTrimTierDevProduct;
local getArmorTrimEffect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-definition").getArmorTrimEffect;
local ArmorTrimEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType;
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local ArmorTrimEffectRankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRankMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local humanoidAttachments = RuntimeLib.import(script, script.Parent, "roblox-humanoid-attachments").humanoidAttachments;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "ArmorTrimController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 32
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "ArmorTrimController";
end;

function u2.KnitStart(u5) -- Line: 40
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), PlaceUtil (copy), KnitClient (copy), MatchState (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("UpdatedArmorTrimConfig "):Connect(function(p6) -- Line: 42
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetArmorTrimData",
            allKitProgress = p6.progress,
            effectUnlocks = p6.effectUnlocks,
            allKitXpPotential = p6.xpPotential,
            selectedArmorTrimConfigs = p6.configs
        });
    end);

    if PlaceUtil.isGameServer() then
        if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
            u5:hookArmorTrim();

            return;
        end;

        ClientSyncEvents.MatchStateChange:connect(function(p7) -- Line: 57
            -- upvalues: MatchState (ref), u5 (copy)
            if p7.matchState == MatchState.RUNNING then
                u5:hookArmorTrim();
            end;
        end);
    end;
end;

function u2.equipArmorTrimConfig(p8, p9, p10, p11, p12) -- Line: 65
    -- upvalues: default (copy)
    default.Client:Get("SetSelectedArmorTrimConfig"):SendToServer({
        kit = p9,
        trim = p10,
        color = p11,
        effectType = p12
    });
end;

function u2.promptPurchaseToTier(p13, p14, p15, p16) -- Line: 73
    -- upvalues: default (copy), getArmorTrimTierDevProduct (copy), MarketplaceService (copy), Players (copy)
    default.Client:Get("AttemptArmorTrimPurchaseTier"):SendToServer({
        armorTrimType = p14,
        kit = p15
    });
    local v17 = getArmorTrimTierDevProduct(p16);
    MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v17);
end;

function u2.attachArmorTrim(p18, p19, p20) -- Line: 81
    local v21 = p19:GetAttribute("ArmorTrimEffectRank");
    local v22 = p19:GetAttribute("ArmorTrimType");
    local v23 = p19:GetAttribute("ArmorTrimColor");
    local v24 = p19:GetAttribute("ArmorTrimEffectType");

    if v21 == 0 or (v21 ~= v21 or not (v21 and v22)) then
        return nil;
    end;

    p18:attachArmorTrimEffects(p20, v22, v23, v21, v24);
end;

function u2.attachArmorTrimEffects(p25, u26, p27, p28, p29, p30) -- Line: 91
    -- upvalues: ArmorTrimEffectRankMeta (copy), ArmorTrimMeta (copy), getArmorTrimEffect (copy), ReplicatedStorage (copy), ArmorTrimEffectType (copy), CollectionService (copy), humanoidAttachments (copy)
    local tier = ArmorTrimEffectRankMeta[p29].tier;
    local effects = ArmorTrimMeta[p27].effects;
    local v31;

    if effects == nil then
        v31 = effects;
    else
        v31 = effects.definition;
    end;

    if p30 == nil then
        if v31 == nil then
            p30 = nil;
        else
            p30 = getArmorTrimEffect(v31, p28);
        end;
    end;

    local v32 = nil;
    local v33 = effects and p30 and table.find(effects.tierOverrides, p29) ~= nil;

    if v33 then
        v32 = ReplicatedStorage.Assets.ArmorTrimEffects:FindFirstChild(p30);

        if v32 ~= nil then
            v32 = v32:FindFirstChild(tier);
        end;
    end;

    if v32 == nil then
        v32 = ReplicatedStorage.Assets.ArmorTrimEffects:FindFirstChild(ArmorTrimEffectType.DEFAULT);

        if v32 ~= nil then
            v32 = v32:FindFirstChild(tier);
        end;
    end;

    if not v32 then
        return nil;
    end;

    local function _(p34) -- Line: 125
        return p34:IsA("BasePart");
    end;

    local v35 = 0;
    local v36 = {};

    for i, child in u26:GetChildren() do
        local _ = i - 1;

        if child:IsA("BasePart") == true then
            v35 = v35 + 1;
            v36[v35] = child;
        end;
    end;

    local function _(p37) -- Line: 138
        return p37.Name;
    end;

    local u38 = table.create(#v36);

    for i, v in v36 do
        local _ = i - 1;
        u38[i] = v.Name;
    end;

    local v39 = v32:GetDescendants();

    local function v59(p40) -- Line: 149
        -- upvalues: u38 (copy), u26 (copy), CollectionService (ref), humanoidAttachments (ref)
        local function _(p41) -- Line: 151
            return p41:IsA("ParticleEmitter");
        end;

        local v42 = nil;

        for i, child in p40:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") == true then
                v42 = child;
                break;
            end;
        end;

        if v42 == nil then
            local v43 = (p40:IsA("ParticleEmitter") or p40:IsA("Beam")) and p40.Parent and table.find(u38, p40.Parent.Name) ~= nil;

            if v43 then
                local v44 = p40:Clone();
                v44.Parent = u26:FindFirstChild(p40.Parent.Name);
                CollectionService:AddTag(v44, "FirstPersonHidden");

                if v44:IsA("Beam") then
                    local Attachment0 = v44.Attachment0;
                    local Attachment1 = v44.Attachment1;
                    local v45;

                    if Attachment0 then
                        local v46;

                        if Attachment0 == nil then
                            v46 = Attachment0;
                        else
                            v46 = Attachment0.Name;
                        end;

                        v45 = not (humanoidAttachments[v46] ~= nil);
                    else
                        v45 = Attachment0;
                    end;

                    if v45 then
                        local v47 = Attachment0:Clone();
                        v47.Parent = v44.Parent;
                        v44.Attachment0 = v47;
                    end;

                    local v48;

                    if Attachment1 then
                        local v49;

                        if Attachment1 == nil then
                            v49 = Attachment1;
                        else
                            v49 = Attachment1.Name;
                        end;

                        v48 = not (humanoidAttachments[v49] ~= nil);
                    else
                        v48 = Attachment1;
                    end;

                    if v48 then
                        local v50 = Attachment1:Clone();
                        v50.Parent = v44.Parent;
                        v44.Attachment1 = v50;
                    end;
                end;
            end;
        else
            local v51 = p40;

            while p40 and table.find(u38, p40.Name) == nil do
                v51 = p40;
                p40 = p40.Parent;
            end;

            if p40 and table.find(u38, v51.Name) == nil then
                if v51:IsA("Attachment") then
                    local v52 = v51:Clone();
                    v52.Parent = u26:FindFirstChild(p40.Name);

                    local function _(p53) -- Line: 182
                        -- upvalues: CollectionService (ref)
                        if p53:IsA("ParticleEmitter") then
                            CollectionService:AddTag(p53, "FirstPersonHidden");
                        end;
                    end;

                    for i, descendant in v52:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") then
                            CollectionService:AddTag(descendant, "FirstPersonHidden");
                        end;
                    end;

                    return;
                end;

                if v51:IsA("BasePart") then
                    local v54 = u26:FindFirstChild(p40.Name);

                    if not v54 then
                        return nil;
                    end;

                    local v55 = v51:Clone();
                    local Parent = v51.Parent;

                    if not Parent then
                        return nil;
                    end;

                    local v56 = Parent.CFrame * v55.CFrame:Inverse();
                    v55.CFrame = v54.CFrame * v56:Inverse();
                    v55.CanCollide = false;
                    v55.CanQuery = false;
                    v55.CanTouch = false;
                    v55.Transparency = 1;
                    v55.Parent = v54;
                    local v57 = v55:FindFirstChildWhichIsA("WeldConstraint");

                    if v57 then
                        v57.Part0 = v55;
                        v57.Part1 = v54;
                    end;

                    local function _(p58) -- Line: 218
                        -- upvalues: CollectionService (ref)
                        if p58:IsA("ParticleEmitter") then
                            CollectionService:AddTag(p58, "FirstPersonHidden");
                        end;
                    end;

                    for i, descendant in v55:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") then
                            CollectionService:AddTag(descendant, "FirstPersonHidden");
                        end;
                    end;
                end;
            end;
        end;
    end;

    for i, v in v39 do
        v59(v, i - 1, v39);
    end;
end;

function u2.hookArmorTrim(u60) -- Line: 278
    -- upvalues: WatchCharacter (copy), RuntimeLib (copy)
    WatchCharacter(function(u61, u62, p63) -- Line: 279
        -- upvalues: RuntimeLib (ref), u60 (copy)
        if u62:FindFirstChild("Humanoid") then
            u60:attachArmorTrim(u61, u62);

            return;
        end;

        local u64 = RuntimeLib.Promise.new(function() -- Line: 284
            -- upvalues: u62 (copy), u60 (ref), u61 (copy)
            u62:WaitForChild("Humanoid");
            u60:attachArmorTrim(u61, u62);
        end);
        p63:GiveTask(function() -- Line: 288
            -- upvalues: u64 (copy)
            u64:cancel();
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;