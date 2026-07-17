-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local v1 = {};
local v2 = setmetatable({}, {
    __index = v1
});
v2.SWORDS = "swords";
v1.swords = "SWORDS";
v2.PICK_AXES = "pick_axes";
v1.pick_axes = "PICK_AXES";
v2.AXES = "axes";
v1.axes = "AXES";
v2.RANGED = "ranged";
v1.ranged = "RANGED";
v2.BED = "bed";
v1.bed = "BED";
v2.WIN_EFFECT = "win_effect";
v1.win_effect = "WIN_EFFECT";
v2.BED_BREAK_EFFECT = "bed_break_effect";
v1.bed_break_effect = "BED_BREAK_EFFECT";
v2.KILL_EFFECT = "kill_effect";
v1.kill_effect = "KILL_EFFECT";
v2.LOBBY_GADGET = "lobby_gadget";
v1.lobby_gadget = "LOBBY_GADGET";
v2.TITLES = "titles";
v1.titles = "TITLES";
v2.ACHIEVEMENT = "achievement";
v1.achievement = "ACHIEVEMENT";

return {
    CollectionSection = v2,
    CollectionSectionMeta = {
        [v2.SWORDS] = {
            title = "Swords",
            layoutOrder = 2,
            skinBaseItemTypes = {
                ItemType.WOOD_SWORD,
                ItemType.STONE_SWORD,
                ItemType.IRON_SWORD,
                ItemType.DIAMOND_SWORD,
                ItemType.EMERALD_SWORD
            }
        },
        [v2.PICK_AXES] = {
            title = "Pick Axes",
            layoutOrder = 4,
            skinBaseItemTypes = {
                ItemType.WOOD_PICKAXE,
                ItemType.STONE_PICKAXE,
                ItemType.IRON_PICKAXE,
                ItemType.DIAMOND_PICKAXE
            }
        },
        [v2.AXES] = {
            title = "Axes",
            layoutOrder = 3,
            skinBaseItemTypes = {
                ItemType.WOOD_AXE,
                ItemType.STONE_AXE,
                ItemType.IRON_AXE,
                ItemType.DIAMOND_AXE
            }
        },
        [v2.RANGED] = {
            title = "Ranged",
            layoutOrder = 1,
            skinBaseItemTypes = { ItemType.WOOD_BOW, ItemType.WOOD_CROSSBOW, ItemType.HEADHUNTER }
        },
        [v2.BED] = {
            title = "Bed",
            layoutOrder = 1,
            lockerCategory = LockerItemCategory.BED_SKIN
        },
        [v2.WIN_EFFECT] = {
            title = "Win Effect",
            layoutOrder = 2,
            lockerCategory = LockerItemCategory.WIN_EFFECT
        },
        [v2.BED_BREAK_EFFECT] = {
            title = "Bed Break Effect",
            layoutOrder = 3,
            lockerCategory = LockerItemCategory.BED_BREAK_EFFECT
        },
        [v2.KILL_EFFECT] = {
            title = "Kill Effect",
            layoutOrder = 4,
            lockerCategory = LockerItemCategory.KILL_EFFECT
        },
        [v2.LOBBY_GADGET] = {
            title = "Lobby Gadget",
            layoutOrder = 5,
            lockerCategory = LockerItemCategory.LOBBY_GADGET
        },
        [v2.TITLES] = {
            title = "Titles",
            layoutOrder = 6,
            lockerCategory = LockerItemCategory.TITLE
        },
        [v2.ACHIEVEMENT] = {
            title = "Achievement",
            layoutOrder = 7,
            lockerCategory = LockerItemCategory.BADGE
        }
    }
};