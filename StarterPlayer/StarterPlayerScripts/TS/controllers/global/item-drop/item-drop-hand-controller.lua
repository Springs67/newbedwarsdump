local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, script.Parent, "item-drop-controller").ItemDropController
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "ItemDropHandController"
    end,
    ["__index"] = u10
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p17)
    p17.Name = "ItemDropHandController"
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p18)
end
function u14.isRelevantItem(_, p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
    --]]
    if u9.includes(p19.itemType, "wool") then
        return true
    end
    local v20 = u14.ITEMS
    local v21 = p19.itemType
    return table.find(v20, v21) ~= nil
end
function u14.onEnable(p22, _) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u7
        [4] = u5
        [5] = u11
        [6] = u2
        [7] = u13
        [8] = u8
    --]]
    if u4.isMobileControls() then
        p22:setupYield(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u7
                [3] = u5
                [4] = u11
                [5] = u2
                [6] = u13
                [7] = u8
            --]]
            u6.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await()
            local u23 = u7.mount(u7.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u7.createElement(u5, {
                    ["Image"] = u11.UP_MOBILE,
                    ["Position"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("DropItem"),
                    ["Size"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("DropItem"),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 56 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                        --]]
                        u13:dropItemInHand()
                    end
                }) }), u8.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u23
                --]]
                u7.unmount(u23)
            end
        end)
    end
end
function u14.onDisable(_) --[[ Line: 67 ]] end
u14.ITEMS = {
    v12.IRON,
    v12.DIAMOND,
    v12.EMERALD,
    v12.ARROW,
    v12.TELEPEARL,
    v12.TNT,
    v12.STONE_BRICK,
    v12.BLASTPROOF_CERAMIC,
    v12.WOOD_PLANK_OAK,
    v12.OBSIDIAN,
    v12.SLIME_BLOCK
}
return {
    ["ItemDropHandController"] = u6.CreateController(u14.new())
}