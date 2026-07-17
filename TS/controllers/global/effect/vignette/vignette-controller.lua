-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayerCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u8 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local VignetteApp = RuntimeLib.import(script, script.Parent, "vignette-app").VignetteApp;
local VignetteMeta = RuntimeLib.import(script, script.Parent, "vignette-meta").VignetteMeta;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "VignetteController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 37
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 41
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p11);
    p11.Name = "VignetteController";
    p11.activeVignetteMaid = {};
    p11.enableOnScreenEffects = true;
    p11.maid = u3.new();
end;

function u9.KnitStart(u12) -- Line: 48
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Setting (copy), ClientStore (copy), Players (copy), WatchPlayerCharacter (copy), EntityUtil (copy), u2 (copy), VignetteMeta (copy), default (copy)
    KnitController.KnitStart(u12);
    u12.maid:GiveTask(ClientSyncEvents.SettingChanged:connect(function(p13) -- Line: 50
        -- upvalues: Setting (ref), u12 (copy), ClientStore (ref)
        if p13.setting == Setting.ENABLE_ON_SCREEN_EFFECTS then
            u12.enableOnScreenEffects = ClientStore:getState().Settings.enable_on_screen_effects;

            if not u12.enableOnScreenEffects then
                u12:destroyAllVignettes();
            end;
        end;
    end));
    u12.enableOnScreenEffects = ClientStore:getState().Settings.enable_on_screen_effects;
    u12.maid:GiveTask(Players.LocalPlayer.CharacterRemoving:Connect(function() -- Line: 59
        -- upvalues: u12 (copy)
        u12:destroyAllVignettes();
    end));
    u12.maid:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p14, p15) -- Line: 62
        -- upvalues: u12 (copy)
        p15:GiveTask(p14:WaitForChild("Humanoid").Died:Connect(function() -- Line: 64
            -- upvalues: u12 (ref)
            u12:destroyAllVignettes();
        end));
    end));
    u12.maid:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(u16) -- Line: 68
        -- upvalues: EntityUtil (ref), Players (ref), u2 (ref), VignetteMeta (ref), u12 (copy)
        local v17 = EntityUtil:getPlayerFromEntityInstance(u16.entityInstance);

        if not v17 then
            return nil;
        end;

        if v17 ~= Players.LocalPlayer then
            return nil;
        end;

        local function _(p18) -- Line: 77
            -- upvalues: u16 (copy)
            local _ = p18[1];
            local statusEffectType = p18[2].statusEffectType;

            if statusEffectType ~= nil then
                statusEffectType = table.find(statusEffectType, u16.statusEffect) ~= nil;
            end;

            return statusEffectType;
        end;

        local v19 = nil;

        for i, v in u2.entries(VignetteMeta) do
            local _ = i - 1;
            local _ = v[1];
            local statusEffectType = v[2].statusEffectType;

            if statusEffectType ~= nil then
                statusEffectType = table.find(statusEffectType, u16.statusEffect) ~= nil;
            end;

            if statusEffectType == true then
                v19 = v;
                break;
            end;
        end;

        if v19 ~= nil then
            v19 = v19[1];
        end;

        if not v19 then
            return nil;
        end;

        u12:createVignette(v19);
    end));
    u12.maid:GiveTask(ClientSyncEvents.StatusEffectRemoved:connect(function(u20) -- Line: 106
        -- upvalues: EntityUtil (ref), Players (ref), u2 (ref), VignetteMeta (ref), u12 (copy)
        local v21 = EntityUtil:getPlayerFromEntityInstance(u20.entityInstance);

        if not v21 then
            return nil;
        end;

        if v21 ~= Players.LocalPlayer then
            return nil;
        end;

        local function _(p22) -- Line: 115
            -- upvalues: u20 (copy)
            local _ = p22[1];
            local statusEffectType = p22[2].statusEffectType;

            if statusEffectType ~= nil then
                statusEffectType = table.find(statusEffectType, u20.statusEffect) ~= nil;
            end;

            return statusEffectType;
        end;

        local v23 = nil;

        for i, v in u2.entries(VignetteMeta) do
            local _ = i - 1;
            local _ = v[1];
            local statusEffectType = v[2].statusEffectType;

            if statusEffectType ~= nil then
                statusEffectType = table.find(statusEffectType, u20.statusEffect) ~= nil;
            end;

            if statusEffectType == true then
                v23 = v;
                break;
            end;
        end;

        if v23 ~= nil then
            v23 = v23[1];
        end;

        if not v23 then
            return nil;
        end;

        u12:destroyVignette(v23);
    end));
    u12.maid:GiveTask(function() -- Line: 144
        -- upvalues: u12 (copy)
        u12:destroyAllVignettes();
    end);
    u12.maid:GiveTask(default.Client:Get("CreateVignette"):Connect(function(p24) -- Line: 147
        -- upvalues: u12 (copy)
        local vignetteType = p24.vignetteType;

        if not vignetteType then
            return nil;
        end;

        u12:createVignette(vignetteType);
    end));
    u12.maid:GiveTask(default.Client:Get("DestroyVignette"):Connect(function(p25) -- Line: 154
        -- upvalues: u12 (copy)
        local vignetteType = p25.vignetteType;

        if not vignetteType then
            return nil;
        end;

        u12:destroyVignette(vignetteType);
    end));
end;

function u9.createVignette(p26, p27, p28) -- Line: 162
    -- upvalues: VignetteMeta (copy), u3 (copy), KnitClient (copy)
    if not p26.enableOnScreenEffects then
        return nil;
    end;

    local v29 = VignetteMeta[p27];

    if not v29 then
        return nil;
    end;

    if p26.activeVignetteMaid[p27] ~= nil then
        return nil;
    end;

    local v30 = u3.new();

    if v29.particle then
        local u31 = {};
        local emitters = v29.particle.emitters;

        local function v34(p32) -- Line: 179
            -- upvalues: u31 (copy)
            if p32:IsA("ParticleEmitter") then
                table.insert(u31, p32);

                return;
            end;

            if p32:IsA("Folder") then
                local function _(p33) -- Line: 186
                    -- upvalues: u31 (ref)
                    if p33:IsA("ParticleEmitter") then
                        table.insert(u31, p33);
                    end;
                end;

                for i, child in p32:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        table.insert(u31, child);
                    end;
                end;
            end;
        end;

        for i, v in emitters do
            v34(v, i - 1, emitters);
        end;

        local VignetteController = KnitClient.Controllers.VignetteController;
        local v35 = {
            particleEmitters = u31,
            offset = v29.particle.offset,
            fadeOutDuration = v29.particle.fadeOutDuration,
            fadeInDuration = v29.particle.fadeInDuration,
            shouldShow = v29.particle.shouldShow
        };
        local v36;

        if p28 == nil then
            v36 = p28;
        else
            v36 = p28.transparencyMultiplier;
        end;

        v35.transparencyMultiplier = v36;
        local v37 = {};

        if p28 ~= nil then
            p28 = p28.maxRate;
        end;

        v37.Rate = p28;
        v35.config = v37;
        v30:GiveTask(VignetteController:createParticlesVignette(v35));
    end;

    if v29.vignette then
        local VignetteController = KnitClient.Controllers.VignetteController;
        local v38 = {};

        for i, v in v29.vignette do
            v38[i] = v;
        end;

        v38.fadeOutDuration = v29.vignette.fadeOutDuration;
        v38.fadeInDuration = v29.vignette.fadeInDuration;
        v30:GiveTask(VignetteController:createRadialVignette(v38));
    end;

    p26.activeVignetteMaid[p27] = v30;
end;

function u9.destroyVignette(p39, p40) -- Line: 242
    local v41 = p39.activeVignetteMaid[p40];

    if v41 ~= nil then
        v41:Destroy();
    end;

    p39.activeVignetteMaid[p40] = nil;
end;

function u9.destroyAllVignettes(p42) -- Line: 253
    local function _(p43) -- Line: 255
        p43:Destroy();
    end;

    for _, v in p42.activeVignetteMaid do
        v:Destroy();
    end;

    table.clear(p42.activeVignetteMaid);
end;

function u9.createRadialVignette(p44, u45) -- Line: 263
    -- upvalues: u3 (copy), u7 (copy), u5 (copy), VignetteApp (copy), Players (copy)
    local u46 = u3.new();
    local u47 = u7.new();
    u46:GiveTask(u47);
    local v48 = {};

    for i, v in u45 do
        v48[i] = v;
    end;

    v48.signalDestroy = u47;
    local u49 = u5.mount(u5.createElement(VignetteApp, v48), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u46:GiveTask(function() -- Line: 274
        -- upvalues: u5 (ref), u49 (copy)
        u5.unmount(u49);
    end);
    local v50 = u3.new();
    v50:GiveTask(function() -- Line: 278
        -- upvalues: u46 (copy), u47 (copy), u45 (copy)
        if not u46 then
            return nil;
        end;

        u47:Fire();
        local fadeOutDuration = u45.fadeOutDuration;

        if fadeOutDuration ~= 0 and (fadeOutDuration == fadeOutDuration and fadeOutDuration) then
            fadeOutDuration = u45.fadeOutDuration > 0;
        end;

        if fadeOutDuration == 0 or (fadeOutDuration ~= fadeOutDuration or not fadeOutDuration) then
            u46:Destroy();

            return;
        end;

        task.delay(u45.fadeOutDuration, function() -- Line: 288
            -- upvalues: u46 (ref)
            u46:Destroy();
        end);
    end);

    return v50;
end;

function u9.createParticlesVignette(p51, u52) -- Line: 297
    -- upvalues: Workspace (copy), u3 (copy), RunService (copy), EffectUtil (copy), u8 (copy), KnitClient2 (copy)
    local u53 = p51:createVignettePart();
    p51:initializeParticles(u53, u52.particleEmitters, Enum.NormalId.Left, u52.config, u52.fadeInDuration, u52.disableCloning);
    u53.Parent = Workspace.CurrentCamera;
    local u54 = p51:createVignettePart();
    p51:initializeParticles(u54, u52.particleEmitters, Enum.NormalId.Right, u52.config, u52.fadeInDuration, u52.disableCloning);
    u54.Parent = Workspace.CurrentCamera;
    local u55 = p51:createVignettePart();
    p51:initializeParticles(u55, u52.particleEmitters, Enum.NormalId.Bottom, u52.config, u52.fadeInDuration, u52.disableCloning);
    u55.Parent = Workspace.CurrentCamera;
    local u56 = p51:createVignettePart();
    p51:initializeParticles(u56, u52.particleEmitters, Enum.NormalId.Top, u52.config, u52.fadeInDuration, u52.disableCloning);
    u56.Parent = Workspace.CurrentCamera;
    local u57 = u3.new();
    local u58 = 0;
    local u59 = 0;
    u57:GiveTask(RunService.RenderStepped:Connect(function(p60) -- Line: 314
        -- upvalues: u52 (copy), u53 (copy), u54 (copy), u55 (copy), u56 (copy), u58 (ref), u59 (ref), EffectUtil (ref), u8 (ref), KnitClient2 (ref), Workspace (ref)
        if u52.shouldShow and u52.shouldShow() == false then
            u53.CFrame = CFrame.new((1 / 0), 0, 0);
            u54.CFrame = CFrame.new((1 / 0), 0, 0);
            u55.CFrame = CFrame.new((1 / 0), 0, 0);
            u56.CFrame = CFrame.new((1 / 0), 0, 0);

            return nil;
        end;

        u58 = u58 + p60;

        if u52.transparencyMultiplier and u58 > 0.3 then
            u58 = 0;
            local v61 = u52.transparencyMultiplier();

            if v61 ~= u59 then
                u59 = v61;
                EffectUtil:setEffectTransparencyStrength({
                    u53,
                    u54,
                    u55,
                    u56
                }, v61);
            end;
        end;

        local v62 = u8.ScreenHeightToWorldHeight(u8.ViewSizeY(), -4, KnitClient2.Controllers.FovController:getBaseFOV()) * 1.2;
        local v63 = Vector3.new(1, v62, 1);
        local v64 = u8.ScreenWidthToWorldWidth(u8.ViewSizeX(), -4, KnitClient2.Controllers.FovController:getBaseFOV()) * 1.2;
        local v65 = Vector3.new(v64, 1, 1);
        local CFrame2 = Workspace.CurrentCamera.CFrame;
        local v66 = u8.ScreenWidthToWorldWidth(-u8.ViewSizeX() / 2, -4);
        local offset = u52.offset;
        u53.CFrame = CFrame2 * CFrame.new(v66, 0, -4.5 - (offset == nil and 0 or offset));
        local CFrame3 = Workspace.CurrentCamera.CFrame;
        local v67 = u8.ScreenWidthToWorldWidth(u8.ViewSizeX() / 2, -4);
        local offset2 = u52.offset;
        u54.CFrame = CFrame3 * CFrame.new(v67, 0, -4.5 - (offset2 == nil and 0 or offset2));
        local CFrame4 = Workspace.CurrentCamera.CFrame;
        local v68 = u8.ScreenHeightToWorldHeight(-u8.ViewSizeY() / 2, -4);
        local offset3 = u52.offset;
        u55.CFrame = CFrame4 * CFrame.new(0, v68, -4.5 - (offset3 == nil and 0 or offset3));
        local CFrame5 = Workspace.CurrentCamera.CFrame;
        local v69 = u8.ScreenHeightToWorldHeight(u8.ViewSizeY() / 2, -4);
        local offset4 = u52.offset;
        u56.CFrame = CFrame5 * CFrame.new(0, v69, -4.5 - (offset4 == nil and 0 or offset4));
        u53.Size = v63;
        u54.Size = v63;
        u55.Size = v65;
        u56.Size = v65;
    end));
    u57:GiveTask(u53);
    u57:GiveTask(u54);
    u57:GiveTask(u55);
    u57:GiveTask(u56);
    local u70 = {
        u53,
        u54,
        u55,
        u56
    };
    local v71 = u3.new();
    v71:GiveTask(function() -- Line: 381
        -- upvalues: u52 (copy), EffectUtil (ref), u70 (copy), u57 (copy)
        local fadeOutDuration = u52.fadeOutDuration;

        if fadeOutDuration ~= 0 and (fadeOutDuration == fadeOutDuration and fadeOutDuration) then
            fadeOutDuration = u52.fadeOutDuration > 0;
        end;

        if fadeOutDuration == 0 or (fadeOutDuration ~= fadeOutDuration or not fadeOutDuration) then
            u57:Destroy();

            return;
        end;

        local function _(p72) -- Line: 387
            -- upvalues: EffectUtil (ref), u52 (ref)
            EffectUtil:toggleEffects(p72, false, u52.fadeOutDuration);
        end;

        for i, v in u70 do
            local _ = i - 1;
            EffectUtil:toggleEffects(v, false, u52.fadeOutDuration);
        end;

        task.delay(u52.fadeOutDuration, function() -- Line: 393
            -- upvalues: u57 (ref)
            u57:Destroy();
        end);
    end);

    return v71;
end;

function u9.createVignettePart(p73) -- Line: 402
    -- upvalues: u4 (copy), Workspace (copy)
    return u4("Part", {
        Size = Vector3.new(1, 1, 1),
        CanCollide = false,
        Transparency = 1,
        Anchored = true,
        Parent = Workspace.CurrentCamera
    });
end;

function u9.initializeParticles(p74, p75, p76, p77, p78, p79, p80) -- Line: 411
    -- upvalues: u2 (copy), CollectionService (copy), EffectUtil (copy)
    for _, v in p76 do
        if not p80 then
            local v = v:Clone();
        end;

        v.LockedToPart = true;
        v.ZOffset = 3;

        if p78 then
            u2.assign(v, p78);
        end;

        v.EmissionDirection = p77;

        if v:HasTag("visualizer_hidden_in_first") then
            CollectionService:RemoveTag(v, "visualizer_hidden_in_first");
        end;

        local v81 = v:GetAttribute("FirstPersonHidden");

        if v81 ~= 0 and (v81 == v81 and (v81 ~= "" and v81)) then
            v:SetAttribute("FirstPersonHidden", nil);
        end;

        v.Parent = p75;
    end;

    local v82;

    if p79 == 0 or (p79 ~= p79 or not p79) then
        v82 = p79;
    else
        v82 = p79 > 0;
    end;

    if v82 ~= 0 and (v82 == v82 and v82) then
        EffectUtil:toggleEffects(p75, true, p79);
    end;
end;

KnitClient.CreateController(u9.new());

return nil;