local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport
return {
    ["KitSkinCard"] = v8.new(u7)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u11
            [4] = u4
            [5] = u6
            [6] = u10
            [7] = u9
            [8] = u3
            [9] = u14
            [10] = u13
            [11] = u15
            [12] = u5
        --]]
        local _ = p17.useState
        local u18 = u7.createRef()
        local v19 = u16.SelectedSkin == u16.Skin
        local v20 = u16.SelectedSkin
        if v20 then
            local v21 = u12[u16.SelectedSkin].variantOfSkin
            if v21 ~= nil then
                v21 = v21.parentSkin
            end
            v20 = v21 == u16.Skin
        end
        local u22 = v20 and true or v19
        local v23 = u16.Skin == u11.DEFAULT
        local u24
        if u16.Skin then
            v23 = v23
            if v23 then
                u24 = v23
            elseif u4.isHoarceKat() then
                local v25 = u16.store.Bedwars.ownedKitSkins
                local v26 = u16.Skin
                u24 = table.find(v25, v26) ~= nil
            else
                u24 = u6.Controllers.UnlockController:isKitSkinUnlocked(u16.Skin)
            end
        else
            u24 = false
        end
        local u27
        if u16.store.Bedwars.equippedKitSkins then
            u27 = u16.Skin == u16.store.Bedwars.equippedKitSkins[u16.Kit]
        else
            u27 = false
        end
        local v28 = {
            ["Size"] = UDim2.fromScale(0.25, 0.88),
            ["BackgroundTransparency"] = 1,
            [u7.Event.Activated] = function() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u24
                    [3] = u27
                    [4] = u4
                    [5] = u10
                    [6] = u6
                --]]
                u16.SetSelectedSkin(u16.Skin)
                if u24 and not u27 then
                    if u4.isHoarceKat() then
                        u10:dispatch({
                            ["type"] = "EquipKitSkin",
                            ["kit"] = u16.Kit,
                            ["kitSkin"] = u16.Skin
                        })
                        return
                    end
                    u6.Controllers.KitSkinController:equipKitSkin(u16.Kit, u16.Skin)
                end
            end,
            [u7.Event.MouseEnter] = function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u9
                --]]
                u9:Create(u18:getValue(), TweenInfo.new(0.15), {
                    ["BackgroundTransparency"] = 1
                }):Play()
            end,
            [u7.Event.MouseLeave] = function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u18
                    [3] = u9
                --]]
                if u22 then
                    return nil
                end
                u9:Create(u18:getValue(), TweenInfo.new(0.15), {
                    ["BackgroundTransparency"] = 0.8
                }):Play()
            end
        }
        local v29 = {}
        local v30 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.03, 0)
        })
        local v31 = u7.createElement
        local v32 = "UIStroke"
        local v33 = {
            ["Thickness"] = 1.5
        }
        local v34
        if u22 then
            v34 = u3.WHITE
        else
            v34 = u14.textPrimary
        end
        v33.Color = v34
        v33.Transparency = u27 and 0 or (u22 and 0 or 0.7)
        __set_list(v29, 1, {v30, (v31(v32, v33))})
        v29.Dark_Overlay = u7.createElement("Frame", {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = u22 and 1 or 0.8,
            ["BorderSizePixel"] = 0,
            [u7.Ref] = u18,
            ["ZIndex"] = 3
        }, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }) })
        local v35 = #v29
        local v36 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.93, 0.93)
        }
        local v37 = {}
        local v38 = #v37
        local v39 = not u24
        if v39 then
            v39 = u7.createFragment({
                ["Icon_Locked"] = u7.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 4,
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(0.95, 0.05),
                    ["Size"] = UDim2.fromScale(0.15, 0.15),
                    ["Image"] = u13.LOCK_SOLID
                })
            })
        end
        if v39 then
            v37[v38 + 1] = v39
        end
        local v40 = #v37 + 1
        local v41
        if v23 then
            v41 = u7.createElement(u15, {
                ["Kit"] = u16.Kit
            })
        else
            v41 = u7.createElement(u15, {
                ["Kit"] = u16.Kit,
                ["Skin"] = u16.Skin
            })
        end
        v37[v40] = v41
        v29[v35 + 1] = u7.createElement(u5, v36, v37)
        return u7.createElement("ImageButton", v28, v29)
    end)
}