-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "ChameleonFruitController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ChameleonFruitController";
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), RuntimeLib (copy), PlayerEntity (copy), Players (copy), KnitClient (copy), EntityUtil (copy), RandomUtil (copy)
    KnitController.KnitStart(u7);
    ClientSyncEvents.ItemConsumed:connect(function(p8) -- Line: 36
        -- upvalues: ItemType (ref), RuntimeLib (ref), PlayerEntity (ref), Players (ref), KnitClient (ref), EntityUtil (ref), u7 (copy), RandomUtil (ref)
        if p8.itemType ~= ItemType.BLOCK_HUNT_CHAMELEON_FRUIT then
            return nil;
        end;

        if not RuntimeLib.instanceof(p8.entity, PlayerEntity) then
            return nil;
        end;

        local v9 = p8.entity:getPlayer();
        local v10 = {};

        for _, v in Players:GetPlayers() do
            local v11 = KnitClient.Controllers.TeamController:getPlayerTeam(v);
            local v12 = KnitClient.Controllers.TeamController:getPlayerTeam(v9);

            if v11 ~= nil then
                v11 = v11.id;
            end;

            if v12 ~= nil then
                v12 = v12.id;
            end;

            if v11 ~= v12 then
                local v13 = EntityUtil:getEntity(v);
                local v14;

                if v13 == nil then
                    v14 = v13;
                else
                    v14 = v13:getInstance();
                end;

                if v14 and v13:isAlive() then
                    v10[v] = true;
                end;
            end;
        end;

        local v15 = 0;
        local v16 = {};

        for i in v10 do
            v15 = v15 + 1;
            v16[v15] = i;
        end;

        u7:disguiseAsPlayer(v9, RandomUtil.fromList(unpack(v16)));
    end);
end;

function u4.disguiseAsPlayer(p17, p18, p19) -- Line: 84
    -- upvalues: KnitClient (copy), u2 (copy), u3 (copy), GameQueryUtil (copy), WeldUtil (copy)
    local Character = p19.Character;

    if not Character then
        return nil;
    end;

    local Character2 = p18.Character;

    if not Character2 then
        return nil;
    end;

    KnitClient.Controllers.BlockDisguiseController:undisguisePlayer(p18);
    local v20 = u2.new();
    local v21 = u3("Folder", {
        Name = "ExtraCharacterParts",
        Parent = Character2
    });
    v20:GiveTask(v21);
    local u22 = u3("Model", {});
    local v23 = Character:GetChildren();

    local function v29(p24) -- Line: 102
        -- upvalues: u22 (copy)
        if p24:IsA("Humanoid") then
            return nil;
        end;

        local v25 = p24:Clone();
        local v26 = v25:GetDescendants();

        local function v28(p27) -- Line: 108
            if p27:FindFirstAncestorWhichIsA("Accessory") then
                return nil;
            end;

            if p27:IsA("Motor6D") then
                p27:Destroy();
            end;

            if p27:IsA("WeldConstraint") then
                p27:Destroy();
            end;

            if p27:IsA("Weld") then
                p27:Destroy();
            end;
        end;

        for i, v in v26 do
            v28(v, i - 1, v26);
        end;

        v25.Parent = u22;
    end;

    for i, v in v23 do
        v29(v, i - 1, v23);
    end;

    u22.PrimaryPart = u22:FindFirstChild("HumanoidRootPart");
    u22:PivotTo(Character2:GetPrimaryPartCFrame());
    local v30 = u22:FindFirstChildOfClass("Humanoid");

    if v30 ~= nil then
        v30:Destroy();
    end;

    local HumanoidRootPart = u22:FindFirstChild("HumanoidRootPart");

    if HumanoidRootPart ~= nil then
        HumanoidRootPart:Destroy();
    end;

    local Animate = u22:FindFirstChild("Animate");

    if Animate ~= nil then
        Animate:Destroy();
    end;

    local v31 = u22:FindFirstAncestorOfClass("BodyColors");

    if v31 ~= nil then
        v31:Destroy();
    end;

    for _, descendant in u22:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Massless = true;
            descendant.CanCollide = false;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    u22.Parent = v21;

    for _, child in Character2:GetChildren() do
        if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
            local v32 = u22:FindFirstChild(child.Name);

            if v32 and v32:IsA("BasePart") then
                for _, descendant in v32:GetDescendants() do
                    if descendant:IsA("Motor6D") and not descendant:FindFirstChildWhichIsA("Accessory") then
                        descendant:Destroy();
                    end;
                end;

                v32.Parent = v21;
                u3("Weld", {
                    Part0 = v32,
                    Part1 = child,
                    Parent = v32
                });
            end;
        end;
    end;

    for _, child in u22:GetChildren() do
        child.Parent = v21;
    end;

    WeldUtil:weldCharacterAccessories(Character2, v21);
end;

KnitClient.CreateController(u4.new());

return nil;