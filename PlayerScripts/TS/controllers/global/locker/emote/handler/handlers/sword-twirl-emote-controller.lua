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
        return "SwordTwirlEmoteController";
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
    p4.Name = "SwordTwirlEmoteController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ItemType (copy), InventoryUtil (copy), getItemMeta (copy), PlaceUtil (copy), u1 (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SWORD_TWIRL = EmoteType.SWORD_TWIRL;
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
        -- upvalues: ItemType (ref), InventoryUtil (ref), getItemMeta (ref), PlaceUtil (ref), u1 (ref)
        p14:GiveTask(p10:handleRightHandItemWithEmote(p11, u12, function(p15) -- Line: 52
            -- upvalues: ItemType (ref), InventoryUtil (ref), getItemMeta (ref), PlaceUtil (ref)
            local IRON_DAGGER = ItemType.IRON_DAGGER;

            if p15 then
                local hand = InventoryUtil.getInventory(p15).hand;

                if hand and getItemMeta(hand.itemType).sword then
                    return hand.itemType;
                end;

                if PlaceUtil.isLobbyServer() then
                    return ItemType.IRON_DAGGER;
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

                if #items == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                IRON_DAGGER = items[1];

                for i = 2, #items do
                    local v20 = items[i];
                    local _ = i - 1;
                    local v21 = getItemMeta(v20.itemType);
                    local v22 = getItemMeta(IRON_DAGGER.itemType);

                    if v21.sword and v22.sword then
                        if v21.sword.damage > v22.sword.damage then
                            IRON_DAGGER = v20;
                        end;
                    end;
                end;

                if IRON_DAGGER ~= nil then
                    IRON_DAGGER = IRON_DAGGER.itemType;
                end;
            end;

            return IRON_DAGGER;
        end, function(p23) -- Line: 92
            -- upvalues: u12 (copy), u1 (ref)
            CFrame.new(Vector3.new(0, 1.9, 0));
            local v24 = CFrame.new(Vector3.new(0, -1.9, 0)) * CFrame.Angles(0, 3.141592653589793, 3.141592653589793);

            return u1("Motor6D", {
                Name = "dagger.001",
                Parent = u12.RightHand,
                C0 = CFrame.new(Vector3.new(-0.044, -0.309, -0.004)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
                C1 = v24,
                Part0 = u12.RightHand,
                Part1 = p23,
                Enabled = true
            });
        end, {
            name = "animatedDagger"
        }));
    end;

    function u7.onDisable(p25, p26, p27, p28) -- Line: 116
    end;

    EmoteHandlerController:registerHandler(SWORD_TWIRL, u7);
end;

KnitClient.CreateController(u2.new());

return nil;