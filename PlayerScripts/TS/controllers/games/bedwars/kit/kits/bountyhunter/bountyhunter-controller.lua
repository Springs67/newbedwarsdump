-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BountyHunterPosterWrapper = RuntimeLib.import(script, script.Parent, "ui", "bountyhunter-poster").BountyHunterPosterWrapper;
local TargetMarkerWrapper = RuntimeLib.import(script, script.Parent, "ui", "target-marker").TargetMarkerWrapper;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BountyhunterController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy)
    BaseKitController.constructor(p5, BedwarsKit.BOUNTY_HUNTER);
    p5.Name = "BountyhunterController";
    p5.maid = u1.new();
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p6);
end;

function u3.onKitReplicationActivated(u7, p8) -- Line: 38
    -- upvalues: default (copy), Players (copy), ClientStore (copy), SoundManager (copy), GameSound (copy), CreateRoduxApp (copy), TargetMarkerWrapper (copy), u1 (copy), u2 (copy)
    default.Client:OnEvent("BountyHunterTargetChanged", function(p9) -- Line: 39
        -- upvalues: Players (ref), ClientStore (ref)
        local newTargetUserId = p9.newTargetUserId;
        local v10;

        if newTargetUserId == 0 or (newTargetUserId ~= newTargetUserId or not newTargetUserId) then
            v10 = nil;
        else
            v10 = Players:GetPlayerByUserId(p9.newTargetUserId);
        end;

        ClientStore:dispatch({
            type = "KitBountyHunterSetTarget",
            bountyHunterTarget = v10
        });
    end);
    default.Client:WaitFor("GetBountyHunterTarget"):andThen(function(p11) -- Line: 48
        -- upvalues: Players (ref), ClientStore (ref)
        p11:CallServerAsync():andThen(function(p12) -- Line: 50
            -- upvalues: Players (ref), ClientStore (ref)
            local v13;

            if p12 == 0 or (p12 ~= p12 or not p12) then
                v13 = nil;
            else
                v13 = Players:GetPlayerByUserId(p12);
            end;

            ClientStore:dispatch({
                type = "KitBountyHunterSetTarget",
                bountyHunterTarget = v13
            });
        end);
    end);
    default.Client:OnEvent("BountyHunterRewardClaimed", function(p14) -- Line: 60
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.BOUNTY_CLAIMED);
    end);
    ClientStore.changed:connect(function(p15, p16) -- Line: 63
        -- upvalues: u7 (copy), SoundManager (ref), GameSound (ref), CreateRoduxApp (ref), TargetMarkerWrapper (ref), u1 (ref), u2 (ref), default (ref)
        local bountyHunterTarget = p15.Kit.bountyHunterTarget;

        if bountyHunterTarget == nil or bountyHunterTarget == p16.Kit.bountyHunterTarget then
            return nil;
        end;

        u7.maid:DoCleaning();
        SoundManager:playSound(GameSound.BOUNTY_ASSIGNED);

        local function u21(u17) -- Line: 72
            -- upvalues: CreateRoduxApp (ref), TargetMarkerWrapper (ref), bountyHunterTarget (copy), u1 (ref), u2 (ref), default (ref)
            local u18 = CreateRoduxApp("TargetMarker", TargetMarkerWrapper, {
                adornee = u17:WaitForChild("HumanoidRootPart"),
                player = bountyHunterTarget
            });
            local u19 = u1.new();
            u19:GiveTask(function() -- Line: 79
                -- upvalues: u2 (ref), u18 (copy)
                u2.unmount(u18);
            end);
            u19:GiveTask(bountyHunterTarget.CharacterRemoving:Connect(function() -- Line: 82
                -- upvalues: u19 (copy)
                u19:DoCleaning();
            end));
            u19:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p20) -- Line: 85
                -- upvalues: u17 (copy), u19 (copy)
                if p20.entityInstance == u17 then
                    u19:DoCleaning();
                end;
            end));

            return u19;
        end;

        u7.maid:GiveTask(bountyHunterTarget.CharacterAdded:Connect(function(p22) -- Line: 92
            -- upvalues: u7 (ref), u21 (copy)
            u7.maid:GiveTask((u21(p22)));
        end));
        task.spawn(function() -- Line: 96
            -- upvalues: bountyHunterTarget (copy), u7 (ref), u21 (copy)
            if bountyHunterTarget.Character then
                u7.maid:GiveTask((u21(bountyHunterTarget.Character)));
            end;
        end);
    end);
end;

function u3.onKitLocalActivated(p23, p24) -- Line: 103
    -- upvalues: CreateRoduxApp (copy), BountyHunterPosterWrapper (copy), Players (copy)
    CreateRoduxApp("BountyHunterPoster", BountyHunterPosterWrapper, {}, {
        Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    });
end;

function u3.onKitLocalDeactivated(p25) -- Line: 108
end;

function u3.onKitReplicationDeactivated(p26) -- Line: 110
end;

function u3.onInnateAbilityEnabled(p27, p28, p29) -- Line: 112
end;

function u3.onAbilityUsed(p30, p31, p32) -- Line: 114
end;

KnitClient.CreateController(u3.new());

return nil;