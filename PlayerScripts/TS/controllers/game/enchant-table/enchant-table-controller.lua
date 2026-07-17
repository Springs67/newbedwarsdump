-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local CollectionTagAdded = v1.CollectionTagAdded;
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local ContentProvider = v6.ContentProvider;
local HttpService = v6.HttpService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta");
local ArmorEnchantMeta = v7.ArmorEnchantMeta;
local EnchantMeta = v7.EnchantMeta;
local ToolEnchantMeta = v7.ToolEnchantMeta;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EnchantPopUp = RuntimeLib.import(script, script.Parent, "ui", "enchant-pop-up", "enchant-pop-up").EnchantPopUp;
local EnchantTableUIUtil = RuntimeLib.import(script, script.Parent, "ui", "enchant-table-ui-util").EnchantTableUIUtil;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "EnchantTableController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 58
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 62
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p10);
    p10.Name = "EnchantTableController";
    p10.upgradeCooldowns = ExpireList.new(2);
    p10.learnedEnchants = {};
    p10.preloaded = false;
end;

function u8.KnitStart(u11) -- Line: 69
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), u4 (copy), TeamUpgradeUtil (copy), Theme (copy), DeviceUtil (copy), ClientSyncEvents (copy), ClientStore (copy), Flamework (copy), InventoryUtil (copy), ItemType (copy), u3 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), default (copy), WatchCollectionTag (copy), EffectUtil (copy), KnitClient2 (copy), EnchantBalance (copy), BedwarsAppIds (copy), AnimationUtil (copy), WatchCharacterAnimation (copy), EntityUtil (copy), ReplicatedStorage (copy), WeldUtil (copy), GameSound (copy), SoundManager (copy), KnitClient (copy), Workspace (copy), HttpService (copy), RunService (copy), u5 (copy), EnchantMeta (copy), EnchantTableUIUtil (copy), EnchantPopUp (copy), ArmorEnchantMeta (copy), ToolEnchantMeta (copy)
    KnitController.KnitStart(u11);
    CollectionTagAdded("broken-enchant-table", function(u12) -- Line: 71
        -- upvalues: u4 (ref), TeamUpgradeUtil (ref), Theme (ref), DeviceUtil (ref), ClientSyncEvents (ref), ClientStore (ref), Flamework (ref), InventoryUtil (ref), ItemType (ref), u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), default (ref)
        local u13 = u4("ProximityPrompt", {
            ObjectText = "Repair Enchant Table",
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            HoldDuration = 3.68,
            Parent = u12,
            ActionText = tostring(TeamUpgradeUtil.ENCHANT_TABLE_COST) .. " Diamonds",
            KeyboardKeyCode = Theme.promptKeyboardKey,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u13.PromptButtonHoldBegan:Connect(function(p14) -- Line: 82
            -- upvalues: ClientSyncEvents (ref), u12 (copy), u13 (copy), ClientStore (ref), Flamework (ref), InventoryUtil (ref), ItemType (ref), TeamUpgradeUtil (ref), u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref)
            if ClientSyncEvents.StartEnchantRepair:fire(u12):isCancelled() then
                u13:InputHoldEnd();

                return nil;
            end;

            local v15 = u12:GetAttribute("Team");
            local myTeam = ClientStore:getState().Game.myTeam;

            if myTeam ~= nil then
                myTeam = myTeam.id;
            end;

            if v15 ~= myTeam then
                u13:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You can only repair your team\'s Enchant Table."
                });

                return nil;
            end;

            if not InventoryUtil.hasEnough(p14, ItemType.DIAMOND, TeamUpgradeUtil.ENCHANT_TABLE_COST) then
                u13:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You need " .. tostring(TeamUpgradeUtil.ENCHANT_TABLE_COST) .. " diamonds to repair the Enchant Table."
                });

                return nil;
            end;

            local u16 = u3.new();
            local u17 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REPAIR_ENCHANT_TABLE);
            u16:GiveTask(function() -- Line: 109
                -- upvalues: u17 (copy)
                local v18 = u17;

                if v18 ~= nil then
                    v18:Stop();
                end;

                local v19 = u17;

                if v19 ~= nil then
                    v19:Destroy();
                end;
            end);
            u13.PromptButtonHoldEnded:Connect(function() -- Line: 119
                -- upvalues: u16 (copy)
                u16:DoCleaning();
            end);
        end);
        u13.Triggered:Connect(function(p20) -- Line: 123
            -- upvalues: default (ref), u12 (copy)
            default.Client:Get("RepairEnchantTable"):CallServer(u12);
        end);
    end);
    WatchCollectionTag("enchant-table", function(u21) -- Line: 127
        -- upvalues: ItemType (ref), u11 (copy), EffectUtil (ref), KnitClient2 (ref), DeviceUtil (ref), EnchantBalance (ref), ClientStore (ref), Players (ref), Flamework (ref), BedwarsAppIds (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local u22 = u21.Name == ItemType.ENCHANT_TABLE_GLITCHED;
        u11:preloadAssets();
        task.spawn(function() -- Line: 130
            -- upvalues: u21 (copy), EffectUtil (ref)
            local SpawnEffect = u21:FindFirstChild("SpawnEffect");

            if SpawnEffect then
                SpawnEffect:WaitForChild("Main");
                SpawnEffect:WaitForChild("Outline");
                SpawnEffect:WaitForChild("Outline1");
                SpawnEffect:WaitForChild("Specs");
                EffectUtil:playEffects(u21.SpawnEffect:GetChildren(), nil);
            end;
        end);
        local u23 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Open",
            ObjectText = "Enchant Table",
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            Parent = u21,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });

        if not EnchantBalance.USE_ENCHANT_TABLE_ANY_TEAM then
            local v24 = ClientStore:getState().Game.myTeam ~= nil;

            if v24 then
                local myTeam = ClientStore:getState().Game.myTeam;

                if myTeam ~= nil then
                    myTeam = myTeam.id;
                end;

                v24 = myTeam ~= u21:GetAttribute("Team");
            end;

            if v24 then
                u23.Enabled = false;
            end;

            ClientStore.changed:connect(function(p25, p26) -- Line: 160
                -- upvalues: u21 (copy), u23 (copy)
                if p25 == p26 then
                    return nil;
                end;

                if not p25.Game.myTeam then
                    return nil;
                end;

                local myTeam = p25.Game.myTeam;

                if myTeam ~= nil then
                    myTeam = myTeam.id;
                end;

                if myTeam == u21:GetAttribute("Team") then
                    u23.Enabled = true;

                    return;
                end;

                u23.Enabled = false;
            end);
        end;

        u23.Triggered:Connect(function(p27) -- Line: 178
            -- upvalues: Players (ref), Flamework (ref), BedwarsAppIds (ref), u21 (copy)
            if p27 ~= Players.LocalPlayer then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ENCHANT_TABLE, {
                EnchantTableType = u21.Name
            });
        end);
        task.spawn(function() -- Line: 187
            -- upvalues: u21 (copy), u22 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
            local Rig = u21:WaitForChild("Rig");

            if Rig ~= nil then
                Rig = Rig:WaitForChild("AnimationController"):WaitForChild("Animator");
            end;

            if u22 then
                AnimationUtil:playAnimation(Rig, GameAnimationUtil:getAssetId(AnimationType.ENCHANT_TABLE_GLITCHED_IDLE), {
                    looped = true
                });

                return;
            end;

            AnimationUtil:playAnimation(Rig, GameAnimationUtil:getAssetId(AnimationType.ENCHANT_TABLE_LOOP), {
                looped = true
            });
        end);
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.REPAIR_ENCHANT_TABLE) }, function(p28, p29) -- Line: 205
        -- upvalues: u11 (copy), Players (ref), EntityUtil (ref), u3 (ref), ReplicatedStorage (ref), WeldUtil (ref), GameSound (ref), EffectUtil (ref), SoundManager (ref)
        local Character = p28.Character;

        if not Character then
            return nil;
        end;

        if u11.upgradeCooldowns:has(p28.UserId) and p28.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u11.upgradeCooldowns:add(p28.UserId);
        local v30 = EntityUtil:getEntity(p28);
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u31 = u11:getClosestBrokenEnchantTable(PrimaryPart);

        if not u31 then
            return nil;
        end;

        local u32 = u3.new();

        if v30 ~= nil then
            v30 = v30:getItemInHandClient();
        end;

        if v30 then
            for _, descendant in v30:GetDescendants() do
                if descendant:IsA("BasePart") then
                    local Transparency = descendant.Transparency;
                    descendant.Transparency = 1;
                    u32:GiveTask(function() -- Line: 238
                        -- upvalues: descendant (copy), Transparency (copy)
                        descendant.Transparency = Transparency;
                    end);
                end;
            end;
        end;

        local u33 = Character == Players.LocalPlayer.Character;
        local u34 = ReplicatedStorage.Assets.Effects.RepairEnchantTableHammer:Clone();
        u34.Parent = Character;
        WeldUtil:weldCharacterAccessories(Character);
        local u35 = {
            GameSound.ENCHANT_TABLE_REPAIR_HAMMER_1,
            GameSound.ENCHANT_TABLE_REPAIR_HAMMER_2,
            GameSound.ENCHANT_TABLE_REPAIR_HAMMER_3,
            GameSound.ENCHANT_TABLE_REPAIR_HAMMER_4
        };
        local u36 = nil;
        u36 = p29:GetMarkerReachedSignal("hammer_1"):Connect(function() -- Line: 250
            -- upvalues: EffectUtil (ref), u31 (copy), SoundManager (ref), u35 (copy), u33 (copy), Character (copy), u36 (ref)
            EffectUtil:playEffects(u31.HammerEffect:GetChildren(), nil);
            local v37 = u35[1];
            local v38 = {};
            local v39;

            if u33 then
                v39 = nil;
            else
                v39 = Character.PrimaryPart;

                if v39 ~= nil then
                    v39 = v39.Position;
                end;
            end;

            v38.position = v39;
            SoundManager:playSound(v37, v38);
            u36:Disconnect();
        end);
        local u40 = nil;
        u40 = p29:GetMarkerReachedSignal("hammer_2"):Connect(function() -- Line: 271
            -- upvalues: EffectUtil (ref), u31 (copy), SoundManager (ref), u35 (copy), u33 (copy), Character (copy), u40 (ref)
            EffectUtil:playEffects(u31.HammerEffect:GetChildren(), nil);
            local v41 = u35[2];
            local v42 = {};
            local v43;

            if u33 then
                v43 = nil;
            else
                v43 = Character.PrimaryPart;

                if v43 ~= nil then
                    v43 = v43.Position;
                end;
            end;

            v42.position = v43;
            SoundManager:playSound(v41, v42);
            u40:Disconnect();
        end);
        local u44 = nil;
        u44 = p29:GetMarkerReachedSignal("hammer_3"):Connect(function() -- Line: 292
            -- upvalues: EffectUtil (ref), u31 (copy), SoundManager (ref), u35 (copy), u33 (copy), Character (copy), u44 (ref)
            EffectUtil:playEffects(u31.HammerEffect:GetChildren(), nil);
            local v45 = u35[3];
            local v46 = {};
            local v47;

            if u33 then
                v47 = nil;
            else
                v47 = Character.PrimaryPart;

                if v47 ~= nil then
                    v47 = v47.Position;
                end;
            end;

            v46.position = v47;
            SoundManager:playSound(v45, v46);
            u44:Disconnect();
        end);
        local u48 = nil;
        u48 = p29:GetMarkerReachedSignal("hammer_4"):Connect(function() -- Line: 313
            -- upvalues: EffectUtil (ref), u31 (copy), SoundManager (ref), u35 (copy), u33 (copy), Character (copy), u48 (ref)
            EffectUtil:playEffects(u31.HammerEffect:GetChildren(), nil);
            local v49 = u35[4];
            local v50 = {};
            local v51;

            if u33 then
                v51 = nil;
            else
                v51 = Character.PrimaryPart;

                if v51 ~= nil then
                    v51 = v51.Position;
                end;
            end;

            v50.position = v51;
            SoundManager:playSound(v49, v50);
            u48:Disconnect();
        end);
        p29.Stopped:Connect(function() -- Line: 333
            -- upvalues: u34 (copy), u32 (copy)
            u34:Destroy();
            u32:DoCleaning();
        end);
        p29.Destroying:Connect(function() -- Line: 337
            -- upvalues: u34 (copy), u32 (copy)
            u34:Destroy();
            u32:DoCleaning();
        end);
    end);
    default.Client:OnEvent("EnchantTableResearch", function(u52) -- Line: 343
        -- upvalues: Players (ref), KnitClient (ref), u11 (copy), GameSound (ref), ItemType (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), EffectUtil (ref), ReplicatedStorage (ref), Workspace (ref), u3 (ref), HttpService (ref), RunService (ref), u5 (ref), EnchantMeta (ref), EnchantTableUIUtil (ref), EnchantPopUp (ref)
        local v53 = Players:GetPlayerFromCharacter(u52.entityInstance);

        if not v53 then
            return nil;
        end;

        local v54 = KnitClient.Controllers.TeamController:getPlayerTeam(v53);
        local v55 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v53 and (v55 and v54 == v55) then
            u11.learnedEnchants[u52.enchant] = true;
        end;

        local PrimaryPart = u52.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if u52.enchantTable then
            PrimaryPart = u52.enchantTable.Position;
        end;

        if u52.orbOriginPosition then
            PrimaryPart = u52.orbOriginPosition;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u56 = {
            implosion = GameSound.ENCHANT_TABLE_RESEARCH_IMPLODE,
            research = GameSound.ENCHANT_TABLE_RESEARCH_CONSUME
        };
        local enchantTable = u52.enchantTable;

        if enchantTable ~= nil then
            enchantTable = enchantTable.Name;
        end;

        local v57 = enchantTable == ItemType.ENCHANT_TABLE_GLITCHED;

        if v57 and u52.enchantTable then
            u56.implosion = GameSound.GLITCH_ETABLE_IMPLOSION;
            u56.research = GameSound.GLITCH_ETABLE_ORB_CONSUME;
            task.spawn(function() -- Line: 383
                -- upvalues: u52 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
                local enchantTable2 = u52.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2:FindFirstChild("Rig");

                    if enchantTable2 ~= nil then
                        enchantTable2 = enchantTable2:WaitForChild("AnimationController"):WaitForChild("Animator");
                    end;
                end;

                AnimationUtil:playAnimation(enchantTable2, GameAnimationUtil:getAssetId(AnimationType.ENCHANT_TABLE_GLITCHED_ACTION), {
                    looped = false
                });
            end);
        end;

        SoundManager:playSound(u56.implosion, {
            rollOffMaxDistance = 120,
            position = PrimaryPart
        });

        if u52.enchantTable then
            EffectUtil:playEffects(u52.enchantTable.Implosion:GetChildren(), nil);
        end;

        local EnchantResearchOrb = ReplicatedStorage.Assets.Effects.EnchantResearchOrb;

        if v57 then
            EnchantResearchOrb = ReplicatedStorage.Assets.Effects.EnchantResearchOrbGlitched;
        end;

        local u58 = EnchantResearchOrb:Clone();
        u58.Parent = Workspace;

        if u52.enchantTable then
            u58:PivotTo(CFrame.new(u52.enchantTable.OrbAttachment.WorldPosition));
        else
            u58:PivotTo(CFrame.new(PrimaryPart));
        end;

        local u59 = u3.new();
        u59:GiveTask(function() -- Line: 416
            -- upvalues: u58 (ref)
            u58:Destroy();
        end);
        local u60 = 0;
        local UpperTorso = u52.entityInstance:FindFirstChild("UpperTorso");

        if UpperTorso == nil then
            return nil;
        end;

        local v61 = math.random(-2, 2);
        local v62 = math.random(3, 4);
        local u63 = Vector3.new(v61, v62, math.random(-2, 2));
        local u64 = HttpService:GenerateGUID(false);
        RunService:BindToRenderStep(u64, Enum.RenderPriority.Last.Value, function(p65) -- Line: 430
            -- upvalues: UpperTorso (copy), u58 (ref), u60 (ref), u63 (copy)
            if UpperTorso.Parent == nil then
                return nil;
            end;

            if u58.PrimaryPart == nil then
                return nil;
            end;

            u60 = u60 + p65;
            local v66 = math.clamp(u60 / 1.2, 0, 1);
            local v67 = u58.PrimaryPart.Position:Lerp(UpperTorso.Position, (math.sqrt(v66)));
            local v68 = math.sin(v66 * 3.141592653589793);
            local v69 = v67 + u63 * Vector3.new(v68, v68, v68);
            local v70 = CFrame.Angles(6.283185307179586 * (u60 % 2), 6.283185307179586 * (u60 % 3), 6.283185307179586 * (u60 % 1.5));
            u58:PivotTo(CFrame.new(v69) * v70);
        end);
        u59:GiveTask(function() -- Line: 451
            -- upvalues: RunService (ref), u64 (copy)
            RunService:UnbindFromRenderStep(u64);
        end);
        local u71 = u52.entityInstance == Players.LocalPlayer.Character;
        task.delay(1.2, function() -- Line: 455
            -- upvalues: u59 (copy), u52 (copy), SoundManager (ref), u56 (copy), u71 (copy)
            u59:DoCleaning();

            if u52.entityInstance.PrimaryPart then
                local research = u56.research;
                local v72 = {};
                local v73;

                if u71 then
                    v73 = nil;
                else
                    v73 = u52.entityInstance.PrimaryPart.Position;
                end;

                v72.position = v73;
                SoundManager:playSound(research, v72);
            end;
        end);

        if u52.entityInstance == Players.LocalPlayer.Character then
            task.delay(1.2, function() -- Line: 464
                -- upvalues: u11 (ref), u5 (ref), EnchantMeta (ref), u52 (copy), EnchantTableUIUtil (ref), EnchantPopUp (ref), Players (ref)
                if u11.enchantPopupTree then
                    u5.unmount(u11.enchantPopupTree);
                end;

                local v74 = EnchantMeta[u52.enchant];
                local v75 = {
                    EnchantName = v74.name,
                    EnchantImage = v74.image
                };
                local enchantTable2 = u52.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2.Name;
                end;

                v75.EnchantTableType = enchantTable2;
                local enchantTable3 = u52.enchantTable;

                if enchantTable3 ~= nil then
                    enchantTable3 = enchantTable3.Name;
                end;

                v75.ThemeColor = EnchantTableUIUtil.getThemeColor(enchantTable3);
                u11.enchantPopupTree = u5.mount(u5.createElement(EnchantPopUp, v75), Players.LocalPlayer:WaitForChild("PlayerGui"));
            end);
        end;
    end);
    default.Client:OnEvent("ArmorEnchantResearch", function(u76) -- Line: 494
        -- upvalues: Players (ref), GameSound (ref), ItemType (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), EffectUtil (ref), ReplicatedStorage (ref), Workspace (ref), u3 (ref), HttpService (ref), RunService (ref), u11 (copy), u5 (ref), ArmorEnchantMeta (ref), EnchantTableUIUtil (ref), EnchantPopUp (ref)
        if not Players:GetPlayerFromCharacter(u76.entityInstance) then
            return nil;
        end;

        local PrimaryPart = u76.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if u76.enchantTable then
            PrimaryPart = u76.enchantTable.Position;
        end;

        if u76.orbOriginPosition then
            PrimaryPart = u76.orbOriginPosition;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u77 = {
            implosion = GameSound.ENCHANT_TABLE_RESEARCH_IMPLODE,
            research = GameSound.ENCHANT_TABLE_RESEARCH_CONSUME
        };
        local enchantTable = u76.enchantTable;

        if enchantTable ~= nil then
            enchantTable = enchantTable.Name;
        end;

        local v78 = enchantTable == ItemType.ENCHANT_TABLE_GLITCHED;

        if v78 and u76.enchantTable then
            u77.implosion = GameSound.GLITCH_ETABLE_IMPLOSION;
            u77.research = GameSound.GLITCH_ETABLE_ORB_CONSUME;
            task.spawn(function() -- Line: 526
                -- upvalues: u76 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
                local enchantTable2 = u76.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2:FindFirstChild("Rig");

                    if enchantTable2 ~= nil then
                        enchantTable2 = enchantTable2:WaitForChild("AnimationController"):WaitForChild("Animator");
                    end;
                end;

                AnimationUtil:playAnimation(enchantTable2, GameAnimationUtil:getAssetId(AnimationType.ENCHANT_TABLE_GLITCHED_ACTION), {
                    looped = false
                });
            end);
        end;

        SoundManager:playSound(u77.implosion, {
            rollOffMaxDistance = 120,
            position = PrimaryPart
        });

        if u76.enchantTable then
            EffectUtil:playEffects(u76.enchantTable.Implosion:GetChildren(), nil);
        end;

        local ArmorEnchantResearchOrb = ReplicatedStorage.Assets.Effects.ArmorEnchantResearchOrb;

        if v78 then
            ArmorEnchantResearchOrb = ReplicatedStorage.Assets.Effects.EnchantResearchOrbGlitched;
        end;

        local u79 = ArmorEnchantResearchOrb:Clone();
        u79.Parent = Workspace;

        if u76.enchantTable then
            u79:PivotTo(CFrame.new(u76.enchantTable.OrbAttachment.WorldPosition));
        else
            u79:PivotTo(CFrame.new(PrimaryPart));
        end;

        local u80 = u3.new();
        u80:GiveTask(function() -- Line: 559
            -- upvalues: u79 (ref)
            u79:Destroy();
        end);
        local u81 = 0;
        local UpperTorso = u76.entityInstance:FindFirstChild("UpperTorso");

        if UpperTorso == nil then
            return nil;
        end;

        local v82 = math.random(-2, 2);
        local v83 = math.random(3, 4);
        local u84 = Vector3.new(v82, v83, math.random(-2, 2));
        local u85 = HttpService:GenerateGUID(false);
        RunService:BindToRenderStep(u85, Enum.RenderPriority.Last.Value, function(p86) -- Line: 573
            -- upvalues: UpperTorso (copy), u79 (ref), u81 (ref), u84 (copy)
            if UpperTorso.Parent == nil then
                return nil;
            end;

            if u79.PrimaryPart == nil then
                return nil;
            end;

            u81 = u81 + p86;
            local v87 = math.clamp(u81 / 1.2, 0, 1);
            local v88 = u79.PrimaryPart.Position:Lerp(UpperTorso.Position, (math.sqrt(v87)));
            local v89 = math.sin(v87 * 3.141592653589793);
            local v90 = v88 + u84 * Vector3.new(v89, v89, v89);
            local v91 = CFrame.Angles(6.283185307179586 * (u81 % 2), 6.283185307179586 * (u81 % 3), 6.283185307179586 * (u81 % 1.5));
            u79:PivotTo(CFrame.new(v90) * v91);
        end);
        u80:GiveTask(function() -- Line: 594
            -- upvalues: RunService (ref), u85 (copy)
            RunService:UnbindFromRenderStep(u85);
        end);
        local u92 = u76.entityInstance == Players.LocalPlayer.Character;
        task.delay(1.2, function() -- Line: 598
            -- upvalues: u80 (copy), u76 (copy), SoundManager (ref), u77 (copy), u92 (copy)
            u80:DoCleaning();

            if u76.entityInstance.PrimaryPart then
                local research = u77.research;
                local v93 = {};
                local v94;

                if u92 then
                    v94 = nil;
                else
                    v94 = u76.entityInstance.PrimaryPart.Position;
                end;

                v93.position = v94;
                SoundManager:playSound(research, v93);
            end;
        end);

        if u76.entityInstance == Players.LocalPlayer.Character then
            task.delay(1.2, function() -- Line: 607
                -- upvalues: u11 (ref), u5 (ref), ArmorEnchantMeta (ref), u76 (copy), EnchantTableUIUtil (ref), EnchantPopUp (ref), Players (ref)
                if u11.enchantPopupTree then
                    u5.unmount(u11.enchantPopupTree);
                end;

                local v95 = ArmorEnchantMeta[u76.enchant];
                local v96 = {
                    EnchantName = v95.name,
                    EnchantImage = v95.image
                };
                local enchantTable2 = u76.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2.Name;
                end;

                v96.EnchantTableType = enchantTable2;
                local enchantTable3 = u76.enchantTable;

                if enchantTable3 ~= nil then
                    enchantTable3 = enchantTable3.Name;
                end;

                v96.ThemeColor = EnchantTableUIUtil.getThemeColor(enchantTable3);
                u11.enchantPopupTree = u5.mount(u5.createElement(EnchantPopUp, v96), Players.LocalPlayer:WaitForChild("PlayerGui"));
            end);
        end;
    end);
    default.Client:OnEvent("ToolEnchantResearch", function(u97) -- Line: 637
        -- upvalues: Players (ref), GameSound (ref), ItemType (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), EffectUtil (ref), ReplicatedStorage (ref), Workspace (ref), u3 (ref), HttpService (ref), RunService (ref), u11 (copy), u5 (ref), ToolEnchantMeta (ref), EnchantTableUIUtil (ref), EnchantPopUp (ref)
        if not Players:GetPlayerFromCharacter(u97.entityInstance) then
            return nil;
        end;

        local PrimaryPart = u97.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if u97.enchantTable then
            PrimaryPart = u97.enchantTable.Position;
        end;

        if u97.orbOriginPosition then
            PrimaryPart = u97.orbOriginPosition;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u98 = {
            implosion = GameSound.ENCHANT_TABLE_RESEARCH_IMPLODE,
            research = GameSound.ENCHANT_TABLE_RESEARCH_CONSUME
        };
        local enchantTable = u97.enchantTable;

        if enchantTable ~= nil then
            enchantTable = enchantTable.Name;
        end;

        local v99 = enchantTable == ItemType.ENCHANT_TABLE_GLITCHED;

        if v99 and u97.enchantTable then
            u98.implosion = GameSound.GLITCH_ETABLE_IMPLOSION;
            u98.research = GameSound.GLITCH_ETABLE_ORB_CONSUME;
            task.spawn(function() -- Line: 669
                -- upvalues: u97 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
                local enchantTable2 = u97.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2:FindFirstChild("Rig");

                    if enchantTable2 ~= nil then
                        enchantTable2 = enchantTable2:WaitForChild("AnimationController"):WaitForChild("Animator");
                    end;
                end;

                AnimationUtil:playAnimation(enchantTable2, GameAnimationUtil:getAssetId(AnimationType.ENCHANT_TABLE_GLITCHED_ACTION), {
                    looped = false
                });
            end);
        end;

        SoundManager:playSound(u98.implosion, {
            rollOffMaxDistance = 120,
            position = PrimaryPart
        });

        if u97.enchantTable then
            EffectUtil:playEffects(u97.enchantTable.Implosion:GetChildren(), nil);
        end;

        local ArmorEnchantResearchOrb = ReplicatedStorage.Assets.Effects.ArmorEnchantResearchOrb;

        if v99 then
            ArmorEnchantResearchOrb = ReplicatedStorage.Assets.Effects.EnchantResearchOrbGlitched;
        end;

        local u100 = ArmorEnchantResearchOrb:Clone();
        u100.Parent = Workspace;

        if u97.enchantTable then
            u100:PivotTo(CFrame.new(u97.enchantTable.OrbAttachment.WorldPosition));
        else
            u100:PivotTo(CFrame.new(PrimaryPart));
        end;

        local u101 = u3.new();
        u101:GiveTask(function() -- Line: 702
            -- upvalues: u100 (ref)
            u100:Destroy();
        end);
        local u102 = 0;
        local UpperTorso = u97.entityInstance:FindFirstChild("UpperTorso");

        if UpperTorso == nil then
            return nil;
        end;

        local v103 = math.random(-2, 2);
        local v104 = math.random(3, 4);
        local u105 = Vector3.new(v103, v104, math.random(-2, 2));
        local u106 = HttpService:GenerateGUID(false);
        RunService:BindToRenderStep(u106, Enum.RenderPriority.Last.Value, function(p107) -- Line: 716
            -- upvalues: UpperTorso (copy), u100 (ref), u102 (ref), u105 (copy)
            if UpperTorso.Parent == nil then
                return nil;
            end;

            if u100.PrimaryPart == nil then
                return nil;
            end;

            u102 = u102 + p107;
            local v108 = math.clamp(u102 / 1.2, 0, 1);
            local v109 = u100.PrimaryPart.Position:Lerp(UpperTorso.Position, (math.sqrt(v108)));
            local v110 = math.sin(v108 * 3.141592653589793);
            local v111 = v109 + u105 * Vector3.new(v110, v110, v110);
            local v112 = CFrame.Angles(6.283185307179586 * (u102 % 2), 6.283185307179586 * (u102 % 3), 6.283185307179586 * (u102 % 1.5));
            u100:PivotTo(CFrame.new(v111) * v112);
        end);
        u101:GiveTask(function() -- Line: 737
            -- upvalues: RunService (ref), u106 (copy)
            RunService:UnbindFromRenderStep(u106);
        end);
        local u113 = u97.entityInstance == Players.LocalPlayer.Character;
        task.delay(1.2, function() -- Line: 741
            -- upvalues: u101 (copy), u97 (copy), SoundManager (ref), u98 (copy), u113 (copy)
            u101:DoCleaning();

            if u97.entityInstance.PrimaryPart then
                local research = u98.research;
                local v114 = {};
                local v115;

                if u113 then
                    v115 = nil;
                else
                    v115 = u97.entityInstance.PrimaryPart.Position;
                end;

                v114.position = v115;
                SoundManager:playSound(research, v114);
            end;
        end);

        if u97.entityInstance == Players.LocalPlayer.Character then
            task.delay(1.2, function() -- Line: 750
                -- upvalues: u11 (ref), u5 (ref), ToolEnchantMeta (ref), u97 (copy), EnchantTableUIUtil (ref), EnchantPopUp (ref), Players (ref)
                if u11.enchantPopupTree then
                    u5.unmount(u11.enchantPopupTree);
                end;

                local v116 = ToolEnchantMeta[u97.enchant];
                local v117 = {
                    EnchantName = v116.name,
                    EnchantImage = v116.image
                };
                local enchantTable2 = u97.enchantTable;

                if enchantTable2 ~= nil then
                    enchantTable2 = enchantTable2.Name;
                end;

                v117.EnchantTableType = enchantTable2;
                local enchantTable3 = u97.enchantTable;

                if enchantTable3 ~= nil then
                    enchantTable3 = enchantTable3.Name;
                end;

                v117.ThemeColor = EnchantTableUIUtil.getThemeColor(enchantTable3);
                u11.enchantPopupTree = u5.mount(u5.createElement(EnchantPopUp, v117), Players.LocalPlayer:WaitForChild("PlayerGui"));
            end);
        end;
    end);
end;

function u8.preloadAssets(p118) -- Line: 780
    -- upvalues: ContentProvider (copy), u4 (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p118.preloaded then
        return nil;
    end;

    p118.preloaded = true;
    task.spawn(function() -- Line: 785
        -- upvalues: ContentProvider (ref), u4 (ref), GameAnimationUtil (ref), AnimationType (ref)
        ContentProvider:PreloadAsync({ u4("Animation", {
                AnimationId = GameAnimationUtil:getAssetId(AnimationType.REPAIR_ENCHANT_TABLE)
            }) });
    end);
end;

function u8.getClosestBrokenEnchantTable(p119, u120) -- Line: 791
    -- upvalues: CollectionService (copy)
    local v121 = CollectionService:GetTagged("broken-enchant-table");
    table.sort(v121, function(p122, p123) -- Line: 793
        -- upvalues: u120 (copy)
        return (p122.Position - u120).Magnitude < (p123.Position - u120).Magnitude;
    end);

    local function _(p124) -- Line: 802
        return true;
    end;

    local v125 = nil;

    for i, v in v121 do
        local _ = i - 1;

        if true == true then
            v125 = v;
            break;
        end;
    end;

    return v125;
end;

function u8.getClosestEnchantTable(p126, u127) -- Line: 817
    -- upvalues: CollectionService (copy)
    local v128 = CollectionService:GetTagged("enchant-table");
    table.sort(v128, function(p129, p130) -- Line: 819
        -- upvalues: u127 (copy)
        return (p129.Position - u127).Magnitude < (p130.Position - u127).Magnitude;
    end);

    local function _(p131) -- Line: 828
        return true;
    end;

    local v132 = nil;

    for i, v in v128 do
        local _ = i - 1;

        if true == true then
            v132 = v;
            break;
        end;
    end;

    return v132;
end;

function u8.researchEnchant(p133) -- Line: 843
    -- upvalues: Players (copy), Flamework (copy), BedwarsAppIds (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v134 = p133:getClosestEnchantTable(Character);

    if not v134 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.ENCHANT_TABLE);
    default.Client:Get("ResearchEnchant"):CallServer({
        enchantTable = v134
    });
end;

function u8.researchArmorEnchant(p135) -- Line: 865
    -- upvalues: Players (copy), Flamework (copy), BedwarsAppIds (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v136 = p135:getClosestEnchantTable(Character);

    if not v136 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.ENCHANT_TABLE);
    default.Client:Get("ResearchArmorEnchant"):CallServer({
        enchantTable = v136
    });
end;

function u8.researchToolEnchant(p137) -- Line: 887
    -- upvalues: Players (copy), Flamework (copy), BedwarsAppIds (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v138 = p137:getClosestEnchantTable(Character);

    if not v138 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.ENCHANT_TABLE);
    default.Client:Get("ResearchToolEnchant"):CallServer({
        enchantTable = v138
    });
end;

function u8.unmountEnchantPopup(p139) -- Line: 909
    -- upvalues: u5 (copy)
    if p139.enchantPopupTree then
        u5.unmount(p139.enchantPopupTree);
        p139.enchantPopupTree = nil;
    end;
end;

KnitClient.CreateController(u8.new());

return nil;