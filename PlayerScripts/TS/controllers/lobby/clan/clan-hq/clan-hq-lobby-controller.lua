-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getClanHqBackgroundMusicMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types");
local ClanHqBackgroundMusicType = v1.ClanHqBackgroundMusicType;
local ClanHqSkyboxType = v1.ClanHqSkyboxType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ClanHqLobby";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "ClanHqLobby";
    p4.clanHqProfileJoin = false;
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), PlaceUtil (copy), RunService (copy), ClanHqBackgroundMusicType (copy), ClanHqSkyboxType (copy), default (copy), getClanHqBackgroundMusicMeta (copy), KnitClient (copy), ClientStore (copy)
    KnitController.KnitStart(u5);

    if PlaceUtil.isLobbyServer() then
        u5.clanHqProfileJoin = RunService:IsStudio();
        local DEFAULT = ClanHqBackgroundMusicType.DEFAULT;
        local DEFAULT2 = ClanHqSkyboxType.DEFAULT;
        default.Client:GetNamespace("Clans"):Get("ClanHqProfileJoin"):Connect(function(p6) -- Line: 38
            -- upvalues: u5 (copy), ClanHqBackgroundMusicType (ref), DEFAULT (ref), ClanHqSkyboxType (ref), DEFAULT2 (ref), getClanHqBackgroundMusicMeta (ref), KnitClient (ref)
            u5.clanHqProfileJoin = true;
            local clanHq = p6.clanHq;

            if clanHq ~= nil then
                clanHq = clanHq.selectedLobbyMusic;
            end;

            if clanHq == nil then
                clanHq = ClanHqBackgroundMusicType.DEFAULT;
            end;

            DEFAULT = clanHq;
            local clanHq2 = p6.clanHq;

            if clanHq2 ~= nil then
                clanHq2 = clanHq2.selectedSykbox;
            end;

            if clanHq2 == nil then
                clanHq2 = ClanHqSkyboxType.DEFAULT;
            end;

            DEFAULT2 = clanHq2;
            local v7 = getClanHqBackgroundMusicMeta(DEFAULT);
            KnitClient.Controllers.BackgroundMusicController:startMusic(v7.soundId, nil, {
                title = v7.title
            });
            KnitClient.Controllers.LobbyLightingController:setupEnvironment(DEFAULT2);
        end);
        ClientStore.changed:connect(function(p8, p9) -- Line: 64
            -- upvalues: DEFAULT (ref), ClanHqBackgroundMusicType (ref), u5 (copy), getClanHqBackgroundMusicMeta (ref), KnitClient (ref), DEFAULT2 (ref), ClanHqSkyboxType (ref)
            local myClan = p8.Clans.myClan;

            if myClan ~= nil then
                myClan = myClan.clanHq;

                if myClan ~= nil then
                    myClan = myClan.selectedLobbyMusic;
                end;
            end;

            local myClan2 = p9.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanHq;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedLobbyMusic;
                end;
            end;

            if myClan ~= myClan2 then
                DEFAULT = myClan or ClanHqBackgroundMusicType.DEFAULT;

                if u5.clanHqProfileJoin then
                    local v10 = getClanHqBackgroundMusicMeta(DEFAULT);
                    KnitClient.Controllers.BackgroundMusicController:startMusic(v10.soundId, nil, {
                        title = v10.title
                    });
                end;
            end;

            local myClan3 = p8.Clans.myClan;

            if myClan3 ~= nil then
                myClan3 = myClan3.clanHq;

                if myClan3 ~= nil then
                    myClan3 = myClan3.selectedSykbox;
                end;
            end;

            local myClan4 = p9.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.clanHq;

                if myClan4 ~= nil then
                    myClan4 = myClan4.selectedSykbox;
                end;
            end;

            if myClan3 ~= myClan4 then
                DEFAULT2 = myClan3 or ClanHqSkyboxType.DEFAULT;

                if u5.clanHqProfileJoin then
                    KnitClient.Controllers.LobbyLightingController:setupEnvironment(DEFAULT2);
                end;
            end;
        end);
    end;
end;

function u2.isClanHq(p11) -- Line: 113
    return p11.clanHqProfileJoin;
end;

KnitClient.CreateController(u2.new());

return nil;