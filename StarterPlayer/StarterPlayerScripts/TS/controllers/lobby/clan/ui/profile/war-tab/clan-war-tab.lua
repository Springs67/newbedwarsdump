local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.TabsComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u15 = v1.import(script, script.Parent, "clan-war-active-war-info").ClanWarActiveWarInfo
local u16 = v1.import(script, script.Parent, "clan-war-player-missions").ClanWarPlayerMissions
local u17 = v1.import(script, script.Parent, "leaderboard", "clan-war-leaderboard").ClanWarLeaderboard
local v18 = {}
local u19 = setmetatable({}, {
    ["__index"] = v18
})
u19.WAR = "war"
v18.war = "WAR"
u19.LEADERBOARD = "leaderboard"
v18.leaderboard = "LEADERBOARD"
u19.MISSIONS = "missions"
v18.missions = "MISSIONS"
local function v57(p20, p21) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
        [3] = u11
        [4] = u4
        [5] = u12
        [6] = u9
        [7] = u3
        [8] = u13
        [9] = u7
        [10] = u6
        [11] = u15
        [12] = u17
        [13] = u16
        [14] = u5
        [15] = u14
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local v24, u25 = v22(u19.WAR)
    local v26, u27 = v22(nil)
    local u28 = u8.new()
    local u29 = u11.getActiveClanWarId()
    local v30 = u11.areClanWarsDisabled()
    local u31 = p20.store.Clans.myClanId
    v23(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u4
            [3] = u12
            [4] = u27
            [5] = u28
            [6] = u31
        --]]
        if u29 == "" or not u29 then
            return nil
        end
        if not u4.isHoarceKat() then
            u12.Client:Get("RequestClanWarInfo"):CallServerAsync():andThen(function(p32) --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                if p32 then
                    u27(p32)
                end
            end)
        end
        if not u4.isHoarceKat() then
            u28:GiveTask(u12.Client:Get("SendClanWarInfo"):Connect(function(p33) --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27(p33.clanWarInfo)
            end))
        end
        u28:GiveTask(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u31
                [3] = u12
            --]]
            local v34 = not u4.isHoarceKat()
            if v34 then
                v34 = u31
            end
            if v34 ~= "" and v34 then
                u12.Client:Get("UnsubscribeClanWarInfo"):CallServerAsync(u31)
            end
        end)
        return function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:DoCleaning()
        end
    end, {})
    local v35 = {
        ["PaddingBottom"] = true
    }
    local v36 = {}
    local v37 = #v36
    local v38
    if v30 then
        v38 = u9.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = "RelativeYY",
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Text"] = "<b>CLAN WARS CURRENTLY <font color=\"" .. u3.richTextColor(u13.mcRed) .. "\">DISABLED</font></b>",
            ["TextColor3"] = u3.WHITE,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
    else
        v38 = v30
    end
    if v38 then
        v36[v37 + 1] = v38
    end
    local v39 = #v36
    local v40 = not v30
    if v40 then
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v42 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v43 = #v42
        local v44 = u7.values(u19)
        local v45 = table.create(#v44)
        local v46 = {
            ["Value"] = v24
        }
        for v47, v48 in v44 do
            local v49 = v47 - 1
            v45[v47] = {
                ["value"] = v48,
                ["text"] = string.upper(v48),
                ["layoutOrder"] = v49
            }
        end
        v46.Tabs = v45
        function v46.OnChange(p50) --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25(p50.value)
        end
        v46.FrameProps = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.08)
        }
        v46.UIListLayout = {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
        }
        v42[v43 + 1] = u9.createElement(u6, v46)
        local v51 = v43 + 2
        local v52
        if v24 == u19.WAR then
            v52 = u9.createElement(u15, {
                ["store"] = p20.store,
                ["ActiveClanWar"] = v26
            })
        else
            v52 = u9.createFragment()
        end
        v42[v51] = v52
        local v53 = #v42
        local v54
        if v24 == u19.LEADERBOARD then
            v54 = u9.createElement(u17)
        else
            v54 = false
        end
        if v54 then
            v42[v53 + 1] = v54
        end
        local v55 = #v42
        local v56
        if v24 == u19.MISSIONS then
            v56 = u9.createElement(u16, {
                ["store"] = p20.store
            })
        else
            v56 = false
        end
        if v56 then
            v42[v55 + 1] = v56
        end
        v40 = u9.createElement(u5, v41, v42)
    end
    if v40 then
        v36[v39 + 1] = v40
    end
    return u9.createElement(u14, v35, v36)
end
return {
    ["ClanWarTab"] = v10.new(u9)(v57)
}