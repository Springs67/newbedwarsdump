-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local u8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local Indicator = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "items", "metal-detector", "indicator").Indicator;
local v9 = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v9.InteractionCategory;
local InteractionPriority = v9.InteractionPriority;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "MurdererHiddenWoolController";
    end,

    __index = HandKnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 43
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 47
    -- upvalues: HandKnitController (copy), GameSound (copy)
    HandKnitController.constructor(p12);
    p12.registered = false;
    p12.sheepSound = {
        GameSound.MURDER_GAME_SHEEP_1,
        GameSound.MURDER_GAME_SHEEP_2,
        GameSound.MURDER_GAME_SHEEP_3,
        GameSound.MURDER_GAME_SHEEP_4
    };
    p12.Name = "MurdererHiddenWoolController";
    p12.sheepMap = {};
    p12.usingShear = false;
end;

function u10.KnitStart(u13) -- Line: 55
    -- upvalues: HandKnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), u5 (copy), GameAnimationUtil (copy), AnimationType (copy), CollectionService (copy)
    HandKnitController.KnitStart(u13);
    default.Client:Get("SpawnHiddenWool"):Connect(function(p14) -- Line: 57
        -- upvalues: ReplicatedStorage (ref), u13 (copy), Workspace (ref), u5 (ref), GameAnimationUtil (ref), AnimationType (ref), CollectionService (ref)
        local v15 = ReplicatedStorage.Assets.Effects.WoolSheep:Clone();

        if v15 then
            local PrimaryPart = v15.PrimaryPart;

            if not PrimaryPart then
                return nil;
            end;

            u13.sheepMap[p14.secret] = v15;
            v15:SetAttribute("Secret", p14.secret);
            p14.position = p14.position - Vector3.new(0, 0.5, 0);
            v15.PrimaryPart.CFrame = CFrame.new(p14.position);
            v15.Parent = Workspace;
            u5("BodyForce", {
                Name = "AntiGravity",
                Force = Vector3.new(0, PrimaryPart.AssemblyMass * Workspace.Gravity, 0),
                Parent = PrimaryPart
            });
            GameAnimationUtil:playAnimation(v15, AnimationType.SHEEP_IDLE, {
                looped = true
            });
            u13:wander(v15);

            if u13.usingShear then
                CollectionService:AddTag(v15.PrimaryPart, "WoolSheep");
            end;
        end;
    end);
    default.Client:Get("DeleteWoolEvent"):Connect(function(p16) -- Line: 88
        -- upvalues: u13 (copy)
        local u17 = u13.sheepMap[p16.secret];
        u13.sheepMap[p16.secret] = nil;
        task.delay(0.3, function() -- Line: 95
            -- upvalues: u17 (copy), u13 (ref)
            if u17 then
                u13:sheepAnimation(u17);
            end;
        end);
    end);
end;

function u10.isRelevantItem(p18, p19) -- Line: 102
    -- upvalues: ItemType (copy)
    return p19.itemType == ItemType.WOOL_SHEAR;
end;

function u10.onEnable(u20, p21, p22) -- Line: 105
    -- upvalues: u4 (copy), u6 (copy), u8 (copy), Indicator (copy), Players (copy), RunService (copy), EntityUtil (copy), Workspace (copy), InQuad (copy), CollectionService (copy)
    u20.usingShear = true;

    if not u20.registered then
        u20:initSheepPrompt();
        u20.registered = true;
    end;

    u20:enableSheepPrompt();
    u20.maid = u4.new();
    u20:highlightSheep();
    local v23, u24 = u6.createBinding(UDim2.fromScale(0.5, 0.5));
    local v25, u26 = u6.createBinding(0);
    local u27 = u8.new();
    local u28 = u6.createRef();
    u20.maid:GiveTask(u27);
    local u29 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true
    }, { u6.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            [u6.Ref] = u28
        }), u6.createElement(Indicator, {
            position = v23,
            rotation = v25,
            activatedSignal = u27
        }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
    u20.maid:GiveTask(function() -- Line: 135
        -- upvalues: u6 (ref), u29 (copy)
        u6.unmount(u29);
    end);
    u20.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 139
        -- upvalues: EntityUtil (ref), u20 (copy), Workspace (ref), u28 (copy), u24 (copy), u26 (copy), InQuad (ref), u27 (copy), CollectionService (ref)
        local v30 = EntityUtil:getLocalPlayerEntity();
        local v31;

        if v30 == nil then
            v31 = v30;
        else
            v31 = v30:getInstance():GetPrimaryPartCFrame().Position;
        end;

        if v30 == nil or v31 == nil then
            return nil;
        end;

        if u20.lastTrackedHiddenMetal then
            if u20.lastTrackedHiddenMetal.model:IsDescendantOf(Workspace) == false then
                u20.lastTrackedHiddenMetal = nil;

                return nil;
            end;

            local PrimaryPart = u20.lastTrackedHiddenMetal.model.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            if not PrimaryPart then
                return nil;
            end;

            local Magnitude = (PrimaryPart - v31).Magnitude;
            local v32 = u28:getValue();
            local AbsolutePosition = v32.AbsolutePosition;
            local AbsoluteSize = v32.AbsoluteSize;
            local v33 = Workspace.CurrentCamera:WorldToViewportPoint(PrimaryPart);
            local v34 = Vector2.new(v33.X, v33.Y);

            if v33.Z < 0 then
                v34 = AbsoluteSize + AbsolutePosition - v34 + AbsolutePosition;
            end;

            local v35 = v34 - AbsolutePosition;
            local v36 = math.atan2(v35.Y, v35.X);
            local v37 = AbsolutePosition + Vector2.new(math.cos(v36) * 80, math.sin(v36) * 80);
            u24(UDim2.fromOffset(v37.X, v37.Y));
            u26((math.deg(v36)));

            if u20.lastTrackedHiddenMetal.nextBeep < time() then
                local v38 = {};

                for i, v in u20.lastTrackedHiddenMetal do
                    v38[i] = v;
                end;

                v38.nextBeep = time() + InQuad(200 - Magnitude, 4, 3, 200);
                u20.lastTrackedHiddenMetal = v38;
                u27:Fire(InQuad(200 - Magnitude, 4, 3, 200));

                if Magnitude > 200 then
                    u20.lastTrackedHiddenMetal = nil;
                end;
            end;
        else
            local v39 = 200;
            local v40 = nil;

            for _, v in CollectionService:GetTagged("WoolSheep") do
                local Parent = v.Parent;
                local Magnitude = (Parent:GetPrimaryPartCFrame().Position - v31).Magnitude;

                if Magnitude < v39 then
                    v40 = Parent;
                    v39 = Magnitude;
                end;
            end;

            if v40 then
                u20.lastTrackedHiddenMetal = {
                    model = v40,
                    nextBeep = time() + 2,
                    nextRevealLocation = time() + 2
                };
            end;
        end;
    end));
end;

function u10.onDisable(p41) -- Line: 216
    p41.usingShear = false;
    p41:disableSheepPrompt();

    if p41.maid then
        p41.maid:DoCleaning();
        p41.maid = nil;
    end;
end;

function u10.getWool(p42, p43) -- Line: 224
    -- upvalues: default (copy)
    local v44 = p43:GetAttribute("Secret");

    return default.Client:Get("GetWool"):CallServer({
        secret = v44
    });
end;

function u10.sheepAnimation(p45, u46) -- Line: 230
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    GameAnimationUtil:playAnimation(u46, AnimationType.SHEEP_JUMP);
    task.delay(0.5, function() -- Line: 232
        -- upvalues: u46 (copy)
        u46:Destroy();
    end);
end;

function u10.initSheepPrompt(u47) -- Line: 236
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Shear",
        interactionObjectText = "Get Wool",
        interactionTag = "WoolSheep",
        maxActivationDistance = 5,
        holdDuration = 3,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.OTHER,
        category = InteractionCategory.OTHER,

        onInteracted = function(p48, p49, p50) -- Line: 247, Name: onInteracted
            -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), EntityUtil (ref), u47 (copy), SoundManager (ref), GameSound (ref)
            if p48 == Players.LocalPlayer then
                GameAnimationUtil:playAnimation(p48, AnimationType.PUNCH);
                local v51 = EntityUtil:getEntity(p48);

                if v51 ~= nil then
                    v51 = v51:isAlive();
                end;

                if not v51 then
                    return nil;
                end;

                local v52 = u47:getWool(p49.Parent);
                p50:Destroy();

                if v52 then
                    SoundManager:playSound(GameSound.WOOL_BREAK);
                end;
            end;
        end
    });
end;

function u10.enableSheepPrompt(p53) -- Line: 269
    -- upvalues: CollectionService (copy)
    for i, v in p53.sheepMap do
        CollectionService:AddTag(({ i, v })[2].PrimaryPart, "WoolSheep");
    end;
end;

function u10.disableSheepPrompt(p54) -- Line: 275
    -- upvalues: KnitClient2 (copy)
    for i, v in p54.sheepMap do
        KnitClient2.Controllers.InteractionRegistryController:removePrompt(({ i, v })[2].PrimaryPart, "WoolSheep");
    end;
end;

function u10.wander(p55, u56) -- Line: 281
    -- upvalues: RunService (copy), GameAnimationUtil (copy), AnimationType (copy), RandomUtil (copy)
    local Position = u56.PrimaryPart.Position;
    local u57 = {
        Position,
        Position + Vector3.new(2, 0, 0),
        Position + Vector3.new(2, 0, 2),
        Position + Vector3.new(2, 0, -2),
        Position + Vector3.new(0, 0, 2),
        Position + Vector3.new(-2, 0, 2),
        Position + Vector3.new(-2, 0, -2),
        Position + Vector3.new(0, 0, -2),
        Position + Vector3.new(-2, 0, 0)
    };
    local u58 = 0;
    local u59 = Position;
    local u60 = nil;
    local u61 = false;
    local u62 = nil;
    u62 = RunService.Heartbeat:Connect(function(p63) -- Line: 304
        -- upvalues: u56 (copy), u62 (ref), Position (copy), u59 (ref), u61 (ref), u58 (ref), GameAnimationUtil (ref), AnimationType (ref), RandomUtil (ref), u57 (copy), u60 (ref)
        if not u56.PrimaryPart then
            u62:Disconnect();

            return nil;
        end;

        local Position2 = u56.PrimaryPart.Position;

        if (Position2 - Position).Magnitude > 20 then
            u62:Disconnect();
        end;

        if (Position2 - u59).Magnitude == 0 then
            if not u61 then
                u58 = 0;
                u61 = true;
                GameAnimationUtil:playAnimation(u56, AnimationType.SHEEP_IDLE, {
                    looped = true
                });

                return nil;
            end;

            if u58 < 4 then
                u58 = u58 + p63;

                return nil;
            end;

            u61 = false;
            u59 = RandomUtil.fromList(unpack(u57));

            if Position2 == u59 then
                return nil;
            end;

            GameAnimationUtil:playAnimation(u56, AnimationType.SHEEP_WALK, {
                looped = true
            });
            u56.PrimaryPart.CFrame = CFrame.new(Position2, u59);
            u60 = (u59 - Position2).Unit;
        end;

        if not u60 then
            return nil;
        end;

        local v64 = Position2 + u60 * p63;

        if (v64 - Position2).Magnitude > (u59 - Position2).Magnitude then
            v64 = u59;
        end;

        u56.PrimaryPart.Position = v64;
    end);
end;

function u10.highlightSheep(u65) -- Line: 352
    -- upvalues: u3 (copy), u5 (copy)
    local v66 = u3.values(u65.sheepMap);

    local function v69(p67) -- Line: 354
        -- upvalues: u5 (ref), u65 (copy)
        local v68 = u5("Highlight", {
            Enabled = true,
            FillTransparency = 1,
            OutlineTransparency = 0,
            DepthMode = Enum.HighlightDepthMode.Occluded,
            FillColor = Color3.fromRGB(0, 255, 238),
            OutlineColor = Color3.fromRGB(255, 255, 255),
            Parent = p67
        });
        local maid = u65.maid;

        if maid ~= nil then
            maid:GiveTask(v68);
        end;
    end;

    for i, v in v66 do
        v69(v, i - 1, v66);
    end;
end;

KnitClient.CreateController(u10.new());

return nil;