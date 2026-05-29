local v1 = {}
local v2 = {
    ["abilityActions"] = {
        ["KitPrimary"] = Enum.KeyCode.R,
        ["KitSecondary"] = Enum.KeyCode.Q,
        ["KitTertiary"] = Enum.KeyCode.V,
        ["ItemPrimary"] = Enum.KeyCode.Z,
        ["ItemSecondary"] = Enum.KeyCode.X,
        ["MiscPrimary"] = Enum.KeyCode.B,
        ["MiscSecondary"] = Enum.KeyCode.Y,
        ["Recall"] = Enum.KeyCode.C
    },
    ["controlActions"] = {
        ["CloseMenu"] = Enum.KeyCode.E,
        ["Ping"] = Enum.KeyCode.G,
        ["Interact"] = Enum.KeyCode.F,
        ["Inventory"] = Enum.KeyCode.E,
        ["Attack"] = Enum.UserInputType.MouseButton1,
        ["DropItem"] = Enum.KeyCode.H,
        ["Emote"] = Enum.KeyCode.T,
        ["Dismount"] = Enum.KeyCode.B,
        ["MoveMountUp"] = Enum.KeyCode.Q,
        ["MoveMountDown"] = Enum.KeyCode.E,
        ["HotbarSlot1"] = Enum.KeyCode.One,
        ["HotbarSlot2"] = Enum.KeyCode.Two,
        ["HotbarSlot3"] = Enum.KeyCode.Three,
        ["HotbarSlot4"] = Enum.KeyCode.Four,
        ["HotbarSlot5"] = Enum.KeyCode.Five,
        ["HotbarSlot6"] = Enum.KeyCode.Six,
        ["HotbarSlot7"] = Enum.KeyCode.Seven,
        ["HotbarSlot8"] = Enum.KeyCode.Eight,
        ["HotbarSlot9"] = Enum.KeyCode.Nine
    }
}
v1.KEYBOARD_KEYBINDS = v2
local v3 = {
    ["abilityKeybind"] = {
        ["PrimaryUp"] = Enum.KeyCode.ButtonY,
        ["PrimaryLeft"] = Enum.KeyCode.ButtonX,
        ["PrimaryRight"] = Enum.KeyCode.ButtonB,
        ["PrimaryDown"] = Enum.KeyCode.ButtonA,
        ["SecondaryUp"] = Enum.KeyCode.DPadUp,
        ["SecondaryLeft"] = Enum.KeyCode.DPadLeft,
        ["SecondaryRight"] = Enum.KeyCode.DPadRight,
        ["SecondaryDown"] = Enum.KeyCode.DPadDown
    },
    ["abilityPositionActions"] = {
        ["PrimaryUp"] = "ItemPrimary",
        ["PrimaryLeft"] = "KitTertiary",
        ["PrimaryRight"] = "KitSecondary",
        ["PrimaryDown"] = "KitPrimary",
        ["SecondaryUp"] = "ItemSecondary",
        ["SecondaryLeft"] = "MiscPrimary",
        ["SecondaryRight"] = "MiscSecondary",
        ["SecondaryDown"] = "Recall"
    },
    ["controlActions"] = {
        ["CloseMenu"] = Enum.KeyCode.ButtonB,
        ["Ping"] = Enum.KeyCode.ButtonB,
        ["Dismount"] = Enum.KeyCode.ButtonB,
        ["Interact"] = Enum.KeyCode.ButtonX,
        ["Inventory"] = Enum.KeyCode.ButtonY,
        ["Attack"] = Enum.KeyCode.ButtonR2,
        ["DropItem"] = Enum.KeyCode.DPadLeft,
        ["Emote"] = Enum.KeyCode.DPadRight,
        ["HotbarRight"] = Enum.KeyCode.ButtonR1,
        ["HotbarLeft"] = Enum.KeyCode.ButtonL1,
        ["TriggerAbilitySelect"] = Enum.KeyCode.ButtonL2,
        ["MoveMountUp"] = Enum.KeyCode.DPadUp,
        ["MoveMountDown"] = Enum.KeyCode.DPadDown,
        ["ToggleShiftLock"] = Enum.KeyCode.DPadUp,
        ["ToggleVirtualMouse"] = Enum.KeyCode.DPadDown
    }
}
v1.GAMEPAD_KEYBINDS = v3
return {
    ["KeybindDefaults"] = v1
}