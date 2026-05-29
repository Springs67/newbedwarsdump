local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local u5 = v3.ScaleComponent
local u6 = v3.SoundManager
local u7 = v3.WidgetComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "create", "clan-create-tab").ClanCreateTab
local u14 = v1.import(script, script.Parent, "invites", "clan-menu-invites").ClanMenuInvites
local u15 = v1.import(script, script.Parent, "search", "clan-menu-search-tab").ClanMenuSearchTab
local v16 = {}
local u17 = setmetatable({}, {
    ["__index"] = v16
})
u17.SEARCH = "search"
v16.search = "SEARCH"
u17.INVITES = "invites"
v16.invites = "INVITES"
u17.CREATE = "create"
v16.create = "CREATE"
local u18 = {
    {
        ["text"] = "Search",
        ["layoutOrder"] = 1,
        ["value"] = u17.SEARCH
    },
    {
        ["text"] = "Invites",
        ["layoutOrder"] = 2,
        ["value"] = u17.INVITES
    },
    {
        ["text"] = "Create",
        ["layoutOrder"] = 3,
        ["value"] = u17.CREATE
    }
}
local function v42(u19, p20) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u18
        [4] = u12
        [5] = u9
        [6] = u5
        [7] = u2
        [8] = u6
        [9] = u11
        [10] = u15
        [11] = u14
        [12] = u13
        [13] = u4
        [14] = u7
    --]]
    local v21 = p20.useState
    local _ = p20.useEffect
    local v22, u23 = v21(u19.StartingTab or u17.SEARCH)
    local v24 = 0
    local v25 = {}
    for v26, v27 in u8.values(u18) do
        local _ = v26 - 1
        if (v27.value == u17.SEARCH or u19.store.Clans.myClanId == nil) == true then
            v24 = v24 + 1
            v25[v24] = v27
        end
    end
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = u12.widgetSize
    }
    local v29 = { u9.createElement(u5, {
            ["MaximumSize"] = u12.widgetScaleComponentMaxSize,
            ["ScreenPadding"] = u12.widgetScaleComponentScreenPadding
        }) }
    local v30 = #v29
    local v32 = {
        ["ClipsDescendents"] = true,
        ["Title"] = "Clan Menu",
        ["AppId"] = u19.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 86 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u19
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.AppId)
        end,
        ["Navbar"] = {
            ["Value"] = v22,
            ["Tabs"] = v25,
            ["UIListLayout"] = {
                ["Padding"] = UDim.new(0.09, 0)
            },
            ["OnChange"] = function(p31) --[[ Name: OnChange, Line 95 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u6
                    [3] = u11
                --]]
                u23(p31.value)
                u6:playSound(u11.UI_CLICK)
            end
        }
    }
    local v33 = {}
    local _ = #v33
    local v34 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v35 = { u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.03, 0),
            ["PaddingBottom"] = UDim.new(0.04, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }) }
    local v36 = #v35
    local v37
    if v22 == u17.SEARCH then
        v37 = u9.createElement(u15)
    else
        v37 = false
    end
    if v37 then
        v35[v36 + 1] = v37
    end
    local v38 = #v35
    local v39
    if v22 == u17.INVITES and u19.store.Clans.myClanId == nil then
        v39 = u9.createElement(u14, {
            ["AppId"] = "ClanMenuInvites"
        })
    else
        v39 = false
    end
    if v39 then
        v35[v38 + 1] = v39
    end
    local v40 = #v35
    local v41
    if v22 == u17.CREATE and u19.store.Clans.myClanId == nil then
        v41 = u9.createElement(u13, {
            ["store"] = u19.store
        })
    else
        v41 = false
    end
    if v41 then
        v35[v40 + 1] = v41
    end
    v33.Content = u9.createElement(u4, v34, v35)
    v29[v30 + 1] = u9.createElement(u7, v32, v33)
    return u9.createElement("Frame", v28, v29)
end
return {
    ["ClanMenuTab"] = u17,
    ["ClanMenu"] = v10.new(u9)(v42)
}