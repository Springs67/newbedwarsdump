local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = v1.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport
return {
    ["KitDetailsKitSkinCard"] = v9.new(u8)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u12
            [4] = u5
            [5] = u7
            [6] = u15
            [7] = u2
            [8] = u11
            [9] = u14
            [10] = u16
            [11] = u4
            [12] = u10
            [13] = u17
            [14] = u6
        --]]
        local _ = p19.useState
        u8.createRef()
        local v20 = u18.SelectedKitSkin == u18.Skin
        local v21 = u18.SelectedKitSkin
        if v21 then
            local v22 = u13[u18.SelectedKitSkin].variantOfSkin
            if v22 ~= nil then
                v22 = v22.parentSkin
            end
            v21 = v22 == u18.Skin
        end
        local u23 = v21 and true or v20
        local v24 = u18.Skin == u12.DEFAULT
        local u25
        if u18.Skin then
            v24 = v24
            if not v24 then
                if u5.isHoarceKat() then
                    local v26 = u18.store.Bedwars.ownedKitSkins
                    local v27 = u18.Skin
                    u25 = table.find(v26, v27) ~= nil
                else
                    u25 = u7.Controllers.UnlockController:isKitSkinUnlocked(u18.Skin)
                end
            end
        else
            u25 = false
        end
        local u28
        if u18.store.Bedwars.equippedKitSkins then
            u28 = u18.Skin == u18.store.Bedwars.equippedKitSkins[u18.Kit]
        else
            u28 = false
        end
        local v29 = {}
        for v30, v31 in u18 do
            v29[v30] = v31
        end
        v29.Kit = nil
        v29.Skin = nil
        v29.SelectedKitSkin = nil
        v29.SetSelectedKitSkin = nil
        v29.store = nil
        v29.Size = nil
        local v32 = {}
        local v33
        if u18.Size then
            if u23 then
                v33 = u18.Size + UDim2.fromOffset(u18.Size.X.Offset * 0.05, u18.Size.Y.Offset * 0.05)
            else
                v33 = u18.Size
            end
        else
            v33 = nil
        end
        v32.Size = v33
        for v34, v35 in v29 do
            v32[v34] = v35
        end
        local v36 = { (u8.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0, 1),
                ["PaddingLeft"] = UDim.new(0, 1),
                ["PaddingRight"] = UDim.new(0, 1),
                ["PaddingTop"] = UDim.new(0, 1)
            })) }
        local v37 = u8.createElement
        local v38 = "ImageButton"
        local v48 = {
            ["Size"] = UDim2.fromScale(0.05, 0.05),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.95, 0.05),
            ["Image"] = u15.EYE_SOLID,
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 0.2,
            ["ScaleType"] = Enum.ScaleType.Fit,
            [u8.Event.MouseEnter] = function(p39) --[[ Line: 101 ]]
                p39.ImageTransparency = 0
            end,
            [u8.Event.MouseLeave] = function(p40) --[[ Line: 104 ]]
                p40.ImageTransparency = 0.2
            end,
            [u8.Event.Activated] = function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u18
                    [3] = u12
                    [4] = u23
                    [5] = u2
                    [6] = u11
                --]]
                local v41 = u7.Controllers.LockerPreviewController
                local v42 = {
                    ["kit"] = u18.Kit
                }
                local v43
                if u18.Skin == u12.DEFAULT then
                    v43 = u12.DEFAULT
                elseif u23 then
                    v43 = u18.SelectedKitSkin
                else
                    v43 = u18.Skin
                end
                v42.kitSkin = v43
                v41:openFullscreenPreview(v42, {
                    ["onOpen"] = function() --[[ Name: onOpen, Line 112 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                        --]]
                        u7.Controllers.LobbyHudController:unmountLobbyHud()
                        u7.Controllers.HotbarController:unmountHotbar()
                    end,
                    ["onClose"] = function() --[[ Name: onClose, Line 116 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u11
                            [3] = u18
                            [4] = u23
                            [5] = u7
                        --]]
                        local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                        local v45 = u11.KIT_DETAILS_APP
                        local v46 = {
                            ["SelectedKit"] = u18.Kit
                        }
                        local v47
                        if u23 then
                            v47 = u18.SelectedKitSkin
                        else
                            v47 = u18.Skin
                        end
                        v46.SelectedKitSkin = v47
                        v44:openApp(v45, v46)
                        u7.Controllers.LockerPreviewController:closePreview()
                    end
                })
            end
        }
        local v49
        if u18.Kit == u14.NONE then
            v49 = false
        else
            v49 = u16.isLobbyServer()
        end
        v48.Visible = v49
        v36.KitSkinPreviewButton = v37(v38, v48, { u8.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(10, 10),
                ["MaxSize"] = Vector2.new(50, 50)
            }), u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v50 = #v36
        local v51 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u4.brighten(u4.BLACK, u23 and 0.2 or 0),
            ["BackgroundTransparency"] = u23 and 0.4 or 0.5,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = true,
            [u8.Event.Activated] = function() --[[ Line: 145 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u25
                    [3] = u28
                    [4] = u5
                    [5] = u10
                    [6] = u7
                --]]
                u18.SetSelectedKitSkin(u18.Skin)
                if u25 and not u28 then
                    if u5.isHoarceKat() then
                        u10:dispatch({
                            ["type"] = "EquipKitSkin",
                            ["kit"] = u18.Kit,
                            ["kitSkin"] = u18.Skin
                        })
                        return
                    end
                    u7.Controllers.KitSkinController:equipKitSkin(u18.Kit, u18.Skin)
                end
            end
        }
        local v52 = {}
        local v53 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        local v54 = u8.createElement
        local v55 = "UIStroke"
        local v56 = {
            ["Thickness"] = 1,
            ["Transparency"] = 0.5
        }
        local v57
        if u23 then
            v57 = Color3.fromRGB(204, 194, 61)
        else
            v57 = u4.WHITE
        end
        v56.Color = v57
        __set_list(v52, 1, {v53, v54(v55, v56)})
        local v58 = #v52
        local v59 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["Kit"] = u18.Kit
        }
        local v60
        if v24 then
            v60 = nil
        elseif u23 then
            v60 = u18.SelectedKitSkin
        else
            v60 = u18.Skin
        end
        v59.Skin = v60
        local v61 = {}
        local v62 = #v61
        local v63 = not u25
        if v63 then
            v63 = u8.createFragment({
                ["Icon_Locked"] = u8.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.5,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u4.BLACK
                }, {
                    ["Icon_Locked"] = u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.15, 0.15),
                        ["Image"] = u15.LOCK_SOLID,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    })
                })
            })
        end
        if v63 then
            v61[v62 + 1] = v63
        end
        v52[v58 + 1] = u8.createElement(u17, v59, v61)
        v36[v50 + 1] = u8.createElement("ImageButton", v51, v52)
        return u8.createElement(u6, v32, v36)
    end)
}