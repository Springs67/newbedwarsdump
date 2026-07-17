-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local UserInputService = v2.UserInputService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-util").AbilityUtil;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.ALL = 0;
v4[0] = "ALL";
u5.TEAM = 1;
v4[1] = "TEAM";
u5.PLAYER = 2;
v4[2] = "PLAYER";
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "SpectateController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 45
    -- upvalues: KnitController (copy), u1 (copy), u5 (ref)
    KnitController.constructor(p8);
    p8.Name = "SpectateController";
    p8.spectatingPlayerMaid = u1.new();
    p8.spectating = false;
    p8.mode = u5.TEAM;
    p8.lockedTeamId = nil;
    p8.lockedPlayerId = nil;
end;

function u6.KnitStart(u9) -- Line: 54
    -- upvalues: default (copy), u3 (copy), AbilityUtil (copy), ClientStore (copy), OfflinePlayerUtil (copy), Players (copy), KnitClient (copy), Workspace (copy)
    default.Client:WaitFor("SpectatePlayer"):andThen(function(p10) -- Line: 56
        -- upvalues: u9 (copy), u3 (ref), AbilityUtil (ref), ClientStore (ref), OfflinePlayerUtil (ref)
        p10:Connect(function(p11) -- Line: 57
            -- upvalues: u9 (ref), u3 (ref), AbilityUtil (ref), ClientStore (ref), OfflinePlayerUtil (ref)
            u9.lockedTeamId = p11.lockToTeamId;
            u3:Disable();
            AbilityUtil.disableAllAbilities();

            if p11.target then
                ClientStore:dispatch({
                    type = "GameSetSpectator",
                    spectating = true,
                    spectatingPlayer = OfflinePlayerUtil.getOfflinePlayer(p11.target)
                });

                return;
            end;

            u9:switchSpectateTargets("next");
        end);
    end);
    default.Client:WaitFor("StopSpectating"):andThen(function(p12) -- Line: 74
        -- upvalues: u9 (copy)
        p12:Connect(function(p13) -- Line: 75
            -- upvalues: u9 (ref)
            u9:stopSpectatingPlayer();
        end);
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() -- Line: 80
        -- upvalues: Players (ref), u9 (copy)
        if Players.LocalPlayer:GetAttribute("Spectator") ~= true then
            u9:stopSpectatingPlayer();
        end;
    end);
    ClientStore.changed:connect(function(p14, p15) -- Line: 86
        -- upvalues: OfflinePlayerUtil (ref), u9 (copy)
        if p14.Game.spectatingPlayer ~= p15.Game.spectatingPlayer then
            if p14.Game.spectatingPlayer then
                local v16 = OfflinePlayerUtil.getPlayer(p14.Game.spectatingPlayer);

                if v16 then
                    u9:hookSpectatedPlayer(v16);
                end;
            else
                u9:stopSpectatingPlayer();
            end;
        end;

        if p14.Game.spectating ~= p15.Game.spectating and not p14.Game.spectating then
            u9:stopSpectatingPlayer();
        end;
    end);
    default.Client:OnEvent("EntityDeathEvent", function(p17) -- Line: 105
        -- upvalues: ClientStore (ref), Players (ref), OfflinePlayerUtil (ref), KnitClient (ref), u9 (copy)
        local v18 = ClientStore:getState();

        if v18.Game.spectating and (v18.Game.spectatingPlayer and v18.Game.spectatingPlayer.userId ~= Players.LocalPlayer.UserId) then
            local v19 = OfflinePlayerUtil.getPlayer(v18.Game.spectatingPlayer);
            local v20;

            if v19 == nil then
                v20 = v19;
            else
                v20 = v19.Character;
            end;

            if v20 == p17.entityInstance then
                local Team = v19.Team;

                if Team ~= nil then
                    Team = Team.Name;
                end;

                if not KnitClient.Controllers.BedwarsController:getTeamBed(Team == nil and "" or Team) then
                    u9:switchSpectateTargets("next");
                end;
            end;
        end;
    end);
    Players.LocalPlayer.CharacterAdded:Connect(function(p21) -- Line: 130
        -- upvalues: u9 (copy), Workspace (ref)
        if not u9:isSpectating() then
            Workspace.CurrentCamera.CameraSubject = p21:WaitForChild("Humanoid");
        end;
    end);
end;

function u6.isSpectating(p22) -- Line: 136
    return p22.spectating;
end;

function u6.setSpectateMode(p23, p24) -- Line: 139
    p23.mode = p24;
end;

function u6.isObserver(p25, p26) -- Line: 142
    return p26:GetAttribute("IsObserver") == true;
end;

function u6.getSpectateTargets(u27) -- Line: 145
    -- upvalues: Players (copy), GamePlayerUtil (copy), u5 (ref), Flamework (copy), ClientStore (copy)
    local function _(p28) -- Line: 148
        -- upvalues: Players (ref)
        return p28 ~= Players.LocalPlayer;
    end;

    local v29 = 0;
    local v30 = {};

    for i, v in Players:GetPlayers() do
        local _ = i - 1;

        if v ~= Players.LocalPlayer == true then
            v29 = v29 + 1;
            v30[v29] = v;
        end;
    end;

    local function _(p31) -- Line: 161
        -- upvalues: GamePlayerUtil (ref)
        return GamePlayerUtil.getGamePlayer(p31):isInGame();
    end;

    local v32 = 0;
    local v33 = {};

    for i, v in v30 do
        local _ = i - 1;

        if GamePlayerUtil.getGamePlayer(v):isInGame() == true then
            v32 = v32 + 1;
            v33[v32] = v;
        end;
    end;

    table.sort(v33, function(p34, p35) -- Line: 174
        -- upvalues: Players (ref)
        if p34.Team ~= p35.Team then
            if p34.Team == Players.LocalPlayer.Team then
                return true;
            end;

            if p35.Team == Players.LocalPlayer.Team then
                return false;
            end;
        end;

        return p34.DisplayName < p35.DisplayName;
    end);
    local v36;

    if u27.mode == u5.TEAM then
        local v37 = Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getCurrentTicket();
        local v38 = v37 and Players:GetPlayerByUserId(v37.reported);

        if v38 then
            u27.lockedTeamId = GamePlayerUtil.getGamePlayer(v38):getTeamId();
        end;

        local function v41(p39) -- Line: 196
            -- upvalues: ClientStore (ref), u27 (copy), GamePlayerUtil (ref)
            local Team = p39.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            local myTeam = ClientStore:getState().Game.myTeam;

            if myTeam ~= nil then
                myTeam = myTeam.name;
            end;

            local v40 = Team == myTeam;

            if not v40 then
                if u27.lockedTeamId == nil then
                    v40 = false;
                else
                    v40 = GamePlayerUtil.getGamePlayer(p39):getTeamId() == u27.lockedTeamId;
                end;
            end;

            return v40;
        end;

        v36 = v33;
        local v42 = 0;
        local v43 = {};

        for i, v in v33 do
            if v41(v, i - 1, v33) == true then
                v42 = v42 + 1;
                v43[v42] = v;
            end;
        end;

        if #v43 ~= 0 then
            return v43;
        end;
    elseif u27.mode == u5.PLAYER then
        local function _(p44) -- Line: 227
            -- upvalues: ClientStore (ref), u27 (copy)
            local UserId = p44.UserId;
            local spectatingPlayer = ClientStore:getState().Game.spectatingPlayer;

            if spectatingPlayer ~= nil then
                spectatingPlayer = spectatingPlayer.userId;
            end;

            return UserId == spectatingPlayer or p44.UserId == u27.lockedPlayerId;
        end;

        v36 = {};
        local v45 = 0;

        for i, v in v33 do
            local _ = i - 1;
            local UserId = v.UserId;
            local spectatingPlayer = ClientStore:getState().Game.spectatingPlayer;

            if spectatingPlayer ~= nil then
                spectatingPlayer = spectatingPlayer.userId;
            end;

            if (UserId == spectatingPlayer or v.UserId == u27.lockedPlayerId) == true then
                v45 = v45 + 1;
                v36[v45] = v;
            end;
        end;
    else
        v36 = v33;
    end;

    return v36;
end;

function u6.switchSpectateTargets(p46, p47) -- Line: 253
    -- upvalues: ClientStore (copy), OfflinePlayerUtil (copy)
    local v48 = p46:getSpectateTargets();
    local spectatingPlayer = ClientStore:getState().Game.spectatingPlayer;
    local v49;

    if spectatingPlayer then
        v49 = OfflinePlayerUtil.getPlayer(spectatingPlayer);
    else
        v49 = nil;
    end;

    local v50 = 0;

    if v49 then
        local v51 = (table.find(v48, v49) or 0) - 1;

        if v51 > -1 then
            if p47 == "next" then
                v50 = v51 + 1;
            else
                v50 = v51 - 1;
            end;
        end;
    end;

    local v52;

    if v50 < 0 then
        v52 = #v48 - 1;
    else
        v52 = #v48 <= v50 and 0 or v50;
    end;

    if v48 ~= nil then
        v48 = v48[v52 + 1];
    end;

    local v53;

    if v48 then
        v53 = OfflinePlayerUtil.getOfflinePlayer(v48);
    else
        v53 = nil;
    end;

    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = true,
        spectatingPlayer = v53
    });
end;

function u6.hookSpectatedPlayer(u54, u55) -- Line: 285
    -- upvalues: Players (copy), OfflinePlayerUtil (copy), ClientStore (copy), Workspace (copy), UserInputService (copy)
    u54.spectatingPlayerMaid:DoCleaning();
    u54.spectating = true;
    u54.spectatingPlayerMaid:GiveTask(function() -- Line: 288
        -- upvalues: u54 (copy)
        u54.spectating = false;
    end);
    u54.spectatingPlayerMaid:GiveTask(Players.PlayerRemoving:Connect(function(p56) -- Line: 291
        -- upvalues: u55 (copy), u54 (copy), OfflinePlayerUtil (ref), ClientStore (ref)
        if u55 == p56 then
            u54.spectatingPlayerMaid:DoCleaning();
            local v57 = u54:getSpectateTargets();

            if v57 ~= nil then
                v57 = v57[1];
            end;

            local v58;

            if v57 then
                v58 = OfflinePlayerUtil.getOfflinePlayer(v57);
            else
                v58 = nil;
            end;

            ClientStore:dispatch({
                type = "GameSetSpectator",
                spectating = true,
                spectatingPlayer = v58
            });
        end;
    end));
    task.spawn(function() -- Line: 307
        -- upvalues: u55 (copy), Workspace (ref)
        if u55.Character then
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
            local Character = u55.Character;

            if Character ~= nil then
                Character = Character:WaitForChild("Humanoid", 5);
            end;

            Workspace.CurrentCamera.CameraSubject = Character;
        end;
    end);
    u54.spectatingPlayerMaid:GiveTask(u55.CharacterAdded:Connect(function(p59) -- Line: 317
        -- upvalues: Workspace (ref)
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
        Workspace.CurrentCamera.CameraSubject = p59:WaitForChild("Humanoid");
    end));
    u54.spectatingPlayerMaid:GiveTask(UserInputService.InputBegan:Connect(function(p60, p61) -- Line: 321
        -- upvalues: u54 (copy)
        if p61 then
            return nil;
        end;

        if p60.UserInputState == Enum.UserInputState.Begin then
            if p60.UserInputType == Enum.UserInputType.MouseButton1 or p60.KeyCode == Enum.KeyCode.ButtonR2 then
                u54:switchSpectateTargets("next");

                return;
            end;

            if p60.KeyCode == Enum.KeyCode.ButtonL2 then
                u54:switchSpectateTargets("prev");
            end;
        end;
    end));

    local function _(p62) -- Line: 334
        if p62:IsA("ProximityPrompt") and p62.Enabled then
            p62.Enabled = false;
        end;
    end;

    for i, descendant in Workspace:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ProximityPrompt") and descendant.Enabled then
            descendant.Enabled = false;
        end;
    end;

    u54.spectatingPlayerMaid:GiveTask(function() -- Line: 342
        -- upvalues: Workspace (ref)
        local function _(p63) -- Line: 344
            if p63:IsA("ProximityPrompt") and not p63.Enabled then
                p63.Enabled = true;
            end;
        end;

        for i, descendant in Workspace:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ProximityPrompt") and not descendant.Enabled then
                descendant.Enabled = true;
            end;
        end;
    end);
end;

function u6.stopSpectatingPlayer(p64) -- Line: 354
    -- upvalues: u3 (copy), ClientStore (copy), Players (copy), Workspace (copy)
    u3:Enable();
    p64.spectatingPlayerMaid:DoCleaning();
    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = false,
        spectatingPlayer = nil
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Humanoid");
    end;

    if Character then
        Workspace.CurrentCamera.CameraSubject = Character;
    end;
end;

return {
    SpectateMode = u5,
    SpectateController = KnitClient.CreateController(u6.new())
};