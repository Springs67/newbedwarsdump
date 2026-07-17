-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "SpiritGardenerBuffsStatusEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SpiritGardenerBuffsStatusEffectController";
    p6.highlightFlowerMap = {};
end;

function u4.KnitStart(u7) -- Line: 39
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), StatusEffectType (copy), ClientStatusEffectHandler (copy), Players (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), WeldUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u7);
    default.Client:Get("SpiritGardenerFlowerHighlight"):Connect(function(p8) -- Line: 41
        -- upvalues: u7 (copy)
        if not p8.removeHighlight then
            local v9 = u7:highlightFlower(p8.flower);
            u7.highlightFlowerMap[p8.flower] = v9;

            return;
        end;

        local v10 = u7.highlightFlowerMap[p8.flower];

        if v10 ~= nil then
            v10:DoCleaning();
        end;

        u7.highlightFlowerMap[p8.flower] = nil;
    end);
    local StatusEffectController = KnitClient.Controllers.StatusEffectController;
    local SPIRIT_GARDENER_SOULVINE_BUFF = StatusEffectType.SPIRIT_GARDENER_SOULVINE_BUFF;
    local u11 = ClientStatusEffectHandler;
    local u12 = setmetatable({}, {
        __tostring = function() -- Line: 65, Name: __tostring
            return "Anonymous";
        end,

        __index = u11
    });
    u12.__index = u12;

    function u12.new(...) -- Line: 71
        -- upvalues: u12 (ref)
        local v13 = setmetatable({}, u12);

        return v13:constructor(...) or v13;
    end;

    function u12.constructor(p14, ...) -- Line: 75
        -- upvalues: u11 (copy)
        u11.constructor(p14, ...);
    end;

    function u12.onApply(p15, p16, p17) -- Line: 78
        -- upvalues: Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), ReplicatedStorage (ref), CollectionService (ref), Workspace (ref), WeldUtil (ref), SoundManager (ref), GameSound (ref)
        if p16.PrimaryPart == nil then
            return nil;
        end;

        local v18 = p16 == Players.LocalPlayer.Character;
        local grove = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p16)].grove;
        local u19;

        if grove then
            u19 = grove.buffEffect:Clone();
        else
            u19 = ReplicatedStorage.Assets.Effects.SoulvineBuffEffect:Clone();
        end;

        if not p16 then
            return nil;
        end;

        local v20 = u19:GetDescendants();

        local function v22(p21) -- Line: 96
            -- upvalues: CollectionService (ref)
            if p21:IsA("ParticleEmitter") then
                p21:SetAttribute("FirstPersonVisible", false);
                CollectionService:AddTag(p21, "FirstPersonHidden");
            end;

            if p21:IsA("Beam") then
                p21:SetAttribute("FirstPersonVisible", false);
                CollectionService:AddTag(p21, "FirstPersonHidden");
            end;
        end;

        for i, v in v20 do
            v22(v, i - 1, v20);
        end;

        u19.Parent = Workspace;
        u19.Massless = true;
        u19.CFrame = p16.HumanoidRootPart.CFrame;
        local u23 = WeldUtil:weldParts(p16.HumanoidRootPart, u19);
        local SPIRIT_GARDENER_BUFF_APPLIED = GameSound.SPIRIT_GARDENER_BUFF_APPLIED;
        local v24 = {};
        local v25;

        if v18 then
            v25 = nil;
        else
            v25 = p16.PrimaryPart.Position;
        end;

        v24.position = v25;
        local v26;

        if v18 then
            v26 = nil;
        else
            v26 = p16.PrimaryPart;
        end;

        v24.parent = v26;
        local u27 = SoundManager:playSound(SPIRIT_GARDENER_BUFF_APPLIED, v24);
        p15.maid:GiveTask(function() -- Line: 117
            -- upvalues: u27 (copy), u19 (ref), u23 (copy)
            local v28 = u27;

            if v28 ~= nil then
                v28:Stop();
            end;

            local v29 = u19;

            if v29 ~= nil then
                v29:Destroy();
            end;

            local v30 = u23;

            if v30 ~= nil then
                v30:Destroy();
            end;
        end);
    end;

    function u12.onRemove(p31, p32, p33) -- Line: 132
    end;

    StatusEffectController:setHandler(SPIRIT_GARDENER_SOULVINE_BUFF, u12);
    local StatusEffectController2 = KnitClient.Controllers.StatusEffectController;
    local SPIRIT_GARDENER_TEARBLOOM_BUFF = StatusEffectType.SPIRIT_GARDENER_TEARBLOOM_BUFF;
    local u34 = ClientStatusEffectHandler;
    local u35 = setmetatable({}, {
        __tostring = function() -- Line: 142, Name: __tostring
            return "Anonymous";
        end,

        __index = u34
    });
    u35.__index = u35;

    function u35.new(...) -- Line: 148
        -- upvalues: u35 (ref)
        local v36 = setmetatable({}, u35);

        return v36:constructor(...) or v36;
    end;

    function u35.constructor(p37, ...) -- Line: 152
        -- upvalues: u34 (copy)
        u34.constructor(p37, ...);
    end;

    function u35.onApply(p38, p39, p40) -- Line: 155
        -- upvalues: Players (ref), ReplicatedStorage (ref), CollectionService (ref), Workspace (ref), WeldUtil (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
        if p39.PrimaryPart == nil then
            return nil;
        end;

        local v41 = p39 == Players.LocalPlayer.Character;
        local u42 = ReplicatedStorage.Assets.Effects.TearbloomBuffEffect:Clone();

        if not p39 then
            return nil;
        end;

        local v43 = u42:GetDescendants();

        local function v45(p44) -- Line: 166
            -- upvalues: CollectionService (ref)
            if p44:IsA("ParticleEmitter") then
                p44:SetAttribute("FirstPersonVisible", false);
                CollectionService:AddTag(p44, "FirstPersonHidden");
            end;

            if p44:IsA("Beam") then
                p44:SetAttribute("FirstPersonVisible", false);
                CollectionService:AddTag(p44, "FirstPersonHidden");
            end;
        end;

        for i, v in v43 do
            v45(v, i - 1, v43);
        end;

        u42.Parent = Workspace;
        u42.Massless = true;
        u42.CFrame = p39.HumanoidRootPart.CFrame;
        local u46 = WeldUtil:weldParts(p39.HumanoidRootPart, u42);
        local SPIRIT_GARDENER_BUFF_APPLIED = GameSound.SPIRIT_GARDENER_BUFF_APPLIED;
        local grove = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p39)].grove;

        if grove then
            SPIRIT_GARDENER_BUFF_APPLIED = grove.buffAppliedSound;
        end;

        local v47 = {};
        local v48;

        if v41 then
            v48 = nil;
        else
            v48 = p39.PrimaryPart.Position;
        end;

        v47.position = v48;
        local v49;

        if v41 then
            v49 = nil;
        else
            v49 = p39.PrimaryPart;
        end;

        v47.parent = v49;
        local u50 = SoundManager:playSound(SPIRIT_GARDENER_BUFF_APPLIED, v47);
        p38.maid:GiveTask(function() -- Line: 193
            -- upvalues: u50 (copy), u42 (copy), u46 (copy)
            local v51 = u50;

            if v51 ~= nil then
                v51:Stop();
            end;

            u42:Destroy();
            local v52 = u46;

            if v52 ~= nil then
                v52:Destroy();
            end;
        end);
    end;

    function u35.onRemove(p53, p54, p55) -- Line: 205
    end;

    StatusEffectController2:setHandler(SPIRIT_GARDENER_TEARBLOOM_BUFF, u35);
end;

function u4.highlightFlower(p56, u57) -- Line: 210
    -- upvalues: u1 (copy), u2 (copy), TweenService (copy)
    local v58 = u57:GetAttribute("CurrentStage");
    local v59;

    if v58 == 2 then
        v59 = u57:WaitForChild("stage_2"):WaitForChild("MainPart");
    else
        v59 = nil;
    end;

    if v58 == 3 then
        v59 = u57:WaitForChild("stage_3"):WaitForChild("MainPart");
    end;

    local v60 = u1.new();
    local u61 = u2("Highlight", {
        Name = "SpiritGardenerFlowerHighlight",
        FillTransparency = 0.9,
        OutlineTransparency = 1,
        FillColor = Color3.fromRGB(164, 7, 255),
        OutlineColor = Color3.fromRGB(33, 207, 255),
        Parent = v59,
        DepthMode = Enum.HighlightDepthMode.Occluded
    });
    TweenService:Create(u61, TweenInfo.new(1), {
        OutlineTransparency = 0.4
    }):Play();
    local u62 = u57:GetAttributeChangedSignal("CurrentStage"):Connect(function() -- Line: 232
        -- upvalues: u57 (copy), u61 (copy)
        if u57:GetAttribute("CurrentStage") == 2 then
            u61.Parent = u57:WaitForChild("stage_2"):WaitForChild("MainPart", 5);
        end;

        if u57:GetAttribute("CurrentStage") == 3 then
            u61.Parent = u57:WaitForChild("stage_3"):WaitForChild("MainPart", 5);
        end;
    end);
    v60:GiveTask(function() -- Line: 240
        -- upvalues: TweenService (ref), u61 (copy), u62 (copy)
        local v63 = TweenService:Create(u61, TweenInfo.new(1), {
            OutlineTransparency = 1
        });
        v63:Play();
        v63.Completed:Connect(function() -- Line: 245
            -- upvalues: u61 (ref)
            u61:Destroy();
        end);
        u62:Disconnect();
    end);

    return v60;
end;

KnitClient.CreateController(u4.new());

return nil;