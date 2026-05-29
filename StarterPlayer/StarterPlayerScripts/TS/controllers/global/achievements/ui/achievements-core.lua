local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent, "achievements-list").AchievementsList
local u15 = v1.import(script, script.Parent, "sidebar", "achievements-sidebar").AchievementsSidebar
local v36 = v7.new(u6)(function(u16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u12
        [4] = u9
        [5] = u10
        [6] = u6
        [7] = u5
        [8] = u13
        [9] = u14
        [10] = u15
        [11] = u4
    --]]
    local v18 = p17.useState
    local v19 = p17.useEffect
    local v20
    if u3.isHoarceKat() then
        v20 = u11.MULTIKILLCHAIN_1
    else
        v20 = nil
    end
    local u21, u22 = v18(v20)
    local u23
    if u16.ViewingAsLocalPlayer then
        u23 = u16.store.Lobby.profileData
    else
        u23 = u16.ProfileData or u16.store.Lobby.currentlyViewingProfileData
    end
    v19(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u16
            [3] = u12
            [4] = u9
            [5] = u10
        --]]
        if not u23 and u16.ViewingAsLocalPlayer then
            task.spawn(function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u9
                    [3] = u10
                    [4] = u23
                --]]
                u12.Client:Get("RequestProfileData"):CallServerAsync(u9.LocalPlayer):andThen(function(p24) --[[ Line: 25 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u23
                    --]]
                    if p24 then
                        u10:dispatch({
                            ["type"] = "LobbySetProfileData",
                            ["profileData"] = p24
                        })
                        u23 = p24
                    end
                end)
            end)
        end
    end)
    local v25 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v26 = u16.FrameProps
    if v26 then
        for v27, v28 in v26 do
            v25[v27] = v28
        end
    end
    local v29 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v30 = #v29
    local v31 = {}
    local v32 = {}
    local v33
    if u16.ViewingOnProfile then
        v33 = UDim2.fromScale(1, 1)
    else
        v33 = UDim2.fromScale(0.7, 1) - UDim2.fromOffset(10, 0)
    end
    v32.Size = v33
    v31.FrameProps = v32
    v31.ProfileData = u23
    function v31.OnSelect(p34) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
            [3] = u5
            [4] = u13
        --]]
        if p34 == u21 then
            u22(nil)
        else
            u22(p34)
        end
        u5:playSound(u13.UI_CLICK_2)
    end
    v31.Selected = u21
    v31.ViewingOnProfile = u16.ViewingOnProfile
    v29[v30 + 1] = u6.createElement(u14, v31)
    local v35 = u23 and not u16.ViewingOnProfile
    if v35 then
        v35 = u6.createElement(u15, {
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.3, 1)
            },
            ["ProfileData"] = u23,
            ["SelectedAch"] = u21
        })
    end
    if v35 then
        v29[v30 + 2] = v35
    end
    return u6.createElement(u4, v25, v29)
end)
return {
    ["AchievementsCore"] = v8.connect(function(p37, p38) --[[ Line: 94 ]]
        local v39 = {}
        for v40, v41 in p38 do
            v39[v40] = v41
        end
        v39.store = p37
        return v39
    end)(v36)
}