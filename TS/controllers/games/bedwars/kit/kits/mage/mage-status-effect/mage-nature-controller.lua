-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local MageElement = v2.MageElement;
local MageKitUtil = v2.MageKitUtil;
local BannerConnection = ReplicatedStorage.Assets.Effects.BannerConnection;
local u3 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true);
local colorSequence = MageKitUtil.MageElementMeta[MageElement.NATURE].colorSequence;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "MageNatureController";
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
    p6.Name = "MageNatureController";
    p6.playerBeamMap = {};
    p6.hitTimeMap = {};
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), EntityUtil (copy), MageKitUtil (copy), MageElement (copy)
    KnitController.KnitStart(u7);
    u7:beamCleanupTicker();
    ClientSyncEvents.ProjectileHit:connect(function(p8) -- Line: 45
        -- upvalues: EntityUtil (ref), MageKitUtil (ref), MageElement (ref), u7 (copy)
        if p8:isCancelled() then
            return nil;
        end;

        if p8.projectileType ~= "mage_spell_nature" then
            return nil;
        end;

        if p8.shooter == nil then
            return nil;
        end;

        local v9 = p8.shooter:getInstance();

        if not v9 then
            return nil;
        end;

        local v10 = EntityUtil:getPlayerFromEntityInstance(v9);

        if not v10 then
            return nil;
        end;

        local hitEntity = p8.hitEntity;

        if hitEntity ~= nil then
            hitEntity = hitEntity:getInstance();
        end;

        if not hitEntity then
            return nil;
        end;

        if MageKitUtil.hasUnlockedMageElement(v10, MageElement.NATURE) then
            u7:playLifeStealEffect(v9, hitEntity);
        end;
    end);
end;

function u4.isLocal(p11, p12) -- Line: 76
    -- upvalues: Players (copy)
    return p12 == Players.LocalPlayer.Character;
end;

function u4.playLifeStealEffect(p13, p14, u15) -- Line: 79
    -- upvalues: BannerConnection (copy), colorSequence (copy), TweenService (copy), u3 (copy), Workspace (copy)
    if p13:isLocal(p14) or p13:isLocal(u15) then
        local UpperTorso = p14:WaitForChild("UpperTorso", 1);

        if UpperTorso ~= nil then
            UpperTorso = UpperTorso:WaitForChild("BodyFrontAttachment", 1);
        end;

        local UpperTorso2 = u15:WaitForChild("UpperTorso", 1);

        if UpperTorso2 ~= nil then
            UpperTorso2 = UpperTorso2:WaitForChild("BodyFrontAttachment", 1);
        end;

        local v16 = BannerConnection.Beam1:Clone();
        local v17 = BannerConnection.Beam2:Clone();

        if UpperTorso and UpperTorso2 then
            local v18 = p13.playerBeamMap[p14];
            local v19;

            if v18 == nil then
                v19 = v18;
            else
                local function _(p20) -- Line: 99
                    -- upvalues: u15 (copy)
                    return p20.target == u15;
                end;

                v19 = nil;

                for i, v in v18 do
                    local _ = i - 1;

                    if v.target == u15 == true then
                        v19 = v;
                        break;
                    end;
                end;
            end;

            if not v19 then
                v16.Color = colorSequence;
                v16.Attachment0 = UpperTorso;
                v16.Attachment1 = UpperTorso2;
                v16.Parent = p14;
                v17.Color = ColorSequence.new(Color3.fromRGB(252, 245, 176));
                v17.Attachment0 = UpperTorso;
                v17.Attachment1 = UpperTorso2;
                v17.Parent = p14;
                TweenService:Create(v16, u3, {
                    CurveSize0 = -1.25,
                    CurveSize1 = 1.25,
                    Width0 = 1.4,
                    Width1 = 1.4
                }):Play();
                TweenService:Create(v17, u3, {
                    CurveSize0 = 1.25,
                    CurveSize1 = -1.25,
                    Width0 = 1.2,
                    Width1 = 1.2
                }):Play();

                if v18 then
                    table.insert(v18, {
                        target = u15,
                        front = v16,
                        back = v17
                    });
                else
                    p13.playerBeamMap[p14] = {
                        {
                            target = u15,
                            front = v16,
                            back = v17
                        }
                    };
                end;
            end;
        end;

        local v21 = p13.hitTimeMap[p14];

        if v21 then
            v21[u15] = Workspace:GetServerTimeNow();

            return;
        end;

        local v22 = {
            [u15] = Workspace:GetServerTimeNow()
        };
        p13.hitTimeMap[p14] = v22;
    end;
end;

function u4.beamCleanupTicker(u23) -- Line: 175
    -- upvalues: RunService (copy), Workspace (copy), BalanceFile (copy)
    RunService.Heartbeat:Connect(function() -- Line: 176
        -- upvalues: u23 (copy), Workspace (ref), BalanceFile (ref)
        local hitTimeMap = u23.hitTimeMap;

        local function v35(p24, u25) -- Line: 178
            -- upvalues: Workspace (ref), BalanceFile (ref), u23 (ref)
            local function v34(p26, u27) -- Line: 180
                -- upvalues: Workspace (ref), BalanceFile (ref), u23 (ref), u25 (copy)
                if Workspace:GetServerTimeNow() - p26 >= BalanceFile.MAGE_LIFE_STEAL_DURATION then
                    local v28 = u23.playerBeamMap[u25];
                    local v29;

                    if v28 == nil then
                        v29 = v28;
                    else
                        local function _(p30) -- Line: 188
                            -- upvalues: u27 (copy)
                            return p30.target == u27;
                        end;

                        v29 = nil;

                        for i, v in v28 do
                            local _ = i - 1;

                            if v.target == u27 == true then
                                v29 = v;
                                break;
                            end;
                        end;
                    end;

                    if v28 ~= nil then
                        local function _(p31) -- Line: 205
                            -- upvalues: u27 (copy)
                            return p31.target ~= u27;
                        end;

                        local v32 = 0;
                        v28 = {};

                        for i, v in v28 do
                            local _ = i - 1;

                            if v.target ~= u27 == true then
                                v32 = v32 + 1;
                                v28[v32] = v;
                            end;
                        end;
                    end;

                    if v28 then
                        u23.playerBeamMap[u25] = v28;
                    end;

                    if v29 then
                        v29.front:Destroy();
                        v29.front.Parent = nil;
                        v29.back:Destroy();
                        v29.back.Parent = nil;
                    end;

                    local v33 = u23.hitTimeMap[u25];

                    if v33 ~= nil then
                        v33[u27] = nil;
                    end;
                end;
            end;

            for i, v in p24 do
                v34(v, i, p24);
            end;
        end;

        for i, v in hitTimeMap do
            v35(v, i, hitTimeMap);
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;