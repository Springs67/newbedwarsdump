-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local StickyFireworkConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "sticky-firework", "sticky-firework-constants").StickyFireworkConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "StickyFireworkController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "StickyFireworkController";
end;

function u5.KnitStart(u8) -- Line: 37
    -- upvalues: KnitController (copy), default (copy), u2 (copy), ReplicatedStorage (copy), ItemType (copy), GameQueryUtil (copy), WeldUtil (copy), StickyFireworkConstants (copy), Players (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u8);
    default.Client:OnEvent("FireworkStickEvent", function(p9) -- Line: 39
        -- upvalues: u2 (ref), ReplicatedStorage (ref), ItemType (ref), GameQueryUtil (ref), WeldUtil (ref), StickyFireworkConstants (ref), Players (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        local v10 = u2.new();
        local Items = ReplicatedStorage:FindFirstChild("Items");

        if Items ~= nil then
            Items = Items:FindFirstChild(ItemType.STICKY_FIREWORK);

            if Items ~= nil then
                Items = Items:FindFirstChild("Handle");

                if Items ~= nil then
                    Items = Items:Clone();
                end;
            end;
        end;

        if Items then
            v10:GiveTask(Items);
            Items.Name = "Firework";

            if p9.hitEntity then
                Items.Parent = p9.hitEntity;
            end;

            if p9.hitEntity then
                local v11 = RaycastParams.new();
                local v12 = {};

                local function _(p13) -- Line: 63
                    return p13.Name ~= "Firework";
                end;

                local v14 = 0;
                local v15 = {};

                for i, child in p9.hitEntity:GetChildren() do
                    local _ = i - 1;

                    if child.Name ~= "Firework" == true then
                        v14 = v14 + 1;
                        v15[v14] = child;
                    end;
                end;

                table.move(v15, 1, #v15, #v12 + 1, v12);
                v11.FilterDescendantsInstances = v12;
                v11.FilterType = Enum.RaycastFilterType.Whitelist;
                local v16 = GameQueryUtil:raycast(Items.Position, p9.hitPart.Position - Items.Position, v11);
                local v17;

                if v16 == nil then
                    v17 = v16;
                else
                    v17 = v16.Position;
                end;

                if v17 then
                    Items.CFrame = CFrame.new(v16.Position, v16.Position + v16.Normal);
                end;
            end;

            v10:GiveTask(WeldUtil:weldParts(p9.hitPart, Items));
            task.wait(StickyFireworkConstants.TIME_TO_LAUNCH_SEC);
            local v18;

            if p9.hitEntity == Players.LocalPlayer.Character then
                u8:getLaunched();
                v18 = true;
            else
                v18 = false;
            end;

            local FIREWORK_LAUNCH = GameSound.FIREWORK_LAUNCH;
            local v19 = {};
            local v20;

            if v18 then
                v20 = nil;
            else
                v20 = Items.CFrame.Position;
            end;

            v19.position = v20;
            SoundManager:playSound(FIREWORK_LAUNCH, v19);
            local FIREWORK_TRAIL = GameSound.FIREWORK_TRAIL;
            local v21 = {
                looped = true
            };
            local v22;

            if v18 then
                v22 = nil;
            else
                v22 = Items.CFrame.Position;
            end;

            v21.position = v22;
            local v23 = SoundManager:playSound(FIREWORK_TRAIL, v21);

            if v23 then
                v10:GiveTask(v23);
            end;

            local v24 = Items:FindFirstChildWhichIsA("ParticleEmitter");

            if v24 then
                v24.Enabled = true;
            end;

            task.wait(StickyFireworkConstants.LAUNCH_DURATION_SEC);
            u8:playEffect(Items.CFrame);
            v10:DoCleaning();
        end;
    end);
end;

function u5.getLaunched(p25) -- Line: 122
    -- upvalues: Players (copy), u3 (copy), StickyFireworkConstants (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    local u26 = u3("BodyForce", {
        Parent = Character,
        Force = Vector3.new(0, StickyFireworkConstants.FIREWORK_VERTICAL_FORCE * Character.AssemblyMass, 0)
    });

    if Character2 then
        Character2.PlatformStand = true;
        task.delay(0.2, function() -- Line: 142
            -- upvalues: Character2 (copy)
            Character2.PlatformStand = false;
        end);
    end;

    Character.AssemblyLinearVelocity = Character.AssemblyLinearVelocity * Vector3.new(1, 20, 1);
    task.delay(StickyFireworkConstants.LAUNCH_DURATION_SEC, function() -- Line: 150
        -- upvalues: u26 (copy), Character (copy)
        if u26.Parent then
            u26:Destroy();
        end;

        Character.AssemblyLinearVelocity = Character.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
    end);
end;

function u5.playEffect(p27, p28) -- Line: 159
    -- upvalues: SoundManager (copy), GameSound (copy), KnitClient (copy), FireworkType (copy)
    SoundManager:playSound(GameSound.GOO_SPLAT, {
        rollOffMaxDistance = 45,
        position = p28.Position
    });
    KnitClient.Controllers.FireworkController:playFireworkEffect(p28.Position, FireworkType.NORMAL);
end;

KnitClient.CreateController(u5.new());

return nil;