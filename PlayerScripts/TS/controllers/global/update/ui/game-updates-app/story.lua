-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameUpdateButtons = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons;
local GameUpdatesCore = RuntimeLib.import(script, script.Parent, "game-updates-core").GameUpdatesCore;

return function(p2) -- Line: 8
    -- upvalues: ClientStore (copy), GameUpdateButtons (copy), CreateRoduxApp (copy), GameUpdatesCore (copy), u1 (copy)
    ClientStore:dispatch({
        type = "GameUpdatesSetAll",
        updates = {
            {
                updateLogId = 24,
                visible = true,
                title = "Infected v2 + Sledgehammer",
                date = "11/11/2022",
                body = "🛰️ <b>Zenith (NEW kit!)</b>\nDeploy a satellite to disrupt enemy team economies. Targeted teams have increased shop prices, receive a cut of each shop purchase they make! When you die, your satellite is destroyed. Be careful, enemy teams know when you’re targeting them. \n\n<b>🌍 Friends List + Spectating</b>\nLocated under the Clans button, you can now see your Roblox friends that are online BedWars or Islands! Additionally, spectating friends is now a feature. The option to spectate your friends will appear in the friends list when they enter a match.\n\n<b>📣 Report Cheaters</b>\nYou can now directly report cheaters in-game! Open the scoreboard, click on the player, and then a report button will appear below.\n\n<b>🆓 Free Kits of The Week<b>\n🌲 Eldertree\n🏹 Archer\n🧑‍🍳 Baker\n\n🚧 <b>Balance Changes<b>\n[Kits]\n🟢 <b>Whim</b>\n- Base spell damage (12 → 14)\n- Spell knockback increased (1.5x)\n- Ice spell knockback increased (5.25x)\n- Fire spell damage increased (30 → 35)\n🟢 <b>Lani</b>\n- Scepter price (2 ems → 1 em)\n🟢 <b>Builder</b>\n- Reinforced blocks are more blast resistant\n🟢 <b>Axolotl Amy</b>\n- Break speed axolotl price (3 ems → 1 em)\n🟢 <b>Gingerbread Man</b>\n- Gumdrop shield increased (10 → 12)\n- Enemies no longer get the gumdrop when they break it\n- Enemies break gumdrop at 20% speed\n🔴 <b>Star Collector Stella</b>\n- Added crit damage now falls off based on number of consumed stars\n🔴 <b>Nyx</b>\n- Midnight duration (16s → 14s)\n🔴 <b>Kaliyah</b>\n- Kaliyah’s target will only explode and burn if they hit a block\n- Fire explosion radius (8 blocks → 7 blocks)\n- A punch victim can no longer be punched by another Kaliyah for 8s\n\n<b>⚙️ Other Changes</b>\n⚠️ Fixed bug where some abilities (including Evelynn) would cause lots of lag\n⚔️ Fixed the kill counter hud at the top of the screen\n🌈 Fixed prismatic Evelynn kit skin RGB effect\n🍯 Fixed Alchemist’s cauldron",
                new = true,
                pinned = false,
                image = {
                    assetId = "rbxassetid://11533510696",
                    aspectRatio = 1,
                    height = 150
                }
            },
            {
                title = "⚠️ Clans have been wiped! ⚠️",
                date = "3/07/2022",
                body = "🛡️ <b>CLAN WIPE</b>\nClans have been wiped. Make sure to make your new clan.\n\n⚠️ <b>All clan leaders before the wipe will be able to create a clan for free.</b> ⚠️\n\n<b>Other Changes</b>\n- VIP Gamepass owners are now able to create clans for free.\n- All clan creates will be free after the first purchase. (Clan leaders that have already purchased a clan will benefit from this automatically)\n- To compensate for lost progress we\'re enabling 2x daily coin limit & 2x clan coins for 3 days.\n- Clans will be able to earn more than the daily coin limit! All members will earn coins at 10% the rate after the clan reaches the daily coin limit.",
                new = true,
                pinned = false,
                image = {
                    assetId = "",
                    aspectRatio = 1,
                    height = 0
                }
            },
            {
                title = "100 Player Bed Royale! + Lucky Block Update",
                date = "1/7/2021",
                body = "🦆 <b>Battle Ducks!</b>\nBattle Duck Spawn Eggs are available in the Item Shop for 2 emeralds. Ducks patrol an area and attack detected intruders.\n\n👑 <b>Juggernaut TDM</b>\nA new limited time mode has hit the rotation this week! Two teams of 30 battle for the most kills in 10 minutes.\nJuggernaut Airdrops are deployed every 2 minutes. Obtaining a Juggernaut Airdrop transforms you into a powerful Juggernaut.\n\n🏮 <b>Lunar Vulcan (Limited Time Skin!)</b>\nThe Lunar Vulcan skin is now available! This limited time skin also includes a themed turret and tablet!\n\n🦋 <b>Aery Changes</b>\n- Slightly reduced damage scaling\n- Anti spawn killing: there is now a 30 second cooldown for gaining stacks against the same player\n\n🆓 <b>Free Kits of the Week</b>\n🔨 Builder\n💥 Davey\n🐮 Lassy\n\n🏗️ <b>Custom Match</b>\n- Players search bar\n- Force set a player’s team\n- Set a player’s max health\n- You can now pick the team to change the team generator multiplier speed for.\n- PvP enabled toggle\n- Lock server toggle\n- Server max player limit\n- Bed breaking enabled toggle\n- The default value of Team Overflow toggle has been changed from true → false\n- Team switching enabled toggle\n- Item limits toggle. Remove the item cap for items like the balloon.\n- Disable/Enable all purchasable items button\n- Added new commands:\n   - /tp (username or displayname)\n   - /tpall\n   - /tpbed &lt;team_bed&gt;\n   - Earlier this week: /spawn (item name) [amount]\n\n🗒️ <b>Other Changes</b>\n🎆 Removed firework arrows\n⚡ Tesla Trap: reduced max traps (4 → 2)\n💬 Reworked nametags to increase game clarity\n🎦 You now briefly spectate the player that killed you after dying\n💻 Vulcan: improved turret mobile controls\n🎁 Fixed sounds not working for the gift kill effect\n🌠 Spirit Catcher: released a new visual rework\n🏅 Rank icons are now displayed above your head in the Lobby\n",
                new = true,
                pinned = false,
                image = {
                    assetId = "rbxassetid://8480101402",
                    aspectRatio = 1,
                    height = 150
                }
            },
            {
                title = "New Maps + Double XP!",
                date = "10/15/2021",
                body = "This week is a little light as we are down to one week until the big Season 2 update.\n\n<b>🎉 Double XP  Enabled!</b>\nThis is the final week you can grind out Battle Pass levels. Once Season 2 starts all Season 1 Battle Pass kits will become unobtainable.\n\n<b>🙌 Free Kits of the Week</b>\n- Barbarian\n- Melody\n- Baker\n\n<b>🔥 Pyro Changes</b>\n- You now keep embers upon death (buff)\n- Significantly reduced cost of upgrades (buff)\n- Buffed fire damage\n- Brittle proc now has 20% armor penetration (buff)\n\n<b>🐦 Raven Changes</b>\n- Increased raven tick damage (4 -> 6)\n- Increased raven armor penetration (60% -> 70%)\n\n<b>🍀 Lucky Block Changes</b>\n- Added Charge Shield\n\n<b>🗺️ New Maps</b>\n- Launch (squads)\n- Observatory (squads)\n- Plaza (doubles)\n\n<b>🗒️ Other Changes</b>\n- Reduced leather armor cost (60 iron -> 50 iron)\n- Disabled chat sound in the lobby\n- Improved first person projectile aiming\n- Anticheat improvements\n- Bug fixes",
                new = false,
                pinned = false,
                image = {
                    assetId = "rbxassetid://7745109855",
                    aspectRatio = 1.7777777777777777,
                    height = 150
                }
            },
            {
                title = "Lucky Block Update!",
                date = "10/08/2021",
                body = "<b>✨ Lucky Block LTM</b>\n- This week we\'re hosting a new limited time mode called Lucky Block.\n- Find and break randomly placed Lucky Blocks for crazy (and sometimes dangerous) rewards.\n- Have fun exploring all the new items exclusive to this mode!\n\n<b>🙌 Free Kits of the Week</b>\n- Farmer Cletus\n- Builder\n- Lassy\n\n<b>🛡️ Custom Match Commands</b>\n- /disableKit (kit)\n- /announce [message]\n- /toggleSpawn (entity) (value)\n\n<b>Other Changes</b>\n- Nerfed dodo bird jump height, run speed and spawn rate",
                new = false,
                pinned = false,
                image = {
                    assetId = "rbxassetid://7681599456",
                    aspectRatio = 1,
                    height = 150
                }
            }
        },
        newestKit = GameUpdateButtons.newestKit,
        newestKitBG = GameUpdateButtons.newestKitBG
    });
    local u3 = CreateRoduxApp("GameUpdates", GameUpdatesCore, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 75
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;