-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "SheepHerderKitController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), default (copy), ExpireList (copy)
    BaseKitController.constructor(p6, BedwarsKit.SHEEP_HERDER);
    p6.Name = "SheepHerderKitController";
    p6.sheepNamespace = default.Client:GetNamespace("SheepHerder");
    p6.animationCooldowns = ExpireList.new(2);
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p7);
end;

function u4.onKitLocalActivated(p8, p9) -- Line: 40
end;

function u4.onKitLocalDeactivated(p10) -- Line: 42
end;

function u4.onKitReplicationActivated(u11, p12) -- Line: 44
    -- upvalues: WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), u2 (copy), ReplicatedStorage (copy), WeldUtil (copy)
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.TAME_SHEEP) }, function(p13, p14) -- Line: 45
        -- upvalues: u11 (copy), Players (ref), u2 (ref), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p13.Character;

        if not Character then
            return nil;
        end;

        if u11.animationCooldowns:has(p13.UserId) and p13.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u11.animationCooldowns:add(p13.UserId);
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u15 = u2.new();
        local u16 = ReplicatedStorage.Assets.Effects.Crook:Clone();
        u16.Parent = Character;
        WeldUtil:weldCharacterAccessories(Character);
        p14.Stopped:Connect(function() -- Line: 66
            -- upvalues: u16 (copy), u15 (copy)
            u16:Destroy();
            u15:DoCleaning();
        end);
    end);
end;

function u4.onKitReplicationDeactivated(p17) -- Line: 72
end;

function u4.onInnateAbilityEnabled(p18, p19, p20) -- Line: 74
end;

function u4.onAbilityUsed(p21, p22, p23) -- Line: 76
end;

function u4.tameSheep(p24, p25) -- Line: 78
    local Value = p25.SheepData.Value;

    if not Value then
        return nil;
    end;

    p24.sheepNamespace:Get("TameSheep"):SendToServer(Value);
end;

KnitClient.CreateController(u4.new());

return nil;