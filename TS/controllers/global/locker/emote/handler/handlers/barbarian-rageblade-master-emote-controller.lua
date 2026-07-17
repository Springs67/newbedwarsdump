-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BarbarianRagebladeMasterEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BarbarianRagebladeMasterEmoteController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), InventoryUtil (copy), getItemMeta (copy), PlaceUtil (copy), ItemType (copy), u1 (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local BARBARIAN_RAGEBLADE_MASTER = EmoteType.BARBARIAN_RAGEBLADE_MASTER;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 38, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 44
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 48
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, u12, p13, p14) -- Line: 51
        -- upvalues: InventoryUtil (ref), getItemMeta (ref), PlaceUtil (ref), ItemType (ref), u1 (ref)
        p14:GiveTask(p10:handleRightHandItemWithEmote(p11, u12, function(p15) -- Line: 52
            -- upvalues: InventoryUtil (ref), getItemMeta (ref), PlaceUtil (ref), ItemType (ref)
            if not p15 then
                return ItemType.RAGEBLADE;
            end;

            local hand = InventoryUtil.getInventory(p15).hand;

            if hand and getItemMeta(hand.itemType).sword then
                return hand.itemType;
            end;

            if PlaceUtil.isLobbyServer() then
                return ItemType.RAGEBLADE;
            end;

            local items = InventoryUtil.getInventory(p15).items;

            local function _(p16, p17) -- Line: 63
                -- upvalues: getItemMeta (ref)
                local v18 = getItemMeta(p17.itemType);
                local v19 = getItemMeta(p16.itemType);

                if not (v18.sword and v19.sword) then
                    return p16;
                end;

                if v18.sword.damage > v19.sword.damage then
                    return p17;
                end;

                return p16;
            end;

            local v20 = {
                itemType = ItemType.RAGEBLADE
            };

            for i = 1, #items do
                local v21 = items[i];
                local _ = i - 1;
                local v22 = getItemMeta(v21.itemType);
                local v23 = getItemMeta(v20.itemType);

                if v22.sword and v23.sword then
                    if v22.sword.damage > v23.sword.damage then
                        v20 = v21;
                    end;
                end;
            end;

            if v20 ~= nil then
                v20 = v20.itemType;
            end;

            return v20;
        end, function(p24, p25) -- Line: 94
            -- upvalues: ItemType (ref), u12 (copy), u1 (ref)
            local v26 = CFrame.new(Vector3.new(0, 1.9, 0));

            if p25 ~= ItemType.RAGEBLADE then
                v26 = CFrame.new(Vector3.new(0, -1.9, 0)) * CFrame.Angles(0, 3.141592653589793, 3.141592653589793);
            end;

            return u1("Motor6D", {
                Name = "rageblade",
                Parent = u12.RightHand,
                C0 = CFrame.new(Vector3.new(-0.044, -0.309, -0.004)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
                C1 = v26,
                Part0 = u12.RightHand,
                Part1 = p24,
                Enabled = true
            });
        end, {
            name = "rageblade"
        }));
    end;

    function u7.onDisable(p27, p28, p29, p30) -- Line: 120
    end;

    EmoteHandlerController:registerHandler(BARBARIAN_RAGEBLADE_MASTER, u7);
end;

KnitClient.CreateController(u2.new());

return nil;