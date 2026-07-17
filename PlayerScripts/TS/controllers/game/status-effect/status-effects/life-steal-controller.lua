-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BannerConnection = ReplicatedStorage.Assets.Effects.BannerConnection;
local u2 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true);
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "LifeStealController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "LifeStealController";
    p5.playerBeamMap = {};
    p5.hitTimeMap = {};
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u6);
    u6:beamCleanupTicker();
    default.Client:OnEvent("LifeStealHit", function(p7, p8, p9, p10) -- Line: 43
        -- upvalues: u6 (copy)
        local v11 = {};
        local v12;

        if p10 == nil then
            v12 = p10;
        else
            v12 = p10.beamColors;
        end;

        v11.extraBeams = v12;
        u6:playRegenEffect(p7, p8, v11);

        if p10 ~= nil then
            p10 = p10.volumeMultiplier;
        end;

        u6:playRegenSound(p7, p9, p10);
    end);
end;

function u3.playRegenEffect(u13, u14, u15, p16) -- Line: 65
    -- upvalues: BannerConnection (copy), TweenService (copy), u2 (copy), Workspace (copy)
    local v17 = u13:isLocal(u14) or u13:isLocal(u15);

    if not v17 then
        if p16 == nil then
            v17 = p16;
        else
            v17 = p16.skipLocalCheck;
        end;
    end;

    if v17 then
        local UpperTorso = u14:WaitForChild("UpperTorso", 1);

        if UpperTorso ~= nil then
            UpperTorso = UpperTorso:WaitForChild("BodyFrontAttachment", 1);
        end;

        local UpperTorso2 = u15:WaitForChild("UpperTorso", 1);

        if UpperTorso2 ~= nil then
            UpperTorso2 = UpperTorso2:WaitForChild("BodyFrontAttachment", 1);
        end;

        local v18;

        if p16 == nil then
            v18 = p16;
        else
            v18 = p16.mainBeamColor;
        end;

        if v18 == nil then
            v18 = Color3.new(0, 90, 0);
        end;

        local v19 = ColorSequence.new(v18);
        local v20;

        if p16 == nil then
            v20 = p16;
        else
            v20 = p16.secondaryBeamColor;
        end;

        if v20 == nil then
            v20 = Color3.new(0, 0, 0);
        end;

        local v21 = {
            { v19, ColorSequence.new(v20) }
        };
        local v22;

        if p16 == nil then
            v22 = p16;
        else
            v22 = p16.extraBeams;
        end;

        local v23;

        if v22 then
            v23 = {};
            local v24 = #v23;
            local v25 = #v21;
            table.move(v21, 1, v25, v24 + 1, v23);
            local extraBeams = p16.extraBeams;
            table.move(extraBeams, 1, #extraBeams, v24 + v25 + 1, v23);
        else
            v23 = v21;
        end;

        if UpperTorso and UpperTorso2 then
            local u26 = u13.playerBeamMap[u14];
            local v27;

            if u26 == nil then
                v27 = u26;
            else
                local function _(p28) -- Line: 123
                    -- upvalues: u15 (copy)
                    return p28.target == u15;
                end;

                v27 = nil;

                for i, v in u26 do
                    local _ = i - 1;

                    if v.target == u15 == true then
                        v27 = v;
                        break;
                    end;
                end;
            end;

            if not v27 then
                local function v32(p29) -- Line: 140
                    -- upvalues: BannerConnection (ref), UpperTorso (copy), UpperTorso2 (copy), u14 (copy), TweenService (ref), u2 (ref), u26 (copy), u15 (copy), u13 (copy)
                    local v30 = BannerConnection.Beam1:Clone();
                    local v31 = BannerConnection.Beam2:Clone();
                    v30.Color = p29[1];
                    v30.Attachment0 = UpperTorso;
                    v30.Attachment1 = UpperTorso2;
                    v30.Parent = u14;
                    v31.Color = p29[2];
                    v31.Attachment0 = UpperTorso;
                    v31.Attachment1 = UpperTorso2;
                    v31.Parent = u14;
                    TweenService:Create(v30, u2, {
                        CurveSize0 = -1.25,
                        CurveSize1 = 1.25,
                        Width0 = 1.4,
                        Width1 = 1.4
                    }):Play();
                    TweenService:Create(v31, u2, {
                        CurveSize0 = 1.25,
                        CurveSize1 = -1.25,
                        Width0 = 1.2,
                        Width1 = 1.2
                    }):Play();

                    if u26 then
                        table.insert(u26, {
                            target = u15,
                            front = v30,
                            back = v31
                        });

                        return;
                    end;

                    u13.playerBeamMap[u14] = {
                        {
                            target = u15,
                            front = v30,
                            back = v31
                        }
                    };
                end;

                for i, v in v23 do
                    v32(v, i - 1, v23);
                end;
            end;
        end;

        local v33 = u13.hitTimeMap[u14];

        if v33 then
            v33[u15] = Workspace:GetServerTimeNow();

            return;
        end;

        local v34 = {
            [u15] = Workspace:GetServerTimeNow()
        };
        u13.hitTimeMap[u14] = v34;
    end;
end;

function u3.beamCleanupTicker(u35) -- Line: 207
    -- upvalues: RunService (copy), Workspace (copy)
    RunService.Heartbeat:Connect(function() -- Line: 208
        -- upvalues: u35 (copy), Workspace (ref)
        local hitTimeMap = u35.hitTimeMap;

        local function v49(p36, u37) -- Line: 210
            -- upvalues: Workspace (ref), u35 (ref)
            local function v48(p38, u39) -- Line: 212
                -- upvalues: Workspace (ref), u35 (ref), u37 (copy)
                if Workspace:GetServerTimeNow() - p38 >= 1 then
                    local v40 = u35.playerBeamMap[u37];
                    local v41;

                    if v40 == nil then
                        v41 = v40;
                    else
                        local function _(p42) -- Line: 220
                            -- upvalues: u39 (copy)
                            return p42.target == u39;
                        end;

                        local v43 = 0;
                        v41 = {};

                        for i, v in v40 do
                            local _ = i - 1;

                            if v.target == u39 == true then
                                v43 = v43 + 1;
                                v41[v43] = v;
                            end;
                        end;
                    end;

                    if v40 ~= nil then
                        local function _(p44) -- Line: 238
                            -- upvalues: u39 (copy)
                            return p44.target ~= u39;
                        end;

                        local v45 = 0;
                        v40 = {};

                        for i, v in v40 do
                            local _ = i - 1;

                            if v.target ~= u39 == true then
                                v45 = v45 + 1;
                                v40[v45] = v;
                            end;
                        end;
                    end;

                    if v40 then
                        u35.playerBeamMap[u37] = v40;
                    end;

                    if v41 ~= nil then
                        local function _(p46) -- Line: 261
                            p46.front:Destroy();
                            p46.front.Parent = nil;
                            p46.back:Destroy();
                            p46.back.Parent = nil;
                        end;

                        for i, v in v41 do
                            local _ = i - 1;
                            v.front:Destroy();
                            v.front.Parent = nil;
                            v.back:Destroy();
                            v.back.Parent = nil;
                        end;
                    end;

                    local v47 = u35.hitTimeMap[u37];

                    if v47 ~= nil then
                        v47[u39] = nil;
                    end;
                end;
            end;

            for i, v in p36 do
                v48(v, i, p36);
            end;
        end;

        for i, v in hitTimeMap do
            v49(v, i, hitTimeMap);
        end;
    end);
end;

function u3.playRegenSound(p50, p51, p52, p53) -- Line: 289
    -- upvalues: GameSound (copy), SoundManager (copy)
    local v54;

    if p52 then
        v54 = GameSound.LIFE_STEAL_OVERHEAL;
    else
        v54 = GameSound.LIFE_STEAL_HEAL;
    end;

    local v55 = {};
    local v56;

    if p50:isLocal(p51) then
        v56 = nil;
    else
        v56 = p51.PrimaryPart;

        if v56 ~= nil then
            v56 = v56.Position;
        end;
    end;

    v55.position = v56;
    v55.volumeMultiplier = p53 == nil and 1 or p53;
    SoundManager:playSound(v54, v55);
end;

function u3.isLocal(p57, p58) -- Line: 313
    -- upvalues: Players (copy)
    return p58 == Players.LocalPlayer.Character;
end;

KnitClient.CreateController(u3.new());

return nil;