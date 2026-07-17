-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WorldUtil = v1.WorldUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local TableUtil = v2.TableUtil;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v3.Linear;
local OutCirc = v3.OutCirc;
local OutExpo = v3.OutExpo;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "DeadToMeEmoteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "DeadToMeEmoteController";
end;

function u5.KnitStart(p8) -- Line: 46
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy), OutExpo (copy), BLOCK_SIZE (copy), TableUtil (copy), WorldUtil (copy), Players (copy), GamePlayerUtil (copy), Workspace (copy), RunService (copy), OutCirc (copy)
    KnitController.KnitStart(p8);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local DEAD_TO_ME = EmoteType.DEAD_TO_ME;
    local u9 = EmoteHandler;
    local u10 = setmetatable({}, {
        __tostring = function() -- Line: 54, Name: __tostring
            return "Anonymous";
        end,

        __index = u9
    });
    u10.__index = u10;

    function u10.new(...) -- Line: 60
        -- upvalues: u10 (ref)
        local v11 = setmetatable({}, u10);

        return v11:constructor(...) or v11;
    end;

    function u10.constructor(p12, ...) -- Line: 64
        -- upvalues: u9 (copy)
        u9.constructor(p12, ...);
    end;

    function u10.onEnable(p13, u14, p15, p16, u17) -- Line: 67
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), default (ref), Linear (ref), OutExpo (ref), BLOCK_SIZE (ref), TableUtil (ref), WorldUtil (ref), Players (ref), GamePlayerUtil (ref), Workspace (ref), RunService (ref), OutCirc (ref)
        if not p15.PrimaryPart then
            return nil;
        end;

        local Humanoid = p15.Humanoid;

        if not Humanoid then
            return nil;
        end;

        local u18 = ReplicatedStorage.Assets.Misc.ReaperScythe:Clone();
        u18.Parent = p15;

        local function _(p19) -- Line: 81
            -- upvalues: GameQueryUtil (ref)
            if p19:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p19, true);
                p19.Transparency = 1;
            end;
        end;

        for i, descendant in u18:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.Transparency = 1;
            end;
        end;

        WeldUtil:weldCharacterAccessories(p15);
        local u20 = nil;
        u17:GiveTask(p13:watchEmoteAnimation(u14, p15, AnimationType.GRIM_REAPER_DEAD_TO_ME_EMOTE, function(p21) -- Line: 93
            -- upvalues: u17 (copy), SoundManager (ref), GameSound (ref), default (ref), Linear (ref), u18 (copy), OutExpo (ref), u20 (ref)
            local v22;

            if p21 == nil then
                v22 = p21;
            else
                v22 = p21:GetMarkerReachedSignal("scythe_spawn"):Connect(function() -- Line: 97
                    -- upvalues: u17 (ref), SoundManager (ref), GameSound (ref), default (ref), Linear (ref), u18 (ref)
                    u17:GiveTask(SoundManager:playSound(GameSound.SCYTHE_PULL_1));
                    default(1, Linear, function(u23) -- Line: 99
                        -- upvalues: u18 (ref)
                        local function _(p24) -- Line: 101
                            -- upvalues: u23 (copy)
                            if p24:IsA("BasePart") then
                                p24.Transparency = u23;
                            end;
                        end;

                        for i, descendant in u18:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("BasePart") then
                                descendant.Transparency = u23;
                            end;
                        end;
                    end, 1, 0);
                    u17:GiveTask(u18);
                end);
            end;

            u17:GiveTask(v22);

            if p21 ~= nil then
                p21 = p21:GetMarkerReachedSignal("scythe_hide"):Connect(function() -- Line: 117
                    -- upvalues: u17 (ref), SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref), u18 (ref), Linear (ref), u20 (ref)
                    u17:GiveTask(SoundManager:playSound(GameSound.SCYTHE_PULL_2));
                    default(0.3, OutExpo, function(u25) -- Line: 119
                        -- upvalues: u18 (ref)
                        local function _(p26) -- Line: 121
                            -- upvalues: u25 (copy)
                            if p26:IsA("BasePart") then
                                p26.Transparency = u25;
                            end;
                        end;

                        for i, descendant in u18:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("BasePart") then
                                descendant.Transparency = u25;
                            end;
                        end;
                    end, 0, 1);
                    default(1, Linear, function(u27) -- Line: 130
                        -- upvalues: u20 (ref)
                        local function _(p28) -- Line: 132
                            -- upvalues: u27 (copy)
                            if p28:IsA("BasePart") and p28.Transparency ~= 1 then
                                p28.Transparency = u27;

                                return;
                            end;

                            if p28:IsA("TextLabel") then
                                p28.TextTransparency = u27;
                            end;
                        end;

                        for i, descendant in u20:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("BasePart") and descendant.Transparency ~= 1 then
                                descendant.Transparency = u27;
                            elseif descendant:IsA("TextLabel") then
                                descendant.TextTransparency = u27;
                            end;
                        end;
                    end, 0, 1);
                end);
            end;

            u17:GiveTask(p21);
        end));
        local CFrame = p15.PrimaryPart.CFrame;
        local v29 = p15.PrimaryPart.CFrame.RightVector * 5;
        local v30 = p15.PrimaryPart.CFrame.LookVector * 1.2;
        local v31 = Vector3.new(0, -Humanoid.HipHeight + 0.5, 0);
        local v32 = CFrame + v29 - v30 + v31;
        local v33 = v32 - Vector3.new(0, BLOCK_SIZE, 0);
        u20 = ReplicatedStorage.Assets.Misc.Gravestone:Clone();
        u20:PivotTo(v33);
        local Position = p15.PrimaryPart.Position;
        local v34 = WorldUtil.getPlayersInFrontWithAngle({
            maxAngle = 25,
            position = p15.PrimaryPart.Position,
            direction = p15.PrimaryPart.CFrame.LookVector,
            maxDistance = BLOCK_SIZE * 30
        });
        table.sort(v34, function(p35, p36) -- Line: 165
            -- upvalues: Position (copy)
            local Character = p35.Character;

            if Character ~= nil then
                Character = Character:GetPivot();
            end;

            if not Character then
                local Character2 = p36.Character;

                if Character2 ~= nil then
                    Character2 = Character2:GetPivot();
                end;

                Character = not Character2;
            end;

            if Character then
                return false;
            end;

            return (Position - p35.Character:GetPivot().Position).Magnitude > (Position - p36.Character:GetPivot().Position).Magnitude;
        end);

        local function _(p37) -- Line: 187
            -- upvalues: Players (ref), u14 (copy)
            return p37 ~= Players:GetPlayerByUserId(u14);
        end;

        local v38 = 0;
        local v39 = {};

        for i, v in v34 do
            local _ = i - 1;

            if v ~= Players:GetPlayerByUserId(u14) == true then
                v38 = v38 + 1;
                v39[v38] = v;
            end;
        end;

        local v40 = TableUtil.Reverse(v39);
        local GravestoneText = u20.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText;
        GravestoneText.RichText = true;
        local v41 = { "Forever Missed", "RIP", "Here Lies", "Sleep Well", "Farewell" };
        local v42 = v41[math.random(0, #v41 - 1) + 1];

        if #v40 > 0 then
            GravestoneText.Text = v42 .. "\n" .. GamePlayerUtil.getGamePlayer(v40[1]):getDisplayName();
        else
            GravestoneText.Text = v42 .. "\nYou";
        end;

        u20.Parent = Workspace;
        u17:GiveTask(u20);
        default(1, Linear, function(u43) -- Line: 213
            -- upvalues: u20 (ref)
            local function _(p44) -- Line: 215
                -- upvalues: u43 (copy)
                if p44:IsA("BasePart") and p44.Transparency ~= 1 then
                    p44.Transparency = u43;
                end;
            end;

            for i, descendant in u20:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") and descendant.Transparency ~= 1 then
                    descendant.Transparency = u43;
                end;
            end;
        end, 1, 0);
        local u45 = 0;
        u17:GiveTask(RunService.Heartbeat:Connect(function(p46) -- Line: 225
            -- upvalues: u45 (ref)
            u45 = u45 + p46;
        end));
        local u47 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            playbackSpeedMultiplier = 0.5,
            position = u20:GetPivot().Position
        });
        u17:GiveTask(u47);
        default(1.5, Linear, function(p48) -- Line: 233
            -- upvalues: u47 (copy)
            local v49 = u47:getInstance();

            if not v49 then
                return nil;
            end;

            v49.Volume = p48;
        end, 1, 0);
        default(2, OutCirc, function(p50) -- Line: 240
            -- upvalues: u20 (ref), u45 (ref)
            local v51 = (math.sin(u45 * 60) - 1) / 20;
            local v52 = (math.sin(u45 * 70) - 1) / 20;
            local v53 = (math.cos(u45 * 80) - 1) / 20;
            u20:PivotTo(p50 + Vector3.new(v51, v52, v53));
        end, v33, v32);
    end;

    function u10.onDisable(p54, p55, p56, p57) -- Line: 247
    end;

    EmoteHandlerController:registerHandler(DEAD_TO_ME, u10);
end;

KnitClient.CreateController(u5.new());

return nil;