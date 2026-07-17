-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "ChestController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "ChestController";
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), getItemMeta (copy), KnitClient (copy), DeviceUtil (copy), ItemType (copy), Players (copy), ReplicatedStorage (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitController.KnitStart(u6);
    WatchCollectionTag("chest", function(u7) -- Line: 41
        -- upvalues: getItemMeta (ref), KnitClient (ref), DeviceUtil (ref), ItemType (ref), Players (ref), ReplicatedStorage (ref), Flamework (ref), BedwarsAppIds (ref), u6 (copy)
        local v8 = getItemMeta(u7.Name);
        local ProximityPromptController = KnitClient.Controllers.ProximityPromptController;
        local v9 = {
            Name = "Open",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 7.5,
            ActionText = "Open",
            ObjectText = v8.displayName,
            ClickablePrompt = DeviceUtil.isMobileControls(),
            Parent = u7
        };
        local v10;

        if u7.Name == ItemType.TEAM_CRATE then
            v10 = Vector2.new(0, 75);
        else
            v10 = Vector2.new(0, 0);
        end;

        v9.UIOffset = v10;
        ProximityPromptController:createProximityPrompt(v9).Triggered:Connect(function() -- Line: 66
            -- upvalues: Players (ref), u7 (copy), ItemType (ref), ReplicatedStorage (ref), Flamework (ref), BedwarsAppIds (ref), u6 (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetAttribute("GhostForm");
            end;

            if Character ~= 0 and (Character == Character and (Character ~= "" and Character)) then
                return nil;
            end;

            local v11 = nil;

            if u7.Name == ItemType.PERSONAL_CHEST or u7.Name == ItemType.OG_PERSONAL_CHEST then
                v11 = ReplicatedStorage:WaitForChild("Inventories"):FindFirstChild(Players.LocalPlayer.Name .. "_personal");
            elseif u7.Name == ItemType.LUCKY_BLOCK_ITEM_SMELTER then
                v11 = ReplicatedStorage:WaitForChild("Inventories"):FindFirstChild(Players.LocalPlayer.Name .. "_smelter");
            else
                local ChestFolderValue = u7:FindFirstChild("ChestFolderValue");

                if ChestFolderValue then
                    v11 = ChestFolderValue.Value;
                end;
            end;

            if v11 and Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CHEST_INVENTORY, {
                chestBlock = u7
            }) then
                u6:openChest(v11);
            end;
        end);
        u7:GetAttributeChangedSignal("ChestOpened"):Connect(function(p12) -- Line: 91
            -- upvalues: u7 (copy), u6 (ref)
            if u7:GetAttribute("ChestOpened") == true then
                u6:playChestOpenAnimation(u7);
            end;
        end);

        if u7:GetAttribute("ChestOpened") == true then
            u6:playChestOpenAnimation(u7);
        end;
    end);
end;

function u3.playChestOpenAnimation(p13, p14) -- Line: 101
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u15 = AnimationUtil:playAnimation(p14:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.CHEST_OPEN));

    if u15 ~= nil then
        u15:GetMarkerReachedSignal("open"):Connect(function() -- Line: 106
            -- upvalues: u15 (copy)
            u15:AdjustSpeed(0);
        end);
    end;

    SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCK, {
        position = p14.Position
    });
end;

function u3.openChest(p16, u17) -- Line: 114
    -- upvalues: default (copy)
    task.spawn(function() -- Line: 115
        -- upvalues: default (ref), u17 (copy)
        default.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(u17);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;