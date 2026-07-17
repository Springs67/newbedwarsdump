-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "BaseTutorialController";
    end,

    __index = KnitController
});
v5.__index = v5;

function v5.constructor(p6, p7) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BaseTutorialController";
    p6.sectionMaids = {};
    p6.taskMaids = {};
    p6.assigningSectionGuides = false;
    p6.assigningTaskGuides = false;
    p6.tutorialType = p7;
end;

function v5.KnitStart(u8) -- Line: 37
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u8);
    default.Client:OnEvent("TutorialStart", function(p9) -- Line: 39
        -- upvalues: u8 (copy)
        if p9.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onTutorialStart();
    end);
    default.Client:OnEvent("TutorialEnd", function(p10) -- Line: 45
        -- upvalues: u8 (copy)
        if p10.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onTutorialEnd();
    end);
    default.Client:OnEvent("TutorialSectionStart", function(p11) -- Line: 51
        -- upvalues: u8 (copy)
        if p11.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onSectionStart(p11.sectionId);
        u8.assigningSectionGuides = true;
        u8.sectionMaids[p11.sectionId] = u8:assignSectionGuides(p11.sectionId);
        u8.assigningSectionGuides = false;
    end);
    default.Client:OnEvent("TutorialTasksAssigned", function(p12) -- Line: 63
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref)
        if p12.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        SoundManager:playSound(GameSound.TASK_START, {
            playbackSpeedMultiplier = 1.1,
            volumeMultiplier = 0.8
        });
    end);
    default.Client:OnEvent("TutorialSectionEnd", function(u13) -- Line: 73
        -- upvalues: u8 (copy)
        if u13.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onSectionEnd(u13.sectionId);
        task.spawn(function() -- Line: 78
            -- upvalues: u8 (ref), u13 (copy)
            while u8.assigningSectionGuides do
                task.wait(0.01);
            end;

            local v14 = u8.sectionMaids[u13.sectionId];

            if v14 ~= nil then
                v14:DoCleaning();
            end;
        end);
    end);
    default.Client:OnEvent("TutorialTaskStart", function(p15) -- Line: 90
        -- upvalues: u8 (copy)
        if p15.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onTaskStart(p15.taskId);
        u8.assigningTaskGuides = true;
        u8.taskMaids[p15.taskId] = u8:assignTaskGuides(p15.taskId);
        u8.assigningTaskGuides = false;
    end);
    default.Client:OnEvent("TutorialTaskEnd", function(u16) -- Line: 102
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref)
        if u16.tutorialType ~= u8.tutorialType then
            return nil;
        end;

        u8:onTaskEnd(u16.taskId);
        SoundManager:playSound(GameSound.QUEST_COMPLETE, {
            volumeMultiplier = 0.4
        });
        task.spawn(function() -- Line: 111
            -- upvalues: u8 (ref), u16 (copy)
            while u8.assigningTaskGuides do
                task.wait(0.01);
            end;

            local v17 = u8.taskMaids[u16.taskId];

            if v17 ~= nil then
                v17:DoCleaning();
            end;
        end);
    end);
end;

function v5.createHighlight(p18, p19, p20) -- Line: 124
    -- upvalues: u3 (copy)
    local v21 = {};
    local v22;

    if p20 == nil then
        v22 = p20;
    else
        v22 = p20.name;
    end;

    v21.Name = v22 == nil and "Highlight" or v22;
    v21.Parent = p19;

    if p20 ~= nil then
        p20 = p20.color;
    end;

    if p20 == nil then
        p20 = Color3.fromRGB(0, 237, 255);
    end;

    v21.OutlineColor = p20;
    v21.FillTransparency = 1;
    v21.OutlineTransparency = 0;
    v21.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;

    return u3("Highlight", v21);
end;

function v5.createArrowBeam(p23, p24) -- Line: 152
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), Players (copy)
    local v25 = ReplicatedStorage.Assets.Effects.QueueTutorialBeam:Clone();
    v25.Parent = Workspace;
    v25.Attachment1 = p24;
    v25.Color = ColorSequence.new(Color3.fromRGB(0, 166, 204));
    v25.Transparency = NumberSequence.new(0.2);
    v25.LightEmission = 0.4;
    v25.ZOffset = 0;
    v25.FaceCamera = true;
    v25.TextureSpeed = 1.5;
    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer ~= nil then
        LocalPlayer = LocalPlayer.Character;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
        end;
    end;

    if LocalPlayer then
        v25.Attachment0 = LocalPlayer;

        return v25;
    end;

    warn("Player has no UpperTorso or BodyFrontAttachment");

    return v25;
end;

function v5.setupArrowBeam(u26, u27) -- Line: 177
    -- upvalues: u2 (copy), WatchPlayerCharacter (copy), Players (copy)
    local v28 = u2.new();
    local u29 = u26:createArrowBeam(u27);
    v28:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p30, p31) -- Line: 180
        -- upvalues: u29 (ref), u26 (copy), u27 (copy)
        u29:Destroy();
        u29 = u26:createArrowBeam(u27);
    end));
    v28:GiveTask(function() -- Line: 184
        -- upvalues: u29 (ref)
        u29:Destroy();
    end);

    return v28;
end;

function v5.highlightSlotWithItem(p32, u33) -- Line: 189
    -- upvalues: u2 (copy), ClientStore (copy), Players (copy)
    local v34 = u2.new();
    local hotbar = ClientStore:getState().Inventory.observedInventory.hotbar;

    local function _(p35) -- Line: 193
        -- upvalues: u33 (copy)
        local item = p35.item;

        if item ~= nil then
            item = item.itemType;
        end;

        return item == u33;
    end;

    local v36 = nil;

    for i, v in hotbar do
        local _ = i - 1;
        local item = v.item;

        if item ~= nil then
            item = item.itemType;
        end;

        if item == u33 == true then
            v36 = v;
            break;
        end;
    end;

    if not v36 then
        warn("No item slot found: " .. u33);

        return nil;
    end;

    local v37 = (table.find(hotbar, v36) or 0) - 1;
    Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", v37);
    v34:GiveTask(function() -- Line: 216
        -- upvalues: Players (ref)
        Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil);
    end);

    return v34;
end;

function v5.highlightTeamUpgradeButton(p38) -- Line: 221
    -- upvalues: u2 (copy), Players (copy)
    local v39 = u2.new();
    Players.LocalPlayer:SetAttribute("TutorialHighlightedUpgrade", true);
    v39:GiveTask(function() -- Line: 224
        -- upvalues: Players (ref)
        Players.LocalPlayer:SetAttribute("TutorialHighlightedUpgrade", false);
    end);

    return v39;
end;

function v5.highlightBlockPosition(p40, p41, p42) -- Line: 229
    -- upvalues: u2 (copy), u3 (copy), Workspace (copy), BLOCK_SIZE (copy), BlockEngine (copy)
    local v43 = u2.new();
    local u44 = u3("Part", {
        Name = "TutorialSpacePart",
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Transparency = 1,
        Parent = Workspace,
        Size = Vector3.new(BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE),
        Position = BlockEngine:getWorldPosition(BlockEngine:snapPosition(p41)),
        Material = Enum.Material.Glass
    });
    local u45 = p40:createHighlight(u44, {
        name = "SpaceHighlight"
    });

    if p42 then
        local u46 = p40:setupArrowBeam((u3("Attachment", {
            Parent = u44
        })));
        v43:GiveTask(function() -- Line: 251
            -- upvalues: u46 (copy)
            u46:DoCleaning();
        end);
    end;

    v43:GiveTask(function() -- Line: 255
        -- upvalues: u44 (copy), u45 (copy)
        u44:Destroy();
        u45:Destroy();
    end);

    return v43;
end;

return {
    BaseTutorialController = v5
};