local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "CustomEntityController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "CustomEntityController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u4
        [4] = u7
        [5] = u8
        [6] = u9
        [7] = u5
        [8] = u10
    --]]
    u6.KnitStart(p15)
    u2("entity", function(u16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u8
            [4] = u9
            [5] = u5
            [6] = u10
        --]]
        if u16:GetAttribute("KitEntityType") ~= nil then
            local u17 = u4.new()
            local u18 = u4.new()
            task.spawn(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u16
                    [3] = u17
                    [4] = u8
                    [5] = u9
                    [6] = u5
                    [7] = u10
                    [8] = u18
                --]]
                if not u7.new(u16) then
                    return nil
                end
                u16:WaitForChild("Humanoid")
                local function u21(p19) --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u8
                        [3] = u9
                        [4] = u16
                        [5] = u5
                        [6] = u10
                    --]]
                    u17:DoCleaning()
                    if not (p19 and u8(p19)) then
                        return nil
                    end
                    u9.createItemInstance(p19).Parent = u16
                    local v20 = u5:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(p19):WaitForChild(p19):Clone()
                    v20.Parent = u16
                    u17:GiveTask(v20)
                    u10:weldCharacterAccessories(u16)
                end
                local function u24(p22) --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u8
                        [3] = u9
                        [4] = u16
                        [5] = u10
                    --]]
                    u18:DoCleaning()
                    if not (p22 and u8(p22)) then
                        return nil
                    end
                    local v23 = u9.createItemInstance(p22)
                    v23.Parent = u16
                    u18:GiveTask(v23)
                    u10:weldCharacterAccessories(u16)
                end
                u21((u16:GetAttribute("ArmorType")))
                u24((u16:GetAttribute("HandItemType")))
                u16:GetAttributeChangedSignal("ArmorType"):Connect(function() --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u21
                    --]]
                    u21((u16:GetAttribute("ArmorType")))
                end)
                u16:GetAttributeChangedSignal("HandItemType"):Connect(function() --[[ Line: 74 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u24
                    --]]
                    u24((u16:GetAttribute("HandItemType")))
                end)
            end)
        end
    end)
end
v3.CreateController(u11.new())
return nil