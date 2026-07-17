-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v3.HttpService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local AeryStacksUi = RuntimeLib.import(script, script.Parent, "ui", "aery-stack-ui").AeryStacksUi;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "AeryKitController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p6, BedwarsKit.AERY);
    p6.Name = "AeryKitController";
end;

function u4.onKitLocalActivated(u7, u8) -- Line: 37
    -- upvalues: default (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), u1 (copy), HttpService (copy), RunService (copy)
    u7:setUpTree();
    default.Client:OnEvent("AeryGiveButterfly", function(p9) -- Line: 39
        -- upvalues: Players (ref), u7 (copy), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), u1 (ref), HttpService (ref), RunService (ref)
        if not Players.LocalPlayer.Character then
            return nil;
        end;

        local u10 = u7:getKitSkinData(Players.LocalPlayer.Character);
        local v11;

        if u10 == nil then
            v11 = u10;
        else
            v11 = u10.butterflySpawnSound;
        end;

        if v11 == nil then
            v11 = GameSound.AERY_BUTTERFLY_SPAWN;
        end;

        SoundManager:playSound(v11);
        local v12 = false;
        local v13 = 0;

        while true do
            if v12 then
                v13 = v13 + 1;
            else
                v12 = true;
            end;

            if v13 >= p9.amount then
                return;
            end;

            local v14;

            if u10 == nil then
                v14 = u10;
            else
                v14 = u10.butterflyEffect;
            end;

            local u15;

            if v14 then
                u15 = u10.butterflyEffect:Clone();
            else
                u15 = ReplicatedStorage.Assets.Effects.AeryButterfly:Clone();
            end;

            u15.Parent = Workspace;
            u15:PivotTo(CFrame.new(p9.position));
            local u16 = u1.new();
            u16:GiveTask(function() -- Line: 79
                -- upvalues: u15 (ref)
                u15:Destroy();
            end);
            local u17 = 0;
            local u18 = v13 * 0.2 + 1.2;
            local UpperTorso = p9.givenToEntity:FindFirstChild("UpperTorso");

            if UpperTorso == nil then
                return nil;
            end;

            local v19 = math.random(-2, 2);
            local v20 = math.random(3, 4);
            local u21 = Vector3.new(v19, v20, math.random(-2, 2));
            local u22 = HttpService:GenerateGUID(false);
            RunService:BindToRenderStep(u22, Enum.RenderPriority.Last.Value, function(p23) -- Line: 90
                -- upvalues: UpperTorso (copy), u15 (ref), u17 (ref), u18 (copy), u21 (copy)
                if UpperTorso.Parent == nil then
                    return nil;
                end;

                if u15.PrimaryPart == nil then
                    return nil;
                end;

                u17 = u17 + p23;
                local v24 = math.clamp(u17 / u18, 0, 1);
                local v25 = u15.PrimaryPart.Position:Lerp(UpperTorso.Position, (math.sqrt(v24)));
                local v26 = math.sin(v24 * 3.141592653589793);
                local v27 = v25 + u21 * Vector3.new(v26, v26, v26);
                u15:PivotTo(CFrame.new(v27));
            end);
            u16:GiveTask(function() -- Line: 107
                -- upvalues: RunService (ref), u22 (copy)
                RunService:UnbindFromRenderStep(u22);
            end);
            task.delay(u18, function() -- Line: 110
                -- upvalues: SoundManager (ref), u10 (copy), GameSound (ref), u16 (copy)
                local v28 = u10;

                if v28 ~= nil then
                    v28 = v28.butterflyConsumeSound;
                end;

                if v28 == nil then
                    v28 = GameSound.AERY_BUTTERFLY_CONSUME;
                end;

                SoundManager:playSound(v28);
                u16:DoCleaning();
            end);
        end;
    end):andThen(function(p29) -- Line: 125
        -- upvalues: u8 (copy)
        u8:GiveTask(p29);
    end);
end;

function u4.onKitLocalDeactivated(p30) -- Line: 129
    p30:unmountTree();
end;

function u4.onKitReplicationActivated(p31, p32) -- Line: 132
end;

function u4.onKitReplicationDeactivated(p33) -- Line: 134
end;

function u4.onInnateAbilityEnabled(p34, p35, p36) -- Line: 136
end;

function u4.onAbilityUsed(p37, p38, p39) -- Line: 138
end;

function u4.setUpTree(u40) -- Line: 140
    -- upvalues: Players (copy), KnitClient (copy), u2 (copy), AeryStacksUi (copy)
    u40:unmountTree();

    if not u40.aeryStackTree then
        local v41 = Players.LocalPlayer:GetAttribute("AeryStacks");
        u40.aeryStackTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(AeryStacksUi, {
            aeryStacks = v41
        }));
    end;

    Players.LocalPlayer:GetAttributeChangedSignal("AeryStacks"):Connect(function(p42) -- Line: 148
        -- upvalues: u40 (copy)
        u40:updateTree();
    end);
end;

function u4.updateTree(p43) -- Line: 152
    -- upvalues: Players (copy), u2 (copy), AeryStacksUi (copy)
    if p43.aeryStackTree then
        local v44 = Players.LocalPlayer:GetAttribute("AeryStacks");
        u2.update(p43.aeryStackTree, u2.createElement(AeryStacksUi, {
            aeryStacks = v44
        }));
    end;
end;

function u4.unmountTree(p45) -- Line: 160
    -- upvalues: u2 (copy)
    if p45.aeryStackTree then
        u2.unmount(p45.aeryStackTree);
        p45.aeryStackTree = nil;
    end;
end;

function u4.getKitSkinData(p46, p47) -- Line: 166
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if p47 then
        return BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p47)].aery;
    end;

    return nil;
end;

KnitClient.CreateController(u4.new());

return nil;