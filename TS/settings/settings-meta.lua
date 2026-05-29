local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types")
local v4 = v3.Setting
local v5 = v3.SettingInputType
local v6 = v3.SettingSection
local v7 = v3.SettingsTab
local v8 = v3.VisibilitySetting
local u9 = {
    [v4.MOBILE_SWORD_HOLD] = {
        ["name"] = "Hold to Auto Swing",
        ["description"] = "Hold the sword button to continuously attack",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.LOCK_CAMERA] = {
        ["name"] = "Lock Camera",
        ["description"] = "Locks your camera in the current perspective. Disables zooming in or out",
        ["defaultValue"] = false,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.MOBILE_SHIFT_LOCK] = {
        ["name"] = "Mobile Camera Shift Lock",
        ["defaultValue"] = false,
        ["mobileOnly"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.PC_SHIFT_LOCK] = {
        ["name"] = "Toggle Sprint",
        ["description"] = "Sets sprint to be toggleable with one press when enabled or hold to sprint if disabled.",
        ["defaultValue"] = false,
        ["section"] = v6.GAME,
        ["tab"] = v7.PC,
        ["inputType"] = v5.TOGGLE
    },
    [v4.BACKGROUND_MUSIC_VOLUME] = {
        ["name"] = "Lobby Background Music Volume",
        ["min"] = 0,
        ["max"] = 1,
        ["stepSize"] = 0.01,
        ["defaultValue"] = 0.5,
        ["section"] = v6.AUDIO,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.SLIDER
    },
    [v4.EMOTE_VOLUME] = {
        ["name"] = "Emote Music Volume",
        ["min"] = 0,
        ["max"] = 1,
        ["stepSize"] = 0.01,
        ["defaultValue"] = 1,
        ["section"] = v6.AUDIO,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.SLIDER
    },
    [v4.BACKGROUND_MUSIC_VOLUME_GAME] = {
        ["name"] = "Game Background Music Volume ",
        ["min"] = 0,
        ["max"] = 1,
        ["stepSize"] = 0.01,
        ["defaultValue"] = 1,
        ["section"] = v6.AUDIO,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.SLIDER
    },
    [v4.FOV] = {
        ["name"] = "FOV",
        ["description"] = "(Field of view. Default: 80)",
        ["min"] = 70,
        ["max"] = 360,
        ["stepSize"] = 1,
        ["defaultValue"] = 80,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.SLIDER
    },
    [v4.ENABLE_AUTO_DEPOSIT] = {
        ["name"] = "Auto Deposit",
        ["description"] = "Automatically deposit diamonds into the Team Crate when nearby",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.SHOW_RESOURCES_IN_HUD] = {
        ["name"] = "Resource Display",
        ["description"] = "Display resources next to your hotbar",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.SHOW_RECOMMENDED_SHOP] = {
        ["name"] = "Show Recommended Shop Category",
        ["description"] = "Show recommended shop items",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.SHOW_TIPS] = {
        ["name"] = "Show Tips",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.ENABLE_ON_SCREEN_EFFECTS] = {
        ["name"] = "On Screen Effects",
        ["description"] = "Enable on screen visual effects",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.PICTURE_MODE] = {
        ["name"] = "Picture Mode",
        ["defaultValue"] = false,
        ["resetOnJoin"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.FRIEND_NOTIFICATIONS] = {
        ["name"] = "Friend Notifications",
        ["description"] = "Toggle whether you\'ll receive friend notifications (ex. Friend joins)",
        ["defaultValue"] = true,
        ["section"] = v6.FRIENDS,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.FRIEND_SPECTATING] = {
        ["name"] = "Friend Spectating",
        ["description"] = "Enable to allow friends to spectate your game",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.STREAMER_MODE] = {
        ["name"] = "Streamer Mode",
        ["description"] = "Hide your name from other players. And hide the names of others from view (Disabled in Ranked; Player Level 20 required)",
        ["defaultValue"] = false,
        ["rateLimit"] = 0.3,
        ["section"] = v6.PRIVACY,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.CLAN_INVITES] = {
        ["name"] = "Clan Invites",
        ["description"] = "Toggle whether you\'ll receive clan invites",
        ["defaultValue"] = true,
        ["section"] = v6.PRIVACY,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    },
    [v4.MOBILE_PROJECTILE_BUTTON] = {
        ["name"] = "Mobile Projectile Button",
        ["description"] = "Displays an aiming joystick button for projectiles",
        ["defaultValue"] = true,
        ["mobileOnly"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.MOBILE_BLOCK_BREAK_BUTTON] = {
        ["name"] = "Mobile Block Button",
        ["description"] = "Displays a block break joystick button on tools",
        ["defaultValue"] = true,
        ["mobileOnly"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.MOBILE_INTERACT_BUTTON] = {
        ["name"] = "Mobile Interact Button",
        ["description"] = "Displays an interact button for prompts",
        ["defaultValue"] = true,
        ["mobileOnly"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.MOBILE_AUTO_BRIDGE_BUTTON] = {
        ["name"] = "Mobile Auto Bridge Button",
        ["description"] = "Displays a button for automatic block placement",
        ["defaultValue"] = true,
        ["mobileOnly"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.MOBILE,
        ["inputType"] = v5.TOGGLE
    },
    [v4.GLOBAL_CHAT_SYSTEM_MESSAGES] = {
        ["name"] = "Global Chat Messages",
        ["description"] = "Determines whether global chat messages should be displayed (ex. Global Crate Openings)",
        ["defaultValue"] = true,
        ["section"] = v6.GAME,
        ["tab"] = v7.GENERAL,
        ["inputType"] = v5.TOGGLE
    }
}
local v10 = v4.PROFILE_VISIBILITY
local v11 = {
    ["name"] = "Profile Visibility",
    ["description"] = "Toggle who can view your profile.",
    ["section"] = v6.PRIVACY,
    ["tab"] = v7.GENERAL,
    ["inputType"] = v5.TOGGLE,
    ["defaultValue"] = v8.PUBLIC,
    ["toggleOptionsOverride"] = {
        {
            ["text"] = "Public",
            ["value"] = v8.PUBLIC
        },
        {
            ["text"] = "Friends Only",
            ["value"] = v8.FRIENDS_ONLY,
            ["activeColor"] = v2.mcBlue
        },
        {
            ["text"] = "Private",
            ["value"] = v8.PRIVATE,
            ["activeColor"] = v2.backgroundError
        }
    }
}
u9[v10] = v11
return {
    ["getSettingMeta"] = function(p12) --[[ Name: getSettingMeta, Line 235 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        return u9[p12]
    end,
    ["SettingMeta"] = u9
}