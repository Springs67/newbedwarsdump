-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u5 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local PIRATE_TELESCOPE_RANGE = BalanceFile.PIRATE_TELESCOPE_RANGE;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "PirateTelescopeService";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "PirateTelescopeService";
    p8.abilityMaid = u1.new();
end;

function u6.isRelevantItem(p9, p10) -- Line: 46
    -- upvalues: ItemType (copy)
    return p10.itemType == ItemType.PIRATE_TELESCOPE;
end;

function u6.onEnable(p11, p12, p13) -- Line: 49
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    p11:setupDestroyableYield(function() -- Line: 50
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref)
        local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local PIRATE_TELESCOPE = AbilityId.PIRATE_TELESCOPE;
        local v15 = {};
        local v16 = {};
        local image = getItemMeta(ItemType.PIRATE_TELESCOPE).image;
        v16.icon = image == nil and "" or image;
        v15.abilityButton = v16;
        v15.abilityType = "ItemPrimary";

        return v14:enableAbility(PIRATE_TELESCOPE, v15):expect();
    end);
end;

function u6.onDisable(p17) -- Line: 67
    p17.abilityMaid:DoCleaning();
end;

function u6.KnitStart(u18) -- Line: 70
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    HandKnitController.KnitStart(u18);
    ClientSyncEvents.AbilityUsed:connect(function(p19) -- Line: 72
        -- upvalues: AbilityId (ref), Players (ref), default (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v20;

        if p19.ability == AbilityId.PIRATE_TELESCOPE and p19.userCharacter == Players.LocalPlayer.Character then
            v20 = default.Client:Get("PirateTelescopeAura"):CallServer();
        else
            v20 = false;
        end;

        local v21 = v20 and Players:GetPlayerFromCharacter(p19.userCharacter);

        if v21 then
            local u22 = AnimationUtil:playAnimation(v21, GameAnimationUtil:getAssetId(AnimationType.BOBA_BLASTER_IDLE));
            task.delay(1, function() -- Line: 81
                -- upvalues: u22 (copy)
                local v23 = u22;

                if v23 ~= nil then
                    v23:Stop();
                end;

                local v24 = u22;

                if v24 ~= nil then
                    v24:Destroy();
                end;
            end);
        end;
    end);
    default.Client:Get("PlayTelescopeEffect"):Connect(function(p25) -- Line: 94
        -- upvalues: u18 (copy)
        u18:createRadius(p25.player);
    end);
end;

function u6.createRadius(p26, p27) -- Line: 98
    -- upvalues: EntityUtil (copy), Workspace (copy), u2 (copy), RunService (copy), TweenService (copy), u4 (copy), PIRATE_TELESCOPE_RANGE (copy), u5 (copy)
    local Team = p27.Team;

    if Team ~= nil then
        Team = Team.TeamColor.Color;
    end;

    local u28 = EntityUtil:getEntity(p27);
    local Character = p27.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame().Position;
    end;

    if not Character then
        return nil;
    end;

    local u29 = u2("Part", {
        Size = Vector3.new(0.2, 0, 0),
        Parent = Workspace,
        CFrame = CFrame.new(Character) - Vector3.new(0, 2, 0),
        Orientation = Vector3.new(0, 0, 90),
        Shape = Enum.PartType.Cylinder,
        Color = Team,
        Transparency = 0,
        CastShadow = false,
        Material = Enum.Material.ForceField,
        Reflectance = 0,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false
    });
    RunService.Heartbeat:Connect(function() -- Line: 133
        -- upvalues: u29 (copy), u28 (copy)
        local v30 = u29;

        if v30 then
            v30 = u28;

            if v30 ~= nil then
                v30 = v30:isAlive();
            end;

            if v30 then
                v30 = u28:getInstance():GetPrimaryPartCFrame().Position;
            end;
        end;

        if not v30 then
            return nil;
        end;

        u29.Position = u28:getInstance():GetPrimaryPartCFrame().Position - Vector3.new(0, 2, 0);
    end);
    local v31 = TweenService:Create(u29, u4, {
        Size = Vector3.new(0.2, PIRATE_TELESCOPE_RANGE, PIRATE_TELESCOPE_RANGE)
    });
    v31:Play();
    local u32 = nil;
    u32 = v31.Completed:Connect(function() -- Line: 158
        -- upvalues: TweenService (ref), u29 (copy), u5 (ref), PIRATE_TELESCOPE_RANGE (ref), u32 (ref)
        TweenService:Create(u29, u5, {
            Size = Vector3.new(0.2, PIRATE_TELESCOPE_RANGE, PIRATE_TELESCOPE_RANGE),
            Position = Vector3.new(u29.Position.X, u29.Position.Y + 0.1 + 0.1, u29.Position.Z)
        }):Play();
        u32:Disconnect();
        u29:Destroy();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;