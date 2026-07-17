-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "fisherman", "fisherman-drops");
local FishermanDropsEarlyGame = v4.FishermanDropsEarlyGame;
local FishermanDropsLateGame = v4.FishermanDropsLateGame;
local FishermanMinigameApp = RuntimeLib.import(script, script.Parent, "ui", "fisherman-minigame-app").FishermanMinigameApp;
local FisherMinigameGameOver = RuntimeLib.import(script, script.Parent, "ui", "fisherman-minigame-game-over").FisherMinigameGameOver;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "FishingMinigameController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "FishingMinigameController";
end;

function u5.KnitStart(p8) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
end;

function u5.startMinigame(u9, u10, u11, u12) -- Line: 39
    -- upvalues: u1 (copy), ClientStore (copy), FishermanDropsEarlyGame (copy), FishermanDropsLateGame (copy), u2 (copy), FishermanMinigameApp (copy), Players (copy), Flamework (copy), RunService (copy), ClientSyncEvents (copy), FisherMinigameGameOver (copy), RuntimeLib (copy)
    if u9.minigameMaid then
        u9.minigameMaid:DoCleaning();
    else
        u9.minigameMaid = u1.new();
    end;

    local v13;

    if os.time() - ClientStore:getState().Game.startTime < 480 then
        v13 = FishermanDropsEarlyGame:getMaxElementWeight();
    else
        v13 = FishermanDropsLateGame:getMaxElementWeight();
    end;

    local v14 = {
        fishType = u10.fishModel,
        decaySpeedMultiplier = 1 + (1 - u10.weight / v13)
    };
    local v15;

    if u12 == nil then
        v15 = u12;
    else
        v15 = u12.duration;
    end;

    v14.duration = v15;
    local v16;

    if u12 == nil then
        v16 = u12;
    else
        v16 = u12.customUI;

        if v16 ~= nil then
            v16 = v16.size;
        end;
    end;

    v14.size = v16;
    local v17;

    if u12 == nil then
        v17 = u12;
    else
        v17 = u12.customUI;

        if v17 ~= nil then
            v17 = v17.position;
        end;
    end;

    v14.position = v17;
    local v18;

    if u12 == nil then
        v18 = u12;
    else
        v18 = u12.customUI;

        if v18 ~= nil then
            v18 = v18.anchorPoint;
        end;
    end;

    v14.anchorPoint = v18;
    local v19 = u2.createElement(FishermanMinigameApp, v14);
    local v20;

    if u12 == nil then
        v20 = u12;
    else
        v20 = u12.customUI;
    end;

    if v20 then
        u9.appMaid = u1.new();
        local v21 = u2.createFragment({
            FishingMinigameScreen = u2.createElement("ScreenGui", {}, { v19 })
        });
        local v22;

        if u12 == nil then
            v22 = u12;
        else
            v22 = u12.customUI.parent;
        end;

        if v22 == nil then
            v22 = Players.LocalPlayer:WaitForChild("PlayerGui");
        end;

        local u23 = u2.mount(v21, v22);
        u9.appMaid:GiveTask(function() -- Line: 102
            -- upvalues: u2 (ref), u23 (copy)
            u2.unmount(u23);
        end);
    else
        u9.appMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(v19);
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame.Position;
        end;
    end;

    local v24;

    if u12 == nil then
        v24 = u12;
    else
        v24 = u12.cancelOnMove;
    end;

    if v24 == nil and true or v24 then
        local u25 = nil;
        u25 = RunService.Heartbeat:Connect(function() -- Line: 127
            -- upvalues: Character (copy), Players (ref), u12 (copy), u9 (copy), u11 (copy), u25 (ref)
            local v26 = not Character;

            if not v26 then
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;

                    if Character2 ~= nil then
                        Character2 = (Character2.Position - Character).Magnitude;
                    end;
                end;

                local v27 = u12;

                if v27 ~= nil then
                    v27 = v27.interactionRangeLimit;
                end;

                v26 = (v27 == nil and 0.5 or v27) < (Character2 == nil and 1 or Character2);
            end;

            if v26 then
                u9:cancelMinigame();
                u11({
                    gameOver = true,
                    win = false
                });
                u25:Disconnect();
            end;
        end);
        u9.minigameMaid:GiveTask(u25);
    end;

    local v31 = ClientSyncEvents.FishermanMinigameEnd:connect(function(p28) -- Line: 164
        -- upvalues: u9 (copy), u11 (copy), Flamework (ref), u10 (copy), u2 (ref), FisherMinigameGameOver (ref), RuntimeLib (ref)
        local minigameMaid = u9.minigameMaid;

        if minigameMaid ~= nil then
            minigameMaid:DoCleaning();
        end;

        u11(p28);
        local v29 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController");
        local v30 = {
            win = p28.win,
            fishType = u10.fishModel
        };
        local timeElapsed = p28.timeElapsed;
        v30.elapsedItem = timeElapsed == nil and 0 or timeElapsed;
        u9.gameOverScreenMaid = v29:addComponent(u2.createElement(FisherMinigameGameOver, v30));
        RuntimeLib.Promise.delay(3):andThen(function() -- Line: 184
            -- upvalues: u9 (ref)
            if not u9.gameOverScreenMaid then
                return nil;
            end;

            u9.gameOverScreenMaid:DoCleaning();
        end);
    end);
    u9.minigameMaid:GiveTask(v31);
end;

function u5.cancelMinigame(p32) -- Line: 194
    p32:closeFishingMinigameApp();
end;

function u5.closeFishingMinigameApp(p33) -- Line: 197
    if p33.appMaid then
        local appMaid = p33.appMaid;

        if appMaid ~= nil then
            appMaid:DoCleaning();
        end;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;