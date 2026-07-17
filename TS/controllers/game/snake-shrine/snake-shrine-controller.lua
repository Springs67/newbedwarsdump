-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "SnakeShrineController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy), LoggerProvider (copy)
    KnitController.constructor(p4);
    p4.Name = "SnakeShrineController";
    p4.logger = LoggerProvider.getLogger("SnakeShrineController");
    p4.shrinePromptsByTeam = {};
end;

function u2.KnitStart(u5) -- Line: 35
    -- upvalues: KnitController (copy), KnitClient (copy), WatchCollectionTag (copy), DeviceUtil (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u5);

    if KnitClient.Controllers.SpectateController:isSpectating() then
        return nil;
    end;

    WatchCollectionTag("SnakeShrine", function(u6) -- Line: 40
        -- upvalues: KnitClient (ref), DeviceUtil (ref), Flamework (ref), BedwarsAppIds (ref), u5 (copy)
        local u7 = u6:GetAttribute("Team");

        if u7 == "" or not u7 then
            u5.logger:Error("Failed to get team for snake shrine");

            return;
        end;

        local v8 = KnitClient.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Open",
            ObjectText = "Snake Shrine",
            RequiresLineOfSight = false,
            MaxActivationDistance = 8,
            Parent = u6,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        v8.Triggered:Connect(function(p9) -- Line: 51
            -- upvalues: KnitClient (ref), Flamework (ref), BedwarsAppIds (ref), u7 (copy), u6 (copy)
            local v10 = KnitClient.Controllers.TeamController:getPlayerTeam(p9);

            if v10 ~= nil then
                v10 = v10.name;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SNAKE_SHRINE, {
                TeamId = u7,
                IsHomeBase = u7 == v10,
                SnakeShrineInstance = u6
            });
        end);
        u5.shrinePromptsByTeam[u7] = v8;
    end);
    default.Client:Get("SnakeShrinePurchaseStateUpdate"):Connect(function(p11) -- Line: 68
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "UpdateSnakeShrinePurchaseState",
            costMultipliers = p11.purchaseMultipliers,
            buffCounts = p11.buffCount,
            activeBuffCounts = p11.activeBuffCount
        });
    end);
    ClientStore.changed:connect(function(p12, p13) -- Line: 76
        -- upvalues: u5 (copy)
        local myTeam = p12.Game.myTeam;

        if myTeam ~= nil then
            myTeam = myTeam.id;
        end;

        local myTeam2 = p13.Game.myTeam;

        if myTeam2 ~= nil then
            myTeam2 = myTeam2.id;
        end;

        if myTeam ~= myTeam2 or p12.Game.spectating then
            u5:resetPrompts();
        end;
    end);
    default.Client:Get("SnakeFountainEffect"):Connect(function(p14) -- Line: 93
        -- upvalues: u5 (copy)
        u5:snakeFountainEffect(p14.instance);
    end);
end;

function u2.resetPrompts(p15) -- Line: 97
    -- upvalues: ClientStore (copy)
    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam ~= nil then
        myTeam = myTeam.id;
    end;

    local function _(p16, p17) -- Line: 104
        -- upvalues: myTeam (copy)
        p16.Enabled = p17 == myTeam;
    end;

    for i, v in p15.shrinePromptsByTeam do
        v.Enabled = i == myTeam;
    end;
end;

function u2.snakeFountainEffect(p18, u19) -- Line: 111
    -- upvalues: SoundManager (copy), GameSound (copy)
    local v20 = u19:GetAttribute("InEffect");

    if v20 ~= 0 and (v20 == v20 and (v20 ~= "" and v20)) then
        return nil;
    end;

    u19:SetAttribute("InEffect", true);
    local eyes = u19:FindFirstChild("eyes");

    if eyes then
        eyes.Material = Enum.Material.Neon;
    end;

    local function _(p21) -- Line: 122
        if p21.Name == "Water" and p21:IsA("Beam") then
            p21.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56));
        end;
    end;

    for i, descendant in u19:GetDescendants() do
        local _ = i - 1;

        if descendant.Name == "Water" and descendant:IsA("Beam") then
            descendant.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56));
        end;
    end;

    task.delay(5, function() -- Line: 130
        -- upvalues: eyes (copy), u19 (copy)
        if eyes then
            eyes.Material = Enum.Material.Plastic;
        end;

        local function _(p22) -- Line: 135
            if p22.Name == "Water" and p22:IsA("Beam") then
                p22.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
            end;
        end;

        for i, descendant in u19:GetDescendants() do
            local _ = i - 1;

            if descendant.Name == "Water" and descendant:IsA("Beam") then
                descendant.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
            end;
        end;

        u19:SetAttribute("InEffect", false);
    end);
    SoundManager:playSound(GameSound.SNAKE_SHRINE_TRIBUTE, {
        volumeMultiplier = 0.3,
        position = u19.Position
    });
end;

KnitClient.CreateController(u2.new());

return nil;