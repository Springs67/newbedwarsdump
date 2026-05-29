local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.WatchCollectionTag
local u4 = v2.WatchPlayerCharacter
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, script.Parent, "ui", "resources-accumulated-billboard").ResourcesAccumulatedBillboard
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "PersonalChestResourcesAccumulatedDisplayController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    u8.constructor(p16)
    p16.Name = "PersonalChestResourcesAccumulatedDisplayController"
    p16.chestBillboardMap = {}
    p16.updateResourceCountsSignal = u7.new()
    p16.enableBillboardSignal = u7.new()
end
function u13.KnitStart(u17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u3
        [4] = u9
        [5] = u6
        [6] = u12
        [7] = u4
        [8] = u10
    --]]
    u8.KnitStart(u17)
    u11.Client:Get("GetAccumulatedResourcesFromPersonalChest"):Connect(function(p18) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.updateResourceCountsSignal:Fire(p18.items)
        u17.enableBillboardSignal:Fire(true)
    end)
    u3("chest", function(p19) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u17
            [3] = u6
            [4] = u12
        --]]
        if p19.Name ~= u9.PERSONAL_CHEST and p19.Name ~= u9.OG_PERSONAL_CHEST then
            return nil
        end
        if u17.chestBillboardMap[p19] == nil then
            u17.chestBillboardMap[p19] = u6.mount(u6.createElement(u12, {
                ["chest"] = p19,
                ["updateResourceCountsSignal"] = u17.updateResourceCountsSignal,
                ["enableBillboardSignal"] = u17.enableBillboardSignal
            }), p19)
        end
    end)
    u4(u10.LocalPlayer, function(p20, p21) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u17
            [3] = u11
        --]]
        local v22 = p20:WaitForChild("ObservedChestFolder", 3)
        if not v22 then
            return nil
        end
        p21:GiveTask(v22.Changed:Connect(function(p23) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u17
                [3] = u11
            --]]
            if not p23 then
                return nil
            end
            if p23:GetAttribute("PersonalChest") ~= u10.LocalPlayer.UserId then
                return nil
            end
            u17.enableBillboardSignal:Fire(false)
            u11.Client:Get("ClearAccumulatedResourcesFromPersonalChest"):SendToServer()
        end))
    end)
end
v5.CreateController(u13.new())
return nil