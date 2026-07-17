-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CauldronWrapper = RuntimeLib.import(script, script.Parent, "ui", "cauldron-app").CauldronWrapper;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "CauldronController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "CauldronController";
    p8.cauldronToMaid = {};
end;

function u6.KnitStart(u9) -- Line: 41
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), u3 (copy), u4 (copy), Empty (copy), ItemViewport (copy), ItemType (copy), Players (copy), KnitClient2 (copy), SoundManager (copy), GameSound (copy), default (copy), CollectionService (copy)
    KnitController.KnitStart(u9);
    CollectionTagAdded("cauldron", function(u10) -- Line: 43
        -- upvalues: u3 (ref), u9 (copy), u4 (ref), Empty (ref), ItemViewport (ref), ItemType (ref), Players (ref), KnitClient2 (ref), SoundManager (ref), GameSound (ref), default (ref)
        local Root = u10:WaitForChild("Root");
        local v11 = u3.new();
        u9.cauldronToMaid[u10] = v11;
        local u12 = u4.mount(u4.createElement("BillboardGui", {
            LightInfluence = 0,
            StudsOffsetWorldSpace = Vector3.new(0, 5, 0),
            Adornee = Root,
            Size = UDim2.fromScale(2.5, 2.5)
        }, { u4.createElement(Empty, {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, { u4.createElement(ItemViewport, {
                    ItemType = ItemType.DIAMOND
                }) }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        v11:GiveTask(function() -- Line: 65
            -- upvalues: u4 (ref), u12 (copy)
            u4.unmount(u12);
        end);
        local u13 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Enabled = true,
            ActionText = "Repair (8 diamonds)",
            ObjectText = "Cauldron",
            HoldDuration = 0.3,
            RequiresLineOfSight = false,
            Parent = u10
        });
        u13.Triggered:Connect(function(p14) -- Line: 76
            -- upvalues: Players (ref), u13 (copy), u10 (copy), SoundManager (ref), GameSound (ref), u9 (ref), default (ref)
            if p14 == Players.LocalPlayer and u13.Enabled == true then
                if u10:GetAttribute("Enabled") == true then
                    SoundManager:playSound(GameSound.UI_OPEN);
                    u9:disableui();
                    u9:enableui(u10);

                    return;
                end;

                SoundManager:playSound(GameSound.DEPOSIT_BEE);
                default.Client:WaitFor("RepairCauldron"):expect():SendToServer({
                    cauldron = u10
                });
            end;
        end);
        u10:GetAttributeChangedSignal("Enabled"):Connect(function() -- Line: 90
            -- upvalues: u10 (copy), u13 (copy)
            if u10:GetAttribute("Enabled") == true then
                u13.ActionText = "Open";

                return;
            end;

            u13.ActionText = "Repair (8 diamonds)";
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("cauldron"):Connect(function(p15) -- Line: 98
        -- upvalues: u9 (copy)
        local v16 = u9.cauldronToMaid[p15];

        if v16 ~= nil then
            v16:DoCleaning();
        end;

        u9.cauldronToMaid[p15] = nil;
    end);
    task.spawn(function() -- Line: 106
        -- upvalues: u9 (copy), Players (ref)
        while true do
            local v17 = task.wait(0.2);

            if v17 == 0 or (v17 ~= v17 or not v17) then
                break;
            end;

            task.spawn(function() -- Line: 112
                -- upvalues: u9 (ref), Players (ref)
                if u9.active and Players.LocalPlayer:DistanceFromCharacter(u9.active.cauldron:GetPrimaryPartCFrame().Position) > u9.active.cauldron.ProximityPrompt.MaxActivationDistance then
                    u9:disableui();
                end;
            end);
        end;
    end);
end;

function u6.enableui(p18, p19) -- Line: 123
    -- upvalues: CreateRoduxApp (copy), CauldronWrapper (copy)
    p19.ProximityPrompt.Enabled = false;
    p18.active = {
        tree = CreateRoduxApp("cauldron", CauldronWrapper, {
            cauldron = p19
        }),
        cauldron = p19
    };
end;

function u6.disableui(p20) -- Line: 132
    -- upvalues: u4 (copy)
    if p20.active then
        p20.active.cauldron.ProximityPrompt.Enabled = true;
        u4.unmount(p20.active.tree);
        p20.active = nil;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;