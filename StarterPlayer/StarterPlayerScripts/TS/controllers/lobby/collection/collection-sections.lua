local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.SWORDS = "swords"
v4.swords = "SWORDS"
v5.PICK_AXES = "pick_axes"
v4.pick_axes = "PICK_AXES"
v5.AXES = "axes"
v4.axes = "AXES"
v5.RANGED = "ranged"
v4.ranged = "RANGED"
v5.BED = "bed"
v4.bed = "BED"
v5.WIN_EFFECT = "win_effect"
v4.win_effect = "WIN_EFFECT"
v5.BED_BREAK_EFFECT = "bed_break_effect"
v4.bed_break_effect = "BED_BREAK_EFFECT"
v5.KILL_EFFECT = "kill_effect"
v4.kill_effect = "KILL_EFFECT"
v5.LOBBY_GADGET = "lobby_gadget"
v4.lobby_gadget = "LOBBY_GADGET"
v5.TITLES = "titles"
v4.titles = "TITLES"
v5.ACHIEVEMENT = "achievement"
v4.achievement = "ACHIEVEMENT"
local v6 = {
    [v5.SWORDS] = {
        ["title"] = "Swords",
        ["layoutOrder"] = 2,
        ["skinBaseItemTypes"] = {
            v2.WOOD_SWORD,
            v2.STONE_SWORD,
            v2.IRON_SWORD,
            v2.DIAMOND_SWORD,
            v2.EMERALD_SWORD
        }
    },
    [v5.PICK_AXES] = {
        ["title"] = "Pick Axes",
        ["layoutOrder"] = 4,
        ["skinBaseItemTypes"] = {
            v2.WOOD_PICKAXE,
            v2.STONE_PICKAXE,
            v2.IRON_PICKAXE,
            v2.DIAMOND_PICKAXE
        }
    },
    [v5.AXES] = {
        ["title"] = "Axes",
        ["layoutOrder"] = 3,
        ["skinBaseItemTypes"] = {
            v2.WOOD_AXE,
            v2.STONE_AXE,
            v2.IRON_AXE,
            v2.DIAMOND_AXE
        }
    },
    [v5.RANGED] = {
        ["title"] = "Ranged",
        ["layoutOrder"] = 1,
        ["skinBaseItemTypes"] = { v2.WOOD_BOW, v2.WOOD_CROSSBOW, v2.HEADHUNTER }
    },
    [v5.BED] = {
        ["title"] = "Bed",
        ["layoutOrder"] = 1,
        ["lockerCategory"] = v3.BED_SKIN
    },
    [v5.WIN_EFFECT] = {
        ["title"] = "Win Effect",
        ["layoutOrder"] = 2,
        ["lockerCategory"] = v3.WIN_EFFECT
    },
    [v5.BED_BREAK_EFFECT] = {
        ["title"] = "Bed Break Effect",
        ["layoutOrder"] = 3,
        ["lockerCategory"] = v3.BED_BREAK_EFFECT
    },
    [v5.KILL_EFFECT] = {
        ["title"] = "Kill Effect",
        ["layoutOrder"] = 4,
        ["lockerCategory"] = v3.KILL_EFFECT
    },
    [v5.LOBBY_GADGET] = {
        ["title"] = "Lobby Gadget",
        ["layoutOrder"] = 5,
        ["lockerCategory"] = v3.LOBBY_GADGET
    },
    [v5.TITLES] = {
        ["title"] = "Titles",
        ["layoutOrder"] = 6,
        ["lockerCategory"] = v3.TITLE
    },
    [v5.ACHIEVEMENT] = {
        ["title"] = "Achievement",
        ["layoutOrder"] = 7,
        ["lockerCategory"] = v3.BADGE
    }
}
return {
    ["CollectionSection"] = v5,
    ["CollectionSectionMeta"] = v6
}