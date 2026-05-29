local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.OfflinePlayerUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "all-random-kit-draft-reducer").ARKDraftReducer
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, script.Parent, "all-random-kit-draft-app").AllRandomKitDraftApp
return function(p17) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u13
        [4] = u5
        [5] = u15
        [6] = u14
        [7] = u8
        [8] = u12
        [9] = u11
        [10] = u10
        [11] = u9
        [12] = u6
        [13] = u7
        [14] = u16
    --]]
    local v18 = {}
    local v19 = {
        ["id"] = "1",
        ["name"] = "Orange",
        ["members"] = {
            [u4.Dummy.Chase.userId] = u4.Dummy.Chase,
            [u4.Dummy.oiogy.userId] = u4.Dummy.oiogy,
            [u4.Dummy.Bryan3838.userId] = u4.Dummy.Bryan3838,
            [u4.Dummy.Rascal.userId] = u4.Dummy.Rascal,
            [u4.Dummy.Asen.userId] = u4.Dummy.Asen
        },
        ["color"] = u3.hexColor(u13.orange)
    }
    local v20 = {
        ["id"] = "2",
        ["name"] = "Pink",
        ["members"] = {
            [u4.Dummy.LongNameMan.userId] = u4.Dummy.LongNameMan,
            [u4.Dummy.DVwastaken.userId] = u4.Dummy.DVwastaken
        },
        ["color"] = u3.hexColor(u13.pink)
    }
    __set_list(v18, 1, {v19, v20})
    local function v25() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u14
        --]]
        local v21 = u5.values(u15)
        local v22 = table.create(#v21)
        for v23, v24 in v21 do
            local _ = v23 - 1
            v22[v23] = { v24, u14.DEFAULT }
        end
        return u5.fromEntries(v22)
    end
    local v26 = u8.Store.new
    local v27 = {
        ["Game"] = u12,
        ["Bedwars"] = u11,
        ["ARKDraft"] = u10
    }
    local v28 = u8.combineReducers(v27)
    local v29 = {}
    local v30 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["favoriteKits"] = {
            [u15.CYBER] = true,
            [u15.NAZAR] = true,
            [u15.FROSTY_HAMMER] = true
        },
        ["ownedKits"] = { u15.FROSTY_HAMMER },
        ["equippedKitSkins"] = v25()
    }
    v29.Bedwars = v30
    v29.Game = {
        ["myTeam"] = v18[1],
        ["teams"] = v18,
        ["startTime"] = u9:GetServerTimeNow() + 15
    }
    local v31 = {
        ["kitSelection"] = {
            [u4.Dummy.Bryan3838.userId] = u15.FROSTY_HAMMER
        },
        ["kitPool"] = {
            {
                ["kit"] = u15.AERY,
                ["othersCooldownExpireTime"] = u9:GetServerTimeNow(),
                ["prevSelectionUserCooldownExpireTime"] = u9:GetServerTimeNow(),
                ["prevSelectionUser"] = u4.Dummy.Bryan3838.userId
            }
        },
        ["playerRerolls"] = {
            [u4.Dummy.Bryan3838.userId] = 2
        }
    }
    v29.ARKDraft = v31
    local v32 = {
        ["store"] = v26(v28, v29)
    }
    local u33 = u6.mount(u6.createElement(u7, v32, { u6.createElement(u16, {
            ["AppId"] = "AllRandomKitDraftApp"
        }) }), p17)
    return function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u33
        --]]
        return u6.unmount(u33)
    end
end