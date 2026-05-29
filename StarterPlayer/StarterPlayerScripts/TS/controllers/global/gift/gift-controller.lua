local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").getSkinsForKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u15 = v1.import(script, script.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "GiftController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p19)
    p19.Name = "GiftController"
end
function u16.KnitStart(_) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u12
        [4] = u6
        [5] = u15
        [6] = u11
        [7] = u2
        [8] = u8
        [9] = u5
        [10] = u10
        [11] = u9
        [12] = u3
    --]]
    u13.Client:GetNamespace("Gift"):WaitFor("GiftReceived"):andThen(function(p20) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u12
            [3] = u6
            [4] = u15
            [5] = u11
            [6] = u2
            [7] = u8
            [8] = u5
            [9] = u10
            [10] = u9
            [11] = u3
        --]]
        p20:Connect(function(u21) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u12
                [3] = u6
                [4] = u15
                [5] = u11
                [6] = u2
                [7] = u8
                [8] = u5
                [9] = u10
                [10] = u9
                [11] = u3
            --]]
            if u14.isGameServer() then
                return nil
            end
            local v22 = nil
            if u12.isKitGift(u21.giftType) then
                v22 = u6.createElement(u15, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Kit"] = u21.giftType,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
            elseif u12.isKitSkinGift(u21.giftType) then
                v22 = u6.createElement(u15, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Skin"] = u21.giftType,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
            end
            local function v29() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u11
                    [3] = u2
                    [4] = u8
                    [5] = u12
                    [6] = u5
                    [7] = u10
                    [8] = u9
                    [9] = u3
                --]]
                if u21.giftType == u11.BattlePass then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.BATTLEPASS, {})
                    return
                end
                if u12.isKitGift(u21.giftType) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u21.giftType
                    })
                    return
                end
                if u12.isKitSkinGift(u21.giftType) then
                    local v23 = nil
                    for v24, v25 in u5.values(u10) do
                        local _ = v24 - 1
                        local v26 = u9(v25)
                        local v27
                        if v26 then
                            local v28 = u21.giftType
                            v27 = table.find(v26, v28) ~= nil
                        else
                            v27 = nil
                        end
                        if v27 == true then
                            v23 = v25
                            break
                        end
                    end
                    if v23 then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.KIT_DETAILS_APP, {
                            ["SelectedKit"] = v23
                        })
                        return
                    end
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u3.MAIN)
                end
            end
            local v30 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v31 = u8.GIFTED
            local v32 = {
                ["giftName"] = u21.gift.name
            }
            local v33 = u21.gift.imageId
            if v33 == nil then
                v33 = nil
            end
            v32.giftImageId = v33
            v32.giftCustomImage = v22 or nil
            v32.fromPlayer = u21.fromPlayer
            v32.message = u21.message
            v32.onGiftClick = v29
            v30:openApp(v31, v32)
        end)
    end)
end
v4.CreateController(u16.new())
return nil