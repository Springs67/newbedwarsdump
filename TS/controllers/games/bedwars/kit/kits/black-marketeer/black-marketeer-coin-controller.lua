-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local HttpService = v4.HttpService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "BlackMarketeerCoinController";
    end,

    __index = CollectableEntityController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p7);
    p7.Name = "BlackMarketeerCoinController";
    p7.pickupListenerActive = false;
end;

function u5.KnitStart(p8) -- Line: 41
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p8);
end;

function u5.validCollectableEntityTypes(p9) -- Line: 44
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.SHADOW_COIN };
end;

function u5.pickDisplayModel(p10, p11, p12) -- Line: 47
    -- upvalues: Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy)
    local v13;

    if Players.LocalPlayer.Character then
        v13 = KnitClient2.Controllers.KitController:getKitSkin(Players.LocalPlayer.Character);
    else
        v13 = nil;
    end;

    local v14;

    if v13 == BedwarsKitSkin.HALLOWEEN_WREN then
        v14 = ReplicatedStorage.Assets.Misc.BlackMarketTraderCoinHalloween;
    elseif v13 == BedwarsKitSkin.TIDAL_WREN then
        v14 = ReplicatedStorage.Assets.Misc.BlackMarketTraderCoinTidal;
    else
        v14 = ReplicatedStorage.Assets.Misc.BlackMarketTraderCoin;
    end;

    return {
        repStorageModel = v14,
        collectionTag = p11
    };
end;

function u5.onWillRemoveEntity(p15, p16, p17, p18, p19) -- Line: 67
    -- upvalues: u2 (copy), Workspace (copy), KnitClient2 (copy), BedwarsKitSkin (copy), HttpService (copy), RunService (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if not p18 then
        return nil;
    end;

    local u20 = u2.new();
    local u21 = p19:Clone();
    u21.Parent = Workspace;
    u20:GiveTask(u21);
    u21:PivotTo(p19:GetPivot());

    if not u21.PrimaryPart then
        u20:DoCleaning();

        return nil;
    end;

    local v22;

    if p18.Character then
        v22 = KnitClient2.Controllers.KitController:getKitSkin(p18.Character) == BedwarsKitSkin.HALLOWEEN_WREN;
    else
        v22 = false;
    end;

    if v22 then
        p15:playCoffinEffect(p18);
    end;

    local u23 = 0;
    local u24;

    if v22 then
        u24 = p18.Character;

        if u24 ~= nil then
            u24 = u24:FindFirstChild("coffin");

            if u24 ~= nil then
                u24 = u24:FindFirstChild("Handle");

                if u24 ~= nil then
                    u24 = u24:FindFirstChild("GhostTarget");
                end;
            end;
        end;
    else
        u24 = p18.Character;

        if u24 ~= nil then
            u24 = u24:FindFirstChild("UpperTorso");
        end;
    end;

    if u24 == nil then
        u20:DoCleaning();

        return nil;
    end;

    local v25 = math.random(-2, 2);
    local v26 = math.random(3, 4);
    local u27 = Vector3.new(v25, v26, math.random(-2, 2));
    local u28 = HttpService:GenerateGUID(false);
    RunService:BindToRenderStep(u28, Enum.RenderPriority.Last.Value, function(p29) -- Line: 116
        -- upvalues: u24 (copy), u21 (copy), u20 (copy), u23 (ref), u27 (copy)
        if u24.Parent == nil or u21.PrimaryPart == nil then
            u20:DoCleaning();

            return nil;
        end;

        u23 = u23 + p29;
        local v30 = math.clamp(u23 / 1, 0, 1);
        local v31 = u21.PrimaryPart.Position:Lerp(u24.Position, (math.sqrt(v30)));
        local v32 = math.sin(v30 * 3.141592653589793);
        local v33 = v31 + u27 * Vector3.new(v32, v32, v32);
        local v34 = CFrame.Angles(6.283185307179586 * (u23 % 2), 6.283185307179586 * (u23 % 3), 6.283185307179586 * (u23 % 1.2));
        u21:PivotTo(CFrame.new(v33) * v34);
    end);
    u20:GiveTask(function() -- Line: 135
        -- upvalues: RunService (ref), u28 (copy)
        return RunService:UnbindFromRenderStep(u28);
    end);
    task.delay(1, function() -- Line: 138
        -- upvalues: u20 (copy)
        u20:DoCleaning();
    end);

    if p18 == Players.LocalPlayer then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PUNCH);
        SoundManager:playSound(GameSound.COIN_COLLECT);
    end;
end;

function u5.onCreatedEntity(p35, p36, p37, u38) -- Line: 146
    -- upvalues: Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), RunService (copy)
    u38:PivotTo(CFrame.new(u38:GetPivot().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0));
    local u39;

    if Players.LocalPlayer.Character then
        u39 = KnitClient2.Controllers.KitController:getKitSkin(Players.LocalPlayer.Character) == BedwarsKitSkin.HALLOWEEN_WREN;
    else
        u39 = false;
    end;

    local u40 = 0;

    if not u38.PrimaryPart then
        return nil;
    end;

    local Position = u38.PrimaryPart.Position;
    local u45 = RunService.Heartbeat:Connect(function(p41) -- Line: 167
        -- upvalues: u40 (ref), u38 (copy), u39 (copy), Position (copy)
        u40 = u40 + p41;
        local v42 = (os.clock() - 0) / 0.5;
        local v43 = math.sin(v42) * 0.3 + 0;
        local v44 = CFrame.new(u38.PrimaryPart.Position) * CFrame.Angles(0, 6.283185307179586 * u40 * 0.3, 0);

        if u39 then
            v44 = CFrame.new(Position.X, Position.Y + v43, Position.Z);
        end;

        u38:PivotTo(v44);
    end);
    local u46 = nil;
    u46 = u38.Destroying:Once(function() -- Line: 179
        -- upvalues: u45 (copy), u46 (ref)
        u45:Disconnect();
        u46:Disconnect();
    end);
end;

function u5.listenToPickup(u47) -- Line: 184
    -- upvalues: RuntimeLib (copy)
    if u47.pickupListenerActive then
        return nil;
    end;

    u47.pickupListenerActive = true;
    RuntimeLib.Promise.defer(function() -- Line: 189
        -- upvalues: u47 (copy), RuntimeLib (ref)
        while true do
            local v48 = task.wait(0.2);

            if v48 ~= 0 and (v48 == v48 and v48) then
                v48 = u47.pickupListenerActive;
            end;

            if v48 == 0 or (v48 ~= v48 or not v48) then
                return;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 198
                -- upvalues: u47 (ref)
                u47:checkForPickup();
            end);
        end;
    end);

    return {
        Destroy = function() -- Line: 204, Name: Destroy
            -- upvalues: u47 (copy)
            u47.pickupListenerActive = false;
        end
    };
end;

function u5.checkForPickup(u49) -- Line: 209
    -- upvalues: Players (copy), CollectionService (copy), CollectableEntityType (copy), Workspace (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v50 = CollectionService:GetTagged(CollectableEntityType.SHADOW_COIN);

    local function v53(p51) -- Line: 219
        -- upvalues: Workspace (ref), Character (copy), u49 (copy), Players (ref), CollectableEntityType (ref)
        local v52 = p51:GetAttribute("SpawnTime");

        if Workspace:GetServerTimeNow() - v52 < 1 then
            return nil;
        end;

        if (Character.Position - p51:GetPivot().Position).Magnitude <= 5.5 then
            u49:collectEntity(Players.LocalPlayer, p51, CollectableEntityType.SHADOW_COIN);
        end;
    end;

    for i, v in v50 do
        v53(v, i - 1, v50);
    end;
end;

function u5.playCoffinEffect(p54, p55) -- Line: 237
    -- upvalues: u3 (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = p55.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("coffin");

        if Character ~= nil then
            Character = Character:FindFirstChild("Handle");

            if Character ~= nil then
                Character = Character:FindFirstChild("Rig");

                if Character ~= nil then
                    Character = Character:FindFirstChild("AnimationController");
                end;
            end;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v56;

    if Character == nil then
        v56 = Character;
    else
        v56 = Character:FindFirstChild("Animator");
    end;

    local v57 = v56 or u3("Animator", {
        Parent = Character
    });

    if v57 then
        GameAnimationUtil:playAnimation(v57, AnimationType.HALLOWEEN_WREN_COFFIN_OPEN_CLOSE, {
            looped = false,
            speed = 2
        });
    end;
end;

KnitClient.CreateController(u5.new());

return nil;