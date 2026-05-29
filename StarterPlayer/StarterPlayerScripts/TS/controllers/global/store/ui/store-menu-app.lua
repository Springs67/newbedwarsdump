local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.EmptyButton
local u8 = v3.Padding
local u9 = v3.ScaleComponent
local u10 = v3.SlideIn
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "close-button").CloseButton
local v26 = v1.import(script, script.Parent, "kit-skins", "kit-skin-store-list").KitSkinStoreList
local u27 = v1.import(script, script.Parent, "navbar", "app-navbar-vertical").AppNavbarVertical
local v28 = v1.import(script, script.Parent, "robux-store").RobuxStore
local v29 = v1.import(script, script.Parent, "ugc-page", "ugc-store-list").UGCStoreList
local v30 = {
    ["Id"] = "RobuxStore",
    ["Element"] = u14.createElement(v28, {
        ["AppId"] = "RobuxStore"
    })
}
local v31 = u20(u23.LUCKY_GIFT)
v30.Icon = v31 == nil and "" or v31
v30.Title = "Store"
v30.ElementProps = {
    ["FrameProps"] = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0)
    }
}
local u32 = {
    v30,
    {
        ["Id"] = "KitSkins",
        ["Title"] = "Kit Skins",
        ["Element"] = u14.createElement(v26, {
            ["AppId"] = "KitSkinList",
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.95, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 0)
            }
        }),
        ["Icon"] = v22.DODO_WHISPER_KIT_RENDER
    },
    {
        ["Id"] = "UGC",
        ["Title"] = "UGC",
        ["Element"] = u14.createElement(v29, {
            ["AppId"] = "UGCStoreList",
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.95, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 0)
            }
        }),
        ["Icon"] = v22.DODO_BIRD_SHOULDER_BUDDY_UGC_RENDER
    }
}
local v88 = v15.new(u14)(function(u33, p34) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u14
        [3] = u12
        [4] = u13
        [5] = u17
        [6] = u5
        [7] = u11
        [8] = u4
        [9] = u8
        [10] = u6
        [11] = u10
        [12] = u9
        [13] = u24
        [14] = u18
        [15] = u21
        [16] = u20
        [17] = u23
        [18] = u2
        [19] = u19
        [20] = u27
        [21] = u25
        [22] = u7
    --]]
    local v35 = p34.useState
    local v36 = p34.useEffect
    local v37
    if u33.DefaultPageId == "KitSkins" then
        v37 = u32[2]
    else
        v37 = u32[1]
    end
    local u38, u39 = v35(v37)
    local v40 = UDim2.fromOffset(820, 520)
    local u41 = u14.createRef()
    local u42 = u14.createRef()
    v36(function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u17
            [4] = u5
            [5] = u11
        --]]
        local u43 = u12.new()
        local v44 = u13("BlurEffect", {
            ["Name"] = "UIBlurEffect",
            ["Parent"] = u17
        })
        v44.Size = 12
        u43:GiveTask(v44)
        if not u5.isHoarceKat() then
            u11.Controllers.FovController:playUIOpenFOVTween()
            u11.Controllers.HotbarController:hideHotbar("store-menu-app")
            u11.Controllers.LobbyHudController:hideLobbyHud("store-menu-app")
            if u5.isMobileControls() then
                u11.Controllers.MobileUiController:hideUi("store-menu-app")
            end
        end
        return function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u5
                [3] = u11
            --]]
            u43:DoCleaning()
            if u5.isMobileControls() then
                u11.Controllers.MobileUiController:unhideUi("store-menu-app")
            end
            u11.Controllers.FovController:playUICloseFOVTween()
            u11.Controllers.HotbarController:unhideHotbar("store-menu-app")
            u11.Controllers.LobbyHudController:unhideLobbyHud("store-menu-app")
        end
    end, {})
    local function u45() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        return u38.Element
    end
    local function u57() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u14
            [4] = u42
            [5] = u8
            [6] = u38
            [7] = u45
            [8] = u6
        --]]
        local v46 = {}
        local v47 = UDim2.fromScale
        u5.isSmallScreen()
        local v48 = 1
        v46.Size = v47(v48, 1)
        v46.Position = UDim2.fromScale(0.5, 0)
        v46.AnchorPoint = Vector2.new(0.5, 0)
        local v49 = {}
        local _ = #v49
        local v50 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["AutomaticCanvasSize"] = "Y",
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
            ["ScrollBarThickness"] = 4,
            ["ScrollBarImageTransparency"] = 0.3,
            ["ScrollBarImageColor3"] = u4.WHITE,
            ["ClipsDescendants"] = false,
            [u14.Ref] = u42
        }
        local v51 = { u14.createElement(u8, {
                ["Padding"] = {
                    ["Right"] = 16
                }
            }) }
        local v52 = #v51
        local v53 = {}
        local v54 = u38.ElementProps
        if v54 then
            for v55, v56 in v54 do
                v53[v55] = v56
            end
        end
        v51[v52 + 1] = u14.createElement(u45, v53)
        v49.ContentScrollingFrame = u14.createElement("ScrollingFrame", v50, v51)
        return u14.createFragment({
            ["Content"] = u14.createElement(u6, v46, v49)
        })
    end
    local function v58() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u10
            [3] = u57
        --]]
        return u14.createElement(u10, {
            ["TweenInfo"] = TweenInfo.new(0.12, Enum.EasingStyle.Cubic),
            ["StartPosition"] = UDim2.fromScale(0, 0.15)
        }, { u14.createElement(u57) })
    end
    local v59 = {
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false,
        [u14.Ref] = u41
    }
    local v60 = {
        ["DarkBackground"] = u14.createElement("Frame", {
            ["BackgroundTransparency"] = 0.1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u14.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 48)) })
            }) })
    }
    local _ = #v60
    local v61 = {
        ["Modal"] = true,
        ["Size"] = v40,
        ["Position"] = UDim2.new(0.5, 0, 0, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v62 = { u14.createElement(u9, {
            ["PowerRelationshipPastMaximum"] = 0.8,
            ["MaximumSize"] = Vector2.new(v40.X.Offset * 2.25, v40.Y.Offset * 2.25),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }), u14.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.1, 0),
            ["PaddingRight"] = UDim.new(0.1, 0),
            ["PaddingTop"] = UDim.new(0.07, u24.topBarGuiInset),
            ["PaddingBottom"] = UDim.new(0.04, 0)
        }) }
    local _ = #v62
    local v63 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v64 = {}
    local v65 = #v64
    local v66 = {}
    local v67 = {}
    local v68 = #v67
    local v69 = #u32
    table.move(u32, 1, v69, v68 + 1, v67)
    local v70 = v68 + v69
    local v71 = {
        ["Id"] = "Kits"
    }
    local v72
    if u18:getState().Bedwars.kit then
        v72 = u21(u18:getState().Bedwars.kit).renderImage
    else
        local v73 = u20(u23.LUCKY_GIFT)
        v72 = v73 == nil and "" or v73
    end
    v71.Icon = v72
    v71.Title = "Kits"
    v67[v70 + 1] = v71
    v66.NavButtons = v67
    v66.ActiveAppId = u38.Id
    function v66.SetActiveAppId(p74) --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u39
            [3] = u42
            [4] = u2
            [5] = u19
            [6] = u38
        --]]
        local v75 = nil
        for v76, v77 in u32 do
            local _ = v76 - 1
            if v77.Id == p74 == true then
                v75 = v77
                break
            end
        end
        if v75 then
            u39(v75)
        end
        local u78 = u42:getValue()
        if p74 == "Kits" then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_SHOP_APP, {})
            return
        end
        if p74 == "Daily" and u78 then
            local function u81(p79) --[[ Line: 253 ]]
                --[[
                Upvalues:
                    [1] = u78
                --]]
                local v80 = u78
                if v80 ~= nil then
                    v80 = v80:FindFirstChild(p79)
                end
                if v80 then
                    u78.CanvasPosition = Vector2.new(0, v80.AbsolutePosition.Y - u78.AbsolutePosition.Y)
                end
            end
            if u38.Id == "RobuxStore" then
                local v82
                if u78 == nil then
                    v82 = u78
                else
                    v82 = u78:FindFirstChild("BedCoinsTitle")
                end
                if v82 then
                    u78.CanvasPosition = Vector2.new(0, v82.AbsolutePosition.Y - u78.AbsolutePosition.Y)
                end
            else
                local v83 = nil
                for v84, v85 in u32 do
                    local _ = v84 - 1
                    if v85.Id == "RobuxStore" == true then
                        v83 = v85
                        break
                    end
                end
                if v83 then
                    u39(v83)
                    task.delay(1, function() --[[ Line: 280 ]]
                        --[[
                        Upvalues:
                            [1] = u81
                        --]]
                        return u81("BedCoinsTitle")
                    end)
                    return
                end
            end
        end
    end
    v66.FrameProps = {
        ["Position"] = UDim2.fromScale(-0.085, 0.6),
        ["AnchorPoint"] = Vector2.new(0, 0.5)
    }
    v64[v65 + 1] = u14.createElement(u27, v66)
    v64[v65 + 2] = u14.createElement(u25, {
        ["OnClick"] = function() --[[ Name: OnClick, Line 295 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u33
                [3] = u41
                [4] = u17
                [5] = u11
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u33.AppId)
            task.delay(3, function() --[[ Line: 297 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u17
                    [3] = u11
                --]]
                if u41:getValue() then
                    local v86 = u41:getValue()
                    if v86 ~= nil then
                        v86:Destroy()
                    end
                    local v87 = u17:FindFirstChild("UIBlurEffect")
                    if v87 ~= nil then
                        v87:Destroy()
                    end
                    u11.Controllers.FovController:playUICloseFOVTween()
                    u11.Controllers.HotbarController:mountHotbar()
                    u11.Controllers.LobbyHudController:mountLobbyHud()
                end
            end)
        end,
        ["ButtonProps"] = {
            ["Position"] = UDim2.fromScale(1.02, 0),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(0.1, 0.1)
        }
    })
    v64.Content = u14.createElement(u6, {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }, { u14.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0, 0),
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0)
        }), u14.createElement(v58) })
    v62.Body = u14.createElement(u6, v63, v64)
    v60.StoreApp = u14.createElement(u7, v61, v62)
    return u14.createElement("ScreenGui", v59, v60)
end)
return {
    ["StoreMenuApp"] = v16.connect(function(_, p89) --[[ Line: 337 ]]
        local v90 = {}
        for v91, v92 in p89 do
            v90[v91] = v92
        end
        return v90
    end)(v88)
}