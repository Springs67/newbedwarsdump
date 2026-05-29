local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContentProvider
local u11 = v9.Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent, "ui", "vending-machine-app-wrapper").VendingMachineAppWrapper
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "VendingMachineUiController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p19)
    p19.Name = "VendingMachineUiController"
    p19.hasPreloaded = false
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u10
        [4] = u3
        [5] = u14
        [6] = u7
        [7] = u13
        [8] = u6
        [9] = u8
        [10] = u15
        [11] = u11
    --]]
    u12.KnitStart(u20)
    u4("VendingMachine", function(_) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u10
            [3] = u3
            [4] = u14
            [5] = u7
            [6] = u13
        --]]
        if u20.hasPreloaded then
            return nil
        end
        u20.hasPreloaded = true
        u10:PreloadAsync({ u3:createSound(u14.VENDING_ROLL_TICK), u3:createSound(u14.VENDING_ROLL_PRIZE), u7("ImageLabel", {
                ["Image"] = u13.VENDING_RING
            }) })
    end)
    u4("VendingMachine", function(p21) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u15
            [4] = u11
        --]]
        local v22 = p21:WaitForChild("Screen")
        local u23 = u6.new()
        v22.AncestryChanged:Connect(function(_, p24) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            if p24 == nil then
                u23:DoCleaning()
            end
        end)
        local u25 = u8.mount(u8.createElement("SurfaceGui", {
            ["ResetOnSpawn"] = false,
            ["Adornee"] = v22
        }, { u8.createElement(u15, {
                ["vendingMachine"] = p21
            }) }), u11.LocalPlayer:WaitForChild("PlayerGui"), "VendingMachine")
        u23:GiveTask(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u25
            --]]
            u8.unmount(u25)
        end)
    end)
end
v5.CreateController(u16.new())
return nil