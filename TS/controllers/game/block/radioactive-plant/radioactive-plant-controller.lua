-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local TweenService = v5.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local RadioactivePlantBillboard = RuntimeLib.import(script, script.Parent, "radioactive-plant-billboard").RadioactivePlantBillboard;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "RadioactivePlantController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "RadioactivePlantController";
    p8.radioactivePlantTargets = {};
    p8.lastEffectReconcileTime = {};
    p8.billboardMap = {};
    p8.originalNeonPartColors = {};
end;

function u6.KnitStart(u9) -- Line: 43
    -- upvalues: KnitController (copy), default2 (copy), CollectionService (copy), u4 (copy), RadioactivePlantBillboard (copy)
    KnitController.KnitStart(u9);
    default2.Client:OnEvent("RadioactivePlantTargetsChanged", function(p10) -- Line: 45
        -- upvalues: u9 (copy)
        local radioactivePlant = p10.radioactivePlant;
        local v11 = {};

        for _, v in p10.targets do
            v11[v] = true;
        end;

        u9:reconcileEffects(radioactivePlant, v11);
    end);

    local function _(p12) -- Line: 55
        -- upvalues: u9 (copy)
        return u9:updateTeamIndicator(p12);
    end;

    for i, v in CollectionService:GetTagged("radioactive-plant") do
        local _ = i - 1;
        u9:updateTeamIndicator(v);
    end;

    CollectionService:GetInstanceAddedSignal("radioactive-plant"):Connect(function(u13) -- Line: 61
        -- upvalues: u9 (copy), u4 (ref), RadioactivePlantBillboard (ref)
        u9:updateTeamIndicator(u13);
        local v14 = u13:GetAttribute("Enabled");

        if v14 ~= nil then
            u9:handleEnabledEffects(u13, v14);
        end;

        local v15 = u4.mount(u4.createElement(RadioactivePlantBillboard, {
            radioactivePlantInstance = u13
        }), u13);
        u9.billboardMap[u13] = v15;
        u13:GetAttributeChangedSignal("Enabled"):Connect(function() -- Line: 74
            -- upvalues: u13 (copy), u9 (ref)
            local v16 = u13:GetAttribute("Enabled");

            if v16 ~= nil then
                u9:handleEnabledEffects(u13, v16);
            end;
        end);
        u13:GetAttributeChangedSignal("IronDeposits"):Connect(function() -- Line: 80
            -- upvalues: u9 (ref), u13 (copy)
            u9:updateGroundSize(u13);
        end);
        u13:GetAttributeChangedSignal("DiamondDeposits"):Connect(function() -- Line: 83
            -- upvalues: u9 (ref), u13 (copy)
            u9:updateGroundSize(u13);
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("radioactive-plant"):Connect(function(p17) -- Line: 87
        -- upvalues: u9 (copy), u4 (ref)
        local v18 = u9.radioactivePlantTargets[p17];

        if v18 == nil then
            return nil;
        end;

        for _, v in v18 do
            v:DoCleaning();
        end;

        local v19 = u9.billboardMap[p17];

        if v19 then
            u4.unmount(v19);
            u9.billboardMap[p17] = nil;
        end;

        u9.radioactivePlantTargets[p17] = nil;
    end);
end;

function u6.handleEnabledEffects(u20, p21, u22) -- Line: 105
    -- upvalues: ColorUtil (copy), TweenService (copy)
    local function _(p23) -- Line: 108
        return p23:IsA("MeshPart");
    end;

    local v24 = 0;
    local v25 = {};

    for i, descendant in p21:WaitForChild("NeonParts", 3):GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") == true then
            v24 = v24 + 1;
            v25[v24] = descendant;
        end;
    end;

    local Ground = p21:FindFirstChild("Ground");

    if Ground ~= nil then
        local function _(p26) -- Line: 125
            -- upvalues: u22 (copy)
            if p26:IsA("ParticleEmitter") then
                p26.Enabled = u22;
            end;
        end;

        for i, descendant in Ground:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = u22;
            end;
        end;

        Ground = nil;
    end;

    local function v32(p27) -- Line: 136
        -- upvalues: u20 (copy), u22 (copy), ColorUtil (ref), TweenService (ref)
        if not u20.originalNeonPartColors[p27] then
            u20.originalNeonPartColors[p27] = p27.Color;
        end;

        if u22 then
            local v28 = u20.originalNeonPartColors[p27];

            if v28 ~= nil then
                local v29 = ColorUtil.brighten(v28, 0.05);
                TweenService:Create(p27, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Color = v29
                }):Play();
                p27.Color = v29;
            end;
        else
            local v30 = u20.originalNeonPartColors[p27];

            if v30 ~= nil then
                local v31 = ColorUtil.darken(v30, 0.85);
                TweenService:Create(p27, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Color = v31
                }):Play();
                p27.Color = v31;
            end;
        end;
    end;

    for i, v in v25 do
        v32(v, i - 1, v25);
    end;
end;

u6.updateTeamIndicator = RuntimeLib.async(function(p33, p34) -- Line: 174
    -- upvalues: default (copy)
    local TeamIndicator = p34:WaitForChild("TeamIndicator", 3);

    if TeamIndicator == nil then
        return nil;
    end;

    local v35 = default(p34);

    if v35 then
        TeamIndicator.Color = v35.color;
    end;
end);

function u6.updateGroundSize(p36, p37) -- Line: 184
    -- upvalues: BalanceFile (copy)
    local Ground = p37:FindFirstChild("Ground");
    local v38 = p37:GetAttribute("CurrentRange");
    local v39;

    if v38 == 0 or (v38 ~= v38 or not v38) then
        v39 = BalanceFile.RADIOACTIVE_PLANT_IRON_AOE_RANGE;
    else
        v39 = p37:GetAttribute("CurrentRange");
    end;

    Ground.Size = Vector3.new(v39, Ground.Size.Y, v39);
end;

function u6.reconcileEffects(u40, u41, p42) -- Line: 190
    -- upvalues: u2 (copy), BalanceFile (copy), EntityUtil (copy)
    local u43 = os.clock();
    u40.lastEffectReconcileTime[u41] = u43;
    local v44 = u40.radioactivePlantTargets[u41];
    local v45 = v44 == nil and {} or v44;

    for i, v in v45 do
        if p42[i] == nil then
            v:DoCleaning();
            v45[i] = nil;
        end;
    end;

    local v46 = u2.copy(v45);

    for i in p42 do
        if v45[i] == nil then
            local v47 = u41:GetAttribute("CurrentRange");
            local v48;

            if v47 == 0 or (v47 ~= v47 or not v47) then
                v48 = BalanceFile.RADIOACTIVE_PLANT_IRON_AOE_RANGE;
            else
                v48 = u41:GetAttribute("CurrentRange");
            end;

            local PrimaryPart = i.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = (PrimaryPart.Position - u41.Position).Magnitude;
            end;

            if v48 >= (PrimaryPart == nil and 100 or PrimaryPart) then
                local v49 = EntityUtil:getEntity(i);

                if v49 ~= nil then
                    v49 = v49:isAlive();
                end;

                if v49 then
                    v46[i] = u40:createRadioactivePlantEffect(u41, i);
                end;
            end;
        end;
    end;

    u40.radioactivePlantTargets[u41] = v46;
    task.delay(1, function() -- Line: 241
        -- upvalues: u40 (copy), u41 (copy), u43 (copy)
        if u40.lastEffectReconcileTime[u41] == u43 then
            u40:reconcileEffects(u41, {});
        end;
    end);
end;

function u6.createRadioactivePlantEffect(p50, p51, p52) -- Line: 249
    -- upvalues: u3 (copy), Players (copy), SoundManager (copy), GameSound (copy)
    local v53 = u3.new();
    local RADIOACTIVE_PLANT_AOE_LOOP = GameSound.RADIOACTIVE_PLANT_AOE_LOOP;
    local v54 = {
        volumeMultiplier = 1.2,
        looped = true
    };
    local v55;

    if p52 == Players.LocalPlayer.Character then
        v55 = nil;
    else
        v55 = p51.Position;
    end;

    v54.position = v55;
    local u56 = SoundManager:playSound(RADIOACTIVE_PLANT_AOE_LOOP, v54);

    if u56 then
        v53:GiveTask(function() -- Line: 258
            -- upvalues: u56 (copy)
            local v57 = u56;

            if v57 ~= nil then
                v57:Stop();
            end;
        end);
    end;

    return v53;
end;

KnitClient.CreateController(u6.new());

return nil;