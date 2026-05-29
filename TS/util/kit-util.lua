local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.MarketplaceService
local u8 = v6.RunService
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local function u19(p17) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
        [3] = u9
        [4] = u15
        [5] = u8
        [6] = u5
        [7] = u4
    --]]
    if u2.isHoarceKat() then
        local v18 = u10(u9.Kit)
        return v18 and { v18 } or { u15.BARBARIAN }
    elseif u8:IsServer() then
        return u5.Services.KitService:getActiveKits(p17)
    else
        return u4.Controllers.KitController:getActiveKits(p17)
    end
end
local function u27(p20) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
    --]]
    local v21 = u16(p20)
    local v22 = v21.priceRobux
    local v23 = v21.gamepassId
    if v23 == 0 or (v23 ~= v23 or not v23) then
        local v24 = v21.devProductId
        if v24 ~= 0 and (v24 == v24 and v24) then
            local v25 = u7:GetProductInfo(v21.devProductId, Enum.InfoType.Product)
            if v25 then
                v22 = v25.PriceInRobux
            end
        end
    else
        local v26 = u7:GetProductInfo(v21.gamepassId, Enum.InfoType.GamePass)
        if v26 then
            return v26.PriceInRobux
        end
    end
    return v22
end
local function u35(p28) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    local v29 = u14[p28]
    local v30 = v29.product
    if v30 ~= nil then
        v30 = v30.priceRobux
    end
    local v31 = v29.product
    if v31 ~= nil then
        v31 = v31.devProductId
    end
    if v31 ~= 0 and (v31 == v31 and v31) then
        local v32 = u7
        local v33 = v29.product
        if v33 ~= nil then
            v33 = v33.devProductId
        end
        local v34 = v32:GetProductInfo(v33, Enum.InfoType.Product).PriceInRobux
        if v34 ~= 0 and v34 == v34 then
            v30 = v34 or v30
        end
    end
    return v30
end
local u36 = nil
local function v39(p37) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u11
    --]]
    local v38 = u36(p37)
    if v38 == nil then
        return nil
    else
        return u11.getProductInfo(v38)
    end
end
u36 = function(p40) --[[ Name: getKitRentalBedCoinProductId, Line 234 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v41 = u16(p40)
    return v41.limitedTime and 52 or (v41.battlepassSeason and 51 or 50)
end
local u42 = 5 * v12
local u43 = 5 * v12
local v44 = u10(u9.TerminalFallSpeed)
local u45 = v44 == nil and 120 or v44
return {
    ["getActiveKits"] = u19,
    ["getPrimaryActiveKit"] = function(p46) --[[ Name: getPrimaryActiveKit, Line 39 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u4
        --]]
        if u8:IsServer() then
            return u5.Services.KitService:getPrimaryActiveKit(p46)
        else
            return u4.Controllers.KitController:getPrimaryActiveKit(p46)
        end
    end,
    ["isUsingKit"] = function(p47, p48) --[[ Name: isUsingKit, Line 53 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u4
        --]]
        if p47 == nil then
            return false
        end
        if u8:IsServer() then
            if u5.Services.KitService:isUsingKit(p47, p48) then
                return true
            end
        elseif u4.Controllers.KitController:isUsingKit(p47, p48) then
            return true
        end
        return false
    end,
    ["getPlayerKitSkin"] = function(p49) --[[ Name: getPlayerKitSkin, Line 68 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        return p49:GetAttribute("KitSkin") or u13.DEFAULT
    end,
    ["isPlayerUsingAnyKitInArray"] = function(p50, p51) --[[ Name: isPlayerUsingAnyKitInArray, Line 71 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if p50 == nil then
            return false
        end
        local v52 = u19(p50)
        local v53 = false
        local v54 = 0
        while true do
            if v53 then
                v54 = v54 + 1
            else
                v53 = true
            end
            if v54 >= #v52 then
                return false
            end
            local v55 = v52[v54 + 1]
            if table.find(p51, v55) ~= nil then
                return true
            end
        end
    end,
    ["areThereAnyMatchesInKitArrays"] = function(p56, p57) --[[ Name: areThereAnyMatchesInKitArrays, Line 96 ]]
        local v58 = false
        local v59 = 0
        while true do
            if v58 then
                v59 = v59 + 1
            else
                v58 = true
            end
            if v59 >= #p56 then
                return false
            end
            local v60 = p56[v59 + 1]
            if table.find(p57, v60) ~= nil then
                return true
            end
        end
    end,
    ["doesKitArrayHaveAllKitsInAnotherArray"] = function(p61, p62) --[[ Name: doesKitArrayHaveAllKitsInAnotherArray, Line 117 ]]
        local v63 = false
        local v64 = 0
        while true do
            if v63 then
                v64 = v64 + 1
            else
                v63 = true
            end
            if v64 >= #p62 then
                return true
            end
            local v65 = p62[v64 + 1]
            if table.find(p61, v65) == nil then
                return false
            end
        end
    end,
    ["getKitPriceRobux"] = u27,
    ["getKitPriceRobuxAsync"] = function(u66) --[[ Name: getKitPriceRobuxAsync, Line 164 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u27
        --]]
        return u1.Promise.new(function(p67, p68) --[[ Line: 165 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u66
            --]]
            local v69 = u27(u66)
            if v69 == 0 or (v69 ~= v69 or not v69) then
                p68()
            else
                p67(v69)
            end
        end)
    end,
    ["getKitSkinPriceRobux"] = u35,
    ["getKitSkinPriceRobuxAsync"] = function(u70) --[[ Name: getKitSkinPriceRobuxAsync, Line 205 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u35
        --]]
        return u1.Promise.new(function(p71, p72) --[[ Line: 206 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u70
            --]]
            local v73 = u35(u70)
            if v73 == 0 or (v73 ~= v73 or not v73) then
                p72()
            else
                p71(v73)
            end
        end)
    end,
    ["getKitPriceBedCoins"] = function(p74) --[[ Name: getKitPriceBedCoins, Line 215 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u11
        --]]
        local v75 = u16(p74)
        if not v75.bedCoinProduct then
            return nil
        end
        local v76 = u11.getProductInfo(v75.bedCoinProduct.bedCoinProductId)
        if v76 ~= nil then
            v76 = v76.cost
        end
        return v76
    end,
    ["getKitRentalBedCoinProduct"] = v39,
    ["getKitRentalBedCoinProductId"] = u36,
    ["addExtraKitAttributeToPlayer"] = function(p77, p78) --[[ Name: addExtraKitAttributeToPlayer, Line 247 ]]
        p77:SetAttribute("ExtraKit_" .. p78, true)
    end,
    ["doesPlayerHaveExtraKitAttribute"] = function(p79, p80) --[[ Name: doesPlayerHaveExtraKitAttribute, Line 250 ]]
        local v81 = p79:GetAttribute("ExtraKit_" .. p80)
        if v81 == nil then
            return false
        else
            return v81
        end
    end,
    ["getCommaSeparatedStringFromKitArray"] = function(p82) --[[ Name: getCommaSeparatedStringFromKitArray, Line 257 ]]
        local v83 = false
        local v84 = 0
        local v85 = ""
        while true do
            if v83 then
                v84 = v84 + 1
            else
                v83 = true
            end
            if v84 >= #p82 then
                return v85
            end
            local v86 = p82[v84 + 1]
            if v84 == #p82 - 1 then
                v85 = v85 .. v86
            else
                v85 = v85 .. v86 .. ","
            end
        end
    end,
    ["getKitArrayFromCommaSeparatedString"] = function(p87) --[[ Name: getKitArrayFromCommaSeparatedString, Line 281 ]]
        local v88 = string.split(p87, ",")
        local v89 = false
        local v90 = 0
        local v91 = {}
        while true do
            if v89 then
                v90 = v90 + 1
            else
                v89 = true
            end
            if v90 >= #v88 then
                return v91
            end
            local v92 = v88[v90 + 1]
            table.insert(v91, v92)
        end
    end,
    ["isValidPredictedStartPosition"] = function(p93, p94, p95, p96) --[[ Name: isValidPredictedStartPosition, Line 314 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u43
            [3] = u45
        --]]
        if p95 == nil then
            p95 = p93.Position
        end
        local v97
        if p96 == nil then
            v97 = p96
        else
            v97 = p96.desyncTolerance
        end
        if v97 == nil then
            v97 = u42
        end
        local v98
        if p96 == nil then
            v98 = p96
        else
            v98 = p96.predictionWindow
        end
        local v99 = v98 == nil and 0.35 or v98
        local v100
        if p96 == nil then
            v100 = p96
        else
            v100 = p96.predictionTolerance
        end
        if v100 == nil then
            v100 = u43
        end
        if p96 ~= nil then
            p96 = p96.maxPredictionSpeed
        end
        if p96 == nil then
            p96 = u45
        end
        if (p94 - p95).Magnitude <= v97 then
            return true
        end
        local v101 = p93.AssemblyLinearVelocity
        if p96 < v101.Magnitude then
            v101 = v101.Unit * p96
        end
        local v102 = v101:Dot(v101)
        if v102 <= 0 then
            return false
        end
        local v103 = math
        local v104 = (p95 - p94):Dot(v101) / v102
        local v105 = -v99
        return (p94 - (p95 - v101 * v103.clamp(v104, v105, v99))).Magnitude <= v97 + v100
    end
}