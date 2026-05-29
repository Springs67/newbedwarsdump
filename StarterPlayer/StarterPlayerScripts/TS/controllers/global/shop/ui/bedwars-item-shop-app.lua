local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.EmptyButton
local u8 = v3.SlideIn
local u9 = v3.SoundManager
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, script.Parent, "shop-items", "shop-item-list").ShopItemList
local u18 = u1.import(script, script.Parent, "shop-left", "shop-left").BedwarsItemShopLeft
local u19 = u1.import(script, script.Parent, "toolbar", "shop-disruption-top").ShopDisruptionTop
local u20 = u1.import(script, script.Parent, "toolbar", "shop-toolbar").ShopToolbar
local v21 = u11.Component:extend("BedwarsItemShopAppBase")
function v21.init(p22, _) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u15
        [3] = u13
    --]]
    p22.alive = true
    if not u5.isHoarceKat() then
        p22:setState({
            ["selectedItem"] = u15.getShop(u13.LocalPlayer, p22.props.shopId, true)[1]
        })
    end
end
function v21.didMount(u23) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u16
        [3] = u5
        [4] = u10
        [5] = u14
        [6] = u13
        [7] = u1
        [8] = u2
    --]]
    u9:playSound(u16.UI_OPEN)
    local v24 = false
    if not u5.isHoarceKat() then
        local v25 = u10.Controllers.MatchController:getQueueType()
        v24 = v25 and u14(v25).enableBedwarsShopAnywhere and true or v24
    end
    local v26 = u13.LocalPlayer
    if v26 ~= nil then
        v26 = v26.Character
    end
    if v26 then
        v26 = not v24
    end
    if v26 then
        local u27 = u13.LocalPlayer.Character:GetPivot().Position
        local v28 = u23.props.shopId
        local u29
        if v28 == "" or not v28 then
            u29 = nil
        else
            u29 = u10.Controllers.BedwarsShopController:getShopComponent(u23.props.shopId)
        end
        u1.Promise.defer(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u13
                [3] = u27
                [4] = u2
                [5] = u29
                [6] = u10
            --]]
            while true do
                local v30 = task.wait(0.2)
                if v30 ~= 0 and (v30 == v30 and v30) then
                    v30 = u23.alive
                end
                if v30 == 0 or (v30 ~= v30 or not v30) then
                    return
                end
                local v31 = u13.LocalPlayer.Character
                if v31 ~= nil then
                    v31 = v31:GetPivot().Position
                end
                if v31 == nil then
                    v31 = Vector3.new()
                end
                if (v31 - u27).Magnitude > 6 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.props.AppId)
                end
                local v32 = u23.props.shopId
                if v32 ~= "" and v32 then
                    v32 = u29
                    if v32 then
                        v32 = not u10.Controllers.BedwarsShopController:getShopComponent(u23.props.shopId)
                    end
                end
                if v32 ~= "" and v32 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.props.AppId)
                end
            end
        end)
    end
end
function v21.willUnmount(p33) --[[ Line: 94 ]]
    p33.alive = false
end
function v21.render(u34) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u5
        [4] = u19
        [5] = u13
        [6] = u6
        [7] = u18
        [8] = u20
        [9] = u17
        [10] = u7
        [11] = u8
    --]]
    local v35 = {
        ["DisplayOrder"] = 20
    }
    local v36 = { u11.createElement(u4, {
            ["DisplayOrder"] = 20,
            ["AppId"] = u34.props.AppId
        }) }
    local v37 = #v36
    local v38 = {}
    local v39 = #v38
    local v40 = {
        ["Modal"] = true
    }
    local v41
    if u5.isSmallScreen() then
        v41 = UDim2.fromScale(0.825, 0.825)
    else
        v41 = UDim2.fromScale(0.775, 0.775)
    end
    v40.Size = v41
    v40.Position = UDim2.fromScale(0.5, u5.isSmallScreen() and 0 or 0.05)
    v40.AnchorPoint = Vector2.new(0.5, 0)
    local v42 = { u11.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.8135652173913046
        }), u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder"
        }), u11.createElement(u19, {
            ["Size"] = UDim2.fromScale(1, 0.12)
        }) }
    local v43 = #v42
    local v44 = {}
    local v45 = UDim2
    local v46
    if u5.isHoarceKat() then
        v46 = 1
    else
        local v47 = u13.LocalPlayer:GetAttribute("DisruptionPriceIncrease")
        v46 = (v47 == 0 or (v47 ~= v47 or (v47 == "" or not v47))) and 1 or 0.88
    end
    v44.Size = v45.fromScale(1, v46)
    v42[v43 + 1] = u11.createElement(u6, v44, { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder"
        }), u11.createElement(u18, {
            ["SelectedItem"] = u34.state.selectedItem,
            ["Size"] = UDim2.fromScale(0.27, 1),
            ["Position"] = UDim2.fromScale(0.73, 0),
            ["SetSelectedShopItem"] = function(p48) --[[ Name: SetSelectedShopItem, Line 148 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u11
                --]]
                u34:setState({
                    ["selectedItem"] = p48 or u11.None
                })
            end,
            ["ShopID"] = u34.props.shopId
        }), u11.createElement(u6, {
            ["Size"] = UDim2.fromScale(0.73, 1)
        }, { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical"
            }), u11.createElement(u20, {
                ["Size"] = UDim2.fromScale(1, 0.09),
                ["ObservedInventory"] = u34.props.ObservedInventory,
                ["IsHomeBase"] = u34.props.IsHomeBase
            }), u11.createElement(u17, {
                ["Size"] = UDim2.fromScale(1, 0.91),
                ["Position"] = UDim2.fromScale(0, 0.09),
                ["ShopID"] = u34.props.shopId,
                ["SelectedItem"] = u34.state.selectedItem,
                ["SetSelectedShopItem"] = function(p49) --[[ Name: SetSelectedShopItem, Line 171 ]]
                    --[[
                    Upvalues:
                        [1] = u34
                        [2] = u11
                    --]]
                    u34:setState({
                        ["selectedItem"] = p49 or u11.None
                    })
                end,
                ["ObservedInventory"] = u34.props.ObservedInventory,
                ["IsHomeBase"] = u34.props.IsHomeBase,
                ["QueueType"] = u34.props.QueueType
            }) }) })
    v38[v39 + 1] = u11.createElement(u7, v40, v42)
    v36[v37 + 1] = u11.createElement(u8, {}, v38)
    return u11.createFragment({
        ["ItemShop"] = u11.createElement("ScreenGui", v35, v36)
    })
end
return {
    ["BedwarsItemShopAppBase"] = v21,
    ["BedwarsItemShopApp"] = v12.connect(function(p50, p51) --[[ Line: 189 ]]
        local v52 = {
            ["ObservedInventory"] = p50.Inventory.observedInventory,
            ["QueueType"] = p50.Game.queueType
        }
        for v53, v54 in p51 do
            v52[v53] = v54
        end
        return v52
    end)(v21)
}