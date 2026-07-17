-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u5 = { GameSound.CAN_OF_BEANS_FART_1, GameSound.CAN_OF_BEANS_FART_2, GameSound.CAN_OF_BEANS_FART_3 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "CanOfBeansController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 30
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "CanOfBeansController";
end;

function u6.KnitStart(u9) -- Line: 38
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), u5 (copy), ClientSyncEvents (copy), Players (copy), Workspace (copy), default (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.CONDIMENT_GUN, {
        sounds = u5
    });
    ClientSyncEvents.ItemConsumed:connect(function(p10) -- Line: 43
        -- upvalues: ItemType (ref), Players (ref), u9 (copy), Workspace (ref), default (ref)
        if p10.itemType ~= ItemType.CAN_OF_BEANS then
            return nil;
        end;

        local v11 = Players:GetPlayerFromCharacter(p10.entity:getInstance());

        if not v11 then
            return nil;
        end;

        u9:playFartEffect(v11);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector.Unit;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local v12;

        if Character == nil then
            v12 = Character;
        else
            v12 = Character.AssemblyMass;
        end;

        if v12 == 0 or (v12 ~= v12 or not v12) then
            return nil;
        end;

        if not default.Client:Get("CanOfBeansLaunch"):CallServer({
            lookVector = CurrentCamera
        }) then
            return nil;
        end;

        Character:ApplyImpulse(Vector3.new(CurrentCamera.X, 0.5, CurrentCamera.Z) * (v12 * 125));
    end);
end;

function u6.playFartEffect(p13, p14) -- Line: 89
    -- upvalues: u2 (copy), Workspace (copy), u3 (copy), BedwarsImageId (copy), PlaceUtil (copy), RandomUtil (copy), u5 (copy), SoundManager (copy)
    local u15 = u2.new();
    local v16 = {
        Size = Vector3.new(4, 4, 4),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        Shape = Enum.PartType.Ball
    };
    local Character = p14.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    v16.Position = Character;
    v16.Parent = Workspace;
    local v17 = u3("Part", v16);
    u15:GiveTask(v17);
    local v18 = u3("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        Lifetime = NumberRange.new(5, 10),
        SpreadAngle = Vector2.new(180, 180),
        Speed = NumberRange.new(1, 2),
        Parent = v17
    });
    local v19 = u3("Attachment", {
        Position = Vector3.new(0, -1, 0),
        Orientation = Vector3.new(90, 0, 0),
        Parent = v17
    });
    local v20 = u3("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        Lifetime = NumberRange.new(3, 6),
        SpreadAngle = Vector2.new(10, 180),
        Speed = NumberRange.new(3, 7),
        Parent = v19
    });
    local v21 = PlaceUtil.isLobbyServer() and 20 or 100;
    v18:Emit(v21);
    v20:Emit(v21);
    local v22 = RandomUtil.fromList(unpack(u5));
    local v23 = {};
    local Character2 = p14.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    v23.position = Character2;
    local Character3 = p14.Character;

    if Character3 ~= nil then
        Character3 = Character3.PrimaryPart;
    end;

    v23.parent = Character3;
    local v24 = SoundManager:playSound(v22, v23);

    if v24 then
        u15:GiveTask(v24);
    end;

    local v25 = PlaceUtil.isLobbyServer() and 4 or 10;
    task.delay(v25, function() -- Line: 170
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;