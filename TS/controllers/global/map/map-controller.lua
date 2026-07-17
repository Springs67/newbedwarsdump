-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local MapCreditsBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "spectate", "map-credits-billboard").MapCreditsBillboard;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network");
local FetchMapDataFuncZap = v5.FetchMapDataFuncZap;
local UpdateMapDataZap = v5.UpdateMapDataZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local CustomMatchRole = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role").CustomMatchRole;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta");
local getMapMeta = v6.getMapMeta;
local getMapName = v6.getMapName;
local getMapType = v6.getMapType;
local HostPanelToggleValue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "MapController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 41
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 45
    -- upvalues: KnitController (copy), Workspace (copy)
    KnitController.constructor(p9, ...);
    p9.Name = "MapController";
    p9.mapCFrames = Workspace:WaitForChild("MapCFrames");
    p9.denyRegions = {};
end;

function u7.KnitStart(u10) -- Line: 51
    -- upvalues: BlockEngineClientEvents (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), UpdateMapDataZap (copy), PlaceUtil (copy), FetchMapDataFuncZap (copy), getMapMeta (copy), getMapType (copy), getMapName (copy)
    BlockEngineClientEvents.PlaceBlock:connect(function(p11) -- Line: 52
        -- upvalues: KnitClient (ref), SoundManager (ref), GameSound (ref)
        if KnitClient.Controllers.MapController:isInDenyRegion(p11.blockPosition) or KnitClient.Controllers.MapController:isOutOfBounds(p11.blockPosition) then
            SoundManager:playSound(GameSound.UI_ERROR);
            p11:setCancelled(true);

            return nil;
        end;
    end);
    UpdateMapDataZap.On(function(p12, p13) -- Line: 61
        -- upvalues: u10 (copy)
        if not p13 then
            u10.denyRegions = p12;

            return;
        end;

        local function _(p14) -- Line: 64
            -- upvalues: u10 (ref)
            local denyRegions = u10.denyRegions;
            table.insert(denyRegions, p14);

            return #denyRegions;
        end;

        for i, v in p12 do
            local _ = i - 1;
            local denyRegions = u10.denyRegions;
            table.insert(denyRegions, v);
            local _ = #denyRegions;
        end;
    end);

    if PlaceUtil.isGameServer() then
        u10.denyRegions = FetchMapDataFuncZap.Call();
        task.spawn(function() -- Line: 80
            -- upvalues: u10 (copy), getMapMeta (ref), getMapType (ref), getMapName (ref)
            local v15 = u10:waitForMapName();
            local v16 = getMapMeta(v15);
            local v17 = getMapType(v15);

            if v17 then
                if v16 ~= nil then
                    v16 = v16.credits;

                    if v16 ~= nil then
                        v16 = v16[v17];
                    end;
                end;
            else
                v16 = nil;
            end;

            if v16 then
                local v18 = getMapName(v15);

                if v18 ~= nil then
                    v15 = v18;
                end;

                u10:setupMapCreditsBillboard(v16, v15);
            end;
        end);
    end;
end;

function u7.getMapName(p19) -- Line: 110
    -- upvalues: Workspace (copy), RunService (copy)
    while Workspace:GetAttribute("MapName") == nil do
        Workspace:GetAttributeChangedSignal("MapName"):Wait();
        RunService.Heartbeat:Wait();
    end;

    return Workspace:GetAttribute("MapName");
end;

function u7.waitForMapName(p20) -- Line: 117
    -- upvalues: Workspace (copy)
    local v21 = p20:getMapName();

    if v21 ~= "" and v21 then
        return v21;
    end;

    Workspace:GetAttributeChangedSignal("MapName"):Wait();

    return Workspace:GetAttribute("MapName");
end;

u7.waitForCFrame = RuntimeLib.async(function(p22, p23) -- Line: 125
    return p22:getCFramesFolder():WaitForChild(p23).Value;
end);
u7.getCFrame = RuntimeLib.async(function(p24, p25) -- Line: 128
    local v26 = p24:getCFramesFolder():FindFirstChild(p25);

    if v26 ~= nil then
        v26 = v26.Value;
    end;

    return v26;
end);

function u7.getCFrameWithoutYield(p27, p28) -- Line: 135
    local mapCFrames = p27.mapCFrames;

    if mapCFrames ~= nil then
        mapCFrames = mapCFrames:FindFirstChild(p28);
    end;

    if mapCFrames ~= nil then
        mapCFrames = mapCFrames.Value;
    end;

    return mapCFrames;
end;

function u7.getCFramesFolder(p29) -- Line: 146
    local v30 = p29.mapCFrames:GetAttribute("Setup");

    if v30 == 0 or (v30 ~= v30 or (v30 == "" or not v30)) then
        while p29.mapCFrames.AttributeChanged:Wait() ~= "Setup" do

        end;
    end;

    return p29.mapCFrames;
end;

function u7.isInDenyRegion(p31, p32) -- Line: 154
    -- upvalues: KnitClient2 (copy), Players (copy)
    for _, v in p31.denyRegions do
        local v33 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v33 ~= nil then
            v33 = v33.id;
        end;

        local whiteListTeamId = v.whiteListTeamId;

        if whiteListTeamId ~= "" and whiteListTeamId then
            whiteListTeamId = v.whiteListTeamId == v33;
        end;

        if whiteListTeamId == "" or not whiteListTeamId then
            if v.box then
                local v34 = p32 - v.center;

                if math.abs(v34.X) <= v.radius.X and (math.abs(v34.Z) <= v.radius.X and math.abs(v34.Y) <= v.radius.Y) then
                    return true;
                end;
            end;

            if (p32 * Vector3.new(1, 0, 1) - v.center * Vector3.new(1, 0, 1)).Magnitude <= v.radius.X and math.abs(p32.Y - v.center.Y) <= v.radius.Y then
                return true;
            end;
        end;
    end;

    return false;
end;

function u7.isOutOfBounds(p35, p36) -- Line: 190
    -- upvalues: ClientStore (copy), HostPanelToggleValue (copy), KnitClient (copy), Players (copy), CustomMatchRole (copy)
    local IgnoreBuildRestrictedRegions = ClientStore:getState().CustomMatch.generalToggles.IgnoreBuildRestrictedRegions;

    if IgnoreBuildRestrictedRegions == HostPanelToggleValue.ON then
        return false;
    end;

    if IgnoreBuildRestrictedRegions == HostPanelToggleValue.HOST_ONLY then
        local v37 = KnitClient.Controllers.CustomMatchController:getRole(Players.LocalPlayer);

        if v37 == CustomMatchRole.COHOST or v37 == CustomMatchRole.HOST then
            return false;
        end;
    end;

    if not (p35.minMapCorner and p35.maxMapCorner) then
        p35:cacheMapBounds();
    end;

    return p35.minMapCorner and (p35.maxMapCorner and (p36.X < p35.minMapCorner.X or (p36.X > p35.maxMapCorner.X or (p36.Y < p35.minMapCorner.Y or (p36.Y > p35.maxMapCorner.Y or (p36.Z < p35.minMapCorner.Z or p36.Z > p35.maxMapCorner.Z)))))) and true or false;
end;

function u7.setupMapCreditsBillboard(u38, p39, u40, u41) -- Line: 211
    -- upvalues: KnitClient (copy), OfflinePlayerUtil (copy), u3 (copy), MapCreditsBillboard (copy)
    local u42 = KnitClient.Controllers.SpectatePlatformController:getCreditsFolder();

    if u42 ~= nil then
        u42 = u42.Location2;
    end;

    local function _(p43) -- Line: 219
        return type(p43) == "number";
    end;

    local v44 = 0;
    local v45 = {};

    for i, v in p39 do
        local _ = i - 1;

        if type(v) == "number" == true then
            v44 = v44 + 1;
            v45[v44] = v;
        end;
    end;

    local function _(p46) -- Line: 235
        return type(p46) == "string";
    end;

    local v47 = 0;
    local v48 = {};

    for i, v in p39 do
        local _ = i - 1;

        if type(v) == "string" == true then
            v47 = v47 + 1;
            v48[v47] = v;
        end;
    end;

    local function _(p49) -- Line: 251
        return {
            displayName = p49
        };
    end;

    local u50 = table.create(#v48);

    for i, v in v48 do
        local _ = i - 1;
        u50[i] = {
            displayName = v
        };
    end;

    if #v45 > 0 then
        OfflinePlayerUtil.getOfflinePlayersByUserIds(v45):andThen(function(p51) -- Line: 265
            -- upvalues: u3 (ref), u41 (copy), u40 (copy), u50 (copy), u38 (copy), MapCreditsBillboard (ref), u42 (copy)
            if #p51 ~= 0 then
                local v52 = {
                    Image = u41,
                    MapName = u40
                };
                local v53 = {};
                local v54 = #v53;
                local v55 = #p51;
                table.move(p51, 1, v55, v54 + 1, v53);
                table.move(u50, 1, #u50, v54 + v55 + 1, v53);
                v52.Creators = v53;
                u38.mapCreditsBillboard = u3.mount(u3.createElement(MapCreditsBillboard, v52), u42);
            end;
        end);

        return;
    end;

    u38.mapCreditsBillboard = u3.mount(u3.createElement(MapCreditsBillboard, {
        Image = u41,
        MapName = u40,
        Creators = u50
    }), u42);
end;

function u7.cacheMapBounds(p56) -- Line: 291
    -- upvalues: BlockEngine (copy)
    local v57 = p56:getCFrame("bound_1"):expect();

    if v57 ~= nil then
        v57 = v57.Position;
    end;

    if v57 == nil then
        v57 = p56:getCFrame("corner_1"):expect();

        if v57 ~= nil then
            v57 = v57.Position;
        end;
    end;

    local v58 = p56:getCFrame("bound_2"):expect();

    if v58 ~= nil then
        v58 = v58.Position;
    end;

    if v58 == nil then
        v58 = p56:getCFrame("corner_2"):expect();

        if v58 ~= nil then
            v58 = v58.Position;
        end;
    end;

    if v57 and v58 then
        local v59 = BlockEngine:getBlockPosition(v57);
        local v60 = BlockEngine:getBlockPosition(v58);
        local v61 = math.min(v59.X, v60.X);
        local v62 = math.max(v59.X, v60.X);
        local v63 = math.min(v59.Y, v60.Y);
        local v64 = math.max(v59.Y, v60.Y);
        local v65 = math.min(v59.Z, v60.Z);
        local v66 = math.max(v59.Z, v60.Z);
        p56.minMapCorner = Vector3.new(v61, v63, v65);
        p56.maxMapCorner = Vector3.new(v62, v64, v66);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;