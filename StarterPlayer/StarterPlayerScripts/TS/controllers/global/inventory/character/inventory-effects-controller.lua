local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCharacter
local u6 = v3.WatchPlayerCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "InventoryEffectsController"
    end
})
u16.__index = u16
function u16.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(_) --[[ Line: 29 ]] end
function u16.onStart(u19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u10
        [4] = u6
        [5] = u9
        [6] = u15
        [7] = u11
        [8] = u14
        [9] = u4
        [10] = u12
        [11] = u7
    --]]
    u5(function(_, p20) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u10
        --]]
        local u21 = u13:getEntity(p20)
        if not u21 then
            return
        end
        task.spawn(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u10
            --]]
            u21:getInstance():WaitForChild("HandInvItem")
            u21:getInstance().HandInvItem.Changed:Connect(function(p22) --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u21
                --]]
                u10.EntityChangeHeldItem:fire(u21, p22)
            end)
        end)
        local u23 = 0
        local v24 = false
        local v25 = { "ArmorInvItem_0", "ArmorInvItem_1", "ArmorInvItem_2" }
        while true do
            if v24 then
                u23 = u23 + 1
            else
                v24 = true
            end
            if u23 >= #v25 then
                return
            end
            local u26 = v25[u23 + 1]
            task.spawn(function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u26
                    [3] = u10
                    [4] = u23
                --]]
                u21:getInstance():WaitForChild(u26).Changed:Connect(function(p27) --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u21
                        [3] = u23
                    --]]
                    u10.EntityChangeArmorSlotItem:fire(u21, p27, u23)
                end)
            end)
        end
    end)
    u6(u9.LocalPlayer, function(_) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u15
            [3] = u11
            [4] = u14
            [5] = u19
            [6] = u4
            [7] = u12
            [8] = u9
            [9] = u7
        --]]
        local u28 = u13:getLocalPlayerEntity()
        if not u28 then
            return nil
        end
        local u29 = nil
        u28:getInstance():WaitForChild("HandInvItem")
        u28:getInstance().HandInvItem.Changed:Connect(function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
                [3] = u15
                [4] = u11
                [5] = u14
                [6] = u19
                [7] = u4
                [8] = u12
                [9] = u9
                [10] = u7
            --]]
            local v30 = u28:getInstance().HandInvItem.Value
            if v30 == nil then
                u29 = nil
                return nil
            end
            if v30 == u29 then
                return nil
            end
            u29 = v30
            local v31 = u15.EQUIP_DEFAULT
            local v32 = u11.EQUIP_1
            local v33 = u14(v30.Name)
            if v33.sword then
                v31 = u15.EQUIP_SWORD
            elseif not v33.breakBlock and (not v33.block and v33.projectileSource) then
                v31 = u15.EQUIP_BOW
            end
            if u19.activeSound then
                u19.activeSound:Stop()
            end
            u19.activeSound = u4:playSound(v31)
            u12:playAnimation(u9.LocalPlayer, v32, {
                ["fadeInTime"] = 0
            })
            if u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                u19:setHandItemEffectsVisible(false)
            end
        end)
    end)
    u7.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p34) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if p34 == 0 then
            u19:setHandItemEffectsVisible(false)
        else
            u19:setHandItemEffectsVisible(true)
        end
    end)
end
function u16.setHandItemEffectsVisible(_, p35) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
    --]]
    local v36 = u13:getEntity(u9.LocalPlayer)
    if v36 ~= nil then
        v36 = v36:getHandItemInstanceFromCharacter()
    end
    if v36 then
        if p35 then
            local v37 = v36:GetDescendants()
            local function v40(p38) --[[ Line: 133 ]]
                if p38:IsA("Beam") or (p38:IsA("ParticleEmitter") or p38:IsA("Trail")) then
                    local v39 = p38:GetAttribute("CustomizedVisualMode")
                    if v39 ~= 0 and (v39 == v39 and (v39 ~= "" and v39)) then
                        return nil
                    end
                    p38.Enabled = true
                end
            end
            for v41, v42 in v37 do
                v40(v42, v41 - 1, v37)
            end
        else
            local v43 = v36:GetDescendants()
            local function v46(p44) --[[ Line: 147 ]]
                if p44:IsA("Beam") or (p44:IsA("ParticleEmitter") or p44:IsA("Trail")) then
                    local v45 = p44:GetAttribute("CustomizedVisualMode")
                    if v45 ~= 0 and (v45 == v45 and (v45 ~= "" and v45)) then
                        return nil
                    end
                    p44.Enabled = false
                end
            end
            for v47, v48 in v43 do
                v46(v48, v47 - 1, v43)
            end
        end
    else
        return nil
    end
end
v2.defineMetadata(u16, "identifier", "client/controllers/global/inventory/character/inventory-effects-controller@InventoryEffectsController")
v2.defineMetadata(u16, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u16, "$:flamework@Controller", v8, {
    {}
})
return {
    ["InventoryEffectsController"] = u16
}