-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutQuad = v1.OutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "HuntersEchoController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "HuntersEchoController";
end;

function u4.KnitStart(u7) -- Line: 40
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), AnimationType (copy), ClientSyncEvents (copy), Players (copy), RuntimeLib (copy), PlayerEntity (copy), PlaceUtil (copy)
    KnitController.KnitStart(u7);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HUNTERS_ECHO, {
        sounds = { GameSound.MIDNIGHT_ACTIVATE },
        animations = { AnimationType.ZEN_HOVER }
    });
    ClientSyncEvents.ItemConsumed:connect(function(p8) -- Line: 46
        -- upvalues: ItemType (ref), Players (ref), KnitClient (ref), RuntimeLib (ref), PlayerEntity (ref), PlaceUtil (ref), u7 (copy)
        if p8.itemType ~= ItemType.HUNTERS_ECHO then
            return nil;
        end;

        local v9 = p8.entity:getInstance() == Players.LocalPlayer.Character;

        if v9 and Players.LocalPlayer.Character then
            local v10 = Players.LocalPlayer.Character:GetPivot().Position or Vector3.new(0, 0, 0);
            KnitClient.Controllers.ScreenShakeController:shake(v10, v10 + Vector3.new(0, -1, 0), {
                cycles = 2,
                zMagnitude = 1,
                duration = 0.08
            });
        end;

        local Position = p8.entity:getInstance():GetPivot().Position;

        if RuntimeLib.instanceof(p8.entity, PlayerEntity) then
            if PlaceUtil.isGameServer() then
                local v11 = KnitClient.Controllers.TeamController:getPlayerTeam(p8.entity:getPlayer());
                local v12 = {};

                if v11 ~= nil then
                    v11 = v11.id;
                end;

                v12.myTeamId = v11;
                u7:playHawkeyeEffect(Position, v12);

                return;
            end;

            if PlaceUtil.isLobbyServer() and v9 then
                u7:playHawkeyeEffect(Position);
            end;
        end;
    end);
end;

function u4.playHawkeyeEffect(p13, u14, u15) -- Line: 80
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), PlaceUtil (copy), EntityUtil (copy), KnitClient (copy), u2 (copy), Workspace (copy), default (copy), OutQuad (copy)
    SoundManager:playSound(GameSound.MIDNIGHT_ACTIVATE);
    local v16;

    if u15 == nil then
        v16 = u15;
    else
        v16 = u15.maxSize;
    end;

    local u17 = v16 == nil and 500 or v16;
    local v18;

    if u15 == nil then
        v18 = u15;
    else
        v18 = u15.expansionDurationSec;
    end;

    local u19 = v18 == nil and 3 or v18;
    local u20 = os.clock();
    p13:playBubbleEffect(u14, u17, u19);
    task.spawn(function() -- Line: 102
        -- upvalues: Players (ref), PlaceUtil (ref), EntityUtil (ref), u15 (copy), KnitClient (ref), u2 (ref), Workspace (ref), SoundManager (ref), GameSound (ref), default (ref), OutQuad (ref), u20 (copy), u19 (copy), u17 (copy), u14 (copy)
        local u21 = {};

        for _, v in Players:GetPlayers() do
            if PlaceUtil.isLobbyServer() then
                local v22 = EntityUtil:getEntity(v);
                local v23;

                if v22 == nil then
                    v23 = v22;
                else
                    v23 = v22:getInstance();
                end;

                if v23 and v22:isAlive() then
                    if v22 ~= nil then
                        v22 = v22:getInstance();
                    end;

                    u21[v22] = true;
                end;
            else
                local v24 = u15;

                if v24 ~= nil then
                    v24 = v24.myTeamId;
                end;

                local v25, v26;

                if v24 == "" or not v24 then
                    v25 = EntityUtil:getEntity(v);

                    if v25 == nil then
                        v26 = v25;
                    else
                        v26 = v25:getInstance();
                    end;

                    if v26 and v25:isAlive() then
                        u21[v25:getInstance()] = true;
                    end;
                else
                    local v27 = KnitClient.Controllers.TeamController:getPlayerTeam(v);

                    if v27 ~= nil then
                        v27 = v27.id;
                    end;

                    local v28 = u15;

                    if v28 ~= nil then
                        v28 = v28.myTeamId;
                    end;

                    if v27 ~= v28 then
                        v25 = EntityUtil:getEntity(v);

                        if v25 == nil then
                            v26 = v25;
                        else
                            v26 = v25:getInstance();
                        end;

                        if v26 and v25:isAlive() then
                            u21[v25:getInstance()] = true;
                        end;
                    end;
                end;
            end;
        end;

        local u29 = {};

        local function v41(p30) -- Line: 162
            -- upvalues: u21 (copy), u29 (copy), u2 (ref), Players (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u15 (ref), default (ref), OutQuad (ref)
            u21[p30] = nil;
            u29[p30] = true;
            local u31 = u2("Highlight", {
                FillTransparency = 0.8,
                OutlineTransparency = 0,
                FillColor = Color3.fromRGB(248, 71, 0),
                OutlineColor = Color3.fromRGB(248, 71, 0),
                Parent = p30
            });
            local v32 = Players:GetPlayerFromCharacter(p30);

            if v32 ~= nil then
                v32 = v32.UserId;
            end;

            local v33 = Workspace:FindFirstChild("DisguisedPlayerBlock_" .. tostring(v32));
            local u34;

            if v33 then
                u34 = u31:Clone();
                u34.Parent = v33;
            else
                u34 = nil;
            end;

            local BEEPING = GameSound.BEEPING;
            local v35 = 0;
            local v36 = {};

            for _ in u29 do
                v35 = v35 + 1;
            end;

            v36.playbackSpeedMultiplier = v35 / 10 + 0.95;
            SoundManager:playSound(BEEPING, v36);
            local u37 = { u31 };

            if u34 then
                table.insert(u37, u34);
            end;

            local v38 = u15;

            if v38 ~= nil then
                v38 = v38.revealDuration;
            end;

            task.delay(v38 == nil and 3 or v38, function() -- Line: 214
                -- upvalues: default (ref), OutQuad (ref), u37 (copy), u31 (copy), u34 (ref)
                default(5, OutQuad, function(p39) -- Line: 215
                    -- upvalues: u37 (ref)
                    for _, v in u37 do
                        v.FillTransparency = (1 - p39) * 0.8 + p39 * 1;
                        v.OutlineTransparency = p39;
                    end;
                end):Wait();
                u31:Destroy();
                local v40 = u34;

                if v40 ~= nil then
                    v40:Destroy();
                end;
            end);
        end;

        while true do
            local v42 = task.wait(0.05);

            if v42 == 0 or (v42 ~= v42 or (not v42 or os.clock() - u20 > u19 + 0.05)) then
                break;
            end;

            local v43 = os.clock() - u20;
            local v44 = u17 * (math.clamp(v43, 0, u19) / u19);

            for i in u21 do
                if (i:GetPivot().Position - u14).Magnitude < v44 then
                    v41(i);
                    task.wait(0);
                end;
            end;
        end;

        for i in u21 do
            v41(i);
            task.wait(0);
        end;
    end);
end;

function u4.playBubbleEffect(p45, p46, p47, p48) -- Line: 259
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), PlaceUtil (copy), default (copy), Linear (copy)
    local u49 = Vector3.new(1, 1, 1) * p47;
    local u50 = ReplicatedStorage.Assets.Misc.HawkeyeSphere:Clone();
    u50.Size = Vector3.new(0, 0, 0);
    u50.Position = p46;
    u50.Parent = Workspace;

    if PlaceUtil.isLobbyServer() then
        u50.Color = Color3.new(0.6, 0.8, 0.95);
        u50.Transparency = 0.75;
    end;

    local u52 = default(p48, Linear, function(p51) -- Line: 271
        -- upvalues: u50 (copy), u49 (copy)
        u50.Size = (Vector3.new(0, 0, 0)):Lerp(u49, p51);
    end);
    task.spawn(function() -- Line: 274
        -- upvalues: u52 (copy), u50 (copy)
        u52:Wait();
        u50:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;