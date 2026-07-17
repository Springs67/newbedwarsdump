-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ImageId = v1.ImageId;
local preloadImages = v1.preloadImages;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local PolicyService = v3.PolicyService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SocialConnectionsController";
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
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p6);
    p6.Name = "SocialConnectionsController";
    p6.remotes = default.Client:GetNamespace("SocialConnections");
    p6.policyDiscordAllowed = false;
    p6.completed = false;
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), RuntimeLib (copy), PolicyService (copy), Players (copy), preloadImages (copy), ImageId (copy)
    KnitController.KnitStart(u7);
    RuntimeLib.Promise.defer(function() -- Line: 40
        -- upvalues: u7 (copy), PolicyService (ref), Players (ref)
        u7.policyDiscordAllowed = table.find(PolicyService:GetPolicyInfoForPlayerAsync(Players.LocalPlayer).AllowedExternalLinkReferences, "Discord") ~= nil;
    end);
    u7.remotes:WaitFor("GetSocialConnections"):andThen(function(p8) -- Line: 44
        -- upvalues: u7 (copy)
        u7:updateSocialConnectionsReducer((p8:CallServer()));
    end);
    u7.remotes:WaitFor("SocialConnectionsUpdate"):andThen(function(p9) -- Line: 50
        -- upvalues: u7 (copy)
        p9:Connect(function(p10) -- Line: 51
            -- upvalues: u7 (ref)
            u7:updateSocialConnectionsReducer(p10);
        end);
    end);
    preloadImages({ ImageId.CHECK_CIRCLE_SOLID, ImageId.UNLOCK_SOLID });
end;

u4.getJoinedGroupStatus = RuntimeLib.async(function(u11) -- Line: 58
    -- upvalues: RuntimeLib (copy)
    local v12 = u11.remotes:WaitFor("VerifyJoinedGroup");

    return RuntimeLib.await(v12:andThen(function(p13) -- Line: 60
        -- upvalues: u11 (copy)
        local v14 = p13:CallServer();
        u11:updateJoinedGroupStore(v14);

        return v14;
    end));
end);

function u4.updateSocialConnectionsReducer(p15, p16) -- Line: 67
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "SocialConnectionsSetAll",
        supportTasks = p16.supportTasks,
        connections = p16.connections
    });
end;

function u4.updateJoinedGroupStore(p17, p18) -- Line: 74
    -- upvalues: ClientStore (copy), SoundManager (copy), GameSound (copy)
    if ClientStore:getState().SocialConnections.supportTasks.joinedGroup ~= p18 then
        return nil;
    end;

    if p18 == true then
        SoundManager:playSound(GameSound.INFO_NOTIFICATION);
    end;

    ClientStore:dispatch({
        type = "SetSomeSupportTasks",
        supportTasks = {
            joinedGroup = p18
        }
    });

    if p17:isSocialConnectionsCompleted() then
        p17:giveCompletedReward();
    end;
end;

function u4.updateDiscordStore(p19, p20) -- Line: 91
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "SetSomeConnections",
        connections = {
            discord = {
                verificationCode = p20.verificationCode,
                validated = p20.validated,
                legacyDiscordVerification = p20.legacyDiscordVerification
            }
        }
    });

    if p19:isSocialConnectionsCompleted() then
        p19:giveCompletedReward();
    end;
end;

function u4.isSocialConnectionsCompleted(p21, p22) -- Line: 106
    -- upvalues: ClientStore (copy), u2 (copy)
    local v23, v24;

    if p22 then
        v23 = p22.supportTasks;
        v24 = p22.connections;
    else
        local SocialConnections = ClientStore:getState().SocialConnections;
        v23 = SocialConnections.supportTasks;
        v24 = SocialConnections.connections;
    end;

    local function _(p25) -- Line: 118
        return p25 == true;
    end;

    local v26 = true;

    for i, v in u2.values(v23) do
        local _ = i - 1;

        if v ~= true then
            v26 = false;
            break;
        end;
    end;

    local function _(p27) -- Line: 132
        return p27.validated == true;
    end;

    local v28 = true;

    for i, v in u2.values(v24) do
        local _ = i - 1;

        if v.validated ~= true then
            v28 = false;
            break;
        end;
    end;

    return v26 and v28;
end;

function u4.giveCompletedReward(p29) -- Line: 147
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
    p29.completed = true;
end;

KnitClient.CreateController(u4.new());

return nil;