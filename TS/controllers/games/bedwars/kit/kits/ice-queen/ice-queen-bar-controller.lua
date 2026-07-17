-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local IceQueenPassiveBarWrapper = RuntimeLib.import(script, script.Parent, "ui", "ice-queen-passive-bar").IceQueenPassiveBarWrapper;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "IceQueenBarController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 30
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), Workspace (copy)
    KnitController.constructor(p8);
    p8.Name = "IceQueenBarController";
    p8.log = default.ForContext(script);
    p8.camera = Workspace.CurrentCamera;
    p8.passiveMap = {};
    p8.stackUIMap = {};
end;

function u6.KnitStart(u9) -- Line: 42
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u9);
    WatchCollectionTag("entity", function(u10) -- Line: 44
        -- upvalues: u9 (copy)
        local v11 = u10:GetAttribute("IceQueenStacks");

        if v11 ~= nil and v11 > 0 then
            u9:updateStacks(u10, v11);
        end;

        u10:GetAttributeChangedSignal("IceQueenStacks"):Connect(function() -- Line: 49
            -- upvalues: u10 (copy), u9 (ref)
            local v12 = u10:GetAttribute("IceQueenStacks");

            if v12 ~= nil then
                u9:updateStacks(u10, v12);
            end;
        end);
    end);
end;

function u6.updateStacks(u13, u14, p15) -- Line: 57
    -- upvalues: u4 (copy), u2 (copy), IceQueenPassiveBarWrapper (copy), Players (copy), ReplicatedStorage (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), u3 (copy), CollectionService (copy), RunService (copy)
    local v16 = u13.passiveMap[u14];

    if p15 == 0 then
        if v16 then
            u13:cleanupStacks(u14);
        end;
    else
        if v16 then
            u13.log:Debug("Update ice queen bar to {bar}", p15);
            v16.setBar(p15);
            v16.particles:FindFirstChild("Snow"):SetAttribute("EmitCount", p15);
            u13.passiveMap[u14] = {
                bar = v16.bar,
                setBar = v16.setBar,
                maid = v16.maid,
                particles = v16.particles
            };

            return;
        end;

        local v17, v18 = u4.createBinding(p15);
        local v19 = u2.new();
        local v20 = u14:GetAttribute("IceQueenAttackerId");
        local v21 = u13.stackUIMap[u14];

        if v21 then
            u4.update(v21, u4.createElement(IceQueenPassiveBarWrapper, {
                adornee = u14.Head,
                bar = v17,
                lastAttackerUserId = v20
            }));
        else
            local v22 = u4.mount(u4.createElement(IceQueenPassiveBarWrapper, {
                adornee = u14.Head,
                bar = v17,
                lastAttackerUserId = v20
            }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
            u13.stackUIMap[u14] = v22;
        end;

        u14.AncestryChanged:Connect(function(p23, p24) -- Line: 104
            -- upvalues: u13 (copy), u14 (copy)
            if p24 == nil then
                u13:cleanupStacks(u14);
            end;
        end);
        local FrostBiteParticles = ReplicatedStorage.Assets.Effects.FrostBiteParticles;
        local v25 = KnitClient2.Controllers.IceQueenEffectsController:getAttackerKitSkin(u14);

        if v25 then
            local freiya = BedwarsKitSkinMeta[v25].freiya;
            local v26;

            if freiya == nil then
                v26 = freiya;
            else
                v26 = freiya.effects;

                if v26 ~= nil then
                    v26 = v26.idle;
                end;
            end;

            if v26 then
                FrostBiteParticles = freiya;

                if FrostBiteParticles ~= nil then
                    FrostBiteParticles = FrostBiteParticles.effects;

                    if FrostBiteParticles ~= nil then
                        FrostBiteParticles = FrostBiteParticles.idle;
                    end;
                end;
            end;
        end;

        local v27 = FrostBiteParticles:Clone();
        v27.Parent = u14;
        v27.Position = u14.PrimaryPart.Position;
        u3("WeldConstraint", {
            Part0 = v27,
            Part1 = u14.PrimaryPart,
            Parent = v27
        });
        local Snow = v27:FindFirstChild("Snow");
        CollectionService:AddTag(Snow, "FirstPersonHidden");
        Snow.Enabled = false;
        local u28 = 0;
        v19:GiveTask(RunService.Heartbeat:Connect(function(p29) -- Line: 144
            -- upvalues: u28 (ref), u13 (copy), u14 (copy), Players (ref), Snow (copy)
            u28 = u28 + p29;

            if u28 >= 1 then
                local camera = u13.camera;

                if camera ~= nil then
                    camera = (camera.Focus.Position - u13.camera.CFrame.Position).Magnitude;
                end;

                if camera ~= 0 and (camera == camera and camera) then
                    if u14 == Players.LocalPlayer.Character then
                        camera = camera < 0.6;
                    else
                        camera = false;
                    end;
                end;

                if camera ~= 0 and (camera == camera and camera) then
                    return nil;
                end;

                Snow:Emit(Snow:GetAttribute("EmitCount") * 3);
                u28 = 0;
            end;
        end));
        u13.passiveMap[u14] = {
            bar = v17,
            setBar = v18,
            maid = v19,
            particles = v27
        };
    end;
end;

function u6.cleanupStacks(p30, p31) -- Line: 178
    -- upvalues: u4 (copy)
    local v32 = p30.passiveMap[p31];

    if v32 ~= nil then
        v32.maid:DoCleaning();
    end;

    if v32 ~= nil then
        v32.particles:Destroy();
    end;

    p30.passiveMap[p31] = nil;
    local v33 = p30.stackUIMap[p31];

    if v33 then
        u4.unmount(v33);
    end;

    p30.stackUIMap[p31] = nil;
end;

KnitClient.CreateController(u6.new());

return nil;