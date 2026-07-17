-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local InfectedVariantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "OreGeneratorDisruptionController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "OreGeneratorDisruptionController";
    p4.disruptionPrompts = {};
    p4.fixPrompts = {};
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy), GameType (copy), Players (copy), MapUtil (copy), InfectedVariantType (copy), default (copy)
    KnitController.KnitStart(u5);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.TESLA_SHORT_CIRCUIT_1, GameSound.GATHER_BOT_CONSTRUCTION },
        loadOnGameTypes = { GameType.INFECTED }
    });
    Players.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() -- Line: 40
        -- upvalues: Players (ref), u5 (copy), MapUtil (ref), InfectedVariantType (ref)
        local v6 = Players.LocalPlayer:GetAttribute("InfectedVariantType");
        u5:initializeDisabledPrompts();

        if v6 ~= nil then
            local function _(p7) -- Line: 46
                p7.Enabled = false;

                return p7.Enabled;
            end;

            for i, v in MapUtil.values(u5.fixPrompts) do
                local _ = i - 1;
                v.Enabled = false;
                local _ = v.Enabled;
            end;
        end;

        local function _(p8) -- Line: 56
            p8.Enabled = false;

            return p8.Enabled;
        end;

        for i, v in MapUtil.values(u5.disruptionPrompts) do
            local _ = i - 1;
            v.Enabled = false;
            local _ = v.Enabled;
        end;

        if v6 == InfectedVariantType.DISRUPTOR then
            u5:enableActiveDisruptionPrompts();
        end;
    end);
    default.Client:Get("OreGeneratorDisruptionStatusChanged"):Connect(function(p9) -- Line: 68
        -- upvalues: u5 (copy), Players (ref), InfectedVariantType (ref)
        u5:initializeDisabledPrompts();
        local v10 = Players.LocalPlayer:GetAttribute("InfectedVariantType");

        if v10 == InfectedVariantType.DISRUPTOR then
            u5.disruptionPrompts[p9.generatorId].Enabled = not p9.isDisrupted;

            return;
        end;

        if v10 == nil then
            u5.fixPrompts[p9.generatorId].Enabled = p9.isDisrupted;
        end;
    end);
end;

function u2.tryRetrieveAllOreGenerators(p11) -- Line: 87
    -- upvalues: RuntimeLib (copy), default (copy)
    return RuntimeLib.Promise.retryWithDelay(function() -- Line: 88
        -- upvalues: RuntimeLib (ref), default (ref)
        return RuntimeLib.Promise.new(function(u12, u13) -- Line: 89
            -- upvalues: RuntimeLib (ref), default (ref)
            RuntimeLib.try(function() -- Line: 90
                -- upvalues: u12 (copy), default (ref)
                u12(default.Client:Get("RetrieveAllGlobalOreGenerators"):CallServer());
            end, function(p14) -- Line: 92
                -- upvalues: u13 (copy)
                u13(p14);
            end);
        end);
    end, 3, 1);
end;

function u2.initializeDisabledPrompts(p15) -- Line: 98
    if next(p15.fixPrompts) == nil or next(p15.disruptionPrompts) == nil then
        table.clear(p15.fixPrompts);
        table.clear(p15.disruptionPrompts);
        p15:setupOreGenProximityPrompts():await();
    end;
end;

function u2.setupOreGenProximityPrompts(u16) -- Line: 105
    -- upvalues: RuntimeLib (copy)
    return u16:tryRetrieveAllOreGenerators():andThen(function(p17) -- Line: 106
        -- upvalues: u16 (copy)
        local function _(p18) -- Line: 108
            -- upvalues: u16 (ref)
            local v19 = u16:createOreGeneratorProximityPrompt(p18.adornee, p18.id, false);
            local v20 = u16:createOreGeneratorProximityPrompt(p18.adornee, p18.id, true);
            u16.fixPrompts[p18.id] = v19;
            u16.disruptionPrompts[p18.id] = v20;
        end;

        for i, v in p17 do
            local _ = i - 1;
            local v21 = u16:createOreGeneratorProximityPrompt(v.adornee, v.id, false);
            local v22 = u16:createOreGeneratorProximityPrompt(v.adornee, v.id, true);
            u16.fixPrompts[v.id] = v21;
            u16.disruptionPrompts[v.id] = v22;
        end;
    end, function() -- Line: 121
        -- upvalues: RuntimeLib (ref)
        return RuntimeLib.Promise.new(function(p23, p24) -- Line: 122
            return p24("Failed to create Infected Disruptor proximity prompts.");
        end);
    end);
end;

function u2.createOreGeneratorProximityPrompt(p25, p26, u27, u28) -- Line: 127
    -- upvalues: KnitClient2 (copy), GameSound (copy), SoundManager (copy), default (copy)
    local v29 = u28 and { "DisruptOreGenerator", 9, "Disrupt Generator" } or { "FixOreGenerator", 5, "Fix Generator" };
    local v30 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = true,
        MaxActivationDistance = 12,
        Enabled = false,
        Name = v29[1] .. "-" .. u27,
        HoldDuration = v29[2],
        Parent = p26,
        ActionText = v29[3]
    });
    v30.Triggered:Connect(function() -- Line: 141
        -- upvalues: u28 (copy), GameSound (ref), SoundManager (ref), default (ref), u27 (copy)
        local v31;

        if u28 then
            v31 = GameSound.TESLA_SHORT_CIRCUIT_1;
        else
            v31 = GameSound.GATHER_BOT_CONSTRUCTION;
        end;

        SoundManager:playSound(v31);
        default.Client:Get("OreGeneratorDisruptionStatusUpdate"):SendToServer({
            generatorId = u27,
            isDisrupted = u28
        });
    end);

    return v30;
end;

function u2.enableActiveDisruptionPrompts(u32) -- Line: 151
    -- upvalues: RuntimeLib (copy)
    return u32:tryRetrieveAllOreGenerators():andThen(function(p33) -- Line: 152
        -- upvalues: u32 (copy)
        local function _(p34) -- Line: 154
            return not p34.isDisrupted;
        end;

        local v35 = 0;
        local v36 = {};

        for i, v in p33 do
            local _ = i - 1;

            if not v.isDisrupted == true then
                v35 = v35 + 1;
                v36[v35] = v;
            end;
        end;

        local function _(p37) -- Line: 167
            -- upvalues: u32 (ref)
            if u32.disruptionPrompts[p37.id] ~= nil then
                u32.disruptionPrompts[p37.id].Enabled = true;
            end;
        end;

        for i, v in v36 do
            local _ = i - 1;

            if u32.disruptionPrompts[v.id] ~= nil then
                u32.disruptionPrompts[v.id].Enabled = true;
            end;
        end;
    end, function() -- Line: 179
        -- upvalues: RuntimeLib (ref)
        return RuntimeLib.Promise.new(function(p38, p39) -- Line: 180
            return p39("Failed to create Infected Disruptor proximity prompts.");
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;