local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "EffectBootsController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.constructor(p12)
    p12.Name = "EffectBootsController"
    p12.maid = u5.new()
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u8
        [4] = u4
    --]]
    u6.KnitStart(u13)
    u7.changed:connect(function(p14, p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u8
            [3] = u4
        --]]
        local v16 = p15.Inventory.observedInventory.inventory.armor
        local u17 = p14.Inventory.observedInventory.inventory.armor
        if v16 == u17 then
            return nil
        end
        local v18 = u13.speedModifier
        if v18 ~= nil then
            v18:Destroy()
        end
        local v19 = u13.jumpModifier
        if v19 ~= nil then
            v19:Destroy()
        end
        u13.maid:DoCleaning()
        local function v25(p20) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            local v21 = nil
            for v22, v23 in u17 do
                local _ = v22 - 1
                local v24
                if v23 == "empty" then
                    v24 = false
                else
                    v24 = v23.itemType == p20
                end
                if v24 == true then
                    v21 = v23
                    break
                end
            end
            return v21 ~= nil
        end
        if v25(u8.SPEED_BOOTS) then
            u13.speedModifier = u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = true,
                ["moveSpeedMultiplier"] = 2
            })
        end
        if v25(u8.JUMP_BOOTS) then
            u13.jumpModifier = u4.Controllers.JumpHeightController:getJumpModifier():addModifier({
                ["jumpHeightMultiplier"] = 2,
                ["airJumps"] = 1
            })
        end
    end)
end
v3.CreateController(u9.new())
return nil