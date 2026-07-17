-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "MazeEnemyController";
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
    p5.Name = "MazeEnemyController";
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: KnitController (copy), default (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), WatchCollectionTag (copy), KnitClient2 (copy)
    KnitController.KnitStart(p6);
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p7) -- Line: 34
        -- upvalues: CollectionService (ref), SoundManager (ref), GameSound (ref)
        p7:Connect(function(p8) -- Line: 35
            -- upvalues: CollectionService (ref), SoundManager (ref), GameSound (ref)
            if not CollectionService:HasTag(p8.entityInstance, "MazeEnemy") then
                return nil;
            end;

            SoundManager:playSound(GameSound.SKELETON_DEATH, {
                position = p8.cframe.Position
            });

            local function _(p9) -- Line: 43
                if p9:IsA("ParticleEmitter") then
                    p9.Enabled = false;
                end;
            end;

            for i, descendant in p8.entityInstance:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;
            end;
        end);
    end);
    WatchCollectionTag("MazeEnemy", function(p10) -- Line: 55
        -- upvalues: KnitClient2 (ref), GameSound (ref)
        if not p10:IsA("Model") then
            return nil;
        end;

        KnitClient2.Controllers.FootstepsController:hookCharacter(nil, p10, {
            walk = {
                GameSound.SKELETON_FOOTSTEP_1,
                GameSound.SKELETON_FOOTSTEP_2,
                GameSound.SKELETON_FOOTSTEP_3,
                GameSound.SKELETON_FOOTSTEP_4
            },
            run = {
                GameSound.SKELETON_FOOTSTEP_1,
                GameSound.SKELETON_FOOTSTEP_2,
                GameSound.SKELETON_FOOTSTEP_3,
                GameSound.SKELETON_FOOTSTEP_4
            }
        });
    end);
end;

KnitClient.CreateController(u3.new());

return nil;