local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.SlideIn
local u8 = v3.SoundManager
local u9 = v3.UILayers
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").WeaponType
local u20 = v1.import(script, script.Parent, "weapon-card").WeaponCard
local v53 = v12.new(u11)(function(u21, p22) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u9
        [4] = u10
        [5] = u19
        [6] = u20
        [7] = u5
        [8] = u16
        [9] = u17
        [10] = u8
        [11] = u18
        [12] = u15
        [13] = u14
        [14] = u7
        [15] = u6
        [16] = u4
    --]]
    local v23 = p22.useState
    local _ = p22.useEffect
    local v24, _ = v23(Vector2.new(584, 443))
    local v25 = v24.X * 0.2568493150684932
    local v26 = math.floor(v25)
    u11.createRef()
    local function v27() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.MAIN)
    end
    local function v42() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u19
            [3] = u11
            [4] = u20
            [5] = u5
            [6] = u16
            [7] = u17
            [8] = u8
            [9] = u18
            [10] = u21
        --]]
        local v28 = u10.values(u19)
        local function v32(u29, _) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u20
                [3] = u5
                [4] = u16
                [5] = u17
                [6] = u8
                [7] = u18
                [8] = u21
            --]]
            return u11.createElement(u20, {
                ["LayoutOrder"] = 0,
                ["Selected"] = false,
                ["weapon"] = u29,
                ["OnClick"] = function() --[[ Name: OnClick, Line 39 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u16
                        [3] = u29
                        [4] = u17
                        [5] = u8
                        [6] = u18
                    --]]
                    if u5.isHoarceKat() then
                        u16:dispatch({
                            ["type"] = "SetBedwarsWeapon",
                            ["weapon"] = u29
                        })
                        return nil
                    end
                    local v30 = {
                        ["weapon"] = u29
                    }
                    u17.Client:Get("BedwarsSetWeapon"):CallServerAsync(v30):andThen(function(p31) --[[ Line: 50 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u18
                            [3] = u16
                            [4] = u29
                        --]]
                        if p31 then
                            u8:playSound(u18.ARMOR_UNEQUIP)
                            u16:dispatch({
                                ["type"] = "SetBedwarsWeapon",
                                ["weapon"] = u29
                            })
                        end
                    end)
                end,
                ["store"] = u21.store
            })
        end
        local v33 = 0
        local v34 = {}
        for v35, v36 in v28 do
            local v37 = v32(v36, v35 - 1, v28)
            if v37 ~= nil then
                v33 = v33 + 1
                v34[v33] = v37
            end
        end
        local v38 = {}
        local v39 = #v38
        for v40, v41 in v34 do
            v38[v39 + v40] = v41
        end
        return u11.createFragment(v38)
    end
    local v43 = {}
    local v44 = {}
    for v45, v46 in u15.GENERIC_BW_IMAGE_PRESET do
        v43[v45] = v46
    end
    v43.OnClick = v27
    v44.Background = v43
    v44.ExitButton = {
        ["OnClick"] = v27
    }
    v44.EnableButtonBackgroundPanel = true
    local v47 = u11.createElement
    local v48 = u14
    local v49 = {}
    local v50 = u11.createElement
    local v51 = u7
    local v52 = {
        u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(u5.isSmallScreen() and 0.15 or 0.025, 0)
        }),
        u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 24)
        }),
        ["Title"] = u11.createElement(u6, {
            ["Size"] = UDim2.fromScale(1, 0.15)
        }, { u11.createElement("TextLabel", {
                ["Text"] = "Select Starter Weapon",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                ["LayoutOrder"] = 2,
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) }),
        ["WeaponList"] = u11.createElement("ScrollingFrame", {
            ["AutomaticCanvasSize"] = "Y",
            ["ScrollingDirection"] = "Y",
            ["ScrollBarThickness"] = 6,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = false,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1),
            ["CanvasSize"] = UDim2.new(1, 0, 0, 0)
        }, {
            u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 24)
            }),
            u11.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 3),
                ["PaddingTop"] = UDim.new(0, 12),
                ["PaddingBottom"] = UDim.new(0, 12)
            }),
            ["AvailableWeapons"] = u11.createElement(u6, {
                ["AutomaticSize"] = "Y",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0)
            }, { u11.createElement("UIGridLayout", {
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Top",
                    ["SortOrder"] = "LayoutOrder",
                    ["FillDirectionMaxCells"] = 5,
                    ["CellSize"] = UDim2.fromOffset(v26, v26 * 1.5),
                    ["CellPadding"] = UDim2.fromOffset(20, 20)
                }), u11.createElement(v42) })
        })
    }
    __set_list(v49, 1, {v50(v51, {}, v52)})
    return v47(v48, v44, v49)
end)
return {
    ["WeaponSelectionApp"] = v13.connect(function(p54, p55) --[[ Line: 169 ]]
        local v56 = {
            ["store"] = p54
        }
        for v57, v58 in p55 do
            v56[v57] = v58
        end
        return v56
    end)(v53)
}