local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Lighting
local u11 = v9.TweenService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
local u15 = nil
local function v17(p16) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
    --]]
    return u7.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 90,
        ["ScreenInsets"] = Enum.ScreenInsets.None
    }, { u7.createElement(u15, {
            ["store"] = p16.store
        }) })
end
u15 = v8.new(u7)(function(_, p18) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
        [4] = u10
        [5] = u5
        [6] = u12
        [7] = u11
        [8] = u14
        [9] = u13
        [10] = u3
    --]]
    local _ = p18.useState
    local v19 = p18.useEffect
    local u20 = u7.createRef()
    v19(function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u4
            [3] = u6
            [4] = u10
            [5] = u5
            [6] = u12
            [7] = u11
            [8] = u14
            [9] = u13
        --]]
        local u21 = u20:getValue()
        local u22 = nil
        local u23 = false
        u12.MatchEndScreenEnd:connect(function(p24) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u21
                [3] = u22
                [4] = u4
                [5] = u5
            --]]
            if p24.matchEndScreenType ~= 5 then
                return nil
            end
            u23 = true
            u21.Transparency = 1
            local v25 = u22
            if v25 ~= nil then
                v25:Destroy()
            end
            u22 = nil
            if not u4.isHoarceKat() then
                u5.Controllers.TopBarController:mountHud()
            end
        end)
        u12.MatchEndScreenStart:connect(function(p26) --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u11
                [3] = u21
                [4] = u4
                [5] = u22
                [6] = u6
                [7] = u10
                [8] = u5
            --]]
            if p26.matchEndScreenType ~= 2 then
                return nil
            end
            if u23 then
                return nil
            end
            u11:Create(u21, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                ["BackgroundTransparency"] = 0.4
            }):Play()
            if not u4.isHoarceKat() then
                local v27 = u22
                if v27 ~= nil then
                    v27:Destroy()
                end
                u22 = u6("BlurEffect", {
                    ["Parent"] = u10
                })
                u22.Size = 12
            end
            if not u4.isHoarceKat() then
                u5.Controllers.TopBarController:unmountHud()
            end
        end)
        u12.MatchEndScreenStart:connect(function(p28) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u14
                [3] = u11
                [4] = u21
                [5] = u4
                [6] = u5
            --]]
            if p28.matchEndScreenType ~= 5 then
                return nil
            end
            if u23 then
                return nil
            end
            local v29 = u14[5].displaySecs
            local v30 = (v29 == nil and 1 or v29) - 0.4
            task.delay(v30, function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u11
                    [3] = u21
                    [4] = u4
                    [5] = u5
                --]]
                if not u23 then
                    u11:Create(u21, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    if not u4.isHoarceKat() then
                        u5.Controllers.TopBarController:mountHud()
                    end
                end
            end)
        end)
        u13.changed:connect(function(p31, p32) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u4
                [3] = u22
                [4] = u6
                [5] = u10
                [6] = u5
            --]]
            if p31.Game.matchEndSummaryVisible == p32.Game.matchEndSummaryVisible then
                return nil
            end
            if p31.Game.matchEndSummaryVisible then
                u21.Transparency = 0.4
                if not u4.isHoarceKat() then
                    local v33 = u22
                    if v33 ~= nil then
                        v33:Destroy()
                    end
                    u22 = u6("BlurEffect", {
                        ["Parent"] = u10
                    })
                    u22.Size = 12
                end
                if not u4.isHoarceKat() then
                    u5.Controllers.TopBarController:unmountHud()
                    return
                end
            else
                u21.Transparency = 1
                local v34 = u22
                if v34 ~= nil then
                    v34:Destroy()
                end
                u22 = nil
                if not u4.isHoarceKat() then
                    u5.Controllers.TopBarController:mountHud()
                end
            end
        end)
    end, {})
    local v35 = u7.createFragment
    local v36 = {
        ["DarkBackground"] = u7.createElement("Frame", {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u3.BLACK,
            ["ZIndex"] = -100,
            [u7.Ref] = u20
        })
    }
    return v35(v36)
end)
return {
    ["MatchEndBackgroundWrapper"] = v17,
    ["MatchEndBackground"] = u15
}