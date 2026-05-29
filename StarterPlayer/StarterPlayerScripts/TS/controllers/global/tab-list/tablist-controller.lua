local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.Signal
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ContextActionService
local u9 = v7.StarterGui
local u10 = v7.UserInputService
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u15 = u1.import(script, script.Parent, "ui", "tab-list").TabList
local u16 = false
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "TablistController"
    end,
    ["__index"] = u11
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(u20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u2
        [4] = u15
        [5] = u1
    --]]
    u11.constructor(u20)
    u20.Name = "TablistController"
    u20.tablistOpen = false
    u20.NewScoreboardSnapshot = u5.new()
    function u20.openTablist() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u20
        --]]
        local v21 = {
            ["appId"] = "TabList",
            ["app"] = u15
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v21, {})
        u20.tablistOpen = true
    end
    function u20.closeTablist() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TabList")
        u20.tablistOpen = false
    end
    function u20.toggleTablist() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if u20.tablistOpen then
            u20.closeTablist()
        else
            u20.openTablist()
        end
        u20.tablistOpen = not u20.tablistOpen
    end
    function u20.getLatestScoreboardSnapshot() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        return u20.latestSnapshot
    end
    function u20.waitForScoreboardSnapshot() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u20
        --]]
        return u1.Promise.new(function(p22) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if u20.latestSnapshot then
                p22(u20.latestSnapshot)
            else
                p22(({ u20.NewScoreboardSnapshot:Wait() })[1])
            end
        end)
    end
end
function u17.KnitStart(u23) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u9
        [4] = u8
        [5] = u10
        [6] = u13
        [7] = u6
        [8] = u12
    --]]
    if u14.isLobbyServer() then
        u16 = true
    end
    if u14.isAfkServer() then
        u16 = true
    end
    if u16 then
        u9:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
        return nil
    end
    if not u16 then
        u8:BindAction("tab_list-toggle", function(_, p24, _) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u10
            --]]
            if p24 == Enum.UserInputState.Begin then
                u23.openTablist()
            end
            if not u10.GamepadEnabled and (p24 == Enum.UserInputState.End or p24 == Enum.UserInputState.Change) then
                u23.closeTablist()
            end
        end, false, Enum.KeyCode.Tab, Enum.KeyCode.ButtonSelect)
    end
    u13.Client:WaitFor("SendTablistSnapshot"):andThen(function(p25) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
            [3] = u23
        --]]
        p25:Connect(function(p26) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
                [3] = u23
            --]]
            local v27 = u6.entries(p26.players)
            local v28 = {}
            for v29 = 1, #v27 do
                local v30 = v27[v29]
                local _ = v29 - 1
                local v31 = v30[1]
                local v32 = v30[2]
                v28[tonumber(v31)] = v32
            end
            p26.players = v28
            local v33 = u6.entries(p26.players)
            local v34 = {}
            for v35 = 1, #v33 do
                local v36 = v33[v35]
                local _ = v35 - 1
                local v37 = v36[1]
                local v38 = v36[2]
                local v39 = v38.offlinePlayerDisplay
                if v39 ~= nil then
                    v39 = v39.userId
                end
                if v39 ~= nil then
                    v37 = v39
                end
                v34[v37] = v38.kills
            end
            local v40 = {}
            for v41 = 1, #v33 do
                local v42 = v33[v41]
                local _ = v41 - 1
                v40[v42[1]] = v42[2].eliminated
            end
            local v43 = {
                ["type"] = "BedwarsSetSome",
                ["data"] = {
                    ["kills"] = v34,
                    ["finalDeaths"] = v40
                }
            }
            u12:dispatch(v43)
            for v44, v45 in v33 do
                local _ = v44 - 1
                local v46 = v45[1]
                local v47 = v45[2]
                if v47.kit then
                    u12:dispatch({
                        ["type"] = "BedwarsSetKits",
                        ["userId"] = v46,
                        ["kit"] = v47.kit
                    })
                end
            end
            for v48, v49 in u6.entries(p26.teams) do
                local _ = v48 - 1
                local v50 = v49[1]
                local v51 = v49[2]
                u12:dispatch({
                    ["type"] = "BedwarsSetBedStatus",
                    ["teamId"] = tostring(v50),
                    ["bedStatus"] = v51.bedStatus
                })
            end
            u23.latestSnapshot = p26
            u23.NewScoreboardSnapshot:Fire(p26)
        end)
    end)
    u13.Client:WaitFor("SendTablistPlayerUpdate"):andThen(function(p52) --[[ Line: 198 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        p52:Connect(function(p53, p54) --[[ Line: 199 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            if p54.isEliminated then
                u12:dispatch({
                    ["type"] = "BedwarsSetFinalDeaths",
                    ["userId"] = p53,
                    ["dead"] = p54.isEliminated
                })
            end
        end)
    end)
    u13.Client:WaitFor("SendTablistTeamUpdate"):andThen(function(p55) --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        p55:Connect(function(p56, p57) --[[ Line: 212 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12:dispatch({
                ["type"] = "BedwarsSetBedStatus",
                ["teamId"] = tostring(p56),
                ["bedStatus"] = p57.bedStatus
            })
        end)
    end)
    u13.Client:WaitFor("SendTablistTeamsUpdate"):andThen(function(p58) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        p58:Connect(function(p59) --[[ Line: 223 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
            --]]
            for v60, v61 in u6.entries(p59) do
                local _ = v60 - 1
                local v62 = v61[1]
                local v63 = v61[2]
                u12:dispatch({
                    ["type"] = "BedwarsSetBedStatus",
                    ["teamId"] = tostring(v62),
                    ["bedStatus"] = v63.bedStatus
                })
            end
        end)
    end)
    u13.Client:Get("RequestTablistSnapshot"):SendToServer()
end
return {
    ["TablistController"] = v4.CreateController(u17.new())
}