local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u19 = v1.import(script, script.Parent, "ui", "brewing-cauldron").BrewingCauldron
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "BrewingCauldronController"
    end,
    ["__index"] = u11
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p23)
    p23.Name = "BrewingCauldronController"
    p23.whitelist = {}
    p23.activeBillboards = {}
    p23.activeInteractivePrompts = {}
    p23.activeStatus = {}
end
function u20.KnitStart(u24) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u10
        [4] = u17
        [5] = u14
        [6] = u9
        [7] = u18
    --]]
    u11.KnitStart(u24)
    u8:GetInstanceRemovedSignal("brewing_cauldron"):Connect(function(p25) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u24
        --]]
        if p25.Parent == u10 then
            return nil
        end
        local v26 = p25:GetAttribute("id")
        u24.activeBillboards[v26] = nil
        u24.activeStatus[v26] = nil
    end)
    u17.Client:WaitFor("CraftingEntityInventoryUpdate"):andThen(function(p27) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u14
        --]]
        p27:Connect(function(p28) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u14
            --]]
            local v29 = p28.craftingEntity
            local v30 = p28.inventory
            local v31 = p28.status
            local v32 = p28.timeToCraft
            local v33 = u24.activeInteractivePrompts[v29.id]
            if v33 == nil then
                return nil
            elseif v31 == u14.standby then
                u24.activeStatus[v29.id] = "STANDBY"
                u24:updateBillboard(v29, v31, v30)
                u24:updatePrompt(v29, "Deposit")
                return
            elseif v31 == u14.validate then
                u24:updateBillboard(v29, v31, v30)
                u24:updatePrompt(v29, "Deposit")
                u24.activeStatus[v29.id] = "VALIDATE"
                return
            elseif v31 == u14.crafting then
                u24.activeStatus[v29.id] = "CRAFTING"
                u24:updateBillboard(v29, u14.crafting, v30, "Crafting", v32)
                v33.Enabled = false
                return
            elseif v31 == u14.finished then
                v33.Enabled = true
                u24.activeStatus[v29.id] = "FINISHED"
                u24:updateBillboard(v29, u14.finished, v30, "Item Collection")
                u24:updatePrompt(v29, "Collect")
            end
        end)
    end)
    u17.Client:WaitFor("CraftingEntityAccess"):andThen(function(p34) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u24
            [3] = u18
            [4] = u14
        --]]
        p34:Connect(function(p35) --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u24
                [3] = u18
                [4] = u14
            --]]
            local v36 = {}
            for v37, v38 in p35.craftingEntity do
                v36[v37] = v38
            end
            local v39 = v36.owner
            local v40 = u9.LocalPlayer
            local v41 = false
            u24.whitelist = p35.whitelist
            local v42 = p35.accessLevel
            if v42 == "OWNER" then
                if u18(v40, p35.kit) and v39 == u9.LocalPlayer then
                    u24:updateBillboard(p35.craftingEntity, u14.standby)
                    u24:createPrompts(p35.craftingEntity)
                    return
                end
            elseif v42 == "TEAM" then
                local v43 = v40.Team
                if v43 ~= nil then
                    v43 = v43:GetPlayers()
                end
                if v43 ~= nil then
                    for _, v44 in v43 do
                        if u18(v44, p35.kit) then
                            v41 = true
                        end
                    end
                    if u18(v40, p35.kit) or v41 then
                        u24:updateBillboard(p35.craftingEntity, u14.standby)
                        u24:createPrompts(p35.craftingEntity)
                        return
                    end
                end
            elseif v42 == "ANY" then
                if u18(v40, p35.kit) then
                    u24:updateBillboard(p35.craftingEntity, u14.standby)
                    u24:createPrompts(p35.craftingEntity)
                    return
                end
            elseif u18(v40, p35.kit) then
                u24:updateBillboard(p35.craftingEntity, u14.standby)
                u24:createPrompts(p35.craftingEntity)
            end
        end)
    end)
end
function u20.updateBillboard(p45, p46, p47, p48, p49, p50) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
    --]]
    local v51 = p45.activeBillboards[p46.id]
    local v52 = p48 or {}
    local v53 = p49 == nil and "Ingredients" or p49
    local v54 = p50 == nil and 8 or p50
    if v51 then
        u6.update(v51, u6.createElement(u19, {
            ["Inventory"] = v52,
            ["CraftingStatus"] = p47,
            ["Text"] = v53,
            ["timeToCraft"] = v54
        }))
    else
        p45.activeBillboards[p46.id] = u6.mount(u6.createElement(u19, {
            ["Text"] = "Deposit Ingredients",
            ["Inventory"] = v52,
            ["CraftingStatus"] = p47,
            ["timeToCraft"] = v54
        }), p46.craftingBlock)
    end
end
function u20.updatePrompt(p55, p56, p57) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
    --]]
    local v58 = p55.activeInteractivePrompts[p56.id]
    if v58 == nil then
        return nil
    end
    v58.ActionText = p57
    local v59 = u15:getEntity(u9.LocalPlayer)
    if v59 == nil then
        return nil
    end
    local v60 = v59:getItemInHand()
    if v60 ~= nil then
        v60 = v60.Name
    end
    if v60 == nil then
        return nil
    end
    if p55.activeStatus[p56.id] == "STANDBY" then
        p55:TogglePrompt(p56.id, v60, v58)
    end
end
function u20.onItemSwap(u61, u62) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u15
    --]]
    u2(function(p63, _) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
            [3] = u61
            [4] = u62
        --]]
        if p63 ~= u9.LocalPlayer then
            return nil
        end
        local u64 = u15:getEntity(p63)
        if not u64 then
            return nil
        end
        task.spawn(function() --[[ Line: 238 ]]
            --[[
            Upvalues:
                [1] = u64
                [2] = u61
                [3] = u62
            --]]
            u64:getInstance():WaitForChild("HandInvItem")
            u64:getInstance().HandInvItem.Changed:Connect(function(p65) --[[ Line: 240 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u62
                --]]
                local v66 = u61.activeInteractivePrompts[u62]
                if p65 == nil or v66 == nil then
                    return nil
                end
                u61:TogglePrompt(u62, p65.Name, v66)
            end)
        end)
    end)
end
function u20.TogglePrompt(p67, p68, p69, p70) --[[ Line: 252 ]]
    local v71 = p67.activeStatus[p68] == "CRAFTING"
    local v72 = p67.activeStatus[p68] == "VALIDATE"
    local v73 = p67.activeStatus[p68] == "STANDBY"
    if v71 or v72 then
        p70.Enabled = false
        return
    elseif v73 then
        local v74 = p67.whitelist
        if table.find(v74, p69) == nil then
            p70.Enabled = false
        else
            p70.Enabled = true
        end
    else
        p70.Enabled = true
        return
    end
end
function u20.createPrompts(p75, u76) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u16
        [4] = u13
        [5] = u12
        [6] = u4
        [7] = u17
    --]]
    local v77 = u5.Controllers.ProximityPromptController:createProximityPrompt({
        ["Name"] = "InteractPrompt",
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 6,
        ["ActionText"] = "Deposit",
        ["ClickablePrompt"] = false,
        ["Parent"] = u76.craftingBlock
    })
    v77.Enabled = false
    v77.Triggered:Connect(function(p78) --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u16
            [3] = u13
            [4] = u12
            [5] = u4
            [6] = u17
            [7] = u76
        --]]
        if p78 == u9.LocalPlayer then
            local v79 = u16.getInventory(p78).hand
            if v79 ~= nil then
                v79 = v79.itemType
            end
            u13:playAnimation(p78, u12.PUNCH)
            u4.Controllers.ViewmodelController:playAnimation(u12.FP_USE_ITEM)
            local v80 = {
                ["craftingEntity"] = u76,
                ["itemInHand"] = v79
            }
            u17.Client:Get("CraftingEntityInteract"):SendToServer(v80)
        end
    end)
    p75.activeInteractivePrompts[u76.id] = v77
    p75.activeStatus[u76.id] = "STANDBY"
    p75:onItemSwap(u76.id)
end
u4.CreateController(u20.new())
return nil