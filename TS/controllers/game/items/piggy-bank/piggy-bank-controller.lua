-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local Workspace = v6.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PiggyBankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "piggy-bank", "piggy-bank-util").PiggyBankUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local PiggyBankTitle = RuntimeLib.import(script, script.Parent, "piggy-bank-title").PiggyBankTitle;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "PiggyBankController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "PiggyBankController";
end;

function u7.KnitStart(p10) -- Line: 50
    -- upvalues: KnitController (copy), BlockEngineClientEvents (copy), ItemType (copy), u4 (copy), GameAnimationUtil (copy), RandomUtil (copy), AnimationType (copy), KnitClient (copy), GameSound (copy), WatchCollectionTag (copy), KnitClient2 (copy), DeviceUtil (copy), u3 (copy), Workspace (copy), u5 (copy), default (copy), ColorUtil (copy), PiggyBankTitle (copy), PiggyBankUtil (copy), SoundManager (copy), InventoryUtil (copy), default2 (copy), ClientStore (copy), ReplicatedStorage (copy), EffectUtil (copy), Players (copy)
    KnitController.KnitStart(p10);
    BlockEngineClientEvents.DamageBlock:connect(function(u11) -- Line: 52
        -- upvalues: ItemType (ref), u4 (ref), GameAnimationUtil (ref), RandomUtil (ref), AnimationType (ref)
        task.spawn(function() -- Line: 53
            -- upvalues: u11 (copy), ItemType (ref), u4 (ref), GameAnimationUtil (ref), RandomUtil (ref), AnimationType (ref)
            if u11.blockType ~= ItemType.PINATA then
                return nil;
            end;

            local blockInstance = u11.blockInstance;

            if blockInstance ~= nil then
                blockInstance = blockInstance:FindFirstChild("Rig");

                if blockInstance ~= nil then
                    blockInstance = blockInstance:FindFirstChild("AnimationController");
                end;
            end;

            if not blockInstance then
                return nil;
            end;

            local v12;

            if blockInstance == nil then
                v12 = blockInstance;
            else
                v12 = blockInstance:FindFirstChild("Animator");
            end;

            GameAnimationUtil:playAnimation(v12 or u4("Animator", {
                Parent = blockInstance
            }), RandomUtil.fromList(AnimationType.PINATA_HIT_1, AnimationType.PINATA_HIT_2));
        end);
    end);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.PINATA, {
        sounds = {
            GameSound.PINATA_POP_1,
            GameSound.PINATA_POP_2,
            GameSound.PINATA_POP_3,
            GameSound.PINATA_POP_4,
            GameSound.PINATA_HIT_1,
            GameSound.PINATA_HIT_2,
            GameSound.PINATA_HIT_3,
            GameSound.PINATA_STAGE_INCREASE
        }
    });
    WatchCollectionTag("piggy-bank", function(u13) -- Line: 84
        -- upvalues: KnitClient2 (ref), DeviceUtil (ref), u3 (ref), Workspace (ref), u4 (ref), u5 (ref), default (ref), ColorUtil (ref), PiggyBankTitle (ref), PiggyBankUtil (ref), SoundManager (ref), GameSound (ref), AnimationType (ref), GameAnimationUtil (ref), InventoryUtil (ref), ItemType (ref), default2 (ref)
        local v14 = u13:GetAttribute("Coin");
        local u15 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Add Candy",
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            Parent = u13,
            ObjectText = "Holding " .. tostring(v14) .. " Candy",
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        local u16 = u3.new();
        u13.AncestryChanged:Connect(function() -- Line: 95
            -- upvalues: u13 (copy), u16 (copy)
            if u13.Parent then
                return nil;
            end;

            u16:DoCleaning();
        end);
        local u17 = u4("Part", {
            Transparency = 1,
            CanCollide = false,
            CanQuery = false,
            Anchored = true,
            Size = Vector3.new(1, 1, 1),
            Position = u13.Position + Vector3.new(0, 3.5, 0),
            Parent = Workspace,
            Name = "PiggyBankTitle"
        });
        u16:GiveTask(u17);

        local function u20() -- Line: 117
            -- upvalues: u13 (copy), u4 (ref)
            local v18 = u13;

            if v18 ~= nil then
                v18 = v18:FindFirstChild("Rig");

                if v18 ~= nil then
                    v18 = v18:FindFirstChild("AnimationController");
                end;
            end;

            if not v18 then
                return nil;
            end;

            local v19;

            if v18 == nil then
                v19 = v18;
            else
                v19 = v18:FindFirstChild("Animator");
            end;

            return v19 or u4("Animator", {
                Parent = v18
            });
        end;

        local u21 = u3.new();
        u16:GiveTask(u21);
        local u22 = 0;

        local function u38() -- Line: 144
            -- upvalues: u13 (copy), u15 (copy), u21 (copy), u5 (ref), default (ref), ColorUtil (ref), PiggyBankTitle (ref), u17 (copy), PiggyBankUtil (ref), u22 (ref), SoundManager (ref), GameSound (ref), u20 (copy), AnimationType (ref), GameAnimationUtil (ref)
            local v23 = u13:GetAttribute("Coin");
            u15.ObjectText = "Holding " .. tostring(v23) .. " Candy";

            if v23 ~= nil then
                u21:DoCleaning();
                local v24 = {
                    AlwaysOnTop = true,
                    MaxDistance = 40,
                    Size = UDim2.fromScale(5, 2.5)
                };
                local v25 = {};
                local v26 = {
                    coins = v23
                };
                local v27 = default(u13);

                if v27 ~= nil then
                    v27 = v27.color;
                end;

                if v27 == nil then
                    v27 = ColorUtil.WHITE;
                end;

                v26.color = v27;
                v25[#v25 + 1] = u5.createElement(PiggyBankTitle, v26);
                local u28 = u5.mount(u5.createElement("BillboardGui", v24, v25), u17, "PiggyBankTitle");
                u21:GiveTask(function() -- Line: 171
                    -- upvalues: u5 (ref), u28 (copy)
                    u5.unmount(u28);
                end);
            end;

            local v29 = PiggyBankUtil:getStageFromCoins(v23 == nil and 0 or v23);

            if u22 ~= v29 then
                SoundManager:playSound(GameSound.PINATA_STAGE_INCREASE, {
                    position = u13.Position
                });
            end;

            u22 = v29;
            local Rig = u13:FindFirstChild("Rig");

            if Rig ~= nil then
                Rig = Rig:FindFirstChild("RootPart");
            end;

            local v30;

            if Rig == nil then
                v30 = Rig;
            else
                v30 = Rig:IsA("BasePart");
            end;

            if v30 then
                local IdleSound = Rig:FindFirstChild("IdleSound");

                if not IdleSound and v29 > 0 then
                    IdleSound = SoundManager:playModifiableSound(GameSound.PINATA_AMBIENT_LOOP, {
                        looped = true,
                        parent = Rig
                    });
                end;

                if IdleSound then
                    IdleSound.Name = "IdleSound";
                    IdleSound.Volume = 0.2 + v29 * 0.15;
                    IdleSound.RollOffMaxDistance = v29 * 4 * 3;
                    IdleSound.RollOffMinDistance = 3;
                end;
            end;

            local v31 = u13;

            if v31 ~= nil then
                v31 = v31:FindFirstChild("Rig");

                if v31 ~= nil then
                    v31 = v31:FindFirstChild("torso_mesh");

                    if v31 ~= nil then
                        v31 = v31:FindFirstChild("Glow");
                    end;
                end;
            end;

            if v31 and v29 > 0 then
                for _, child in v31:GetChildren() do
                    if child:IsA("ParticleEmitter") then
                        child.Enabled = true;
                        child.Rate = v29;
                    end;
                end;
            end;

            local v32 = u20();
            local v33 = { AnimationType.PINATA_IDLE_1, AnimationType.PINATA_IDLE_2, AnimationType.PINATA_IDLE_3 };

            if v32 then
                local v34 = v33[v29];
                local v35 = true;

                for _, v in v32:GetPlayingAnimationTracks() do
                    for _, v3 in { AnimationType.PINATA_IDLE_1, AnimationType.PINATA_IDLE_2, AnimationType.PINATA_IDLE_3 } do
                        local v36 = GameAnimationUtil:getAssetId(v3);
                        local Animation = v.Animation;

                        if Animation ~= nil then
                            Animation = Animation.AnimationId;
                        end;

                        if v36 == Animation then
                            if v3 == v34 then
                                v35 = false;
                            else
                                v:Stop();
                            end;
                        end;
                    end;
                end;

                local v37 = v35 and v34;

                if v37 ~= 0 and (v37 == v37 and v37) then
                    GameAnimationUtil:playAnimation(v32, v34);
                end;
            end;
        end;

        u13:GetAttributeChangedSignal("Coin"):Connect(function() -- Line: 267
            -- upvalues: u38 (copy)
            u38();
        end);
        u38();
        u15.Triggered:Connect(function(p39) -- Line: 271
            -- upvalues: InventoryUtil (ref), ItemType (ref), u20 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), default2 (ref), u13 (copy)
            if not InventoryUtil.hasEnough(p39, ItemType.CANDY, 1) then
                return nil;
            end;

            local v40 = u20();

            if v40 then
                GameAnimationUtil:playAnimation(v40, AnimationType.PINATA_FEED);
            end;

            SoundManager:playSound(GameSound.PINATA_DEPOSIT_CANDY);
            default2.Client:Get("DepositCoins"):CallServer(u13);
        end);
    end);
    default2.Client:Get("PiggyBankIncrement"):Connect(function(p41) -- Line: 283
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "KitPigsyIncrementResource",
            progress = {
                coin = p41.coin
            }
        });
    end);
    default2.Client:Get("PiggyBankPop"):Connect(function(u42) -- Line: 291
        -- upvalues: PiggyBankUtil (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), GameSound (ref), SoundManager (ref), KnitClient (ref), Players (ref)
        local v43 = PiggyBankUtil:getStageFromCoins(u42.coins);
        local v44 = math.clamp(v43 - 1, 0, 2);
        local v45 = ReplicatedStorage.Assets.Effects.Pinata:FindFirstChild("PopStage" .. tostring(v44));

        if v45 ~= nil then
            v45 = v45:Clone();
        end;

        local v46;

        if v45 == nil then
            v46 = v45;
        else
            v46 = v45:IsA("BasePart");
        end;

        if v46 then
            v45.Position = u42.position;
            v45.Parent = Workspace;
            EffectUtil:playEffects({ v45 }, nil, {
                destroyAfterSec = 4
            });
        end;

        SoundManager:playSound(({
            GameSound.PINATA_POP_1,
            GameSound.PINATA_POP_2,
            GameSound.PINATA_POP_3,
            GameSound.PINATA_POP_4
        })[v43 + 1], {
            position = u42.position
        });
        local awardedPlayer = u42.awardedPlayer;

        if awardedPlayer ~= nil then
            awardedPlayer = awardedPlayer.Character;
        end;

        local v47 = PiggyBankUtil:getRewardsFromCoins(u42.coins);
        KnitClient.Controllers.ReceiveItemEffectController:playEffectForItems(v47, u42.position, function() -- Line: 320
            -- upvalues: u42 (copy), awardedPlayer (copy)
            local awardedPlayer2 = u42.awardedPlayer;

            if awardedPlayer2 ~= nil then
                awardedPlayer2 = awardedPlayer2.Character;
            end;

            if awardedPlayer2 ~= awardedPlayer then
                return nil;
            end;

            if awardedPlayer2 ~= nil then
                awardedPlayer2 = awardedPlayer2.PrimaryPart;

                if awardedPlayer2 ~= nil then
                    awardedPlayer2 = awardedPlayer2.CFrame;
                end;
            end;

            return awardedPlayer2;
        end, u42.awardedPlayer == Players.LocalPlayer and "PlayLocally" or "PlayGlobally");
    end);
end;

KnitClient.CreateController(u7.new());

return nil;