local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.ImageId
local u7 = v3.ScaleComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").Party
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "kit", "hotbar-kit-viewport").HotbarKitViewport
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "party", "hotbar-party-member-list").HotbarPartyMemberList
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge
local u18 = v1.import(script, script.Parent, "lobby-hud-main-button").LobbyHudMainButton
local u19 = v1.import(script, script.Parent, "lobby-hud-play-button").LobbyHudPlayButton
local v44 = v10.new(u9)(function(p20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u7
        [4] = u14
        [5] = u6
        [6] = u8
        [7] = u12
        [8] = u2
        [9] = u16
        [10] = u17
        [11] = u18
        [12] = u19
        [13] = u15
        [14] = u13
        [15] = u5
    --]]
    local _ = p21.useState
    local v22 = {
        ["ResetOnSpawn"] = false
    }
    local v23 = {}
    local v24 = #v23
    local v25 = {
        ["Size"] = UDim2.fromOffset(700, 60),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, u4.isSmallScreen() and 0.8 or 0.9)
    }
    local v26 = { u9.createElement(u7, {
            ["MaximumSize"] = Vector2.new(u4.isSmallScreen() and 450 or 700, u4.isSmallScreen() and 40 or 60)
        }), u9.createElement(u14, {
            ["LayoutOrder"] = 1,
            ["store"] = p20.store,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(0.03, 0.5)
        }) }
    local _ = #v26
    local v27 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v28 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v29 = #v28
    local v30 = {
        ["store"] = p20.store,
        ["Icon"] = u6.PARTY
    }
    local v31
    if p20.partyMemberCount > 1 then
        local v32 = p20.partyMemberCount
        local v33 = tostring(v32)
        local v34 = u8.MAX_SIZE
        v31 = "Party (" .. v33 .. "/" .. tostring(v34) .. ")"
    else
        v31 = "Create Party"
    end
    v30.Text = v31
    function v30.OnClick() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u2
            [3] = u16
        --]]
        local v35 = u12.LocalPlayer:GetAttribute("ResolvingMatchDisconnect")
        if v35 ~= 0 and (v35 == v35 and (v35 ~= "" and v35)) then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.PARTY, {})
    end
    v30.FrameProps = {
        ["Size"] = UDim2.fromScale(0.25, 0.7)
    }
    local v36 = {}
    local v37 = #v36
    local v38
    if p20.numIncomingInvites > 0 then
        local v39 = u9.createElement
        local v40 = u17
        local v41 = {}
        local v42 = p20.numIncomingInvites
        v41.Text = tostring(v42)
        v38 = v39(v40, v41)
    else
        v38 = false
    end
    if v38 then
        v36[v37 + 1] = v38
    end
    v28[v29 + 1] = u9.createElement(u18, v30, v36)
    v28[v29 + 2] = u9.createElement(u19, {
        ["FrameProps"] = {
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
    })
    v28[v29 + 3] = u9.createElement(u18, {
        ["Text"] = "Kits",
        ["store"] = p20.store,
        ["OnClick"] = function() --[[ Name: OnClick, Line 91 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u2
                [3] = u16
                [4] = u15
            --]]
            local v43 = u12.LocalPlayer:GetAttribute("ResolvingMatchDisconnect")
            if v43 ~= 0 and (v43 == v43 and (v43 ~= "" and v43)) then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.KIT_SHOP_APP, {
                ["SelectedKit"] = u15:getState().Bedwars.kit
            })
        end,
        ["FrameProps"] = {
            ["Size"] = UDim2.fromScale(0.25, 0.7)
        }
    }, { u9.createElement(u13, {
            ["store"] = p20.store,
            ["Size"] = UDim2.fromScale(1.5, 1.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0.02, 0.48)
        }) })
    v26.ButtonList = u9.createElement(u5, v27, v28)
    v23[v24 + 1] = u9.createElement(u5, v25, v26)
    return u9.createElement("ScreenGui", v22, v23)
end)
return {
    ["LobbyHudMain"] = v11.connect(function(p45, p46) --[[ Line: 116 ]]
        local v47 = {}
        for v48, v49 in p46 do
            v47[v48] = v49
        end
        v47.store = p45
        v47.partyMemberCount = #p45.Party.members + 1
        v47.numIncomingInvites = #p45.PartyInvites.incomingInvites
        return v47
    end)(v44)
}