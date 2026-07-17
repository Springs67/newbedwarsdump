-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameCoreSharedConfig = v1.GameCoreSharedConfig;
local getAbilityMeta = v1.getAbilityMeta;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ScriptAbilityController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "ScriptAbilityController";
    p5.abilityMaidMap = {};
end;

function u3.KnitStart(u6) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), getAbilityMeta (copy), u2 (copy), Flamework (copy)
    KnitController.KnitStart(u6);
    default.Client:OnEvent("ScriptBulkUpdateAbility", function(p7) -- Line: 32
        -- upvalues: u6 (copy)
        local function _(p8) -- Line: 34
            -- upvalues: u6 (ref)
            u6:convertDtoToAbilityMeta(p8);
        end;

        for i, v in p7.abilityDtos do
            local _ = i - 1;
            u6:convertDtoToAbilityMeta(v);
        end;
    end);
    default.Client:OnEvent("ScriptCreateAbility", function(p9) -- Line: 41
        -- upvalues: u6 (copy)
        u6:convertDtoToAbilityMeta(p9.abilityDto);
    end);
    default.Client:OnEvent("ScriptEnableAbility", function(p10) -- Line: 44
        -- upvalues: getAbilityMeta (ref), u2 (ref), Flamework (ref), u6 (copy)
        if not getAbilityMeta(p10.abilityName) then
            return nil;
        end;

        local u11 = u2.new();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(p10.abilityName, {
            abilityType = p10.abilityType or "KitPrimary",
            abilityButton = {
                icon = p10.iconImage
            }
        }):andThen(function(p12) -- Line: 55
            -- upvalues: u11 (copy)
            u11:GiveTask(p12);
        end);
        u6.abilityMaidMap[p10.abilityName] = u11;
    end);
    default.Client:OnEvent("ScriptRemoveAbility", function(p13) -- Line: 63
        -- upvalues: u6 (copy)
        local v14 = u6.abilityMaidMap[p13.abilityName];

        if v14 ~= nil then
            v14:DoCleaning();
        end;
    end);
end;

function u3.convertDtoToAbilityMeta(p15, p16) -- Line: 72
    -- upvalues: GameCoreSharedConfig (copy)
    GameCoreSharedConfig.AbilityMetatable[p16.name] = {
        actionBarName = p16.name,
        usableProgress = {
            displayProgressOnButton = true,
            progressNeededPerUse = p16.progressNeededPerUse,
            stacks = p16.maxProgress / p16.progressNeededPerUse,
            initialProgress = p16.maxProgress
        }
    };
end;

KnitClient.CreateController(u3.new());

return nil;