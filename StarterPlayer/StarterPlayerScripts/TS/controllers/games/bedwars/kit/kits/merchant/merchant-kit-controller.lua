local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").Queue
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u16 = v1.import(script, script.Parent, "ui", "merchant-discount").MerchantDiscount
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "MerchantKitController"
    end,
    ["__index"] = u15
})
u17.__index = u17
function u17.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u13
        [4] = u5
        [5] = u6
    --]]
    u15.constructor(p20, u12.MERCHANT)
    p20.Name = "MerchantKitController"
    p20.discountedItems = {}
    p20.discountedItemsEvent = u13.Client:Get("MerchantItems")
    p20.discountAppliedEvent = u13.Client:Get("MerchantDiscountApplied")
    p20.purchaseQueue = u5.new()
    p20.queueAccumulator = 0
    p20.frameRef = u6.createRef()
end
function u17.onKitLocalActivated(_, _) --[[ Line: 46 ]] end
function u17.onKitLocalDeactivated(_) --[[ Line: 48 ]] end
function u17.onKitReplicationActivated(u21, p22) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u16
    --]]
    u21:createUIContainer()
    p22:GiveTask(u21.discountedItemsEvent:Connect(function(p23) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.discountedItems = p23.items
    end))
    p22:GiveTask(u21.discountAppliedEvent:Connect(function(p24) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.purchaseQueue:Push(p24)
    end))
    u9.Heartbeat:Connect(function(p25) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u6
            [3] = u16
        --]]
        if not u21.purchaseQueue:IsEmpty() then
            local v26 = u21
            v26.queueAccumulator = v26.queueAccumulator + p25
        end
        if u21.queueAccumulator >= 0.5 then
            local v27 = u21.purchaseQueue:Pop()
            local v28 = v27 and u21.frameRef:getValue()
            if v28 then
                u21:scheduleForDeletion((u6.mount(u6.createElement(u16, {
                    ["item"] = v27.item,
                    ["refund"] = v27.refund
                }), v28)))
            end
            u21.queueAccumulator = 0
        end
    end)
end
function u17.onKitReplicationDeactivated(_) --[[ Line: 78 ]] end
function u17.onInnateAbilityEnabled(_, _, _) --[[ Line: 80 ]] end
function u17.onAbilityUsed(_, _, p29) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u3
        [3] = u14
        [4] = u2
        [5] = u10
    --]]
    if p29.ability ~= u11.MERCHANT_REROLL then
        return nil
    end
    u3:playSound(u14.BOUNTY_CLAIMED)
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u10.BEDWARS_ITEM_SHOP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u10.BEDWARS_ITEM_SHOP)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.BEDWARS_ITEM_SHOP, {})
    end
end
function u17.createUIContainer(p30) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
    --]]
    local v31 = u6.mount
    local v32 = u6.createElement
    local v33 = {
        ["DiscountContainer"] = u6.createElement("Frame", {
            [u6.Ref] = p30.frameRef,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Active"] = false
        }, { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["Padding"] = UDim.new(0, 15)
            }) })
    }
    v31(v32("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, v33), u8.LocalPlayer:WaitForChild("PlayerGui"))
end
function u17.scheduleForDeletion(_, u34) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    task.delay(2, function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u34
        --]]
        u6.unmount(u34)
    end)
end
v4.CreateController(u17.new())
return nil