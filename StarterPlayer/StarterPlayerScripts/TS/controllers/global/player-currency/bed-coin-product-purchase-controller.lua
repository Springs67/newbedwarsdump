local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v3.StringUtil
local u7 = v3.UILayers
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "BedCoinProductPurchaseController"
    end,
    ["__index"] = u9
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p19)
    p19.Name = "BedCoinProductPurchaseController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p20)
end
function u16.purchase(_, u21, u22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u10
        [4] = u11
        [5] = u4
        [6] = u15
        [7] = u6
        [8] = u13
        [9] = u5
        [10] = u14
        [11] = u7
    --]]
    local u23 = u12.getProductInfo(u21.productId)
    if not u23 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "Product does not exist"
        })
        return nil
    end
    local u24 = u10:getState().Bedwars.bedCoins >= u23.cost
    local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v26 = u11.CONFIRMATION_MODAL
    local v27 = {
        ["Title"] = "Confirm Purchase",
        ["Body"] = "Are you sure you want to purchase <font transparency=\"0\" color=\"" .. u4.richTextColor(u15.mcAqua) .. "\"><b>[" .. u23.name .. "]</b></font> with <font transparency=\"0\" color=\"" .. u4.richTextColor(u15.mcGold) .. "\"><b>" .. u6.formatNumberWithCommas(u23.cost) .. " Bed Coins</b></font>?"
    }
    local v28 = {
        ["Text"] = u24 and "PURCHASE" or "CAN\'T AFFORD"
    }
    local v29
    if u24 then
        v29 = u15.backgroundSuccess
    else
        v29 = u15.backgroundError
    end
    v28.BackgroundColor3 = v29
    v27.PrimaryBtnProps = v28
    v27.SecondaryBtnProps = {
        ["Text"] = "CANCEL"
    }
    function v27.OnPrimaryBtnClick() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u13
            [3] = u21
            [4] = u5
            [5] = u14
            [6] = u22
            [7] = u2
            [8] = u6
            [9] = u23
            [10] = u10
        --]]
        if u24 then
            u13.Client:Get("PromptBedCoinPurchase"):CallServerAsync(u21):andThen(function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u14
                    [3] = u22
                --]]
                u5:playSound(u14.BEDWARS_PURCHASE_ITEM)
                local v30 = u22
                if v30 ~= nil then
                    v30()
                end
            end):catch(function(p31) --[[ Line: 67 ]]
                print("[BED COIN PURCHASE] ", p31)
            end)
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "Not enough <b>Bed Coins</b>\n(Missing: " .. u6.formatNumberWithCommas(u23.cost - u10:getState().Bedwars.bedCoins) .. ")"
            })
        end
    end
    function v27.OnSecondaryBtnClick() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u7.OVERLAY)
    end
    v25:openApp(v26, v27)
end
v8.CreateController(u16.new())
return nil