-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "angel-wings", "angel-wings-types");
local AngelWingsColors = v6.AngelWingsColors;
local AngelWingsTypes = v6.AngelWingsTypes;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = { GameSound.XUROT_FLAP_WING_1, GameSound.XUROT_FLAP_WING_2 };
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "AngelWingsBackpackController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 38
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p10);
    p10.Name = "AngelWingsBackpackController";
    p10.playerMaid = {};
    p10.hasAngelWings = false;
end;

function u8.KnitStart(u11) -- Line: 48
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), u7 (copy), WatchPlayer (copy), default (copy), LobbyGadgetType (copy), Players (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u11);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.ANGEL_WINGS, {
        animations = { AnimationType.ANGEL_WINGS_PLAYER_FLY, AnimationType.ANGEL_WINGS_PLAYER_IDLE, AnimationType.ANGEL_WINGS_WINGS_IDLE },
        sounds = u7
    });
    WatchPlayer(function(u12, p13) -- Line: 54
        -- upvalues: u11 (copy), default (ref), LobbyGadgetType (ref), Players (ref), ItemType (ref), ClientSyncEvents (ref)
        local function _(p14) -- Line: 55
            -- upvalues: u11 (ref), default (ref)
            if p14 and u11.hasAngelWings then
                return nil;
            end;

            if not (p14 or u11.hasAngelWings) then
                return nil;
            end;

            u11.hasAngelWings = p14;
            default.Client:Get("RequestAngelWingsEffect"):SendToServer(p14);
        end;

        if u12:GetAttribute("LobbyGadgetType") == LobbyGadgetType.ANGEL_WINGS then
            local v15 = default.Client:Get("RequestAngelWingsEffectType"):CallServer(u12);

            if not u11.hasAngelWings then
                u11.hasAngelWings = true;
                default.Client:Get("RequestAngelWingsEffect"):SendToServer(true);
            end;

            u11:equip(u12, v15);
        end;

        if u12 == Players.LocalPlayer then
            p13:GiveTask(u12:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 73
                -- upvalues: u12 (copy), ItemType (ref), u11 (ref), default (ref)
                if u12:GetAttribute("LobbyGadgetType") ~= ItemType.ANGEL_WINGS then
                    if not u11.hasAngelWings then
                        return;
                    end;

                    u11.hasAngelWings = false;
                    default.Client:Get("RequestAngelWingsEffect"):SendToServer(false);
                end;
            end));
            ClientSyncEvents.BackpackEquipEvent:connect(function(u16) -- Line: 78
                -- upvalues: ItemType (ref), u11 (ref), default (ref)
                task.spawn(function() -- Line: 79
                    -- upvalues: u16 (copy), ItemType (ref), u11 (ref), default (ref)
                    local v17 = u16.item == ItemType.ANGEL_WINGS;

                    if v17 and u11.hasAngelWings then
                        return;
                    end;

                    if not (v17 or u11.hasAngelWings) then
                        return;
                    end;

                    u11.hasAngelWings = v17;
                    default.Client:Get("RequestAngelWingsEffect"):SendToServer(v17);
                end);
            end);
        end;
    end);
    default.Client:Get("AngelWingsEffect"):Connect(function(p18, p19, p20) -- Line: 85
        -- upvalues: u11 (copy)
        if not p19 then
            u11:unequip(p18);

            return;
        end;

        u11:unequip(p18);
        u11:equip(p18, p20);
    end);
end;

function u8.equip(u21, u22, p23) -- Line: 94
    u21:equipCharacter(u22.Character, p23):andThen(function(p24) -- Line: 95
        -- upvalues: u21 (copy), u22 (copy)
        u21.playerMaid[u22.UserId] = p24;
    end);
end;

function u8.equipCharacter(p25, u26, u27, u28) -- Line: 102
    -- upvalues: RuntimeLib (copy), ItemType (copy), AngelWingsColors (copy), u3 (copy), KnitClient2 (copy), u4 (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), u7 (copy), AnimationUtil (copy)
    return RuntimeLib.Promise.new(function(p29, p30) -- Line: 103
        -- upvalues: u26 (copy), ItemType (ref), AngelWingsColors (ref), u27 (copy), u3 (ref), u28 (copy), KnitClient2 (ref), u4 (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), RandomUtil (ref), u7 (ref), AnimationUtil (ref)
        local u31 = u26;

        if u31 ~= nil then
            u31 = u31:WaitForChild(ItemType.ANGEL_WINGS, 5);
        end;

        if not u31 then
            return nil;
        end;

        local u32 = AngelWingsColors[u27];

        local function _(p33) -- Line: 114
            -- upvalues: u32 (copy)
            if p33:IsA("BasePart") then
                p33.Color = u32.neonColor;

                return;
            end;

            if p33:IsA("Decal") then
                p33.Color3 = u32.wingsDecalColor;
            end;
        end;

        for i, descendant in u31:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Color = u32.neonColor;
            elseif descendant:IsA("Decal") then
                descendant.Color3 = u32.wingsDecalColor;
            end;
        end;

        local v34 = u3.new();
        local u35 = u26;

        if u35 ~= nil then
            u35 = u35:WaitForChild("Humanoid");
        end;

        local u36 = u26;

        if u36 ~= nil then
            u36 = u36.PrimaryPart;
        end;

        if not (u36 and u35) then
            return nil;
        end;

        if not u28 then
            KnitClient2.Controllers.FancyExplosionController:createExplosion({
                radius = 20,
                randomSizeOffset = 0,
                randomPositionOffset = 0,
                inDuration = 0.5,
                outDuration = 1,
                position = u36.Position,
                model = u32.ExplosionEffect
            });
        end;

        local v37 = u32.EffectModel:Clone();
        v37:PivotTo(u36.CFrame);
        v37.Parent = u36;
        u4("WeldConstraint", {
            Enabled = true,
            Part0 = v37.EffectPart,
            Part1 = u36,
            Parent = v37
        });
        v34:GiveTask(v37);
        local Animator = u31.Handle.rig.AnimationController.Animator;

        if not Animator then
            v34:DoCleaning();

            return nil;
        end;

        local v38 = GameAnimationUtil:playAnimation(Animator, AnimationType.ANGEL_WINGS_WINGS_IDLE, {
            looped = true
        });

        if v38 then
            v34:GiveTask(v38:GetMarkerReachedSignal("flap"):Connect(function(p39) -- Line: 168
                -- upvalues: SoundManager (ref), RandomUtil (ref), u7 (ref), u36 (copy), u31 (copy)
                SoundManager:playSound(RandomUtil.fromList(unpack(u7)), {
                    volumeMultiplier = 0.1,
                    rollOffMaxDistance = 10,
                    position = u36.Position,
                    parent = u31
                });
            end));
            v34:GiveTask(v38);
        end;

        local u40 = false;
        local u41 = nil;

        local function u47() -- Line: 180
            -- upvalues: u35 (copy), u40 (ref), u41 (ref), AnimationUtil (ref), u26 (ref), GameAnimationUtil (ref), AnimationType (ref)
            if u35.MoveDirection.Magnitude > 0 and (u35:GetState() == Enum.HumanoidStateType.Running or (u35:GetState() == Enum.HumanoidStateType.Freefall or u35:GetState() == Enum.HumanoidStateType.Jumping)) and not u40 then
                local v42 = u41;

                if v42 ~= nil then
                    v42:Stop();
                end;

                local v43 = u41;

                if v43 ~= nil then
                    v43:Destroy();
                end;

                u41 = AnimationUtil:playAnimation(u26, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_FLY));
                local v44 = u41;

                if v44 ~= nil then
                    v44:AdjustSpeed(2);
                end;

                u40 = true;
            end;

            if u35.MoveDirection.Magnitude == 0 and (u35:GetState() == Enum.HumanoidStateType.Running or (u35:GetState() == Enum.HumanoidStateType.Freefall or u35:GetState() == Enum.HumanoidStateType.Jumping)) then
                u40 = false;
                local v45 = u41;

                if v45 ~= nil then
                    v45:Stop();
                end;

                local v46 = u41;

                if v46 ~= nil then
                    v46:Destroy();
                end;

                u41 = AnimationUtil:playAnimation(u26, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_IDLE));
            end;
        end;

        u47();
        v34:GiveTask(u35:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 211
            -- upvalues: u47 (copy)
            u47();
        end));
        v34:GiveTask(function() -- Line: 214
            -- upvalues: u41 (ref)
            local v48 = u41;

            if v48 ~= nil then
                v48:Stop();
            end;

            local v49 = u41;

            if v49 ~= nil then
                v49:Destroy();
            end;
        end);
        p29(v34);
    end);
end;

function u8.unequip(p50, p51) -- Line: 227
    local v52 = p50.playerMaid[p51.UserId];

    if v52 ~= nil then
        v52:DoCleaning();
    end;
end;

function u8.getAngelWingType(p53) -- Line: 235
    -- upvalues: RunService (copy), KnitClient (copy), AngelWingsTypes (copy)
    if not RunService:IsStudio() and KnitClient.Controllers.PermissionController:isStaffMember() then
        return AngelWingsTypes.DARK;
    end;

    local v54 = KnitClient.Controllers.MilestonesController:getMilestoneRewardsClaimed();

    if v54 ~= nil then
        v54 = table.find(v54, "CyanAngelWings") ~= nil;
    end;

    if v54 then
        return AngelWingsTypes.CYAN;
    end;

    return AngelWingsTypes.LIGHT;
end;

KnitClient.CreateController(u8.new());

return nil;