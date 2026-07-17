-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local TeslaTrapBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "tesla-trap-balance").TeslaTrapBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "TeslaTrapController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "TeslaTrapController";
    p8.teslaTrapToTargets = {};
    p8.lastEffectReconcileTime = {};
end;

function u6.KnitStart(u9) -- Line: 42
    -- upvalues: KnitController (copy), default2 (copy), CollectionService (copy)
    KnitController.KnitStart(u9);
    default2.Client:OnEvent("TeslaTrapTargetsChanged", function(p10, p11) -- Line: 44
        -- upvalues: u9 (copy)
        local v12 = {};

        for _, v in p11 do
            v12[v] = true;
        end;

        u9:reconcileEffects(p10, v12);
    end);

    local function _(p13) -- Line: 54
        -- upvalues: u9 (copy)
        return u9:updateTeamIndicator(p13);
    end;

    for i, v in CollectionService:GetTagged("tesla-trap") do
        local _ = i - 1;
        u9:updateTeamIndicator(v);
    end;

    CollectionService:GetInstanceAddedSignal("tesla-trap"):Connect(function(p14) -- Line: 60
        -- upvalues: u9 (copy)
        u9:updateTeamIndicator(p14);
    end);
    CollectionService:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p15) -- Line: 64
        -- upvalues: u9 (copy)
        local v16 = u9.teslaTrapToTargets[p15];

        if v16 == nil then
            return nil;
        end;

        for _, v in v16 do
            v:DoCleaning();
        end;

        u9.teslaTrapToTargets[p15] = nil;
    end);
end;

u6.updateTeamIndicator = RuntimeLib.async(function(p17, p18) -- Line: 76
    -- upvalues: default (copy), ColorUtil (copy), Workspace (copy), TweenService (copy)
    local TeamIndicator = p18:WaitForChild("TeamIndicator", 3);

    if TeamIndicator == nil then
        return nil;
    end;

    local v19 = default(p18);

    if v19 then
        TeamIndicator.Color = ColorUtil.darken(v19.color, 0.25);

        if Workspace:GetServerTimeNow() < p18:GetAttribute("ActivationTime") then
            TweenService:Create(TeamIndicator, TweenInfo.new(p18:GetAttribute("ActivationTime") - Workspace:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Color = ColorUtil.darken(v19.color, 0.8)
            }):Play();

            return;
        end;

        TeamIndicator.Color = v19.color;
    end;
end);

function u6.reconcileEffects(u20, u21, p22) -- Line: 93
    -- upvalues: u2 (copy), TeslaTrapBalance (copy), EntityUtil (copy)
    local u23 = os.clock();
    u20.lastEffectReconcileTime[u21] = u23;
    local v24 = u20.teslaTrapToTargets[u21];
    local v25 = v24 == nil and {} or v24;

    for i, v in v25 do
        if p22[i] == nil then
            v:DoCleaning();
            v25[i] = nil;
        end;
    end;

    local v26 = u2.copy(v25);

    for i in p22 do
        local PrimaryPart = i.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = (PrimaryPart.Position - u21.Position).Magnitude;
        end;

        if (PrimaryPart == nil and 100 or PrimaryPart) <= TeslaTrapBalance.SEARCH_RANGE and v25[i] == nil then
            local v27 = EntityUtil:getEntity(i);

            if v27 ~= nil then
                v27 = v27:isAlive();
            end;

            if v27 then
                v26[i] = u20:createTeslaTrapEffect(u21, i);
            end;
        end;
    end;

    u20.teslaTrapToTargets[u21] = v26;
    task.delay(1, function() -- Line: 142
        -- upvalues: u20 (copy), u21 (copy), u23 (copy)
        if u20.lastEffectReconcileTime[u21] == u23 then
            u20:reconcileEffects(u21, {});
        end;
    end);
end;

function u6.createTeslaTrapEffect(p28, u29, u30) -- Line: 150
    -- upvalues: default (copy), u3 (copy), u4 (copy), RunService (copy), EntityUtil (copy), TeslaTrapBalance (copy), GameSound (copy), Players (copy), SoundManager (copy)
    local BodyFrontAttachment = u30:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");

    if not BodyFrontAttachment then
        error("Could not find targetAttachment");
    end;

    local v31 = default(u29);
    local link = u3.link;
    local SourceAttachment = u29.SourceAttachment;
    local v32;

    if v31 then
        v32 = v31.color;
    else
        v32 = Color3.fromRGB(255, 255, 255);
    end;

    local v33 = link(BodyFrontAttachment, SourceAttachment, v32);
    local u34 = u4.new();

    if v33 then
        u34:GiveTask(v33);
    end;

    u34:GiveTask(RunService.Heartbeat:Connect(function(p35) -- Line: 161
        -- upvalues: EntityUtil (ref), u30 (copy), u34 (copy), BodyFrontAttachment (copy), u29 (copy), TeslaTrapBalance (ref)
        local v36 = EntityUtil:getEntity(u30);

        if v36 ~= nil then
            v36 = v36:isDead();
        end;

        if v36 then
            u34:DoCleaning();
        end;

        if (BodyFrontAttachment.WorldPosition - u29.SourceAttachment.WorldPosition).Magnitude > TeslaTrapBalance.ARC_MAX_ATTACHMENT_DISTANCE then
            u34:DoCleaning();
        end;
    end));
    local TESLA_ZAP = GameSound.TESLA_ZAP;

    if TESLA_ZAP ~= "" and TESLA_ZAP then
        local v37 = {
            looped = true
        };
        local v38;

        if u30 == Players.LocalPlayer.Character then
            v38 = nil;
        else
            v38 = u29.Position;
        end;

        v37.position = v38;
        local u39 = SoundManager:playSound(TESLA_ZAP, v37);

        if u39 then
            u34:GiveTask(function() -- Line: 183
                -- upvalues: u39 (copy)
                local v40 = u39;

                if v40 ~= nil then
                    v40:Stop();
                end;
            end);
        end;
    end;

    return u34;
end;

KnitClient.CreateController(u6.new());

return nil;