-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = Color3.fromRGB(237, 69, 41);
local u6 = Color3.new(0, 0, 0);
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "BobaBlasterController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 38
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9, ...);
    p9.Name = "BobaBlasterController";
    p9.effectCooldown = {};
end;

function u7.KnitStart(u10) -- Line: 47
    -- upvalues: KnitController (copy), default (copy), u3 (copy), Workspace (copy), GameQueryUtil (copy), WeldUtil (copy), u5 (copy), u6 (copy), SoundManager (copy), GameSound (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), InventoryUtil (copy), MapUtil (copy), ExpireList (copy)
    KnitController.KnitStart(u10);
    default.Client:OnEvent("BobaStickEvent", function(p11) -- Line: 49
        -- upvalues: u3 (ref), Workspace (ref), GameQueryUtil (ref), WeldUtil (ref), u5 (ref), u6 (ref), SoundManager (ref), GameSound (ref), u10 (copy)
        local v12 = u3("Part", {
            Name = "BobaPearl",
            Transparency = 0.5,
            Size = Vector3.new(1, 1, 1),
            CanQuery = false,
            CanCollide = false,
            Position = p11.position,
            Color = Color3.fromRGB(0, 0, 0),
            Material = Enum.Material.Neon,
            Shape = Enum.PartType.Ball,
            Parent = Workspace
        });

        if p11.hitEntity then
            v12.Parent = p11.hitEntity;
        end;

        if p11.hitEntity then
            local v13 = RaycastParams.new();
            local v14 = {};

            local function _(p15) -- Line: 71
                return p15.Name ~= "BobaPearl";
            end;

            local v16 = 0;
            local v17 = {};

            for i, child in p11.hitEntity:GetChildren() do
                local _ = i - 1;

                if child.Name ~= "BobaPearl" == true then
                    v16 = v16 + 1;
                    v17[v16] = child;
                end;
            end;

            table.move(v17, 1, #v17, #v14 + 1, v14);
            v13.FilterDescendantsInstances = v14;
            v13.FilterType = Enum.RaycastFilterType.Whitelist;
            local v18 = GameQueryUtil:raycast(v12.Position, p11.hitPart.Position - v12.Position, v13);
            local v19;

            if v18 == nil then
                v19 = v18;
            else
                v19 = v18.Position;
            end;

            if v19 then
                v12.CFrame = CFrame.new(v18.Position, v18.Position + v18.Normal);
            end;
        end;

        WeldUtil:weldParts(p11.hitPart, v12);
        local v20 = time();
        local v21 = 0.22;
        local v22 = false;

        while time() - v20 < 3 do
            v21 = v21 - 0.007;
            local v23;

            if v22 then
                v23 = u5;
            else
                v23 = u6;
            end;

            v12.Color = v23;
            v12.Transparency = v22 and 0 or 0.5;
            local v24;

            if v22 then
                v24 = Enum.Material.Neon;
            else
                v24 = Enum.Material.Glass;
            end;

            v12.Material = v24;

            if v22 then
                SoundManager:playSound(GameSound.BEEPING, {
                    rollOffMaxDistance = 45,
                    volumeMultiplier = 0.25,
                    position = v12.Position
                });
            end;

            task.wait(v21);
            v22 = not v22;
        end;

        u10:playEffect(v12.CFrame);
        v12:Destroy();
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.BOBA_BLASTER_FIRE) }, function(p25, p26) -- Line: 128
        -- upvalues: InventoryUtil (ref), MapUtil (ref), u10 (copy), ExpireList (ref)
        local Character = p25.Character;

        if not Character then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p25).hand;

        if hand ~= nil then
            hand = hand.tool;
        end;

        if hand then
            local v27 = MapUtil.getOrCreate(u10.effectCooldown, p25.UserId, ExpireList.new(0.35));

            if #v27:getValues() >= 1 then
                return nil;
            end;

            v27:add(math.random());
            u10:playBlastEffect(Character);
        end;
    end);
end;

function u7.playEffect(p28, p29) -- Line: 148
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    SoundManager:playSound(GameSound.GOO_SPLAT, {
        rollOffMaxDistance = 45,
        position = p29.Position
    });
    SoundManager:playSound(GameSound.FIREWORK_EXPLODE_1, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.1,
        position = p29.Position
    });
    local v30 = ReplicatedStorage.Assets.Effects.BobaPearlPop:Clone();
    v30.CFrame = p29;
    v30.Parent = Workspace;
    EffectUtil:playEffects({ v30 }, nil, {
        destroyAfterSec = 1,
        sizeMultiplier = 1.4
    });
end;

function u7.playBlastEffect(p31, p32) -- Line: 166
    -- upvalues: Workspace (copy), Players (copy), KnitClient2 (copy), ItemType (copy), EffectUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame.Position;
    end;

    if not CurrentCamera or (p32:GetPrimaryPartCFrame().Position - CurrentCamera).Magnitude > 300 then
        return nil;
    end;

    if p32 == Players.LocalPlayer.Character and KnitClient2.Controllers.ViewmodelController:isVisible() then
        p32 = KnitClient2.Controllers.ViewmodelController:getViewModel() or p32;
    end;

    local v33 = p32:FindFirstChild(ItemType.BOBA_BLASTER);

    if not v33 then
        return nil;
    end;

    EffectUtil:playEffects(v33:GetDescendants(), nil);
end;

KnitClient.CreateController(u7.new());

return nil;