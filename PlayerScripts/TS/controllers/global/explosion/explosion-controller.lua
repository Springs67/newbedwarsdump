-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getExplosionMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-meta").getExplosionMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "ExplosionController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy)
    KnitController.constructor(p7);
    p7.Name = "ExplosionController";
    p7.explosionsFolder = u3("Folder", {
        Name = "Explosions",
        Parent = Workspace
    });
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: default (copy), ClientSyncEvents (copy), getExplosionMeta (copy), GameSound (copy), SoundManager (copy), u3 (copy), GameQueryUtil (copy), Debris (copy), GetTarmacAsset (copy)
    default.Client:WaitFor("ExplosionEffect"):andThen(function(p9) -- Line: 43
        -- upvalues: ClientSyncEvents (ref), getExplosionMeta (ref), GameSound (ref), SoundManager (ref), u3 (ref), u8 (copy), GameQueryUtil (ref), Debris (ref), GetTarmacAsset (ref)
        p9:Connect(function(p10, p11, p12, p13, p14, p15, p16) -- Line: 44
            -- upvalues: ClientSyncEvents (ref), getExplosionMeta (ref), GameSound (ref), SoundManager (ref), u3 (ref), u8 (ref), GameQueryUtil (ref), Debris (ref), GetTarmacAsset (ref)
            ClientSyncEvents.ExplosionEffect:fire(p10, p11, p15);
            local v17 = getExplosionMeta(p11);

            if not p13 then
                local explosionSound = v17.explosionSound;

                if explosionSound == nil then
                    explosionSound = GameSound.TNT_EXPLODE_1;
                end;

                if p16 ~= "" then
                    explosionSound = p16 or explosionSound;
                end;

                SoundManager:playSound(explosionSound, {
                    rollOffMaxDistance = 300,
                    position = p10
                });
            end;

            if not p14 then
                local v18 = u3("Part", {
                    Size = Vector3.new(1, 1, 1),
                    Anchored = true,
                    CanCollide = false,
                    Transparency = 1,
                    CFrame = CFrame.new(p10),
                    Parent = u8.explosionsFolder
                });
                GameQueryUtil:setQueryIgnored(v18, true);
                Debris:AddItem(v18, 3);
                local v19 = Random.new();
                local v20 = u3("ParticleEmitter", {
                    LightInfluence = 0.1,
                    Acceleration = Vector3.new(0, 4, 0),
                    Drag = 3.5,
                    Rate = 0,
                    Color = ColorSequence.new(v17.explosionParticleColor or Color3.new(0.92, 0.92, 0.92), v17.explosionParticleColor or Color3.new(1, 1, 1)),
                    Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }),
                    Transparency = NumberSequence.new(0, 1),
                    EmissionDirection = Enum.NormalId.Top,
                    Lifetime = NumberRange.new(3, 5),
                    Rotation = NumberRange.new(0, 360),
                    RotSpeed = NumberRange.new(50, 100),
                    Speed = NumberRange.new(17, 30),
                    SpreadAngle = Vector2.new(100, 100),
                    Parent = v18
                });
                local v21 = 25 * p12;
                local v22 = false;
                local v23 = 0;

                while true do
                    if true then
                        if v22 then
                            v23 = v23 + 1;
                        else
                            v22 = true;
                        end;
                    end;

                    if v23 >= v21 then
                        break;
                    end;

                    local v24 = v19:NextInteger(1, 6);
                    v20.Texture = GetTarmacAsset("Explode" .. tostring(v24)).Image;
                    v20:Emit(1);
                end;
            end;
        end);
    end);
end;

function u5.playExplodeEffect(p25, p26, p27, p28) -- Line: 113
    -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), u3 (copy), GameQueryUtil (copy), Debris (copy), GetTarmacAsset (copy)
    local v29 = u2.new();

    if not p28.disableSound then
        v29:GiveTask(SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
            rollOffMaxDistance = 220,
            position = p26
        }));
    end;

    local v30 = u3("Part", {
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        Transparency = 1,
        CFrame = CFrame.new(p26),
        Parent = p25.explosionsFolder
    });
    GameQueryUtil:setQueryIgnored(v30, true);
    Debris:AddItem(v30, 3);
    v29:GiveTask(v30);
    local v31 = Random.new();
    local v32 = NumberRange.new(17, 30);
    local v33 = NumberRange.new(v32.Min * p27, v32.Max * p27);
    local v34 = u3("ParticleEmitter", {
        LightInfluence = 0.1,
        Acceleration = Vector3.new(0, 4, 0),
        Drag = 3.5,
        Rate = 0,
        Color = ColorSequence.new(Color3.new(0.92, 0.92, 0.92), Color3.new(1, 1, 1)),
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }),
        Transparency = NumberSequence.new(0, 1),
        EmissionDirection = Enum.NormalId.Top,
        Lifetime = NumberRange.new(3, 5),
        Rotation = NumberRange.new(0, 360),
        RotSpeed = NumberRange.new(50, 100),
        Speed = v33,
        SpreadAngle = Vector2.new(100, 100),
        Parent = v30
    });
    v29:GiveTask(v34);
    local v35 = false;
    local v36 = 0;

    while true do
        if v35 then
            v36 = v36 + 1;
        else
            v35 = true;
        end;

        if v36 >= 25 then
            return v29;
        end;

        local v37 = v31:NextInteger(1, 6);
        v34.Texture = GetTarmacAsset("Explode" .. tostring(v37)).Image;
        v34:Emit(1);
    end;
end;

return {
    ExplosionController = KnitClient.CreateController(u5.new())
};