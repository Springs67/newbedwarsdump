-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "partcache", "out");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "PlayerBlockCollisionController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 35
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p8);
    p8.Name = "PlayerBlockCollisionController";
    p8.renderedBlockers = {};
    p8.maid = u2.new();
    p8.blockerFolder = nil;
    p8.blockerPartCache = nil;
    p8.lastPlayerBlockPosition = nil;
    p8.forceUpdateBlockers = false;
end;

function u6.KnitStart(u9) -- Line: 45
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy), BLOCK_SIZE (copy), CollectionService (copy), GameQueryUtil (copy), u4 (copy), RunService (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u9);
    u9.blockerFolder = u3("Folder", {
        Name = "Blockers",
        Parent = Workspace
    });
    u9.maid:GiveTask(function() -- Line: 51
        -- upvalues: u9 (copy)
        local blockerFolder = u9.blockerFolder;

        if blockerFolder ~= nil then
            blockerFolder:Destroy();
        end;
    end);
    local v10 = u3("Part", {
        Name = "BlockerPart",
        Transparency = 1,
        CanTouch = false,
        CanCollide = true,
        CanQuery = false,
        Size = Vector3.new(BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE)
    });
    CollectionService:AddTag(v10, "block:no-collision");
    CollectionService:AddTag(v10, "DontBlockSwordRaycast");
    CollectionService:AddTag(v10, "ProjectilesIgnore");
    v10:SetAttribute("BlockEngine_Select_IgnorePlaceMode", true);
    GameQueryUtil:setQueryIgnored(v10, true);
    u9.blockerPartCache = u4.new(v10, 16);
    u9.blockerPartCache:SetCacheParent(u9.blockerFolder);
    u9.maid:GiveTask(function() -- Line: 72
        -- upvalues: u9 (copy)
        local blockerPartCache = u9.blockerPartCache;

        if blockerPartCache ~= nil then
            blockerPartCache:Dispose();
        end;
    end);
    u9.maid:GiveTask(RunService.Stepped:Connect(function() -- Line: 78
        -- upvalues: u9 (copy)
        u9:updateBlockers();
    end));
    u9.maid:GiveTask(WatchCollectionTag("block", function(p11) -- Line: 81
        -- upvalues: u9 (copy)
        u9.forceUpdateBlockers = true;
    end));
    u9.maid:GiveTask(CollectionService:GetInstanceRemovedSignal("block"):Connect(function(p12) -- Line: 84
        -- upvalues: u9 (copy)
        u9.forceUpdateBlockers = true;
    end));
end;

function u6.updateBlockers(u13) -- Line: 88
    -- upvalues: Players (copy), BlockEngine (copy), CharacterUtil (copy)
    local Character = Players.LocalPlayer.Character;
    local v14;

    if Character == nil then
        v14 = Character;
    else
        v14 = Character.PrimaryPart;
    end;

    if not v14 then
        return nil;
    end;

    local v15 = BlockEngine:getBlockPosition(Character.PrimaryPart.Position);

    if u13.lastPlayerBlockPosition == v15 and not u13.forceUpdateBlockers then
        return nil;
    end;

    u13.lastPlayerBlockPosition = v15;
    u13.forceUpdateBlockers = false;
    local u16 = {};
    local v17 = {};
    local v18 = CharacterUtil.getCharacterScale(Character) * 2;
    local v19 = math.round(v18);

    if v19 ~= nil and v19 > 1 then
        local v20 = math.round(v19 / 2) - 1;
        local v21 = false;
        local v22 = -1;

        while true do
            if true then
                if v21 then
                    v22 = v22 + 1;
                else
                    v21 = true;
                end;
            end;

            if v22 > 1 then
                break;
            end;

            local v23 = -1 - v20;
            local v24 = false;

            while true do
                if true then
                    if v24 then
                        v23 = v23 + 1;
                    else
                        v24 = true;
                    end;
                end;

                if v23 > v20 + 1 then
                    break;
                end;

                local v25 = false;
                local v26 = -1;

                while true do
                    if true then
                        if v25 then
                            v26 = v26 + 1;
                        else
                            v25 = true;
                        end;
                    end;

                    if v26 > 1 then
                        break;
                    end;

                    local v27 = v15 + Vector3.new(v22, v23, v26);

                    if u13:getValidBlockAt(v27) == nil then
                        local v28 = false;
                        local v29 = 1;

                        while true do
                            if true then
                                if v28 then
                                    v29 = v29 + 1;
                                else
                                    v28 = true;
                                end;
                            end;

                            if v29 >= v19 then
                                break;
                            end;

                            local v30 = v27 + Vector3.new(0, v29, 0);
                            local v31 = u13:getValidBlockAt(v27 - Vector3.new(0, 1, 0));
                            local v32 = u13:getValidBlockAt(v30);

                            if v31 ~= nil and v32 ~= nil then
                                local v33 = false;
                                local v34 = 0;

                                while true do
                                    if true then
                                        if v33 then
                                            v34 = v34 + 1;
                                        else
                                            v33 = true;
                                        end;
                                    end;

                                    if v34 >= v29 then
                                        break;
                                    end;

                                    local v35 = v27 + Vector3.new(0, v34, 0);

                                    if v17[u13:getVectorString(v35)] == nil then
                                        local v36 = u13:getValidBlockAt(v35);
                                        local v37 = u13:getVectorString(v35);

                                        if v36 == nil then
                                            u16[v37] = true;
                                        end;

                                        v17[v37] = true;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

    local u38 = {};

    local function _(p39, p40) -- Line: 209
        -- upvalues: u16 (copy), u13 (copy), u38 (copy)
        if u16[p40] == nil then
            local blockerPartCache = u13.blockerPartCache;

            if blockerPartCache ~= nil then
                blockerPartCache:ReturnPart(p39);
            end;

            table.insert(u38, p40);
        end;
    end;

    for i, v in u13.renderedBlockers do
        if u16[i] == nil then
            local blockerPartCache = u13.blockerPartCache;

            if blockerPartCache ~= nil then
                blockerPartCache:ReturnPart(v);
            end;

            table.insert(u38, i);
        end;
    end;

    local function _(p41) -- Line: 223
        -- upvalues: u13 (copy)
        local renderedBlockers = u13.renderedBlockers;
        local v42 = renderedBlockers[p41] ~= nil;
        renderedBlockers[p41] = nil;

        return v42;
    end;

    for i, v in u38 do
        local _ = i - 1;
        local renderedBlockers = u13.renderedBlockers;
        local _ = renderedBlockers[v] == nil;
        renderedBlockers[v] = nil;
    end;

    local function v47(p43) -- Line: 235
        -- upvalues: u13 (copy)
        if u13.renderedBlockers[p43] == nil then
            local v44 = string.split(p43, ",");

            local function _(p45) -- Line: 240
                return tonumber(p45);
            end;

            local v46 = table.create(#v44);

            for i, v in v44 do
                local _ = i - 1;
                v46[i] = tonumber(v);
            end;

            u13:createBlockerPart(Vector3.new(v46[1], v46[2], v46[3]), p43);
        end;
    end;

    for i in u16 do
        v47(i, i, u16);
    end;
end;

function u6.createBlockerPart(p48, p49, p50) -- Line: 261
    -- upvalues: BlockEngine (copy)
    if not p48.blockerPartCache then
        return nil;
    end;

    local v51 = p48.blockerPartCache:GetPart();
    v51.Position = BlockEngine:getWorldPosition(p49);
    p48.renderedBlockers[p50] = v51;
end;

function u6.getVectorString(p52, p53) -- Line: 271
    return tostring(p53.X) .. "," .. tostring(p53.Y) .. "," .. tostring(p53.Z);
end;

function u6.getValidBlockAt(p54, p55) -- Line: 274
    -- upvalues: BlockEngine (copy), getItemMeta (copy)
    local v56 = BlockEngine:getStore():getBlockAt(p55);

    if not v56 then
        return nil;
    end;

    local block = getItemMeta(v56.Name).block;

    if block ~= nil then
        block = block.canReplace;
    end;

    if block then
        return nil;
    end;

    return v56;
end;

KnitClient.CreateController(u6.new());

return nil;