-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local DevourStatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "effects", "devour-status-effect-util").DevourStatusEffectUtil;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "DevourTastyController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 38
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 42
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p9);
    p9.Name = "DevourController";
    p9.maidMap = {};
    p9.speedMaid = u3.new();
end;

function u7.KnitStart(u10) -- Line: 48
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), StatusEffectUtil (copy), DevourStatusEffectUtil (copy), KnitClient (copy), u3 (copy), ReplicatedStorage (copy), u4 (copy), KnitClient2 (copy), default (copy), Players (copy), EntityUtil (copy), StatusEffectMeta (copy), CollectionService (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(u10);
    ClientSyncEvents.StatusEffectChanged:connect(function(p11) -- Line: 50
        -- upvalues: StatusEffectType (ref), StatusEffectUtil (ref), u10 (copy), DevourStatusEffectUtil (ref), KnitClient (ref)
        if p11.statusEffect ~= StatusEffectType.TASTY then
            return nil;
        end;

        local v12 = StatusEffectUtil:getActive(p11.entityInstance, p11.statusEffect);

        if not v12 then
            return nil;
        end;

        if v12.stacks <= 0 then
            return nil;
        end;

        local v13 = u10.maidMap[p11.entityInstance];

        if v13 ~= nil then
            v13 = v13.effectPart;
        end;

        if not v13 then
            return nil;
        end;

        local v14 = DevourStatusEffectUtil.DEVOUR_STATUS_STACKS_SCALING_FUNCTION(v12.stacks);
        local _ = v13.Trail;
        local Beam = v13.Beam;
        Beam.Enabled = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0;
        Beam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1 - v14 / DevourStatusEffectUtil.MAX_STACKS), NumberSequenceKeypoint.new(0.9, 0.5), NumberSequenceKeypoint.new(1, 1) });
        Beam.TextureSpeed = 0.25 * v14 / DevourStatusEffectUtil.MAX_STACKS;
        Beam:SetAttribute("FirstPersonVisible", false);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p15) -- Line: 83
        -- upvalues: StatusEffectType (ref), u10 (copy), u3 (ref), ReplicatedStorage (ref), u4 (ref)
        if p15.statusEffect ~= StatusEffectType.TASTY then
            return nil;
        end;

        local PrimaryPart = p15.entityInstance.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        if u10.maidMap[p15.entityInstance] ~= nil then
            return nil;
        end;

        local v16 = u3.new();
        local v17 = ReplicatedStorage.Assets.Effects.TastyStatusEffect:Clone();
        v17.CFrame = PrimaryPart.CFrame;
        v17.Parent = PrimaryPart;
        local v18 = u4("WeldConstraint", {
            Parent = v17,
            Part0 = PrimaryPart,
            Part1 = v17
        });
        v16:GiveTask(v17);
        v16:GiveTask(v18);
        u10.maidMap[p15.entityInstance] = {
            effectPart = v17,
            maid = v16
        };
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(u19) -- Line: 115
        -- upvalues: StatusEffectType (ref), u10 (copy), KnitClient2 (ref)
        if u19.statusEffect == StatusEffectType.DEVOURER_SPEED then
            u10.speedMaid:DoCleaning();

            return;
        end;

        if u19.statusEffect == StatusEffectType.TASTY then
            local u20 = u10.maidMap[u19.entityInstance];

            if not u20 then
                return nil;
            end;

            task.delay(1, function() -- Line: 125
                -- upvalues: u20 (copy), u10 (ref), u19 (copy)
                u20.maid:DoCleaning();
                u10.maidMap[u19.entityInstance] = nil;
            end);
            local v21 = u19.entityInstance:FindFirstChild("Devour Stacks");

            if v21 then
                v21:Destroy();
            end;

            KnitClient2.Controllers.InteractionRegistryController:removePrompt(u19.entityInstance, "Devour");
        end;
    end);
    default.Client:Get("DevourerSpeed"):Connect(function(p22) -- Line: 138
        -- upvalues: u10 (copy), KnitClient (ref)
        u10.speedMaid:DoCleaning();
        u10.speedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = p22.speedMultiplier
        }));
    end);
    default.Client:Get("DevourStacked"):Connect(function(p23) -- Line: 144
        -- upvalues: Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), StatusEffectMeta (ref), DevourStatusEffectUtil (ref), CollectionService (ref), u4 (ref)
        local v24 = Players:GetPlayerFromCharacter(p23.entity);

        if not v24 or v24 == Players.LocalPlayer then
            return nil;
        end;

        local v25 = EntityUtil:getLocalPlayerEntity();
        local v26 = EntityUtil:getEntity(p23.entity);

        if v25 and (v26 and not v25:canAttack(v26)) then
            return nil;
        end;

        local v27 = p23.entity:FindFirstChild("Devour Stacks");
        local v28 = StatusEffectUtil:getStacks(p23.entity, StatusEffectType.TASTY);
        local image = StatusEffectMeta[StatusEffectType.TASTY].image;

        if DevourStatusEffectUtil.SHOULD_DEVOUR(v28) then
            CollectionService:AddTag(p23.entity, "Devour");
            image = StatusEffectMeta[StatusEffectType.DEVOURER_SPEED].image;
        end;

        if v27 then
            local v29 = v27:FindFirstChildWhichIsA("ImageLabel");

            if v29 then
                v29.Image = image;
            end;
        else
            u4("BillboardGui", {
                Name = "Devour Stacks",
                AlwaysOnTop = true,
                MaxDistance = 100,
                StudsOffset = Vector3.new(-1.5, 7, 0),
                Parent = p23.entity,
                Adornee = p23.entity.Head,
                Size = UDim2.fromScale(1, 1),
                Children = { u4("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Image = image,
                        Size = UDim2.fromScale(3, 3),
                        ScaleType = Enum.ScaleType.Fit
                    }) }
            });
        end;
    end);
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Devour",
        interactionTag = "Devour",
        instantActivation = true,
        maxActivationDistance = 10,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p30, p31, p32) -- Line: 194, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), default (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
            if not p31:IsA("Model") then
                return nil;
            end;

            if not Players:GetPlayerFromCharacter(p31) then
                return nil;
            end;

            local v33 = EntityUtil:getEntity(p30);

            if v33 ~= nil then
                v33 = v33:getInstance();
            end;

            if v33 and StatusEffectUtil:isActive(v33, StatusEffectType.GROUNDED) then
                return nil;
            end;

            if v33 and StatusEffectUtil:isActive(v33, StatusEffectType.FROSTED) then
                return nil;
            end;

            if not default.Client:Get("DevourAction"):CallServer({
                devourer = Players.LocalPlayer,
                devouredEntity = p31
            }) then
                return nil;
            end;

            local v34 = p31:FindFirstChild("Devour Stacks");

            if v34 then
                v34:Destroy();
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            local PrimaryPart = p31.PrimaryPart;

            if Character and PrimaryPart then
                Character.CFrame = CFrame.lookAt(Character.Position, PrimaryPart.Position);
            end;

            AnimationUtil:playAnimation(p30, GameAnimationUtil:getAssetId(AnimationType.DEVOUR_ACTION));
        end
    });
    default.Client:Get("EntityDeathEvent"):Connect(function(p35) -- Line: 235
        -- upvalues: KnitClient2 (ref)
        local v36 = p35.entityInstance:FindFirstChild("Devour Stacks");

        if v36 then
            v36:Destroy();
        end;

        KnitClient2.Controllers.InteractionRegistryController:removePrompt(p35.entityInstance, "Devour");
    end);
end;

KnitClient.CreateController(u7.new());

return nil;