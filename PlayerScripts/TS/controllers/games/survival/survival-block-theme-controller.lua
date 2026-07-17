-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local StuddedBlockHandler = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "block-handlers", "studded-block-handler").StuddedBlockHandler;
local SurvivalConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SurvivalBlockThemeController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SurvivalBlockThemeController";
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: KnitClient2 (copy), getQueueMeta (copy), KnitClient (copy), SurvivalConstants (copy), u2 (copy), BlockEngine (copy), StuddedBlockHandler (copy), getItemMeta (copy)
    local v7, v8 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

    if v7 and getQueueMeta(v8).classicTexture then
        local v9 = KnitClient.Controllers.MapController:getMapName();
        local v10 = SurvivalConstants.STUDDED_MAP_BLOCKS[v9];

        if not v10 then
            error(print("Studded map blocks not found"));
        end;

        local v11 = {};
        local v12 = #v11;
        local v13 = u2.entries(v10);
        local v14 = #v13;
        table.move(v13, 1, v14, v12 + 1, v11);
        local v15 = u2.entries(SurvivalConstants.STUDDED_SHOP_BLOCKS);
        table.move(v15, 1, #v15, v12 + v14 + 1, v11);

        for _, v in v11 do
            local v16 = v[1];
            local v17 = v[2];
            BlockEngine:registerHandler(StuddedBlockHandler.new(v16, -1, getItemMeta(v16).block, v17.color, v17.surfaces));
        end;
    end;

    return nil;
end;

KnitClient.CreateController(u3.new());

return nil;