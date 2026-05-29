local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-theme").TutorialTheme
local v4 = {
    ["name"] = "Introduction",
    ["dialogue"] = {
        ["start"] = { "Welcome to <font color=\"" .. v2.richTextColor(Color3.fromRGB(97, 222, 254)) .. "\"><b>Bed</b></font><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 84, 98)) .. "\"><b>Wars</b></font>!", "Your goal is to protect your bed and destroy the other team\'s bed." }
    }
}
local v5 = {
    ["name"] = "Generator",
    ["prevSection"] = "introduction"
}
local v6 = {
    ["collect_iron"] = {
        ["totalProgress"] = 5,
        ["description"] = "Collect <font color=\"" .. v3.iron .. "\">iron</font>."
    }
}
v5.tasks = v6
v5.dialogue = {
    ["start"] = { "You can start by gathering resources to buy <font color=\"" .. v3.item .. "\">items</font> from the shop.", "<font color=\"" .. v3.iron .. "\">Iron</font> is our basic resource. You can collect it from the <font color=\"" .. v3.highlightBlue .. "\">generator</font>." },
    ["end"] = { "Great job!" }
}
local v7 = {
    ["name"] = "Shop",
    ["prevSection"] = "generator"
}
local v8 = {
    ["buy_armor"] = {
        ["totalProgress"] = 1,
        ["description"] = "Use <font color=\"" .. v3.iron .. "\">iron</font> to buy some <font color=\"" .. v3.item .. "\">Leather Armor</font>."
    },
    ["buy_sword"] = {
        ["totalProgress"] = 1,
        ["description"] = "Use <font color=\"" .. v3.iron .. "\">iron</font> to buy a <font color=\"" .. v3.item .. "\">Stone Sword</font>."
    },
    ["buy_blocks"] = {
        ["totalProgress"] = 8,
        ["description"] = "Use <font color=\"" .. v3.iron .. "\">iron</font> to buy <font color=\"" .. v3.item .. "\">Wool Blocks</font>."
    }
}
v7.tasks = v8
v7.dialogue = {
    ["start"] = { "You can use <font color=\"" .. v3.iron .. "\">iron</font> to buy <font color=\"" .. v3.item .. "\">items</font> in the shop.", "Talk to the shopkeeper and buy some <font color=\"" .. v3.item .. "\">wool blocks</font>, <font color=\"" .. v3.item .. "\">armor</font>, and a <font color=\"" .. v3.item .. "\">sword</font>." },
    ["end"] = { "Now you\'re ready to build!" }
}
local v9 = {
    ["name"] = "Selecting Blocks",
    ["prevSection"] = "shop"
}
local v10 = {
    ["select_blocks"] = {
        ["totalProgress"] = 1,
        ["description"] = "Select the <font color=\"" .. v3.woolBlue .. "\">wool blocks</font> in your inventory."
    }
}
v9.tasks = v10
v9.dialogue = {
    ["start"] = { "Let\'s teach you the basics of placing and breaking <font color=\"" .. v3.woolBlue .. "\">blocks</font>.", "Select the <font color=\"" .. v3.woolBlue .. "\">wool blocks</font> in your inventory. Tap the inventory slot or press 3 on your keyboard." }
}
local v11 = {
    ["name"] = "Place Block",
    ["prevSection"] = "block"
}
local v12 = {
    ["place_block"] = {
        ["totalProgress"] = 1,
        ["description"] = "Place a <font color=\"" .. v3.woolBlue .. "\">wool block</font>."
    }
}
v11.tasks = v12
v11.dialogue = {
    ["start"] = { "Place a <font color=\"" .. v3.woolBlue .. "\">wool block</font> in the highlighted space." },
    ["end"] = { "Great job! You\'ve placed a <font color=\"" .. v3.woolBlue .. "\">block</font>!" }
}
local v13 = {
    ["name"] = "Equip Pickaxe",
    ["prevSection"] = "place_block"
}
local v14 = {
    ["equip_pickaxe"] = {
        ["totalProgress"] = 1,
        ["description"] = "Select the <font color=\"" .. v3.item .. "\">pickaxe</font> in your inventory."
    }
}
v13.tasks = v14
v13.dialogue = {
    ["start"] = { "In addition to placing <font color=\"" .. v3.woolBlue .. "\">blocks</font>, you can also <font color=\"" .. v3.highlightBlue .. "\">break them</font>!", "Equip the <font color=\"" .. v3.item .. "\">pickaxe</font> in your inventory. Tap the inventory slot or press 2 on your keyboard." }
}
local v15 = {
    ["name"] = "Break Block",
    ["prevSection"] = "equip_pickaxe"
}
local v16 = {
    ["break_block"] = {
        ["totalProgress"] = 1,
        ["description"] = "Break the <font color=\"" .. v3.woolBlue .. "\">block</font>."
    }
}
v15.tasks = v16
v15.dialogue = {
    ["start"] = { "You can use your <font color=\"" .. v3.item .. "\">pickaxe</font> to break <font color=\"" .. v3.woolBlue .. "\">blocks</font>.", "Break the <font color=\"" .. v3.woolBlue .. "\">block</font> you just placed." },
    ["end"] = { "Great job! Now you know how to place and break blocks." }
}
local v17 = {
    ["name"] = "Bed Protection",
    ["prevSection"] = "break_block"
}
local v18 = {
    ["place_bed_blocks"] = {
        ["totalProgress"] = 8,
        ["description"] = "Place <font color=\"" .. v3.woolBlue .. "\">wool blocks</font> around your <font color=\"" .. v3.bed .. "\">bed</font>."
    }
}
v17.tasks = v18
v17.dialogue = {
    ["start"] = { "Your <font color=\"" .. v3.bed .. "\">bed</font> is the most important thing to protect.", "Place down the <font color=\"" .. v3.woolBlue .. "\">wool</font> so that it covers up your <font color=\"" .. v3.bed .. "\">bed</font>." },
    ["end"] = { "This makes it harder for the enemy team to break your bed." }
}
local v19 = {
    ["name"] = "Sprinting",
    ["prevSection"] = "bed"
}
local v20 = {
    ["sprint"] = {
        ["totalProgress"] = 5,
        ["description"] = "Sprint for a total of <font color=\"" .. v3.highlightBlue .. "\">5 seconds</font>."
    }
}
v19.tasks = v20
local v21 = {
    ["start"] = {
        "Now it\'s time to teach you how to <font color=\"" .. v3.highlightBlue .. "\">sprint</font>.",
        {
            ["mobileText"] = "Press the highlighted button on the right side of the screen to toggle sprinting.",
            ["gamepadText"] = "Press down on the left stick to toggle sprinting.",
            ["text"] = "Hold the <font color=\"" .. v3.highlightBlue .. "\">Left Shift</font> key while moving to sprint."
        }
    }
}
v19.dialogue = v21
local v22 = {
    ["name"] = "Go to the Diamond and Emerald Generators",
    ["prevSection"] = "sprint"
}
local v23 = {
    ["path_to_diamond_emerald_gen"] = {
        ["totalProgress"] = 1,
        ["description"] = "Use blocks to build a bridge to the <font color=\"" .. v3.diamond .. "\">diamond</font> and <font color=\"" .. v3.emerald .. "\">emerald</font> generators."
    }
}
v22.tasks = v23
v22.dialogue = {
    ["start"] = {
        "<font color=\"" .. v3.iron .. "\">Iron</font> isn\'t the only resource in the game! There are also <font color=\"" .. v3.diamond .. "\">diamonds</font> and <font color=\"" .. v3.emerald .. "\">emeralds</font>.",
        "<font color=\"" .. v3.diamond .. "\">Diamonds</font> are used to purchase upgrades for your team, and <font color=\"" .. v3.emerald .. "\">emeralds</font> are used to buy high-level items from the shop.",
        "<font color=\"" .. v3.diamond .. "\">Diamonds</font> and <font color=\"" .. v3.emerald .. "\">emeralds</font> spawn from generators on the map.",
        "Use blocks to build a bridge to the <font color=\"" .. v3.diamond .. "\">diamond</font> and <font color=\"" .. v3.emerald .. "\">emerald</font> generators."
    }
}
local v24 = {
    ["name"] = "Diamond and Emerald Generators",
    ["prevSection"] = "path_to_diamond_emerald_gen"
}
local v25 = {
    ["collect_diamonds"] = {
        ["totalProgress"] = 1,
        ["description"] = "Gather <font color=\"" .. v3.diamond .. "\">diamonds</font>."
    },
    ["collect_emeralds"] = {
        ["totalProgress"] = 1,
        ["description"] = "Gather <font color=\"" .. v3.emerald .. "\">emeralds</font>."
    }
}
v24.tasks = v25
v24.dialogue = {
    ["start"] = { "Let\'s try collecting some <font color=\"" .. v3.diamond .. "\">diamonds</font> and <font color=\"" .. v3.emerald .. "\">emeralds</font> from the generators." }
}
local v26 = {
    ["name"] = "Recall",
    ["prevSection"] = "diamond_emerald_gen"
}
local v27 = {
    ["recall"] = {
        ["totalProgress"] = 1,
        ["description"] = "<font color=\"" .. v3.recall .. "\">Recall</font> to base."
    }
}
v26.tasks = v27
v26.dialogue = {
    ["start"] = { "Now that we have our <font color=\"" .. v3.diamond .. "\">diamonds</font> and <font color=\"" .. v3.emerald .. "\">emeralds</font>, let\'s head back to base!", "Press the <font color=\"" .. v3.recall .. "\">recall</font> button to teleport back to your base. Tap the button or press the C key on your keyboard." },
    ["end"] = { "You\'ve returned to your team\'s base." }
}
local v28 = {
    ["name"] = "Team Upgrades",
    ["prevSection"] = "recall"
}
local v29 = {
    ["team_upgrade"] = {
        ["totalProgress"] = 1,
        ["description"] = "Talk to the <font color=\"" .. v3.upgrade .. "\">team upgrade</font> shopkeeper."
    }
}
v28.tasks = v29
v28.dialogue = {
    ["start"] = { "Let\'s use the <font color=\"" .. v3.diamond .. "\">diamonds</font> we just collected to purchase an <font color=\"" .. v3.upgrade .. "\">upgrade</font> for your team." }
}
local v30 = {
    ["name"] = "Purchase Upgrade",
    ["prevSection"] = "team_upgrades"
}
local v31 = {
    ["purchase_upgrade"] = {
        ["totalProgress"] = 1,
        ["description"] = "Purchase a <font color=\"" .. v3.upgrade .. "\">Team Upgrade</font>."
    }
}
v30.tasks = v31
v30.dialogue = {
    ["start"] = { "Your can use diamonds to purchase different upgrades for your team.", "You can increase your damage and armor strength or improve your team generator.", "Try purchasing any of these <font color=\"" .. v3.upgrade .. "\">Team Upgrades</font> using the <font color=\"" .. v3.diamond .. "\">diamonds</font> you just collected." },
    ["end"] = { "Great job! Diamonds help you and your team grow stronger!" }
}
local v32 = {
    ["name"] = "Basic Combat",
    ["prevSection"] = "purchase_upgrade"
}
local v33 = {
    ["kill_enemy"] = {
        ["totalProgress"] = 1,
        ["description"] = "Kill the <font color=\"" .. v3.enemy .. "\">enemy player</font>."
    }
}
v32.tasks = v33
v32.dialogue = {
    ["start"] = { "Oh no! An <font color=\"" .. v3.enemy .. "\">enemy</font> is attacking!", "Attack the <font color=\"" .. v3.enemy .. "\">enemy</font> with your sword to defeat them." },
    ["end"] = { "Great job! The <font color=\"" .. v3.enemy .. "\">enemy</font> is now on a respawn timer." }
}
local v34 = {
    ["name"] = "Go to the Enemy Bed",
    ["prevSection"] = "basic_combat"
}
local v35 = {
    ["path_to_enemy_bed"] = {
        ["totalProgress"] = 1,
        ["description"] = "Use blocks to build a bridge to the <font color=\"" .. v3.enemy .. "\">enemy\'s bed</font>."
    }
}
v34.tasks = v35
v34.dialogue = {
    ["start"] = { "The <font color=\"" .. v3.enemy .. "\">enemy</font> can\'t defend their bed while they are respawning.", "Let\'s build a bridge to the enemy bed!" },
    ["end"] = { "You\'ve reached the enemy bed." }
}
local v36 = {
    ["name"] = "Equip Axe",
    ["prevSection"] = "path_to_enemy_bed"
}
local v37 = {
    ["equip_axe"] = {
        ["totalProgress"] = 1,
        ["description"] = "Select the <font color=\"" .. v3.item .. "\">axe</font> in your inventory."
    }
}
v36.tasks = v37
v36.dialogue = {
    ["start"] = {
        "Now let\'s try to <font color=\"" .. v3.highlightBlue .. "\">break the bed</font>!",
        "You can use an <font color=\"" .. v3.item .. "\">axe</font> to break beds faster than a pickaxe.",
        "Use this axe to break the bed.",
        "Equip the <font color=\"" .. v3.item .. "\">axe</font> in your inventory."
    }
}
local v38 = {
    ["name"] = "Break Bed",
    ["prevSection"] = "equip_axe"
}
local v39 = {
    ["break_bed"] = {
        ["totalProgress"] = 1,
        ["description"] = "Break the <font color=\"" .. v3.enemy .. "\">enemy\'s bed</font> with your <font color=\"" .. v3.item .. "\">axe</font>."
    }
}
v38.tasks = v39
v38.dialogue = {
    ["start"] = { "Now we can quickly break the <font color=\"" .. v3.enemy .. "\">enemy\'s bed</font>." },
    ["end"] = { "Great job! When a player\'s bed is destroyed, they cannot respawn after dying." }
}
local v40 = {
    ["name"] = "Final Kill",
    ["prevSection"] = "break_bed"
}
local v41 = {
    ["final_kill"] = {
        ["totalProgress"] = 1,
        ["description"] = "Defeat the <font color=\"" .. v3.enemy .. "\">enemy</font> to win the game."
    }
}
v40.tasks = v41
v40.dialogue = {
    ["start"] = { "The <font color=\"" .. v3.enemy .. "\">enemy player</font> is back! But they don\'t have a bed anymore.", "Defeat the <font color=\"" .. v3.enemy .. "\">enemy</font> to win the game!" },
    ["end"] = { "Congratulations on your first victory!" }
}
return {
    ["BeginnerTutorialSections"] = {
        ["introduction"] = v4,
        ["generator"] = v5,
        ["block"] = v9,
        ["place_block"] = v11,
        ["equip_pickaxe"] = v13,
        ["break_block"] = v15,
        ["shop"] = v7,
        ["sprint"] = v19,
        ["bed"] = v17,
        ["path_to_diamond_emerald_gen"] = v22,
        ["diamond_emerald_gen"] = v24,
        ["recall"] = v26,
        ["team_upgrades"] = v28,
        ["purchase_upgrade"] = v30,
        ["basic_combat"] = v32,
        ["path_to_enemy_bed"] = v34,
        ["equip_axe"] = v36,
        ["break_bed"] = v38,
        ["final_kill"] = v40
    }
}