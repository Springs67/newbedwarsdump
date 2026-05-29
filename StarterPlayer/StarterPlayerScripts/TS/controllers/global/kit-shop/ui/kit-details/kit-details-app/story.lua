local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, script.Parent, "kit-details-app").KitDetailsApp
return function(p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u11
        [4] = u5
        [5] = u9
        [6] = u8
        [7] = u6
        [8] = u7
        [9] = u10
        [10] = u3
        [11] = u4
        [12] = u13
    --]]
    local function v19() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u11
        --]]
        local v15 = u2.values(u12)
        local v16 = table.create(#v15)
        for v17, v18 in v15 do
            local _ = v17 - 1
            v16[v17] = { v18, u11.DEFAULT }
        end
        return u2.fromEntries(v16)
    end
    local v20 = u5.Store.new
    local v21 = {
        ["Lobby"] = u9,
        ["Bedwars"] = u8,
        ["ArmorTrim"] = u6,
        ["Consumable"] = u7
    }
    local v22 = u5.combineReducers(v21)
    local v23 = {}
    local v24 = {}
    local v25 = {
        [u12.BARBARIAN] = {
            ["wins"] = 500,
            ["kills"] = 400
        },
        [u12.SPIRIT_ASSASSIN] = {
            ["wins"] = 1000,
            ["kills"] = 1000,
            ["dashes"] = 132,
            ["dash kills"] = 12
        },
        [u12.JELLYFISH] = {
            ["wins"] = 1000,
            ["kills"] = 1000
        }
    }
    v24.kitStatsProfiles = v25
    local v26 = {
        [u12.SPIRIT_ASSASSIN] = {
            ["purchasedUnlock"] = false,
            ["claimedRewards"] = {}
        },
        [u12.SUMMONER] = {
            ["purchasedUnlock"] = false,
            ["claimedRewards"] = {}
        }
    }
    v24.kitContractProfiles = v26
    v23.Lobby = v24
    local v27 = {}
    local v28 = {
        [u12.JELLYFISH] = {
            {
                ["xpEarned"] = 45000,
                ["trim"] = u10.TRIM_5
            }
        },
        [u12.AERY] = {
            {
                ["xpEarned"] = 1000,
                ["trim"] = u10.TRIM_1
            }
        }
    }
    v27.allKitProgress = v28
    v27.effectUnlocks = {}
    v27.allKitXpPotential = {
        [u12.JELLYFISH] = 200000
    }
    local v29 = {
        [u12.JELLYFISH] = {
            ["type"] = u10.TRIM_5,
            ["color"] = {
                ["r"] = 100,
                ["g"] = 100,
                ["b"] = 255
            }
        }
    }
    v27.selectedArmorTrimConfigs = v29
    v23.ArmorTrim = v27
    local v30 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["favoriteKits"] = {
            [u12.CYBER] = true,
            [u12.NAZAR] = true,
            [u12.FROSTY_HAMMER] = true
        },
        ["kits"] = {},
        ["ownedKits"] = { u12.GUN_BLADE },
        ["kit"] = u12.GUN_BLADE,
        ["equippedKitSkins"] = v19(),
        ["ownedKitSkins"] = { u11.JELLYFISH_DESSERT }
    }
    v23.Bedwars = v30
    v23.Consumable = {
        ["record"] = {}
    }
    local v31 = v20(v22, v23)
    local u32 = u3.mount(u3.createElement(u4, {
        ["store"] = v31
    }, { u3.createElement(u13, {
            ["AppId"] = "KitDetailsApp",
            ["SelectedKit"] = u12.LYLA
        }) }), p14)
    return function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u32
        --]]
        u3.unmount(u32)
    end
end