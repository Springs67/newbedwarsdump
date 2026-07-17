-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "CriticalStrikeToolEnchantController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "CriticalStrikeToolEnchantController";
end;

function u3.KnitStart(u6) -- Line: 33
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("BreakToolCrit"):Connect(function(p7) -- Line: 35
        -- upvalues: u6 (copy)
        u6:playBlockDestructionEffects(p7.blockPosition, p7.blockType, p7.destroyer);
    end);
end;

function u3.playBlockDestructionEffects(p8, p9, p10, p11) -- Line: 39
    -- upvalues: BlockEngine (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), ItemType (copy), Workspace (copy), KnitClient (copy), ReplicatedStorage (copy)
    local v12 = BlockEngine:getWorldPosition(p9);
    SoundManager:playSound(RandomUtil.fromList(GameSound.SHATTER_STRIKE_BREAK_1, GameSound.SHATTER_STRIKE_BREAK_2, GameSound.SHATTER_STRIKE_BREAK_3), {
        volumeMultiplier = 0.6,
        position = v12
    });

    if p10 ~= ItemType.IRON_ORE_MESH_BLOCK then
        local v13 = BlockEngine:getHandlerRegistry():getHandler(p10);

        if not v13 then
            return nil;
        end;

        local v14 = v13:place(p9, 0);
        v14.CanCollide = false;
        v14.CanQuery = false;
        v14.CastShadow = false;
        v14.Parent = Workspace;
        local v15 = Vector3.new(5, 5, 5);
        local Character = p11.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if Character then
            local Unit = (v12 - Character).Unit;

            if Unit then
                v15 = Unit * 20;
            end;
        end;

        local v16 = false;
        local v17 = 0;

        while true do
            if true then
                if v16 then
                    v17 = v17 + 1;
                else
                    v16 = true;
                end;
            end;

            if v17 >= 5 then
                break;
            end;

            KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(v14, p10, p9, v15, v17, nil, nil, nil, nil, nil, nil, Vector3.new(0.8, 1.8, 1.2));
        end;

        v14:Destroy();
    end;

    local u18 = ReplicatedStorage.Assets.Effects.ShatterStrikeHit:Clone();
    u18.Parent = Workspace;
    u18:PivotTo(CFrame.new(v12));
    u18.Attachment.ShatterStrikeHit:Emit(1);
    task.delay(1, function() -- Line: 90
        -- upvalues: u18 (copy)
        u18:Destroy();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;