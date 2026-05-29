local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.Empty
local u5 = v2.SlideIn
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "cauldron-types").BrewablePotions
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent, "cauldron-card").CauldronCard
local u14 = u7.Component:extend("CauldronApp")
function u14.init(_) --[[ Line: 18 ]] end
function u14.render(u15) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u8
        [4] = u9
        [5] = u11
        [6] = u6
        [7] = u12
        [8] = u13
        [9] = u10
        [10] = u4
        [11] = u5
    --]]
    local v16 = { u7.createElement(u3, {
            ["AppId"] = u15.props.AppId
        }) }
    local v17 = #v16
    local v18 = {}
    local v19 = #v18
    local function v26(u20, p21) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u11
            [4] = u15
            [5] = u6
            [6] = u12
            [7] = u7
            [8] = u13
        --]]
        local v22 = {
            ["MenuPosition"] = "main"
        }
        local v23 = u8(u20).displayName
        v22.Name = v23 == nil and "brokey" or v23
        v22.Price = 3
        v22.Currency = u9.DIAMOND
        function v22.Purchased() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u15
                [3] = u20
                [4] = u6
                [5] = u12
            --]]
            u11.Client:WaitFor("BrewPotionInCauldron"):andThen(function(p24) --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u20
                    [3] = u6
                    [4] = u12
                --]]
                p24:CallServerAsync({
                    ["cauldron"] = u15.props.cauldron,
                    ["potion"] = u20
                }):andThen(function(p25) --[[ Line: 48 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u12
                    --]]
                    if p25 == true then
                        u6:playSound(u12.BEDWARS_UPGRADE_SUCCESS)
                    else
                        u6:playSound(u12.ERROR_NOTIFICATION)
                    end
                end)
            end)
        end
        v22.LayoutOrder = p21
        v22.ButtonTextOverride = "<b>Buy Potion</b>"
        v22.QueueType = u15.props.store.Game.queueType
        v22.ObservedInventory = u15.props.store.Inventory.observedInventory
        v22.AutoSelect = p21 == 0
        v22.IsHomeBase = false
        return u7.createElement(u13, v22)
    end
    local v27 = table.create(#u10)
    for v28, v29 in u10 do
        v27[v28] = v26(v29, v28 - 1, u10)
    end
    local v30 = {
        ["Size"] = UDim2.fromScale(0.98, 0.45),
        ["Position"] = UDim2.fromScale(0.5, 0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v31 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["Padding"] = UDim.new(0.008, 0)
        }) }
    local v32 = #v31
    for v33, v34 in v27 do
        v31[v32 + v33] = v34
    end
    v18[v19 + 1] = u7.createElement(u4, v30, v31)
    v16[v17 + 1] = u7.createElement(u5, {}, v18)
    return u7.createFragment(v16)
end
return {
    ["CauldronWrapper"] = function(p35) --[[ Name: CauldronWrapper, Line 95 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
        --]]
        return u7.createElement("ScreenGui", {}, { u7.createElement(u14, {
                ["AppId"] = "CauldronApp",
                ["store"] = p35.store,
                ["cauldron"] = p35.cauldron
            }) })
    end,
    ["CauldronApp"] = u14
}