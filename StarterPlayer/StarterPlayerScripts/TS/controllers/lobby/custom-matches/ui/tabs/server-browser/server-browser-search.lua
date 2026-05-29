local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = v4.deepCopy
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-types")
local v9 = v8.MapBrowserQueryFields
local v10 = v8.MapBrowserSortFields
local u11 = v8.SortPreference
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants
local _ = {
    {
        ["text"] = "ALL",
        ["value"] = "all"
    },
    {
        ["text"] = "MAP TITLE",
        ["value"] = v9["0" + 1]
    },
    {
        ["text"] = "MAP DESCRIPTION",
        ["value"] = v9["1" + 1]
    },
    {
        ["text"] = "CREATOR",
        ["value"] = v9["2" + 1]
    },
    {
        ["text"] = "MAP CODE",
        ["value"] = v9["3" + 1]
    }
}
local v13 = { "dislikes" }
local v14 = 0
local v15 = {}
for v16, v17 in v5(v10) do
    local _ = v16 - 1
    if table.find(v13, v17) == nil == true then
        v14 = v14 + 1
        v15[v14] = v17
    end
end
local v18 = table.create(#v15)
for v19, v20 in v15 do
    local _ = v19 - 1
    v18[v19] = {
        ["text"] = "SORT: " .. string.upper(v20),
        ["value"] = v20
    }
end
local v21 = v4.entries(u11)
local v22 = table.create(#v21)
for v23, v24 in v21 do
    local _ = v23 - 1
    local v25 = v24[1]
    local v26 = v24[2]
    v22[v23] = {
        ["text"] = "SORT: " .. string.upper(v25),
        ["value"] = tostring(v26)
    }
end
return {
    ["ServerBrowserSearch"] = v7.new(u6)(function(u27, p28) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
            [3] = u2
            [4] = u12
            [5] = u6
        --]]
        local v29 = p28.useState
        local v30 = p28.useBinding
        local v31 = p28.useEffect
        local _, _ = v29(u11.DESCENDING)
        local u32, u33 = v29("")
        local u34, u35 = v30(0)
        local function u44(p36, _, p37) --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u27
                [3] = u3
            --]]
            u33(p36)
            u27.SetLoading(true)
            local u38 = {}
            if p37 ~= nil then
                p37 = p37.skip
            end
            u38.skip = p37 == nil and 0 or p37
            local v39 = u3.Controllers.LiveGamesBrowserController
            local v40 = {}
            for v41, v42 in u38 do
                v40[v41] = v42
            end
            v39:searchServers(v40):andThen(function(p43) --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u38
                --]]
                u27.onSearchComplete(u38, p43)
                u27.SetLoading(false)
            end)
        end
        v31(function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u27
                [3] = u2
                [4] = u44
                [5] = u32
                [6] = u12
                [7] = u35
            --]]
            if u34:getValue() == u27.Page then
                return nil
            end
            if not u2.isHoarceKat() then
                u44(u32, false, {
                    ["skip"] = (u27.Page - 1) * u12.GAMES_PER_PAGE
                })
            end
            u35(u27.Page)
        end, { u27.Page })
        return u6.createFragment()
    end)
}