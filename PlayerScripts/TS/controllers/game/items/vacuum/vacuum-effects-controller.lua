-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "VacuumEffectsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "VacuumEffectsController";
    p6.fullBagPlayers = {};
end;

function u4.KnitStart(u7) -- Line: 39
    -- upvalues: KnitController (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), u2 (copy), ItemType (copy), SoundManager (copy), GameSound (copy), Players (copy), TweenService (copy), InventoryUtil (copy)
    KnitController.KnitStart(u7);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.VACUUM_SUCK), GameAnimationUtil:getAssetId(AnimationType.VACUUM_GHOST_CAPTURED), GameAnimationUtil:getAssetId(AnimationType.VACUUM_LAUNCH) }, function(p8, p9) -- Line: 43
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), GameAnimationUtil (ref), AnimationType (ref), u2 (ref), ItemType (ref), SoundManager (ref), GameSound (ref), Players (ref), TweenService (ref), InventoryUtil (ref), u7 (copy)
        local Character = p8.Character;

        if not Character then
            return nil;
        end;

        local v10 = EntityUtil:getEntity(p8);

        if not (v10 and RuntimeLib.instanceof(v10, PlayerEntity)) then
            return nil;
        end;

        local Animation = p9.Animation;

        if Animation ~= nil then
            Animation = Animation.AnimationId;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.VACUUM_SUCK) then
            local u11 = u2.new();
            local v12 = v10:getHandItemInstanceFromCharacter();
            local v13;

            if v12 then
                local v14;

                if v12 == nil then
                    v14 = v12;
                else
                    v14 = v12.Name;
                end;

                v13 = v14 == ItemType.VACUUM;
            else
                v13 = v12;
            end;

            if v13 then
                local GHOST_VACUUM_SUCKING_LOOP = GameSound.GHOST_VACUUM_SUCKING_LOOP;
                local v15 = {};
                local v16;

                if p8 == Players.LocalPlayer then
                    v16 = nil;
                else
                    v16 = Character:GetPivot().Position;
                end;

                v15.position = v16;
                u11:GiveTask((SoundManager:playSound(GHOST_VACUUM_SUCKING_LOOP, v15)));
                local v17 = v12:GetDescendants();

                local function v19(u18) -- Line: 75
                    -- upvalues: TweenService (ref), u11 (copy)
                    if u18:IsA("ParticleEmitter") then
                        u18.TimeScale = 0.35;
                        TweenService:Create(u18, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            TimeScale = 1
                        });
                        u18.Enabled = true;
                        u11:GiveTask(function() -- Line: 82
                            -- upvalues: u18 (copy)
                            u18.Enabled = false;
                        end);
                    end;
                end;

                for i, v in v17 do
                    v19(v, i - 1, v17);
                end;

                p9.Destroying:Connect(function() -- Line: 90
                    -- upvalues: u11 (copy)
                    u11:Destroy();
                end);
            end;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.VACUUM_GHOST_CAPTURED) then
            local GHOST_VACUUM_CATCH = GameSound.GHOST_VACUUM_CATCH;
            local v20 = {};
            local v21;

            if p8 == Players.LocalPlayer then
                v21 = nil;
            else
                v21 = Character:GetPrimaryPartCFrame().Position;
            end;

            v20.position = v21;
            SoundManager:playSound(GHOST_VACUUM_CATCH, v20);
            local hand = InventoryUtil.getInventory(p8).hand;
            local v22;

            if hand == nil then
                v22 = hand;
            else
                v22 = hand.tool;
            end;

            if v22 then
                v22 = hand.itemType == ItemType.VACUUM;
            end;

            if v22 then
                local tool = hand.tool;
                tool.Handle.Empty.Transparency = 1;
                tool.Handle.Full.Transparency = 0;
                u7.fullBagPlayers[p8.UserId] = true;
            end;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.VACUUM_LAUNCH) then
            local hand = InventoryUtil.getInventory(p8).hand;
            local v23;

            if hand == nil then
                v23 = hand;
            else
                v23 = hand.tool;
            end;

            if v23 then
                v23 = hand.itemType == ItemType.VACUUM;
            end;

            if v23 then
                local tool = hand.tool;
                tool.Handle.Empty.Transparency = 0;
                tool.Handle.Full.Transparency = 1;
                u7.fullBagPlayers[p8.UserId] = nil;
            end;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;