-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local GoldenGooseBehavior = RuntimeLib.import(script, script.Parent, "golden-goose-behavior").GoldenGooseBehavior;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "GoldenGooseController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "GoldenGooseController";
end;

function u6.KnitStart(u9) -- Line: 47
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u3 (copy), RunService (copy), KnitClient (copy), Players (copy), ClientStore (copy), default (copy), ReplicatedStorage (copy), KnitClient2 (copy), SoundManager (copy), GameSound (copy), CollectionService (copy), Workspace (copy), WatchPlayer (copy), Flamework (copy), u4 (copy), Theme (copy), UIUtil (copy), ColorUtil (copy)
    KnitController.KnitStart(u9);
    u9:setupHonkLogic();
    WatchCollectionTag("GoosePickup", function(u10) -- Line: 51
        -- upvalues: u3 (ref), RunService (ref), KnitClient (ref), Players (ref), ClientStore (ref)
        local u11 = u3.new();
        u11:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 53
            -- upvalues: KnitClient (ref), Players (ref), ClientStore (ref), u10 (copy)
            local v12 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if v12 ~= nil then
                v12 = v12.id;
            end;

            local gooseOwnerTeam = ClientStore:getState().Game.gooseOwnerTeam;
            local v13;

            if v12 == nil then
                v13 = false;
            else
                v13 = v12 ~= gooseOwnerTeam;
            end;

            u10.Enabled = v13;
        end));
        u11:GiveTask(u10.AncestryChanged:Connect(function() -- Line: 63
            -- upvalues: u10 (copy), u11 (copy)
            if not u10.Parent then
                u11:DoCleaning();
            end;
        end));
    end);
    default.Client:Get("ActiveGooseUpdate"):Connect(function(p14, p15) -- Line: 69
        -- upvalues: ClientStore (ref), u9 (copy)
        ClientStore:dispatch({
            type = "RegisterActiveGoose",
            despawnTime = p14
        });
        local ownerTeamId = p15.ownerTeamId;

        if ownerTeamId == "" or not ownerTeamId then
            ClientStore:dispatch({
                type = "DeleteGooseOwnerTeam"
            });
        else
            ClientStore:dispatch({
                type = "SetGooseOwnerTeam",
                ownerTeam = p15.ownerTeamId
            });
        end;

        if p15.nested then
            u9:playNestEffect(p15.nested.cframe);
        end;
    end);
    default.Client:Get("RequestActiveGooseUpdate"):SendToServer();
    default.Client:Get("ReceiveGoldenEgg"):Connect(function(p16) -- Line: 93
        -- upvalues: Players (ref), ReplicatedStorage (ref), KnitClient2 (ref), SoundManager (ref), GameSound (ref)
        local u17 = 0;
        local v18 = false;

        while true do
            if v18 then
                u17 = u17 + 1;
            else
                v18 = true;
            end;

            if u17 >= p16 then
                return;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.CFrame;
                end;
            end;

            if not Character then
                return nil;
            end;

            local v19 = ReplicatedStorage.Assets.Effects.GoldenEgg:Clone();
            KnitClient2.Controllers.ReceiveItemEffectController:playEffect(v19, (Character + Vector3.new(0, 6, 0)).Position, function() -- Line: 121
                -- upvalues: Players (ref)
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;

                    if Character2 ~= nil then
                        Character2 = Character2.CFrame;
                    end;
                end;

                return Character2;
            end, 0.5 + math.random() * 0.2):andThen(function(p20) -- Line: 131
                -- upvalues: SoundManager (ref), GameSound (ref), u17 (ref)
                if p20 then
                    SoundManager:playSound(GameSound.PICKUP_ITEM_DROP, {
                        volumeMultiplier = 0.8,
                        playbackSpeedMultiplier = u17 / 10 + 1
                    });
                end;
            end);
            u17 = u17;
        end;
    end);
    default.Client:Get("PickupGoldenGoose"):Connect(function(p21) -- Line: 144
        -- upvalues: CollectionService (ref), Workspace (ref), u9 (copy)
        local fromCFrame = p21.source.fromCFrame;

        if p21.source.fromBoss then
            task.wait(6.166666666666666);
            local v22 = CollectionService:GetTagged("VisualGooseBoss");

            if #v22 ~= 0 then
                fromCFrame = v22[1]:FindFirstChild("cage_mesh");

                if fromCFrame ~= nil then
                    fromCFrame = fromCFrame:FindFirstChild("GoosePosition");
                end;

                if fromCFrame ~= nil then
                    fromCFrame = fromCFrame.CFrame;
                end;

                local GoldenGoose = Workspace:FindFirstChild("GoldenGoose");

                if GoldenGoose ~= nil then
                    GoldenGoose:Destroy();
                end;
            end;
        end;

        if not fromCFrame then
            fromCFrame = p21.player.Character;

            if fromCFrame ~= nil then
                fromCFrame = fromCFrame:GetPivot();
            end;

            if fromCFrame == nil then
                fromCFrame = CFrame.new();
            end;
        end;

        u9:spawnGooseBehavior(p21.player, fromCFrame);
    end);
    WatchPlayer(function(u23, p24) -- Line: 193
        -- upvalues: u9 (copy), ClientStore (ref), Players (ref), Flamework (ref), u4 (ref), Theme (ref), UIUtil (ref), ColorUtil (ref)
        local v25 = u23:GetAttribute("HoldingGoose");

        if v25 ~= 0 and (v25 == v25 and (v25 ~= "" and v25)) then
            u9.gooseHolder = u23;
        end;

        p24:GiveTask(u23:GetAttributeChangedSignal("HoldingGoose"):Connect(function() -- Line: 198
            -- upvalues: u23 (copy), u9 (ref), ClientStore (ref), Players (ref), Flamework (ref), u4 (ref), Theme (ref), UIUtil (ref), ColorUtil (ref)
            local v26 = u23:GetAttribute("HoldingGoose");

            if v26 == 0 or (v26 ~= v26 or (v26 == "" or not v26)) then
                if u9.gooseHolder == u23 then
                    u9.gooseHolder = nil;
                    ClientStore:dispatch({
                        type = "DeleteGooseHolder"
                    });

                    if u23 == Players.LocalPlayer then
                        local gooseHint = u9.gooseHint;

                        if gooseHint ~= nil then
                            gooseHint:DoCleaning();
                        end;
                    end;
                end;
            else
                u9.gooseHolder = u23;
                ClientStore:dispatch({
                    type = "SetGooseHolder",
                    gooseHolder = u23
                });

                if u23 == Players.LocalPlayer then
                    u9.gooseHint = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement("TextLabel", {
                        Text = "BRING THE GOOSE TO BASE!",
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        AnchorPoint = Vector2.new(0.5, 1),
                        LayoutOrder = Theme.abilityActionBarPriority,
                        Position = UIUtil:getActionBarPosition(),
                        FontFace = Font.new("Roboto", Enum.FontWeight.ExtraBold),
                        TextColor3 = ColorUtil.WHITE,
                        Size = Theme.actionBarButtonSize
                    }, { u4.createElement("UIStroke", {
                            Thickness = 1,
                            Transparency = 0.3
                        }) }));
                end;
            end;
        end));
    end);
end;

function u6.setupHonkLogic(u27) -- Line: 239
    -- upvalues: default (copy), Workspace (copy)
    task.spawn(function() -- Line: 240
        -- upvalues: default (ref), Workspace (ref), u27 (copy)
        local u28 = os.clock();
        default.Client:Get("HonkChatMessage"):Connect(function(p29) -- Line: 242
            -- upvalues: Workspace (ref), u28 (ref), u27 (ref)
            local Character = p29.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            if not Character then
                return nil;
            end;

            local GoldenGoose = Workspace:FindFirstChild("GoldenGoose");

            if GoldenGoose ~= nil then
                GoldenGoose = GoldenGoose:GetPivot().Position;
            end;

            if not GoldenGoose then
                return nil;
            end;

            if (GoldenGoose - Character).Magnitude > 60 then
                return nil;
            end;

            if os.clock() - u28 < 0.5 then
                return nil;
            end;

            u28 = os.clock();
            task.delay(0.3, function() -- Line: 267
                -- upvalues: u27 (ref), GoldenGoose (copy)
                u27:playHonk(GoldenGoose);
            end);
        end);

        while true do
            local v30 = task.wait(15 + math.random() * 15);

            if v30 == 0 or (v30 ~= v30 or not v30) then
                break;
            end;

            local GoldenGoose = Workspace:FindFirstChild("GoldenGoose");

            if GoldenGoose ~= nil then
                GoldenGoose = GoldenGoose:GetPivot().Position;
            end;

            if GoldenGoose then
                if os.clock() - u28 < 0.5 then
                    return nil;
                end;

                u28 = os.clock();
                u27:playHonk(GoldenGoose);
            end;
        end;
    end);
end;

function u6.playHonk(p31, p32) -- Line: 293
    -- upvalues: RandomUtil (copy), GameSound (copy), SoundManager (copy)
    SoundManager:playSound(RandomUtil.fromList(GameSound.GOLDEN_GOOSE_HONK_1, GameSound.GOLDEN_GOOSE_HONK_2, GameSound.GOLDEN_GOOSE_HONK_3, GameSound.GOLDEN_GOOSE_HONK_4), {
        position = p32
    });
end;

function u6.playNestEffect(p33, p34) -- Line: 299
    -- upvalues: KnitClient (copy), FireworkType (copy)
    KnitClient.Controllers.FireworkController:playFireworkEffect(p34.Position, FireworkType.GOOSE);
end;

function u6.spawnGooseBehavior(p35, u36, p37) -- Line: 302
    -- upvalues: GoldenGooseBehavior (copy), u3 (copy)
    if p35.gooseBehavior then
        p35.gooseBehavior:Destroy();
    end;

    p35.gooseBehavior = GoldenGooseBehavior.new(p37);
    p35.gooseBehavior:updateOwner(u36);
    local u38 = u3.new();
    u38:GiveTask(p35.gooseBehavior);
    u38:GiveTask(u36:GetAttributeChangedSignal("HoldingGoose"):Connect(function() -- Line: 310
        -- upvalues: u36 (copy), u38 (copy)
        local v39 = u36:GetAttribute("HoldingGoose");

        if v39 ~= 0 and (v39 == v39 and (v39 ~= "" and v39)) then
            return nil;
        end;

        u38:DoCleaning();
    end));
    u38:GiveTask(u36.AncestryChanged:Connect(function() -- Line: 317
        -- upvalues: u36 (copy), u38 (copy)
        if u36.Parent then
            return nil;
        end;

        u38:DoCleaning();
    end));
end;

KnitClient.CreateController(u6.new());

return nil;