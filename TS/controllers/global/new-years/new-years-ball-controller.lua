-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Lighting = v4.Lighting;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "new-years-ball", "new-years-ball-pattern-meta");
local NEW_YEARS_BALL_COLOR_SET = v5.NEW_YEARS_BALL_COLOR_SET;
local newYearsPatternMeta = v5.newYearsPatternMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "NewYearsBallController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 42
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 46
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "NewYearsBallController";
    p8.active = false;
end;

function u6.KnitStart(u9) -- Line: 51
    -- upvalues: KnitController (copy), default2 (copy), KnitClient (copy), GameSound (copy), u3 (copy), PlaceUtil (copy), CollectionService (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), BalanceFile (copy), FireworkType (copy), RunService (copy)
    KnitController.KnitStart(u9);
    default2.Client:OnEvent("DropNewYearsBall", function(u10) -- Line: 53
        -- upvalues: KnitClient (ref), GameSound (ref), u3 (ref), u9 (copy), PlaceUtil (ref), CollectionService (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), BalanceFile (ref), FireworkType (ref), RunService (ref)
        KnitClient.Controllers.PreloadController:runPreload({
            sounds = { GameSound.BALL_DROP_COMPLETE }
        });
        local u11 = u3.new();

        if u9.active then
            return nil;
        end;

        u9.active = true;
        u11:GiveTask(function() -- Line: 62
            -- upvalues: u9 (ref)
            u9.active = false;
        end);

        if PlaceUtil.isLobbyServer() then
            local function u25(u12) -- Line: 66
                -- upvalues: CollectionService (ref)
                local v13 = CollectionService:GetTagged("LobbyBoard");

                local function v16(p14) -- Line: 68
                    -- upvalues: u12 (copy)
                    local function _(p15) -- Line: 70
                        -- upvalues: u12 (ref)
                        if p15:IsA("SurfaceGui") then
                            p15.Enabled = u12;
                        end;
                    end;

                    for i, descendant in p14:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("SurfaceGui") then
                            descendant.Enabled = u12;
                        end;
                    end;
                end;

                for i, v in v13 do
                    v16(v, i - 1, v13);
                end;

                local v17 = CollectionService:GetTagged("NewYearCountdownBoard");

                local function v20(p18) -- Line: 83
                    -- upvalues: u12 (copy)
                    local function _(p19) -- Line: 85
                        -- upvalues: u12 (ref)
                        if p19:IsA("SurfaceGui") then
                            p19.Enabled = u12;
                        end;
                    end;

                    for i, descendant in p18:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("SurfaceGui") then
                            descendant.Enabled = u12;
                        end;
                    end;
                end;

                for i, v in v17 do
                    v20(v, i - 1, v17);
                end;

                local v21 = CollectionService:GetTagged("VIPRankPurchase");

                local function v24(p22) -- Line: 98
                    -- upvalues: u12 (copy)
                    local function _(p23) -- Line: 100
                        -- upvalues: u12 (ref)
                        if p23:IsA("SurfaceGui") then
                            p23.Enabled = u12;
                        end;
                    end;

                    for i, descendant in p22:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("SurfaceGui") then
                            descendant.Enabled = u12;
                        end;
                    end;
                end;

                for i, v in v21 do
                    v24(v, i - 1, v21);
                end;
            end;

            u25(false);
            u11:GiveTask(function() -- Line: 115
                -- upvalues: u25 (copy)
                u25(true);
            end);
        end;

        local u26 = CollectionService:GetTagged("NewYearsBall")[1] or ReplicatedStorage.Assets.Effects.NewYearsBall:Clone();
        u26.Parent = Workspace;

        local function _(p27) -- Line: 123
            p27.Brightness = 3;
        end;

        for i, child in u26.Lights:GetChildren() do
            local _ = i - 1;
            child.Brightness = 3;
        end;

        u11:GiveTask(u26);
        local u28 = CFrame.new(u10.startPosition);
        local u29 = CFrame.new(u10.finalPosition);
        u26:PivotTo(u28);
        local u30 = SoundManager:playSound(GameSound.NYE_COUNTDOWN);
        task.delay(BalanceFile.NEW_YEARS_BALL_DROP_TIME, function() -- Line: 134
            -- upvalues: SoundManager (ref), GameSound (ref), u30 (copy), KnitClient (ref), u10 (copy), FireworkType (ref)
            SoundManager:playSound(GameSound.BALL_DROP_COMPLETE, {
                fadeInTime = 1,
                volumeMultiplier = 0.45
            });
            local v31 = u30;

            if v31 ~= nil then
                v31:Destroy();
            end;

            KnitClient.Controllers.FireworkController:playFireworkEffect(u10.finalPosition, FireworkType.NEW_YEARS, {
                sizeMultiplier = 3,
                volumeMultiplier = 1.25
            });
            local u32 = 0;
            task.spawn(function() -- Line: 148
                -- upvalues: u32 (ref), u10 (ref), KnitClient (ref), FireworkType (ref)
                while u32 < 90.9090909090909 do
                    task.wait(0.22);
                    local finalPosition = u10.finalPosition;
                    local v33 = math.random(-400, 400);
                    local v34 = math.random(100, 200);
                    local v35 = finalPosition + Vector3.new(v33, v34, math.random(-400, 400));
                    local v36 = math.random(2, 12);
                    KnitClient.Controllers.FireworkController:playFireworkEffect(v35, FireworkType.NEW_YEARS, {
                        volumeMultiplier = 3,
                        sizeMultiplier = v36
                    });
                    u32 = u32 + 1;
                end;
            end);
        end);
        u9:changeLighting(u11);

        local function _(p37) -- Line: 166
            return p37:IsA("SurfaceLight");
        end;

        local v38 = 0;
        local u39 = {};

        for i, child in u26.Lights:GetChildren() do
            local _ = i - 1;

            if child:IsA("SurfaceLight") == true then
                v38 = v38 + 1;
                u39[v38] = child;
            end;
        end;

        local function _(p40) -- Line: 181
            return p40:IsA("BasePart");
        end;

        local v41 = 0;
        local u42 = {};

        for i, child in u26.Triangles:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") == true then
                v41 = v41 + 1;
                u42[v41] = child;
            end;
        end;

        u9:createPanelPatternGroups(u42, u11);
        local u43 = 0;
        local u44 = 0;
        u11:GiveTask(RunService.Heartbeat:Connect(function(p45) -- Line: 199
            -- upvalues: u26 (copy), u11 (copy), u43 (ref), BalanceFile (ref), u44 (ref), u9 (ref), u39 (copy), u42 (copy), u28 (copy), u29 (copy)
            if u26.Parent == nil then
                u11:DoCleaning();

                return nil;
            end;

            u43 = u43 + p45;
            local v46 = u43 / BalanceFile.NEW_YEARS_BALL_DROP_TIME;

            if v46 >= 1 then
                u11:DoCleaning();

                return nil;
            end;

            u44 = u44 + p45;

            if u44 > 0.5 then
                u44 = 0;
                u9:changeBallPattern(u39, u42);
            end;

            local v47 = u28:Lerp(u29, v46);
            local _ = v47 * CFrame.Angles(0, math.rad(6.283185307179586 * u43 * 4), 0);
            u26:PivotTo(v47);
        end));
    end);
end;

function u6.createPanelPatternGroups(p48, p49, p50) -- Line: 223
    -- upvalues: newYearsPatternMeta (copy)
    for _, v in newYearsPatternMeta do
        local u51 = 1;
        local v52 = false;
        local v53 = {};

        while true do
            if true then
                if v52 then
                    u51 = u51 + 1;
                else
                    v52 = true;
                end;
            end;

            if u51 >= v.colors + 1 then
                break;
            end;

            local function _(p54) -- Line: 240
                -- upvalues: v (copy), u51 (ref)
                local v55 = v.symbol .. tostring(u51);

                return string.match(p54.Name, v55) == v55;
            end;

            local v56 = 0;
            local v57 = {};

            for i, v2 in p49 do
                local _ = i - 1;
                local v58 = v.symbol .. tostring(u51);

                if string.match(v2.Name, v58) == v58 == true then
                    v56 = v56 + 1;
                    v57[v56] = v2;
                end;
            end;

            table.insert(v53, v57);
            u51 = u51;
        end;

        v.groups = v53;
        p50:GiveTask(function() -- Line: 260
            -- upvalues: v (copy)
            v.groups = nil;
        end);
    end;
end;

function u6.changeBallPattern(p59, p60, p61) -- Line: 265
    -- upvalues: RandomUtil (copy), newYearsPatternMeta (copy), NEW_YEARS_BALL_COLOR_SET (copy)
    local v62 = RandomUtil.fromList(unpack(newYearsPatternMeta));
    local colors = v62.colors;

    if v62.groups == nil then
        return nil;
    end;

    local v63 = RandomUtil.randomArraySelectN(NEW_YEARS_BALL_COLOR_SET, colors);
    local v64 = 0;

    for _, v in v62.groups do
        for _, v2 in v do
            v2.Color = v63[v64 + 1];
        end;

        v64 = v64 + 1;

        if v64 == colors then
            break;
        end;
    end;
end;

function u6.randomizeLightColors(p65, p66, p67) -- Line: 284
    -- upvalues: RandomUtil (copy)
    for _, v in p66 do
        v.Color = RandomUtil.fromList(unpack(p67));
    end;
end;

function u6.changeLighting(p68, p69) -- Line: 289
    -- upvalues: KnitClient (copy), Lighting (copy), default (copy), Linear (copy), u2 (copy)
    local atmosphereModifier = KnitClient.Controllers.LightingController.atmosphereModifier;

    if atmosphereModifier ~= nil then
        atmosphereModifier = atmosphereModifier:addModifier(20, {
            Density = 0.3,
            Offset = 0.3,
            Glare = 1,
            Haze = 0.75,
            Color = Color3.fromRGB(141, 141, 199),
            Decay = Color3.fromRGB(76, 82, 136)
        });
    end;

    if atmosphereModifier then
        p69:GiveTask(function() -- Line: 303
            -- upvalues: atmosphereModifier (copy)
            task.delay(20, function() -- Line: 304
                -- upvalues: atmosphereModifier (ref)
                atmosphereModifier:Destroy();
            end);
        end);
    end;

    local u70 = {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        ShadowSoftness = Lighting.ShadowSoftness,
        ExposureCompensation = Lighting.ExposureCompensation,
        ClockTime = Lighting.ClockTime
    };
    local u71 = {
        Brightness = 25,
        EnvironmentDiffuseScale = 0,
        EnvironmentSpecularScale = 1,
        ShadowSoftness = 0.3,
        ExposureCompensation = 0,
        ClockTime = 0,
        Ambient = Color3.fromRGB(61, 61, 79),
        ColorShift_Bottom = Color3.fromRGB(255, 255, 255),
        ColorShift_Top = Color3.fromRGB(184, 69, 255),
        OutdoorAmbient = Color3.fromRGB(107, 110, 115)
    };
    local u72 = KnitClient.Controllers.LightingController.lightingModifier:addModifier(20, u71);
    p69:GiveTask(function() -- Line: 334
        -- upvalues: default (ref), Linear (ref), u2 (ref), u71 (copy), u70 (copy), u72 (copy)
        task.delay(20, function() -- Line: 335
            -- upvalues: default (ref), Linear (ref), u2 (ref), u71 (ref), u70 (ref), u72 (ref)
            default(1, Linear, function(p73) -- Line: 336
                -- upvalues: u2 (ref), u71 (ref), u70 (ref), u72 (ref)
                local v74 = u2.deepCopy(u71);

                for _, v in u2.entries(v74) do
                    local v75 = v[1];
                    local v76 = v[2];

                    if type(v76) == "number" then
                        v74[v75] = v76 * (1 - p73) + p73 * u70[v75];
                    end;

                    if typeof(v76) == "Color3" then
                        v74[v75] = v76:Lerp(u70[v75], p73);
                    end;
                end;

                u72:setProperties(v74);
            end);
            task.delay(1, function() -- Line: 350
                -- upvalues: u72 (ref)
                u72:Destroy();
            end);
        end);
    end);
    local u77 = KnitClient.Controllers.LightingController.skyModifier:addModifier(
        20,
        {
            CelestialBodiesShown = false,
            SkyboxBk = "rbxassetid://10290026331",
            SkyboxDn = "rbxassetid://10290026184",
            SkyboxFt = "rbxassetid://10290026023",
            SkyboxLf = "rbxassetid://10290025786",
            SkyboxRt = "rbxassetid://10290025545",
            SkyboxUp = "rbxassetid://10290025302"
        }
    );
    p69:GiveTask(function() -- Line: 364
        -- upvalues: u77 (copy)
        task.delay(20, function() -- Line: 365
            -- upvalues: u77 (ref)
            u77:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;