-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u4 = ConstantManager.registerConstants(script, {
    offset = 0.58
});
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "ForestEnchantController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 38
    -- upvalues: KnitController (copy), StatusEffectType (copy)
    KnitController.constructor(p7);
    p7.Name = "ForestEnchantController";
    p7.hasEnchant = false;
    p7.effectTypes = {
        [StatusEffectType.ENCHANT_FOREST] = true
    };
end;

function u5.KnitStart(u8) -- Line: 46
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy), GameType (copy), default (copy), Players (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), u4 (copy), u2 (copy), RunService (copy), ClientSyncEvents (copy), RuntimeLib (copy)
    KnitController.KnitStart(u8);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.FOREST_ENCHANT_ACTIVATE },
        loadOnGameTypes = { GameType.BEDWARS, GameType.PVP_ARENA }
    });
    default.Client:Get("ForestEnchantActivated"):Connect(function(u9) -- Line: 52
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), u4 (ref), u2 (ref), RunService (ref)
        local v10 = u9.attacker == Players.LocalPlayer.Character;

        if v10 or u9.victim.PrimaryPart then
            local FOREST_ENCHANT_ACTIVATE = GameSound.FOREST_ENCHANT_ACTIVATE;
            local v11 = {};
            local v12;

            if v10 then
                v12 = nil;
            else
                v12 = u9.victim:GetPrimaryPartCFrame().Position;
            end;

            v11.position = v12;
            SoundManager:playSound(FOREST_ENCHANT_ACTIVATE, v11);
        end;

        local u13 = ReplicatedStorage.Assets.Effects.ForestEnchant:Clone();
        u13.Parent = Workspace;

        local function _(p14) -- Line: 62
            -- upvalues: u4 (ref)
            if p14:IsA("Beam") then
                p14:SetTextureOffset(u4.offset);
            end;
        end;

        for i, descendant in u13:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Beam") then
                descendant:SetTextureOffset(u4.offset);
            end;
        end;

        local u15 = u2.new();
        u15:GiveTask(u13);
        u15:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 72
            -- upvalues: u9 (copy), u15 (copy), u13 (copy)
            if not (u9.attacker.PrimaryPart and u9.victim.PrimaryPart) then
                u15:DoCleaning();

                return nil;
            end;

            u13.Position = u9.attacker.PrimaryPart.Position;

            for _, child in u13:GetChildren() do
                if child:IsA("Attachment") then
                    local Position = u9.victim:GetPrimaryPartCFrame().Position;

                    if child.Name == "destination" then
                        Position = u9.attacker:GetPrimaryPartCFrame().Position;
                    end;

                    child.WorldPosition = Position;
                end;
            end;
        end));
        task.delay(1.2, function() -- Line: 89
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p16) -- Line: 93
        -- upvalues: u8 (copy), Players (ref), RuntimeLib (ref)
        if u8.effectTypes[p16.statusEffect] == nil then
            return nil;
        end;

        if Players:GetPlayerFromCharacter(p16.entityInstance) == Players.LocalPlayer then
            u8.hasEnchant = true;
            RuntimeLib.Promise.defer(function() -- Line: 102
                -- upvalues: RuntimeLib (ref), u8 (ref), Players (ref)
                while RuntimeLib.Promise.delay(0.5):await() and u8.hasEnchant do
                    for _, v in Players:GetPlayers() do
                        if u8:checkCooldown(v) then
                            u8:mountEffect(v);
                        end;
                    end;
                end;
            end);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p17) -- Line: 113
        -- upvalues: u8 (copy), Players (ref)
        if u8.effectTypes[p17.statusEffect] == nil then
            return nil;
        end;

        if p17.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        u8.hasEnchant = false;
        u8:unmountAllEffects();
    end);
end;

function u5.checkCooldown(p18, p19) -- Line: 126
    -- upvalues: Players (copy), EntityUtil (copy), Workspace (copy)
    local LocalPlayer = Players.LocalPlayer;
    local v20 = EntityUtil:getLocalPlayerEntity();
    local v21 = EntityUtil:getEntity(p19);

    if not (v20 and (v21 and v20:canAttack(v21))) then
        return false;
    end;

    local v22 = math.abs(LocalPlayer.UserId);
    local v23 = p19:GetAttribute("ForestCooldown" .. tostring(v22));

    if v23 ~= 0 and (v23 == v23 and v23) then
        v23 = Workspace:GetServerTimeNow() < v23;
    end;

    return (v23 == 0 or (v23 ~= v23 or not v23)) and true or false;
end;

function u5.mountEffect(p24, u25) -- Line: 143
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), RunService (copy), Players (copy)
    local v26 = u25:GetAttribute("EffectMounted");

    if v26 == 0 or (v26 ~= v26 or (v26 == "" or not v26)) then
        v26 = not u25.Character;
    end;

    if v26 ~= 0 and (v26 == v26 and (v26 ~= "" and v26)) then
        return nil;
    end;

    u25:SetAttribute("EffectMounted", true);
    local u27 = ReplicatedStorage.Assets.Effects.Seed:Clone();
    u27.Parent = u25.Character;
    GameQueryUtil:setQueryIgnored(u27, true);
    local u28 = 0;
    local u29 = nil;
    u29 = RunService.Heartbeat:Connect(function(p30) -- Line: 158
        -- upvalues: u28 (ref), u27 (copy), u25 (copy), u29 (ref)
        u28 = u28 + p30;
        local v31 = u27;

        if v31 then
            v31 = u25;

            if v31 ~= nil then
                v31 = v31.Character;

                if v31 ~= nil then
                    v31 = v31.PrimaryPart;
                end;
            end;
        end;

        if v31 then
            local v32 = u25.Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0);
            u27.CFrame = CFrame.new(v32) * CFrame.Angles(0, u28 * 3.141592653589793 / 2, 0);

            return;
        end;

        u27:Destroy();
        u25:SetAttribute("EffectMounted", false);
        u29:Disconnect();
    end);
    local v33 = math.abs(Players.LocalPlayer.UserId);
    u25:GetAttributeChangedSignal("ForestCooldown" .. tostring(v33)):Connect(function() -- Line: 185
        -- upvalues: u27 (copy), u25 (copy), u29 (ref)
        u27:Destroy();
        u25:SetAttribute("EffectMounted", false);
        u29:Disconnect();
    end);
end;

function u5.unmountAllEffects(p34) -- Line: 191
    -- upvalues: Players (copy)
    for _, v in Players:GetPlayers() do
        local Character = v.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Seed");
        end;

        if Character then
            Character:Destroy();
            v:SetAttribute("EffectMounted", false);
        end;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;