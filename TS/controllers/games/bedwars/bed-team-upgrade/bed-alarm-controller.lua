-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedTeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-util").BedTeamUpgradeUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "BedAlarmController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "BedAlarmController";
    p8.bedAlarmModelMap = {};
    p8.highlightMap = {};
end;

function u6.KnitStart(u9) -- Line: 42
    -- upvalues: KnitController (copy), KnitClient2 (copy), GameSound (copy), default (copy), CollectionService (copy)
    KnitController.KnitStart(u9);
    KnitClient2.Controllers.PreloadController:runPreload({
        sounds = { GameSound.BED_ALARM_ACTIVATE, GameSound.BED_ALARM_TRIGGERED_FAR, GameSound.BED_ALARM_TRIGGERED }
    });
    default.Client:OnEvent("BedAlarmActivated", function(p10) -- Line: 47
        -- upvalues: u9 (copy)
        u9:handleBedAlarmActivated(p10);
    end);
    default.Client:OnEvent("BedAlarmTriggered", function(p11) -- Line: 50
        -- upvalues: u9 (copy)
        u9:handleBedAlarmTriggered(p11);
    end);
    default.Client:OnEvent("BedBroken", function(p12) -- Line: 53
        -- upvalues: u9 (copy)
        local v13 = u9.bedAlarmModelMap[p12];

        if v13 ~= nil then
            v13:Destroy();
        end;

        u9.bedAlarmModelMap[p12] = nil;
    end);

    local function _(p14) -- Line: 65
        -- upvalues: u9 (copy)
        u9:addIntruderPlayerHighlight(p14);
    end;

    for i, v in CollectionService:GetTagged("IntruderPlayer") do
        local _ = i - 1;
        u9:addIntruderPlayerHighlight(v);
    end;

    CollectionService:GetInstanceAddedSignal("IntruderPlayer"):Connect(function(p15) -- Line: 72
        -- upvalues: u9 (copy)
        if u9:isSameTeamAsLocalPlayer(p15) then
            return nil;
        end;

        u9:addIntruderPlayerHighlight(p15);
    end);
    CollectionService:GetInstanceRemovedSignal("IntruderPlayer"):Connect(function(p16) -- Line: 79
        -- upvalues: u9 (copy)
        if u9:isSameTeamAsLocalPlayer(p16) then
            return nil;
        end;

        local v17 = u9.highlightMap[p16.UserId];

        if v17 ~= nil then
            v17:DoCleaning();
        end;
    end);
end;

function u6.isSameTeamAsLocalPlayer(p18, p19) -- Line: 92
    -- upvalues: Players (copy), KnitClient2 (copy)
    return p19 == Players.LocalPlayer and true or KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer) == KnitClient2.Controllers.TeamController:getPlayerTeam(p19);
end;

function u6.addIntruderPlayerHighlight(u20, u21) -- Line: 100
    -- upvalues: u3 (copy), u4 (copy), default (copy), Players (copy)
    local u22 = u3.new();
    u20.highlightMap[u21.UserId] = u22;
    u22:GiveTask((u4("Highlight", {
        FillTransparency = 0.7,
        OutlineTransparency = 0,
        Parent = u21.Character,
        FillColor = Color3.fromRGB(204, 28, 28),
        OutlineColor = Color3.fromRGB(194, 33, 33),
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    })));
    u22:GiveTask(function() -- Line: 114
        -- upvalues: u20 (copy), u21 (copy)
        u20.highlightMap[u21.UserId] = nil;
    end);
    u22:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p23) -- Line: 120
        -- upvalues: Players (ref), u21 (copy), u22 (copy)
        if Players:GetPlayerFromCharacter(p23.entityInstance) == u21 then
            u22:DoCleaning();
        end;
    end));
end;

function u6.handleBedAlarmActivated(p24, p25) -- Line: 127
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy)
    p24:getOrCreateBedAlarmModel(p25.teamId, p25.bedPosition);
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if (Character:GetPivot().Position - p25.bedPosition).Magnitude >= 100 then
        return nil;
    end;

    SoundManager:playSound(GameSound.BED_ALARM_ACTIVATE, {
        rollOffMaxDistance = 70,
        position = p25.bedPosition
    });
end;

function u6.getOrCreateBedAlarmModel(p26, p27, p28) -- Line: 144
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), CollectionService (copy), GameQueryUtil (copy)
    local v29 = p26.bedAlarmModelMap[p27];

    if not v29 then
        v29 = ReplicatedStorage.Assets.Effects.BedAlarm:Clone();
        v29.Parent = Workspace;
        v29:PivotTo(CFrame.new(p28 + Vector3.new(0, 15, 0)));
        v29:SetAttribute("RotationSpeed", 90);
        CollectionService:AddTag(v29, "RotatingObject");

        local function _(p30) -- Line: 158
            -- upvalues: GameQueryUtil (ref)
            GameQueryUtil:setQueryIgnored(p30, true);
        end;

        for i, descendant in v29:GetDescendants() do
            local _ = i - 1;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;

        p26.bedAlarmModelMap[p27] = v29;
    end;

    return v29;
end;

function u6.handleBedAlarmTriggered(p31, p32) -- Line: 171
    p31:playBedAlarmSound(p32);
    p31:notifyTeamOfIntruder(p32);
    p31:triggerBedAlarmModel(p32);
end;

function u6.triggerBedAlarmModel(u33, u34) -- Line: 176
    -- upvalues: u3 (copy), RunService (copy), BedTeamUpgradeUtil (copy)
    local u35 = u3.new();
    local u36 = u33:getOrCreateBedAlarmModel(u34.teamId, u34.bedPosition);
    u35:GiveTask(function() -- Line: 179
        -- upvalues: u33 (copy), u34 (copy), u36 (copy)
        u33.bedAlarmModelMap[u34.teamId] = nil;
        u36:Destroy();
    end);
    u36:SetAttribute("RotationSpeed", 270);

    local function u45(u37) -- Line: 187
        -- upvalues: u36 (copy)
        local function _(p38) -- Line: 189
            -- upvalues: u37 (copy)
            if p38:IsA("BasePart") then
                local v39;

                if u37 then
                    v39 = Color3.fromRGB(226, 88, 88);
                else
                    v39 = Color3.fromRGB(82, 124, 174);
                end;

                p38.Color = v39;
            end;
        end;

        for i, child in u36.Sides:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                local v40;

                if u37 then
                    v40 = Color3.fromRGB(226, 88, 88);
                else
                    v40 = Color3.fromRGB(82, 124, 174);
                end;

                child.Color = v40;
            end;
        end;

        local Inner = u36.Recolor.Inner;
        local v41;

        if u37 then
            v41 = Color3.fromRGB(195, 70, 70);
        else
            v41 = Color3.fromRGB(33, 84, 185);
        end;

        Inner.Color = v41;
        local Outer = u36.Recolor.Outer;
        local v42;

        if u37 then
            v42 = Color3.fromRGB(188, 74, 74);
        else
            v42 = Color3.fromRGB(82, 124, 174);
        end;

        Outer.Color = v42;
        local Bulb = u36.Recolor.Bulb;
        local v43;

        if u37 then
            v43 = Color3.fromRGB(195, 70, 70);
        else
            v43 = Color3.fromRGB(0, 16, 176);
        end;

        Bulb.Color = v43;
        local Glow = u36.Recolor.Bulb.GlowAttachment.Glow;
        local new = ColorSequence.new;
        local v44;

        if u37 then
            v44 = Color3.fromRGB(255, 0, 0);
        else
            v44 = Color3.fromRGB(0, 60, 255);
        end;

        Glow.Color = new(v44);
    end;

    local u46 = true;
    local u47 = 0;
    u35:GiveTask(RunService.Heartbeat:Connect(function(p48) -- Line: 205
        -- upvalues: u47 (ref), u46 (ref), u45 (copy)
        u47 = u47 + p48;

        if u47 < 0.5 then
            return nil;
        end;

        u47 = 0;
        u46 = not u46;
        u45(u46);
    end));
    task.delay(BedTeamUpgradeUtil.BedAlarmTriggeredDuration, function() -- Line: 214
        -- upvalues: u35 (copy)
        u35:DoCleaning();
    end);
end;

function u6.notifyTeamOfIntruder(p49, p50) -- Line: 218
    -- upvalues: KnitClient2 (copy), Players (copy), Flamework (copy)
    local teamId = p50.teamId;
    local v51 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if v51 ~= nil then
        v51 = v51.id;
    end;

    if teamId == v51 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            message = "[Bed Alarm]: An intruder is near your bed!"
        });
    end;
end;

function u6.playBedAlarmSound(p52, p53) -- Line: 231
    -- upvalues: KnitClient2 (copy), Players (copy), SoundManager (copy), GameSound (copy), BedTeamUpgradeUtil (copy)
    local teamId = p53.teamId;
    local v54 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if v54 ~= nil then
        v54 = v54.id;
    end;

    local v55 = teamId == v54;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    local v56;

    if Character then
        v56 = (Character - p53.bedPosition).Magnitude < 30;
    else
        v56 = false;
    end;

    local v57;

    if v56 or not v55 then
        v57 = GameSound.BED_ALARM;
    else
        v57 = GameSound.BED_ALARM_TRIGGERED_FAR;
    end;

    local v58 = {
        rollOffMaxDistance = 100,
        looped = true,
        volumeMultiplier = 0.75
    };
    local v59;

    if v56 or not v55 then
        v59 = p53.bedPosition;
    else
        v59 = nil;
    end;

    v58.position = v59;
    local u60 = SoundManager:playSound(v57, v58);

    if u60 then
        task.delay(BedTeamUpgradeUtil.BedAlarmTriggeredDuration, function() -- Line: 255
            -- upvalues: SoundManager (ref), u60 (copy)
            SoundManager:tweenSoundVolume(u60, 0, 0.2);
            task.delay(0.2, function() -- Line: 257
                -- upvalues: u60 (ref)
                u60:Stop();
            end);
        end);
    end;
end;

KnitClient.CreateController(u6.new());

return nil;