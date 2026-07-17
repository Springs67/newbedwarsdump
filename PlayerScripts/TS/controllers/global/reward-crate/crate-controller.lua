-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchComponent = v1.WatchComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local RewardCrateComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "reward-crate-component").RewardCrateComponent;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CrateConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-constants").CrateConstants;
local getCrateItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-meta").getCrateItemMeta;
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local CrateMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local CrateRewardTitle = RuntimeLib.import(script, script.Parent, "crate-reward-title").CrateRewardTitle;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "CrateController";
    end
});
u6.__index = u6;

function u6.new(...) -- Line: 40
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 44
    p8.crateMaids = {};
end;

function u6.onStart(u9) -- Line: 47
    -- upvalues: WatchComponent (copy), RewardCrateComponent (copy), CrateMeta (copy), u2 (copy), Players (copy), u3 (copy), KnitClient (copy), CrateConstants (copy), default (copy), CrateItemRarity (copy), getCrateItemMeta (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), getCrateItemRarityMeta (copy), ItemUtil (copy), GameQueryUtil (copy), Workspace (copy), u4 (copy), CrateRewardTitle (copy), ReplicatedStorage (copy), EffectUtil (copy), RandomUtil (copy), RunService (copy)
    WatchComponent(RewardCrateComponent, function(u10) -- Line: 54
        -- upvalues: CrateMeta (ref), u2 (ref), u9 (copy), Players (ref), u3 (ref), KnitClient (ref), CrateConstants (ref), default (ref)
        local crateType = u10.attributes.crateType;

        if not crateType then
            return nil;
        end;

        local v11 = CrateMeta[crateType];
        local v12 = u2.new();
        u9.crateMaids[u10.instance] = v12;

        if u10.attributes.owner == nil and true or u10.attributes.owner == Players.LocalPlayer.UserId then
            local v13 = u3("Part", {
                Name = "PromptPart",
                Transparency = 1,
                CanCollide = false,
                CanQuery = false,
                Anchored = true,
                Size = Vector3.new(1, 1, 1),
                Position = u10.instance:GetPivot().Position + Vector3.new(0, 5, 0),
                Parent = u10.instance
            });
            local ProximityPromptController = KnitClient.Controllers.ProximityPromptController;
            local v14 = {
                Name = "OpenCratePrompt"
            };
            local promptObjectLabel = u10.attributes.promptObjectLabel;

            if promptObjectLabel == nil then
                promptObjectLabel = v11.displayName;
            end;

            v14.ObjectText = promptObjectLabel;
            local promptActionText = u10.attributes.promptActionText;
            v14.ActionText = promptActionText == nil and "Open Crate" or promptActionText;
            v14.HoldDuration = 1.2;
            v14.RequiresLineOfSight = false;
            v14.MaxActivationDistance = CrateConstants.CRATE_MAX_ACTIVATION_DISTANCE;
            v14.Parent = v13;
            local u15 = ProximityPromptController:createProximityPrompt(v14);
            u10:setOpenCratePrompt(u15);
            u15.Triggered:Connect(function(p16) -- Line: 102
                -- upvalues: u10 (copy), KnitClient (ref), default (ref), u15 (copy), CrateConstants (ref)
                local altarId = u10.attributes.altarId;

                if altarId ~= 0 and (altarId == altarId and altarId) then
                    KnitClient.Controllers.CrateAltarController:requestOpenCrate(u10.attributes.crateId, u10.attributes.altarId);

                    return;
                end;

                default.Client:GetNamespace("RewardCrate"):Get("OpenRewardCrate"):SendToServer({
                    crateId = u10.attributes.crateId
                });
                u15.Enabled = false;
                task.delay(CrateConstants.CRATE_OPEN_DECAY_SECONDS, function() -- Line: 113
                    -- upvalues: u15 (ref)
                    u15.Enabled = true;
                end);
            end);
        end;

        local u17 = nil;
        u17 = u10.instance.Destroying:Connect(function() -- Line: 120
            -- upvalues: u9 (ref), u10 (copy), u17 (ref)
            u9:cleanupCrate(u10.instance);
            u17:Disconnect();
        end);
    end);
    default.Client:GetNamespace("RewardCrate"):Get("CrateOpened"):Connect(function(p18) -- Line: 126
        -- upvalues: CrateItemRarity (ref), u2 (ref), CrateConstants (ref), getCrateItemMeta (ref), u9 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), getCrateItemRarityMeta (ref), u3 (ref), ItemUtil (ref), GameQueryUtil (ref), Workspace (ref), u4 (ref), CrateRewardTitle (ref), ReplicatedStorage (ref), EffectUtil (ref), RandomUtil (ref), RunService (ref)
        local _ = p18.openingPlayer;
        local crateModel = p18.crateModel;
        local reward = p18.reward;
        local visualOverrides = p18.visualOverrides;
        local rarity = reward.rarity;

        if rarity == nil then
            rarity = CrateItemRarity.ONE_STAR;
        end;

        local v19;

        if crateModel == nil then
            v19 = crateModel;
        else
            v19 = crateModel.Parent;
        end;

        if not v19 then
            return nil;
        end;

        local u20 = u2.new();
        task.delay(CrateConstants.CRATE_OPEN_DECAY_SECONDS, function() -- Line: 145
            -- upvalues: u20 (copy)
            u20:DoCleaning();
        end);
        local u21 = getCrateItemMeta(reward.itemType);
        local u22 = {};

        for i, v in u21.itemDisplay do
            u22[i] = v;
        end;

        local v23;

        if visualOverrides == nil then
            v23 = visualOverrides;
        else
            v23 = visualOverrides.itemDisplay;
        end;

        if type(v23) == "table" then
            for i, v in v23 do
                u22[i] = v;
            end;
        end;

        local v24 = u9.crateMaids[crateModel];

        if v24 ~= nil then
            v24:GiveTask(u20);
        end;

        local u25 = GameAnimationUtil:playAnimation(crateModel, AnimationType.LUCKY_BOX_OPEN);

        if not u25 then
            u20:DoCleaning();

            return nil;
        end;

        local u26 = SoundManager:playSound(GameSound.LUCKY_BOX_OPEN, {
            rollOffMinDistance = 30,
            rollOffMaxDistance = 45,
            position = crateModel:GetPivot().Position
        });
        u20:GiveTask(function() -- Line: 178
            -- upvalues: SoundManager (ref), GameSound (ref), crateModel (copy), u26 (copy)
            SoundManager:playSound(GameSound.LUCKY_BOX_CLOSE, {
                rollOffMinDistance = 30,
                rollOffMaxDistance = 45,
                position = crateModel:GetPivot().Position
            });
            local v27 = u26;

            if v27 ~= nil then
                v27:Stop();
            end;
        end);
        local PrimaryPart = crateModel.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:FindFirstChild("neon");
        end;

        PrimaryPart.Color = getCrateItemRarityMeta(rarity).gradient.colorTop;
        PrimaryPart.Transparency = 0;
        u20:GiveTask(function() -- Line: 197
            -- upvalues: PrimaryPart (copy)
            PrimaryPart.Transparency = 1;
        end);
        u20:GiveTask(function() -- Line: 200
            -- upvalues: u25 (copy)
            return u25:Stop(0.75);
        end);
        u20:GiveTask(u25:GetMarkerReachedSignal("pause"):Connect(function() -- Line: 203
            -- upvalues: u25 (copy)
            u25:AdjustSpeed(0);
        end));
        u20:GiveTask(u25:GetMarkerReachedSignal("glow_begin"):Connect(function() -- Line: 206
            -- upvalues: GameSound (ref), rarity (copy), SoundManager (ref), crateModel (copy)
            local v28 = ({
                GameSound.LUCKY_BOX_PREVIEW_COMMON,
                GameSound.LUCKY_BOX_PREVIEW_UNCOMMON,
                GameSound.LUCKY_BOX_PREVIEW_RARE,
                GameSound.LUCKY_BOX_PREVIEW_EPIC,
                GameSound.LUCKY_BOX_PREVIEW_LEGENDARY,
                GameSound.LUCKY_BOX_PREVIEW_MYTHIC
            })[rarity + 1];

            if v28 ~= "" and v28 then
                SoundManager:playSound(v28, {
                    volumeMultiplier = 1.3,
                    rollOffMinDistance = 30,
                    rollOffMaxDistance = 45,
                    position = crateModel:GetPivot().Position
                });
            end;
        end));
        u20:GiveTask(u25:GetMarkerReachedSignal("reveal_item"):Connect(function() -- Line: 218
            -- upvalues: u22 (copy), crateModel (copy), u3 (ref), ItemUtil (ref), GameQueryUtil (ref), Workspace (ref), rarity (copy), CrateItemRarity (ref), getCrateItemRarityMeta (ref), u20 (copy), GameSound (ref), SoundManager (ref), u4 (ref), visualOverrides (copy), u21 (copy), CrateRewardTitle (ref), ReplicatedStorage (ref), EffectUtil (ref), RandomUtil (ref), RunService (ref)
            local u29 = nil;
            local image = u22.image;

            if image == "" or not image then
                if u22.itemType then
                    local v30 = ItemUtil.createItemInstance(u22.itemType):Clone();

                    local function _(p31) -- Line: 255
                        -- upvalues: GameQueryUtil (ref)
                        return GameQueryUtil:setQueryIgnored(p31, true);
                    end;

                    for i, descendant in v30:GetDescendants() do
                        local _ = i - 1;
                        GameQueryUtil:setQueryIgnored(descendant, true);
                    end;

                    u29 = v30:FindFirstChild("Handle");
                    u29.Parent = Workspace;

                    if rarity ~= CrateItemRarity.ONE_STAR then
                        for _, descendant in v30:GetDescendants() do
                            if descendant:IsA("BasePart") and descendant.Transparency ~= 1 then
                                for _, v in Enum.NormalId:GetEnumItems() do
                                    u3("Texture", {
                                        Texture = "rbxassetid://9353205239",
                                        Transparency = 0.7,
                                        Color3 = getCrateItemRarityMeta(rarity).gradient.colorTop,
                                        Parent = descendant,
                                        Face = v
                                    });
                                end;
                            end;
                        end;
                    end;
                elseif u22.text then
                    u29 = u3("Part", {
                        Transparency = 1,
                        CanCollide = false,
                        CanQuery = false,
                        Anchored = true,
                        Size = Vector3.new(1, 1, 1),
                        Position = crateModel:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0),
                        Parent = crateModel
                    });
                    local v32 = {
                        MaxDistance = 60,
                        AlwaysOnTop = true,
                        DistanceLowerLimit = 25,
                        DistanceUpperLimit = 10,
                        Parent = u29,
                        Size = UDim2.fromOffset(40, 40)
                    };
                    local v33 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local text = u22.text;

                    if text ~= nil then
                        text = text.richText;
                    end;

                    v33.Text = text;
                    local text2 = u22.text;

                    if text2 ~= nil then
                        text2 = text2.color;
                    end;

                    if text2 == nil then
                        text2 = Color3.fromRGB(255, 255, 255);
                    end;

                    v33.TextColor3 = text2;
                    local text3 = u22.text;

                    if text3 ~= nil then
                        text3 = text3.font;
                    end;

                    if text3 == nil then
                        text3 = Enum.Font.LuckiestGuy;
                    end;

                    v33.Font = text3;
                    v33.TextScaled = true;
                    v33.RichText = true;
                    v33.TextXAlignment = Enum.TextXAlignment.Center;
                    v33.BackgroundTransparency = 1;
                    v32.Children = { u3("TextLabel", v33) };
                    u3("BillboardGui", v32);
                end;
            else
                u29 = u3("Part", {
                    Transparency = 1,
                    CanCollide = false,
                    CanQuery = false,
                    Anchored = true,
                    Size = Vector3.new(1, 1, 1),
                    Position = crateModel:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0),
                    Parent = crateModel
                });
                u3("BillboardGui", {
                    MaxDistance = 60,
                    AlwaysOnTop = true,
                    DistanceLowerLimit = 25,
                    DistanceUpperLimit = 25,
                    Parent = u29,
                    Size = UDim2.fromOffset(50, 50),
                    Children = { u3("ImageLabel", {
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            ScaleType = Enum.ScaleType.Fit,
                            Image = u22.image
                        }) }
                });
            end;

            u20:GiveTask(u29);
            local v34 = ({
                GameSound.LUCKY_BOX_REVEAL_COMMON,
                GameSound.LUCKY_BOX_REVEAL_UNCOMMON,
                GameSound.LUCKY_BOX_REVEAL_RARE,
                GameSound.LUCKY_BOX_REVEAL_EPIC,
                GameSound.LUCKY_BOX_REVEAL_LEGENDARY,
                GameSound.LUCKY_BOX_REVEAL_MYTHIC
            })[rarity + 1];

            if v34 ~= "" and v34 then
                SoundManager:playSound(v34, {
                    rollOffMinDistance = 30,
                    rollOffMaxDistance = 45,
                    position = crateModel:GetPivot().Position
                });
            end;

            local u35 = SoundManager:playSound(GameSound.LUCKY_BOX_SHIMMER, {
                rollOffMinDistance = 30,
                rollOffMaxDistance = 45,
                looped = true,
                position = crateModel:GetPivot().Position
            });
            u20:GiveTask(function() -- Line: 355
                -- upvalues: u35 (copy)
                local v36 = u35;

                if v36 ~= nil then
                    v36 = v36:Stop();
                end;

                return v36;
            end);
            local v37 = u3("Part", {
                Transparency = 1,
                CanCollide = false,
                CanQuery = false,
                Anchored = true,
                Size = Vector3.new(1, 1, 1),
                Position = crateModel:GetPrimaryPartCFrame().Position + Vector3.new(0, 7.5, 0),
                Parent = crateModel
            });
            u20:GiveTask(v37);
            local v38 = {
                AlwaysOnTop = true,
                MaxDistance = 60,
                Size = UDim2.fromScale(6, 3)
            };
            local v39 = {};
            local v40 = {};
            local v41 = visualOverrides;

            if v41 ~= nil then
                v41 = v41.displayName;
            end;

            if v41 == nil then
                v41 = u21.displayName;
            end;

            v40.itemDisplayName = v41;
            v40.itemRarity = rarity;
            v39[#v39 + 1] = u4.createElement(CrateRewardTitle, v40);
            u4.mount(u4.createElement("BillboardGui", v38, v39), v37, "CrateRewardTitle");
            local id = getCrateItemRarityMeta(rarity).id;
            local v42 = ReplicatedStorage.Assets.Effects.CrateItemParticles:FindFirstChild(id);

            if v42 ~= nil then
                v42 = v42:Clone();
            end;

            if v42 ~= nil then
                v42 = v42:GetChildren();
            end;

            if v42 ~= nil and #v42 ~= 0 then
                for _, v in v42 do
                    v.Parent = u29;
                    u20:GiveTask(EffectUtil:enableInstanceEffect(v));
                end;
            end;

            local v43 = crateModel:GetPrimaryPartCFrame();
            local v44 = CFrame.Angles(-0.5235987755982988, 0, 0.7853981633974483);
            local u45 = (v43 + Vector3.new(0, 5, 0)) * v44;
            u29.CFrame = u45;
            u29.Anchored = true;
            local effects = crateModel:FindFirstChild("effects");

            if effects ~= nil then
                effects = effects:FindFirstChild(id);
            end;

            local v46, v47;

            if effects then
                u20:GiveTask(EffectUtil:enableInstanceEffect(effects));
                v46 = false;
                v47 = 0;
            else
                v46 = false;
                v47 = 0;
            end;

            while true do
                if v46 then
                    v47 = v47 + 1;
                else
                    v46 = true;
                end;

                if v47 >= 1 then
                    if effects then
                        for _, descendant in effects:GetDescendants() do
                            if descendant:IsA("Beam") then
                                if not descendant.Attachment0 then
                                    descendant.Attachment0 = u29:FindFirstChild("A1.1");
                                end;

                                if not descendant.Attachment1 then
                                    descendant.Attachment1 = u29:FindFirstChild("A1.1");
                                end;
                            end;
                        end;
                    end;

                    local u48 = 0;
                    u20:GiveTask(RunService.Heartbeat:Connect(function(p49) -- Line: 524
                        -- upvalues: u48 (ref), u29 (ref), u45 (copy)
                        u48 = u48 + p49;
                        local v50 = math.sin(u48 * 3.141592653589793 / 2) * 0.75;
                        u29.CFrame = u45 + Vector3.new(0, v50, 0);
                    end));

                    return;
                end;

                task.delay(v47 * 0.4, function() -- Line: 445
                    -- upvalues: crateModel (ref), id (copy), u20 (ref), EffectUtil (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                    local effects2 = crateModel:FindFirstChild("effects");

                    if effects2 ~= nil then
                        effects2 = effects2:FindFirstChild("firework");

                        if effects2 ~= nil then
                            effects2 = effects2:FindFirstChild(id);
                        end;
                    end;

                    if not effects2 then
                        return nil;
                    end;

                    local u51 = effects2:Clone();
                    u51.Name = "PlayingEffect";
                    u51.Parent = effects2.Parent;
                    u20:GiveTask(u51);
                    task.delay(3, function() -- Line: 462
                        -- upvalues: u51 (copy)
                        u51:Destroy();
                    end);
                    EffectUtil:playInstanceEffects({ u51 });
                    local u52 = {};

                    for _, descendant in u51:GetDescendants() do
                        if descendant:IsA("ParticleEmitter") then
                            table.insert(u52, descendant);
                        end;
                    end;

                    task.delay(0.15, function() -- Line: 473
                        -- upvalues: u52 (copy)
                        local function v60(u53) -- Line: 474
                            u53.TimeScale = 0.05;
                            local Color = u53.Color;
                            local u54 = {};
                            local Keypoints = Color.Keypoints;

                            local function v59(p55) -- Line: 479
                                -- upvalues: u54 (copy)
                                local v56 = { p55.Value:ToHSV() };
                                local v57 = Color3.fromHSV(v56[1], v56[2] / 1.5, 1 - (1 - v56[3]) / 1.5);
                                local v58 = ColorSequenceKeypoint.new(p55.Time, v57);
                                table.insert(u54, v58);
                            end;

                            for i, v in Keypoints do
                                v59(v, i - 1, Keypoints);
                            end;

                            u53.Color = ColorSequence.new(u54);
                            task.delay(0.18, function() -- Line: 489
                                -- upvalues: u53 (copy), Color (copy)
                                u53.Color = Color;
                                u53.TimeScale = 1;
                            end);
                        end;

                        for i, v in u52 do
                            v60(v, i - 1, u52);
                        end;
                    end);
                    task.delay(0.4, function() -- Line: 498
                        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), crateModel (ref)
                        SoundManager:playSound(RandomUtil.fromList(GameSound.FIREWORK_CRACKLE_1, GameSound.FIREWORK_CRACKLE_2, GameSound.FIREWORK_CRACKLE_3), {
                            volumeMultiplier = 0.5,
                            rollOffMinDistance = 30,
                            rollOffMaxDistance = 45,
                            position = crateModel:GetPivot().Position
                        });
                    end);
                end);
            end;
        end));
    end);
end;

function u6.cleanupCrate(p61, p62) -- Line: 533
    local v63 = p61.crateMaids[p62];

    if v63 ~= nil then
        v63:DoCleaning();
    end;
end;

Reflect.defineMetadata(u6, "identifier", "client/controllers/global/reward-crate/crate-controller@CrateController");
Reflect.defineMetadata(u6, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u6, "$:flamework@Controller", Controller, { {} });

return {
    CrateController = u6
};