local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SpiritAssassinMasterEmoteController"
    end,
    ["__index"] = u6
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p21)
    p21.Name = "SpiritAssassinMasterEmoteController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u15
        [4] = u17
        [5] = u5
        [6] = u9
        [7] = u10
        [8] = u11
        [9] = u8
        [10] = u7
        [11] = u12
        [12] = u14
        [13] = u13
        [14] = u4
        [15] = u16
    --]]
    u6.KnitStart(p22)
    local v23 = u3.Controllers.EmoteHandlerController
    local v24 = u15.SPIRIT_ASSASSIN_TOP_ASSASSIN
    local u25 = u17
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(_, p30, p31, _, u32) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u10
            [4] = u3
            [5] = u11
            [6] = u8
            [7] = u7
            [8] = u12
            [9] = u14
            [10] = u13
            [11] = u4
            [12] = u16
        --]]
        local u33 = u5:GetPlayerByUserId(p30)
        if not u33 then
            return nil
        end
        local v34 = p31.Humanoid.Animator
        local u35 = u9:getEntity(u33)
        local v36
        if u35 == nil then
            v36 = u35
        else
            v36 = u35:getInstance()
        end
        local v37 = u10.DEFAULT
        if v36 then
            v37 = u3.Controllers.KitController:getKitSkin(v36)
        end
        local u38 = u11[v37].spiritAssassin
        u32:GiveTask((v34.AnimationPlayed:Connect(function(p39) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u7
                [3] = u12
                [4] = u33
                [5] = u14
                [6] = u13
                [7] = u38
                [8] = u35
                [9] = u5
                [10] = u4
                [11] = u16
                [12] = u32
            --]]
            local v40 = p39.Animation
            if v40 ~= nil then
                v40 = v40.AnimationId
            end
            if v40 == u8:getAssetId(u7.SPIRIT_ASSASSIN_SPIN_EMOTE) then
                local v41 = u12.getInventory(u33).hand
                if v41 ~= nil then
                    v41 = v41.itemType
                end
                local v42 = u14
                local v43 = u13.SPIRIT_DAGGER
                local v44 = u38
                if v44 ~= nil then
                    v44 = v44.dagger
                end
                local u45 = v42.createItemInstance(v43, 1, v44)
                local v46 = u14
                local v47 = u13.SPIRIT_DAGGER_LEFT
                local v48 = u38
                if v48 ~= nil then
                    v48 = v48.daggerLeft
                end
                local u49 = v46.createItemInstance(v47, 1, v48)
                local v50 = u14
                local v51 = u13.SPIRIT_DAGGER
                local v52 = u38
                if v52 ~= nil then
                    v52 = v52.dagger
                end
                local v53 = v50.createItemInstance(v51, 1, v52)
                local v54 = u35
                if v54 ~= nil then
                    local v55 = v54:getHandItemInstanceFromCharacter()
                    if v55 ~= nil then
                        v55:Destroy()
                    end
                end
                if u33 == u5.LocalPlayer then
                    u4.Controllers.ViewmodelController:setHeldItem(v53)
                end
                local v56 = u35
                if v56 ~= nil then
                    local v57 = v56:getHumanoid()
                    if v57 ~= nil then
                        v57:AddAccessory(u49)
                    end
                end
                local v58 = u35
                if v58 ~= nil then
                    local v59 = v58:getHumanoid()
                    if v59 ~= nil then
                        v59:AddAccessory(u45)
                    end
                end
                u45.Destroying:Connect(function() --[[ Line: 131 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                    --]]
                    local v60 = u49
                    if v60 ~= nil then
                        v60:Destroy()
                    end
                end)
                u49.Destroying:Connect(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    local v61 = u45
                    if v61 ~= nil then
                        v61:Destroy()
                    end
                end)
                u16:weldCharacterAccessories(u33.Character)
                u32:GiveTask(function() --[[ Line: 144 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u5
                        [3] = u12
                        [4] = u45
                        [5] = u49
                        [6] = u14
                        [7] = u4
                        [8] = u16
                    --]]
                    if u33 == u5.LocalPlayer then
                        local v62 = u12.getInventory(u33).hand
                        if v62 ~= nil then
                            v62 = v62.itemType
                        end
                        local v63 = u45
                        if v63 ~= nil then
                            v63:Destroy()
                        end
                        local v64 = u49
                        if v64 ~= nil then
                            v64:Destroy()
                        end
                        if not v62 then
                            return nil
                        end
                        local v65 = u14.createItemInstance(v62)
                        u4.Controllers.ViewmodelController:setHeldItem(v65)
                        u16:weldCharacterAccessories(u33.Character)
                    end
                end)
            end
        end)))
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 171 ]] end
    v23:registerHandler(v24, u26)
end
u3.CreateController(u18.new())
return nil