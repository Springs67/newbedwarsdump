local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent, "ui", "item-pop-up").ItemPopUp
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MysteriousBoxController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "MysteriousBoxController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u8
        [4] = u2
        [5] = u10
        [6] = u5
        [7] = u9
        [8] = u4
        [9] = u11
    --]]
    u7.KnitStart(u16)
    u6.StartConsuming:connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u10
        --]]
        if p17:isCancelled() then
            return nil
        end
        if p17.itemType == u8.MYSTERIOUS_BOX then
            u2:playSound(u10.GIFT_BOX_UNWRAP, {
                ["volumeMultiplier"] = 0.4
            })
        end
    end)
    u6.ItemConsumed:connect(function(p18) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u2
            [4] = u10
        --]]
        local v19 = u5:GetPlayerFromCharacter(p18.entity:getInstance())
        if p18.itemType == u8.MYSTERIOUS_BOX and v19 == u5.LocalPlayer then
            u2:playSound(u10.GIFT_BOX_OPEN, {
                ["volumeMultiplier"] = 0.4
            })
        end
    end)
    u9.Client:Get("MysteriousBoxOpen"):Connect(function(p20) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u4
            [3] = u11
            [4] = u5
        --]]
        if u16.popUpTree then
            u4.unmount(u16.popUpTree)
        end
        u16.popUpTree = u4.mount(u4.createElement(u11, {
            ["item"] = p20.item,
            ["tier"] = p20.tier
        }), u5.LocalPlayer:WaitForChild("PlayerGui"))
    end)
end
function u12.unmountItemPopup(p21) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p21.popUpTree then
        u4.unmount(p21.popUpTree)
        p21.popUpTree = nil
    end
end
v3.CreateController(u12.new())
return nil