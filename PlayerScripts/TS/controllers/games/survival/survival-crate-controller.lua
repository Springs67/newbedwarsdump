-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SurvivalCrateController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.SURVIVAL });
    p4.Name = "SurvivalCrateController";
end;

function u2.onGameInit(p5) -- Line: 31
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), WatchCollectionTag (copy), BlockEngine (copy), ItemType (copy)
    default.Client:Get("CrateOpened"):Connect(function(p6) -- Line: 32
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref)
        SoundManager:playSound(GameSound.WOOD_BREAK, {
            rollOffMinDistance = 30,
            rollOffMaxDistance = 120,
            position = p6.cratePosition,
            playbackSpeedMultiplier = 0.95 + math.random() * 0.1
        });
        local v7 = false;
        local v8 = 0;

        while true do
            if v7 then
                v8 = v8 + 1;
            else
                v7 = true;
            end;

            if v8 >= 4 then
                return;
            end;

            KnitClient.Controllers.BlockDebrisController:createDebris(p6.cratePosition, Color3.fromRGB(115, 66, 23), Vector3.new(0, 0, 0));
        end;
    end);
    WatchCollectionTag("survival-crate", function(p9) -- Line: 55
        -- upvalues: BlockEngine (ref), ItemType (ref)
        p9:WaitForChild("crateEntityRoot", 1);
        local v10 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(p9.PrimaryPart.Position));

        if not v10 or v10.Name ~= ItemType.SURVIVAL_CRATE then
            return nil;
        end;

        local v11 = p9:GetAttribute("Emerald");

        if (v11 == 0 or (v11 ~= v11 or (v11 == "" or not v11))) and v10 ~= nil then
            local EmeraldLarge = v10:WaitForChild("EmeraldLarge", 3);

            if EmeraldLarge ~= nil then
                EmeraldLarge:Destroy();
            end;
        end;

        local v12 = p9:GetAttribute("Diamond");

        if (v12 == 0 or (v12 ~= v12 or (v12 == "" or not v12))) and v10 ~= nil then
            local DiamondLarge = v10:WaitForChild("DiamondLarge", 3);

            if DiamondLarge ~= nil then
                DiamondLarge:Destroy();
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;