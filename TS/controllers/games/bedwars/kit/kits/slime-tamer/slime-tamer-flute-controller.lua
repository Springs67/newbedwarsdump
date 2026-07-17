-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util");
local SlimeMeta = v7.SlimeMeta;
local SlimeState = v7.SlimeState;
local SlimeType = v7.SlimeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local SlimeTamerSidebar = RuntimeLib.import(script, script.Parent, "ui", "slime-tamer-sidebar").SlimeTamerSidebar;
local SlimeTamerTarget = RuntimeLib.import(script, script.Parent, "ui", "slime-tamer-target").SlimeTamerTarget;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "SlimeTamerFluteController";
    end,

    __index = HandKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 45
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 49
    -- upvalues: HandKnitController (copy), u4 (copy)
    HandKnitController.constructor(p10);
    p10.Name = "SlimeTamerFluteController";
    p10.maid = u4.new();
    p10.selectedSlimeType = 0;
    p10.tamedSlimes = {};
    p10.tamedSlimeData = {};
    p10.validSlimeSelected = false;
    p10.awaySlimeSelected = false;
end;

function u8.KnitStart(p11) -- Line: 59
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), BedwarsImageId (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), GameAnimationUtil (copy), SoundManager (copy)
    HandKnitController.KnitStart(p11);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.SLIME_TAMER_FLUTE, {
        animations = { AnimationType.SLIME_TAMER_FLUTE_USE, AnimationType.SLIME_TAMER_FLUTE_USE_FP },
        sounds = {
            GameSound.SLIME_RECALL,
            GameSound.SLIME_DIRECT_3,
            GameSound.SLIME_DIRECT_2,
            GameSound.SLIME_DIRECT_1,
            GameSound.SLIME_DIRECT_4
        },
        imageIds = { BedwarsImageId.SLIME_CYCLE, BedwarsImageId.SLIME_DIRECT }
    });
    ClientSyncEvents.AbilityUsed:connect(function(p12) -- Line: 70
        -- upvalues: AbilityId (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        if p12.ability ~= AbilityId.SLIME_DIRECT then
            return nil;
        end;

        local v13 = Players:GetPlayerFromCharacter(p12.userCharacter);

        if not v13 then
            return nil;
        end;

        if v13 == Players.LocalPlayer then
            return nil;
        end;

        GameAnimationUtil:playAnimation(v13, AnimationType.SLIME_TAMER_FLUTE_USE);
        SoundManager:playSound(GameSound.COIN_COLLECT, {
            position = p12.userCharacter:GetPivot().Position
        });
    end);
end;

function u8.isRelevantItem(p14, p15) -- Line: 87
    -- upvalues: ItemType (copy)
    return p15.itemType == ItemType.SLIME_TAMER_FLUTE;
end;

function u8.onEnable(u16, p17, p18) -- Line: 90
    -- upvalues: KnitClient (copy), Players (copy), u5 (copy), SlimeTamerSidebar (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), AbilityState (copy), CollectionService (copy), ClientSyncEvents (copy), EntityUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient2 (copy), RunService (copy), Workspace (copy), GameWorldUtil (copy), SlimeTamerTarget (copy)
    u16:setupYield(function() -- Line: 91
        -- upvalues: u16 (copy), KnitClient (ref), Players (ref), u5 (ref), SlimeTamerSidebar (ref), Flamework (ref), AbilityId (ref), BedwarsImageId (ref), AbilityState (ref), CollectionService (ref), ClientSyncEvents (ref), EntityUtil (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref)
        u16.tamedSlimes = KnitClient.Controllers.SlimeTamerController:getTamedSlimeTypes(Players.LocalPlayer.UserId);
        u16.tamedSlimeData = KnitClient.Controllers.SlimeTamerController:getTamedSlimeData(Players.LocalPlayer.UserId);
        u16:updateSlimeSelection();
        local u19 = u5.mount(u5.createElement(SlimeTamerSidebar, {
            tamedSlimes = u16.tamedSlimes,
            selectedSlimeType = u16.selectedSlimeType,
            tamedSlimeData = u16.tamedSlimeData
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u16.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SLIME_CYCLE, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.SLIME_CYCLE,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(89, 148, 48)
                }
            }
        }):expect());
        u16.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SLIME_DIRECT, {
            abilityType = "ItemSecondary",
            abilityButton = {
                icon = BedwarsImageId.SLIME_DIRECT,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(89, 148, 48)
                }
            }
        }):expect());
        u16.maid:GiveTask(CollectionService:GetInstanceAddedSignal("SlimeData"):Connect(function(p20) -- Line: 121
            -- upvalues: Players (ref), u16 (ref), KnitClient (ref), u5 (ref), u19 (copy), SlimeTamerSidebar (ref)
            if p20:WaitForChild("Tamer").Value ~= Players.LocalPlayer.UserId then
                return nil;
            end;

            u16.tamedSlimes = KnitClient.Controllers.SlimeTamerController:getTamedSlimeTypes(Players.LocalPlayer.UserId);
            u16.tamedSlimeData = KnitClient.Controllers.SlimeTamerController:getTamedSlimeData(Players.LocalPlayer.UserId);
            u5.update(u19, u5.createElement(SlimeTamerSidebar, {
                tamedSlimes = u16.tamedSlimes,
                selectedSlimeType = u16.selectedSlimeType,
                tamedSlimeData = u16.tamedSlimeData
            }));
            u16:updateSlimeSelection();
        end));
        u16.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p21) -- Line: 136
            -- upvalues: AbilityId (ref), Players (ref), u16 (ref), KnitClient (ref), u5 (ref), u19 (copy), SlimeTamerSidebar (ref)
            if p21.ability ~= AbilityId.SLIME_CYCLE then
                return nil;
            end;

            if p21.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u16.tamedSlimes = KnitClient.Controllers.SlimeTamerController:getTamedSlimeTypes(Players.LocalPlayer.UserId);
            u16.tamedSlimeData = KnitClient.Controllers.SlimeTamerController:getTamedSlimeData(Players.LocalPlayer.UserId);
            u16:cycleSlimes();
            u5.update(u19, u5.createElement(SlimeTamerSidebar, {
                tamedSlimes = u16.tamedSlimes,
                selectedSlimeType = u16.selectedSlimeType,
                tamedSlimeData = u16.tamedSlimeData
            }));
            u16:updateSlimeSelection();
        end));
        u16.maid:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p22) -- Line: 154
            -- upvalues: AbilityId (ref), Players (ref), EntityUtil (ref)
            if p22.ability ~= AbilityId.SLIME_DIRECT and p22.ability ~= AbilityId.SLIME_CYCLE then
                return nil;
            end;

            if p22.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            local v23 = EntityUtil:getLocalPlayerEntity();

            if v23 ~= nil then
                v23 = v23:isDead();
            end;

            if v23 then
                return nil;
            end;
        end));
        u16.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p24) -- Line: 171
            -- upvalues: AbilityId (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref), u16 (ref)
            if p24.ability ~= AbilityId.SLIME_DIRECT then
                return nil;
            end;

            if p24.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            task.spawn(function() -- Line: 178
                -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), KnitClient2 (ref), u16 (ref)
                local u25 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SLIME_TAMER_FLUTE_USE);
                local u26 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.SLIME_TAMER_FLUTE_USE_FP);
                u16.maid:GiveTask(function() -- Line: 181
                    -- upvalues: u25 (copy), u26 (copy)
                    local v27 = u25;

                    if v27 ~= nil then
                        v27:Stop();
                    end;

                    local v28 = u25;

                    if v28 ~= nil then
                        v28:Destroy();
                    end;

                    local v29 = u26;

                    if v29 ~= nil then
                        v29:Stop();
                    end;

                    local v30 = u26;

                    if v30 ~= nil then
                        v30:Destroy();
                    end;
                end);
                u16:moveSlime();
                u16:updateSlimeSelection();
            end);
        end));

        return function() -- Line: 203
            -- upvalues: u5 (ref), u19 (copy)
            u5.unmount(u19);
        end;
    end);
    u16.maid:GiveTask(RunService.Heartbeat:Connect(function(p31) -- Line: 208
        -- upvalues: u16 (copy), Workspace (ref), EntityUtil (ref), Players (ref), KnitClient2 (ref), GameWorldUtil (ref), u5 (ref), SlimeTamerTarget (ref)
        if not u16.validSlimeSelected or u16.awaySlimeSelected then
            u16:removeTarget();

            return nil;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u16:removeTarget();

            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            u16:removeTarget();

            return nil;
        end;

        local u32 = Players.LocalPlayer:GetAttribute("Team");

        if u32 == 0 or (u32 ~= u32 or not u32) then
            return nil;
        end;

        if not KnitClient2.Controllers.TeamController:getTeamById((tostring(u32))) then
            return nil;
        end;

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

        local function _(p33) -- Line: 247
            -- upvalues: Players (ref), u32 (copy)
            local v34 = Players:GetPlayerFromCharacter(p33:getInstance());
            local v35 = v34 and not v34:HasTag("PlayerHidden");

            if v35 then
                if v34 == Players.LocalPlayer then
                    v35 = false;
                else
                    v35 = v34:GetAttribute("Team") == u32;
                end;
            end;

            return v35;
        end;

        local v36 = 0;
        local v37 = {};

        for i, v in GameWorldUtil.getEntitiesWithinRadius(Character, 75) do
            local _ = i - 1;
            local v38 = Players:GetPlayerFromCharacter(v:getInstance());
            local v39 = v38 and not v38:HasTag("PlayerHidden");

            if v39 then
                if v38 == Players.LocalPlayer then
                    v39 = false;
                else
                    v39 = v38:GetAttribute("Team") == u32;
                end;
            end;

            if v39 == true then
                v36 = v36 + 1;
                v37[v36] = v;
            end;
        end;

        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        table.sort(v37, function(p40, p41) -- Line: 265
            -- upvalues: Unit (copy)
            local Position = p40:getInstance():GetPivot().Position;
            local v42 = Unit:ClosestPoint(Position);
            local Magnitude = (Position - v42).Magnitude;
            local Magnitude2 = (Unit.Origin - v42).Magnitude;
            local Position2 = p41:getInstance():GetPivot().Position;
            local v43 = Unit:ClosestPoint(Position);

            return Magnitude + Magnitude2 / 3 < (Position2 - v43).Magnitude + (Unit.Origin - v43).Magnitude / 3;
        end);
        local v44 = nil;

        for _, v in v37 do
            local Position = v:getInstance():GetPivot().Position;

            if (Position - CurrentCamera.Position):Dot(CurrentCamera.LookVector) >= 0 then
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;

                    if Character2 ~= nil then
                        Character2 = Character2.Position;
                    end;
                end;

                if Character2 and (Position - Unit:ClosestPoint(Position)).Magnitude <= 75 then
                    v44 = v:getInstance();
                    break;
                end;
            end;
        end;

        if u16.targetEntity ~= v44 then
            u16:removeTarget();

            if v44 then
                u16.targetIcon = u5.mount(u5.createElement(SlimeTamerTarget), v44.PrimaryPart);
            end;
        end;

        u16.targetEntity = v44;
    end));
end;

function u8.onDisable(p45) -- Line: 321
    p45.maid:DoCleaning();
    p45:removeTarget();
end;

function u8.cycleSlimes(u46) -- Line: 325
    -- upvalues: u3 (copy), SlimeType (copy), KnitClient (copy), Players (copy), SoundManager (copy), SlimeMeta (copy)
    local selectedSlimeType = u46.selectedSlimeType;
    local u47 = selectedSlimeType == nil and 0 or selectedSlimeType;
    u46.selectedSlimeType = (u47 + 1) % #u3.values(SlimeType);
    task.spawn(function() -- Line: 332
        -- upvalues: KnitClient (ref), Players (ref), u46 (copy), SoundManager (ref), SlimeMeta (ref), u47 (copy)
        local v48 = KnitClient.Controllers.SlimeTamerController:getTamedSlimeTypes(Players.LocalPlayer.UserId);

        if table.find(v48, u46.selectedSlimeType) ~= nil then
            SoundManager:playSound(SlimeMeta[u47].alertSound, {
                position = nil,
                volumeMultiplier = 0.75
            });
        end;
    end);
end;

function u8.updateSlimeSelection(u49) -- Line: 343
    -- upvalues: KnitClient (copy), Players (copy)
    local v50 = KnitClient.Controllers.SlimeTamerController:getTamedSlimeTypes(Players.LocalPlayer.UserId);

    if table.find(v50, u49.selectedSlimeType) == nil then
        u49.validSlimeSelected = false;
        u49.awaySlimeSelected = false;

        return nil;
    end;

    u49.validSlimeSelected = true;

    local function _(p51) -- Line: 354
        -- upvalues: u49 (copy)
        return p51:GetAttribute("SlimeType") == u49.selectedSlimeType;
    end;

    local v52 = 0;
    local v53 = {};

    for i, v in KnitClient.Controllers.SlimeTamerController:getTamedSlimeData(Players.LocalPlayer.UserId) do
        local _ = i - 1;

        if v:GetAttribute("SlimeType") == u49.selectedSlimeType == true then
            v52 = v52 + 1;
            v53[v52] = v;
        end;
    end;

    local v54 = v53[1];

    if v54.Following.Value == v54.Tamer.Value then
        u49.awaySlimeSelected = false;

        return;
    end;

    u49.awaySlimeSelected = true;
end;

function u8.moveSlime(p55) -- Line: 374
    -- upvalues: Players (copy), KnitClient (copy), SlimeState (copy), SoundManager (copy), SlimeMeta (copy), default (copy), GameSound (copy)
    if not Players.LocalPlayer.Character then
        return nil;
    end;

    local targetEntity = p55.targetEntity;
    local selectedSlimeType = p55.selectedSlimeType;

    local function _(p56) -- Line: 381
        -- upvalues: selectedSlimeType (copy)
        return p56:GetAttribute("SlimeType") == selectedSlimeType;
    end;

    local v57 = 0;
    local v58 = {};

    for i, v in KnitClient.Controllers.SlimeTamerController:getTamedSlimeData(Players.LocalPlayer.UserId) do
        local _ = i - 1;

        if v:GetAttribute("SlimeType") == selectedSlimeType == true then
            v57 = v57 + 1;
            v58[v57] = v;
        end;
    end;

    if not v58 or #v58 == 0 then
        warn("Tamer does not own any slimes of this type " .. tostring(selectedSlimeType));

        return nil;
    end;

    local v59 = v58[1];

    if v59:GetAttribute("SlimeState") == SlimeState.CHANGING_PLAYER then
        warn("Slime is already changing players");

        return nil;
    end;

    if v59.Following.Value ~= v59.Tamer.Value then
        SoundManager:playSound(GameSound.SLIME_RECALL, {
            position = nil
        });
        default.Client:Get("RequestMoveSlime"):CallServer({
            slimeId = v59:GetAttribute("Id"),
            targetPlayerUserId = Players.LocalPlayer.UserId
        });

        return;
    end;

    local v60 = Players:GetPlayerFromCharacter(targetEntity);

    if not v60 then
        return nil;
    end;

    local UserId = v60.UserId;

    local function _(p61) -- Line: 411
        -- upvalues: selectedSlimeType (copy)
        return p61:GetAttribute("SlimeType") == selectedSlimeType;
    end;

    local v62 = nil;

    for i, v in KnitClient.Controllers.SlimeTamerController:getFollowingSlimeData(UserId) do
        local _ = i - 1;

        if v:GetAttribute("SlimeType") == selectedSlimeType == true then
            v62 = v;
            break;
        end;
    end;

    if v62 then
        warn("Player " .. tostring(v60) .. " already has a slime of this type following them");

        return nil;
    end;

    SoundManager:playSound(SlimeMeta[selectedSlimeType].directSound, {
        position = nil,
        volumeMultiplier = 0.75
    });
    default.Client:Get("RequestMoveSlime"):CallServer({
        slimeId = v59:GetAttribute("Id"),
        targetPlayerUserId = UserId
    });
end;

function u8.removeTarget(p63) -- Line: 448
    -- upvalues: u5 (copy)
    p63.targetEntity = nil;

    if p63.targetIcon then
        u5.unmount(p63.targetIcon);
    end;
end;

KnitClient.CreateController(u8.new());

return nil;