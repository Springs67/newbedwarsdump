-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local v3 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v3.InteractionCategory;
local InteractionPriority = v3.InteractionPriority;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "RoyaleBedController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.BATTLE_ROYALE });
    p6.Name = "RoyaleBedController";
    p6.bedSet = {};
    p6.ghostTeammate = {};
end;

function u4.KnitStart(p7) -- Line: 36
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 39
    -- upvalues: WatchCollectionTag (copy), Players (copy), KnitClient (copy), CollectionService (copy), default (copy)
    u8:initPrompt();
    WatchCollectionTag("royale-bed", function(p9) -- Line: 41
        -- upvalues: u8 (copy), Players (ref), KnitClient (ref), CollectionService (ref)
        u8.bedSet[p9] = true;
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetAttribute("GhostForm");
        end;

        if Character == 0 or (Character ~= Character or (Character == "" or not Character)) then
            local v10 = not KnitClient.Controllers.BattleRotaleGhostController:isLocalGhost();

            if v10 then
                local v11 = 0;

                for _ in u8.ghostTeammate do
                    v11 = v11 + 1;
                end;

                if v11 > 0 then
                    v10 = true;
                else
                    v10 = false;
                end;
            end;

            if v10 then
                CollectionService:AddTag(p9, "revive-bed");
            end;
        end;
    end);
    WatchCollectionTag("ghost-player", function(p12) -- Line: 65
        -- upvalues: Players (ref), u8 (copy)
        local v13 = Players:GetPlayerByUserId(p12:GetAttribute("PlayerID"));

        if v13 then
            if v13 == Players.LocalPlayer or v13.Team ~= Players.LocalPlayer.Team then
                return nil;
            end;

            u8.ghostTeammate[v13] = true;
            u8:enableAllPrompts();
        end;
    end);
    default.Client:Get("ReviveEffect"):Connect(function(p14) -- Line: 75
        -- upvalues: u8 (copy)
        if u8.ghostTeammate[p14.player] ~= nil then
            u8.ghostTeammate[p14.player] = nil;
            local v15 = 0;

            for _ in u8.ghostTeammate do
                v15 = v15 + 1;
            end;

            if v15 == 0 then
                u8:disableAllPrompts();
            end;
        end;
    end);
    default.Client:Get("BeconeGhost"):Connect(function(p16) -- Line: 93
        -- upvalues: u8 (copy)
        u8:disableAllPrompts();
    end);
end;

function u4.initPrompt(p17) -- Line: 97
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), default (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Bed",
        interactionObjectText = "Revive Your Teammates!",
        interactionTag = "revive-bed",
        maxActivationDistance = 20,
        removePromptOnInteract = false,
        holdDuration = 8,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.OTHER,
        category = InteractionCategory.OTHER,
        KeyCode = Enum.KeyCode.R,

        onInteracted = function(p18, p19, p20) -- Line: 109, Name: onInteracted
            -- upvalues: default (ref)
            default.Client:Get("BedRevive"):SendToServer({
                bedPosition = p19.Position
            });
        end
    });
end;

function u4.enableAllPrompts(p21) -- Line: 117
    -- upvalues: Players (copy), CollectionService (copy)
    local v22 = 0;

    for _ in p21.ghostTeammate do
        v22 = v22 + 1;
    end;

    if v22 == 0 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetAttribute("GhostForm");
    end;

    if Character ~= 0 and (Character == Character and (Character ~= "" and Character)) then
        return nil;
    end;

    local function _(p23) -- Line: 135
        -- upvalues: CollectionService (ref)
        CollectionService:AddTag(p23, "revive-bed");
        local Part = p23:WaitForChild("Part", 3);

        if Part ~= nil then
            Part = Part:FindFirstChildOfClass("BillboardGui");
        end;

        if Part then
            Part.Enabled = true;
        end;
    end;

    for i in p21.bedSet do
        CollectionService:AddTag(i, "revive-bed");
        local Part = i:WaitForChild("Part", 3);

        if Part ~= nil then
            Part = Part:FindFirstChildOfClass("BillboardGui");
        end;

        if Part then
            Part.Enabled = true;
        end;
    end;
end;

function u4.disableAllPrompts(p24) -- Line: 150
    -- upvalues: CollectionService (copy)
    local function _(p25) -- Line: 152
        -- upvalues: CollectionService (ref)
        CollectionService:RemoveTag(p25, "revive-bed");
        local Part = p25:WaitForChild("Part", 3);

        if Part ~= nil then
            Part = Part:FindFirstChildOfClass("BillboardGui");
        end;

        if Part then
            Part.Enabled = false;
        end;
    end;

    for i in p24.bedSet do
        CollectionService:RemoveTag(i, "revive-bed");
        local Part = i:WaitForChild("Part", 3);

        if Part ~= nil then
            Part = Part:FindFirstChildOfClass("BillboardGui");
        end;

        if Part then
            Part.Enabled = false;
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;