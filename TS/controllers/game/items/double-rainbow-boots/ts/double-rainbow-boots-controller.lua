-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = {
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "DoubleRainbowBootsController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 31
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p7);
    p7.Name = "DoubleRainbowBootsController";
    p7.maid = u2.new();
    p7.jumpCountMap = {};
end;

function u5.KnitStart(u8) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Players (copy), SoundManager (copy), GameSound (copy), u4 (copy), ClientStore (copy), ItemType (copy), KnitClient2 (copy), u2 (copy)
    KnitController.KnitStart(u8);
    ClientSyncEvents.RainbowBootsEquipped:connect(function(u9) -- Line: 39
        -- upvalues: Players (ref), u8 (copy), SoundManager (ref), GameSound (ref), u4 (ref)
        task.spawn(function() -- Line: 40
            -- upvalues: u9 (copy), Players (ref), u8 (ref), SoundManager (ref), GameSound (ref), u4 (ref)
            local u10 = u9.character == Players.LocalPlayer.Character;
            local Humanoid = u9.character:WaitForChild("Humanoid", 1);

            if not Humanoid then
                return nil;
            end;

            u8.jumpCountMap[u9.character] = 0;
            local double_rainbow_boots_right = u9.character:WaitForChild("double_rainbow_boots_right", 2);
            local double_rainbow_boots_left = u9.character:WaitForChild("double_rainbow_boots_left", 2);

            if not (double_rainbow_boots_right and double_rainbow_boots_left) then
                u9.maid:DoCleaning();

                return nil;
            end;

            local u11 = { double_rainbow_boots_right:WaitForChild("Handle"):WaitForChild("Diamond"), (double_rainbow_boots_left:WaitForChild("Handle"):WaitForChild("Diamond")) };
            u9.maid:GiveTask(Humanoid.StateChanged:Connect(function(p12, p13) -- Line: 61
                -- upvalues: u8 (ref), u9 (ref), u11 (copy), SoundManager (ref), GameSound (ref), u10 (copy), u4 (ref)
                if p13 ~= Enum.HumanoidStateType.Landed then
                    if p12 == Enum.HumanoidStateType.Freefall and p13 == Enum.HumanoidStateType.Jumping then
                        local DUCK_JUMP = GameSound.DUCK_JUMP;
                        local v14 = {};
                        local v15;

                        if u10 then
                            v15 = nil;
                        else
                            v15 = u9.character:GetPivot().Position;
                        end;

                        v14.position = v15;
                        SoundManager:playSound(DUCK_JUMP, v14);
                        local v16 = u8.jumpCountMap[u9.character];
                        local v17 = (v16 == nil and 0 or v16) + 1;
                        local v18 = #u4 < v17 and 0 or v17;
                        u8.jumpCountMap[u9.character] = v18;
                        u8:changeBootColor(u11, u9.character, v18, u9.maid);
                    end;

                    return;
                end;

                u8.jumpCountMap[u9.character] = 0;
                u8:changeBootColor(u11, u9.character, 0, u9.maid);
            end));
        end);
    end);
    ClientStore.changed:connect(function(p19, p20) -- Line: 90
        -- upvalues: Players (ref), u8 (copy), ItemType (ref), KnitClient2 (ref), ClientSyncEvents (ref), u2 (ref)
        local armor = p19.Inventory.observedInventory.inventory.armor;

        if p20.Inventory.observedInventory.inventory.armor == armor then
            return nil;
        end;

        if not Players.LocalPlayer.Character then
            return nil;
        end;

        local jumpModifier = u8.jumpModifier;

        if jumpModifier ~= nil then
            jumpModifier:Destroy();
        end;

        u8.maid:DoCleaning();

        if (function(u21) -- Line: 104
            -- upvalues: armor (copy)
            local function _(p22) -- Line: 105
                -- upvalues: u21 (copy)
                local v23;

                if p22 == "empty" then
                    v23 = false;
                else
                    v23 = p22.itemType == u21;
                end;

                return v23;
            end;

            local v24 = nil;

            for i, v in armor do
                local _ = i - 1;
                local v25;

                if v == "empty" then
                    v25 = false;
                else
                    v25 = v.itemType == u21;
                end;

                if v25 == true then
                    v24 = v;
                    break;
                end;
            end;

            return v24 ~= nil;
        end)(ItemType.DOUBLE_RAINBOW_BOOTS) then
            u8.jumpModifier = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                jumpHeightMultiplier = 1.2,
                airJumps = 7
            });
            ClientSyncEvents.RainbowBootsEquipped:fire(u2.new(), Players.LocalPlayer.Character);
        end;
    end);
end;

function u5.changeBootColor(p26, p27, p28, p29, p30) -- Line: 128
    -- upvalues: TweenService (copy), u4 (copy)
    for _, v in p27 do
        if v.Parent == nil or p28.Parent == nil then
            p30:DoCleaning();

            return nil;
        end;

        TweenService:Create(v, TweenInfo.new(0.5), {
            Color = u4[p29 + 1]
        }):Play();
    end;
end;

KnitClient.CreateController(u5.new());

return nil;