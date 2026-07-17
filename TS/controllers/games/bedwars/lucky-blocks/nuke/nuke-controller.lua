-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "NukeController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
end;

function u3.onStart(p6) -- Line: 26
    -- upvalues: default (copy), u1 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    default.Client:OnEvent("Nuke", function(p7) -- Line: 27
        -- upvalues: u1 (ref), Workspace (ref), SoundManager (ref), GameSound (ref), TweenService (ref)
        local v8 = u1("Part", {
            Name = "NukePart",
            Anchored = true,
            CanCollide = false,
            Transparency = 0.6,
            Size = Vector3.new(30, 30, 30),
            Position = p7.position,
            Color = Color3.fromRGB(255, 255, 255),
            Material = Enum.Material.Neon,
            Shape = Enum.PartType.Ball,
            Parent = Workspace
        });
        task.wait(0.2);
        u1("EqualizerSoundEffect", {
            Enabled = true,
            HighGain = 5,
            LowGain = 6,
            MidGain = 0,
            Parent = SoundManager:playModifiableSound(GameSound.TNT_EXPLODE_1, {
                volumeMultiplier = 6,
                rollOffMaxDistance = 10000,
                position = p7.position
            })
        });
        local v9 = TweenService:Create(v8, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
            Size = Vector3.new(100, 100, 100),
            Color = Color3.fromRGB(250, 148, 28)
        });
        v9:Play();
        v9.Completed:Wait();
        local v10 = TweenService:Create(v8, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
            Size = Vector3.new(150, 150, 150),
            Transparency = 1
        });
        v10:Play();
        v10.Completed:Wait();
        v8:Destroy();
    end);
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/games/bedwars/lucky-blocks/nuke/nuke-controller@NukeController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    default = u3
};