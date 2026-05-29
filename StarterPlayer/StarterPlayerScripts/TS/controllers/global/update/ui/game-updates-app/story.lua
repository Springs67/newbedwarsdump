local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons
local u6 = v1.import(script, script.Parent, "game-updates-core").GameUpdatesCore
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
        [4] = u6
        [5] = u2
    --]]
    local v8 = u4
    local v9 = {
        ["type"] = "GameUpdatesSetAll",
        ["updates"] = {
            {
                ["updateLogId"] = 24,
                ["visible"] = true,
                ["title"] = "Infected v2 + Sledgehammer",
                ["date"] = "11/11/2022",
                ["body"] = "\240\159\155\176\239\184\143 <b>Zenith (NEW kit!)</b>\nDeploy a satellite to disrupt enemy team economies. Targeted teams have increased shop prices, receive a cut of each shop purchase they make! When you die, your satellite is destroyed. Be careful, enemy teams know when you\226\128\153re targeting them. \n\n<b>\240\159\140\141 Friends List + Spectating</b>\nLocated under the Clans button, you can now see your Roblox friends that are online BedWars or Islands! Additionally, spectating friends is now a feature. The option to spectate your friends will appear in the friends list when they enter a match.\n\n<b>\240\159\147\163 Report Cheaters</b>\nYou can now directly report cheaters in-game! Open the scoreboard, click on the player, and then a report button will appear below.\n\n<b>\240\159\134\147 Free Kits of The Week<b>\n\240\159\140\178 Eldertree\n\240\159\143\185 Archer\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\n\240\159\154\167\194\160<b>Balance Changes<b>\n[Kits]\n\240\159\159\162 <b>Whim</b>\n- Base spell damage (12 \226\134\146 14)\n- Spell knockback increased (1.5x)\n- Ice spell knockback increased (5.25x)\n- Fire spell damage increased (30 \226\134\146 35)\n\240\159\159\162 <b>Lani</b>\n- Scepter price (2 ems \226\134\146 1 em)\n\240\159\159\162 <b>Builder</b>\n- Reinforced blocks are more blast resistant\n\240\159\159\162 <b>Axolotl Amy</b>\n- Break speed axolotl price (3 ems \226\134\146 1 em)\n\240\159\159\162 <b>Gingerbread Man</b>\n- Gumdrop shield increased (10 \226\134\146 12)\n- Enemies no longer get the gumdrop when they break it\n- Enemies break gumdrop at 20% speed\n\240\159\148\180 <b>Star Collector Stella</b>\n- Added crit damage now falls off based on number of consumed stars\n\240\159\148\180 <b>Nyx</b>\n- Midnight duration (16s \226\134\146 14s)\n\240\159\148\180 <b>Kaliyah</b>\n- Kaliyah\226\128\153s target will only explode and burn if they hit a block\n- Fire explosion radius (8 blocks \226\134\146 7 blocks)\n- A punch victim can no longer be punched by another Kaliyah for 8s\n\n<b>\226\154\153\239\184\143 Other Changes</b>\n\226\154\160\239\184\143 Fixed bug where some abilities (including Evelynn) would cause lots of lag\n\226\154\148\239\184\143 Fixed the kill counter hud at the top of the screen\n\240\159\140\136 Fixed prismatic Evelynn kit skin RGB effect\n\240\159\141\175\194\160Fixed Alchemist\226\128\153s cauldron",
                ["new"] = true,
                ["pinned"] = false,
                ["image"] = {
                    ["assetId"] = "rbxassetid://11533510696",
                    ["aspectRatio"] = 1,
                    ["height"] = 150
                }
            },
            {
                ["title"] = "\226\154\160\239\184\143 Clans have been wiped! \226\154\160\239\184\143",
                ["date"] = "3/07/2022",
                ["body"] = "\240\159\155\161\239\184\143 <b>CLAN WIPE</b>\nClans have been wiped. Make sure to make your new clan.\n\n\226\154\160\239\184\143 <b>All clan leaders before the wipe will be able to create a clan for free.</b> \226\154\160\239\184\143\n\n<b>Other Changes</b>\n- VIP Gamepass owners are now able to create clans for free.\n- All clan creates will be free after the first purchase. (Clan leaders that have already purchased a clan will benefit from this automatically)\n- To compensate for lost progress we\'re enabling 2x daily coin limit & 2x clan coins for 3 days.\n- Clans will be able to earn more than the daily coin limit! All members will earn coins at 10% the rate after the clan reaches the daily coin limit.",
                ["new"] = true,
                ["pinned"] = false,
                ["image"] = {
                    ["assetId"] = "",
                    ["aspectRatio"] = 1,
                    ["height"] = 0
                }
            },
            {
                ["title"] = "100 Player Bed Royale! + Lucky Block Update",
                ["date"] = "1/7/2021",
                ["body"] = "\240\159\166\134 <b>Battle Ducks!</b>\nBattle Duck Spawn Eggs are available in the Item Shop for 2 emeralds. Ducks patrol an area and attack detected intruders.\n\n\240\159\145\145 <b>Juggernaut TDM</b>\nA new limited time mode has hit the rotation this week! Two teams of 30 battle for the most kills in 10 minutes.\nJuggernaut Airdrops are deployed every 2 minutes. Obtaining a Juggernaut Airdrop transforms you into a powerful Juggernaut.\n\n\240\159\143\174 <b>Lunar Vulcan (Limited Time Skin!)</b>\nThe Lunar Vulcan skin is now available! This limited time skin also includes a themed turret and tablet!\n\n\240\159\166\139 <b>Aery Changes</b>\n- Slightly reduced damage scaling\n- Anti spawn killing: there is now a 30 second cooldown for gaining stacks against the same player\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\148\168 Builder\n\240\159\146\165 Davey\n\240\159\144\174 Lassy\n\n\240\159\143\151\239\184\143 <b>Custom Match</b>\n- Players search bar\n- Force set a player\226\128\153s team\n- Set a player\226\128\153s max health\n- You can now pick the team to change the team generator multiplier speed for.\n- PvP enabled toggle\n- Lock server toggle\n- Server max player limit\n- Bed breaking enabled toggle\n- The default value of Team Overflow toggle has been changed from true \226\134\146 false\n- Team switching enabled toggle\n- Item limits toggle. Remove the item cap for items like the balloon.\n- Disable/Enable all purchasable items button\n- Added new commands:\n   - /tp (username or displayname)\n   - /tpall\n   - /tpbed &lt;team_bed&gt;\n   - Earlier this week: /spawn (item name) [amount]\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\142\134 Removed firework arrows\n\226\154\161 Tesla Trap: reduced max traps (4 \226\134\146 2)\n\240\159\146\172 Reworked nametags to increase game clarity\n\240\159\142\166 You now briefly spectate the player that killed you after dying\n\240\159\146\187 Vulcan: improved turret mobile controls\n\240\159\142\129 Fixed sounds not working for the gift kill effect\n\240\159\140\160 Spirit Catcher: released a new visual rework\n\240\159\143\133 Rank icons are now displayed above your head in the Lobby\n",
                ["new"] = true,
                ["pinned"] = false,
                ["image"] = {
                    ["assetId"] = "rbxassetid://8480101402",
                    ["aspectRatio"] = 1,
                    ["height"] = 150
                }
            },
            {
                ["title"] = "New Maps + Double XP!",
                ["date"] = "10/15/2021",
                ["body"] = "This week is a little light as we are down to one week until the big Season 2 update.\n\n<b>\240\159\142\137 Double XP  Enabled!</b>\nThis is the final week you can grind out Battle Pass levels. Once Season 2 starts all Season 1 Battle Pass kits will become unobtainable.\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Barbarian\n- Melody\n- Baker\n\n<b>\240\159\148\165 Pyro Changes</b>\n- You now keep embers upon death (buff)\n- Significantly reduced cost of upgrades (buff)\n- Buffed fire damage\n- Brittle proc now has 20% armor penetration (buff)\n\n<b>\240\159\144\166 Raven Changes</b>\n- Increased raven tick damage (4 -> 6)\n- Increased raven armor penetration (60% -> 70%)\n\n<b>\240\159\141\128 Lucky Block Changes</b>\n- Added Charge Shield\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n- Launch (squads)\n- Observatory (squads)\n- Plaza (doubles)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n- Reduced leather armor cost (60 iron -> 50 iron)\n- Disabled chat sound in the lobby\n- Improved first person projectile aiming\n- Anticheat improvements\n- Bug fixes",
                ["new"] = false,
                ["pinned"] = false,
                ["image"] = {
                    ["assetId"] = "rbxassetid://7745109855",
                    ["aspectRatio"] = 1.7777777777777777,
                    ["height"] = 150
                }
            },
            {
                ["title"] = "Lucky Block Update!",
                ["date"] = "10/08/2021",
                ["body"] = "<b>\226\156\168 Lucky Block LTM</b>\n- This week we\'re hosting a new limited time mode called Lucky Block.\n- Find and break randomly placed Lucky Blocks for crazy (and sometimes dangerous) rewards.\n- Have fun exploring all the new items exclusive to this mode!\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Farmer Cletus\n- Builder\n- Lassy\n\n<b>\240\159\155\161\239\184\143 Custom Match Commands</b>\n- /disableKit (kit)\n- /announce [message]\n- /toggleSpawn (entity) (value)\n\n<b>Other Changes</b>\n- Nerfed dodo bird jump height, run speed and spawn rate",
                ["new"] = false,
                ["pinned"] = false,
                ["image"] = {
                    ["assetId"] = "rbxassetid://7681599456",
                    ["aspectRatio"] = 1,
                    ["height"] = 150
                }
            }
        },
        ["newestKit"] = u5.newestKit,
        ["newestKitBG"] = u5.newestKitBG
    }
    v8:dispatch(v9)
    local u10 = u3("GameUpdates", u6, {}, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        u2.unmount(u10)
    end
end