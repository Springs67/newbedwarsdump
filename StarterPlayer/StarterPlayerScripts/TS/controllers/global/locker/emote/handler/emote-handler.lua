local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacterAnimation
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
return {
    ["EmoteHandler"] = {
        ["constructor"] = function(p15) --[[ Name: constructor, Line 19 ]]
            p15.maidMap = {}
        end,
        ["enable"] = function(p16, p17, p18, p19) --[[ Name: enable, Line 22 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v20 = u7.new()
            p16:cleanMaid(p17)
            if not p18.PrimaryPart then
                return nil
            end
            p16:onEnable(p17, p18, p19, v20)
            p16.maidMap[p17] = v20
        end,
        ["disable"] = function(p21, p22, p23, p24) --[[ Name: disable, Line 33 ]]
            p21:cleanMaid(p22)
            if not p23.PrimaryPart then
                return nil
            end
            p21:onDisable(p22, p23, p24)
        end,
        ["cleanMaid"] = function(p25, p26) --[[ Name: cleanMaid, Line 40 ]]
            if p25.maidMap[p26] == nil then
                return false
            end
            local v27 = p25.maidMap[p26]
            if v27 ~= nil then
                v27:DoCleaning()
            end
            p25.maidMap[p26] = nil
            return true
        end,
        ["playSound"] = function(p28, p29, p30, p31) --[[ Name: playSound, Line 57 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u4
            --]]
            local v32 = u11:getState().Settings.emote_volume
            local v33 = u4
            local v34 = {}
            for v35, v36 in p31 do
                v34[v35] = v36
            end
            local v37 = p31.volumeMultiplier
            v34.volumeMultiplier = v32 * ((v37 == 0 or (v37 ~= v37 or not v37)) and 1 or v37)
            local v38
            if p28:isPreview(p30) then
                v38 = nil
            else
                v38 = p31.position
            end
            v34.position = v38
            return v33:playSound(p29, v34)
        end,
        ["isPreview"] = function(_, p39) --[[ Name: isPreview, Line 75 ]]
            return p39 == -1
        end,
        ["setupInstance"] = function(_, p40) --[[ Name: setupInstance, Line 78 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3:setQueryIgnored(p40, true)
            p40:SetAttribute("DisableInPlayerViewport", true)
            for v41, v42 in p40:GetDescendants() do
                local _ = v41 - 1
                if v42:IsA("BasePart") then
                    u3:setQueryIgnored(v42, true)
                    v42:SetAttribute("DisableInPlayerViewport", true)
                end
            end
        end,
        ["watchEmoteAnimation"] = function(_, u43, p44, u45, u46) --[[ Name: watchEmoteAnimation, Line 92 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u5
            --]]
            if u43 == -1 then
                return p44.Humanoid.Animator.AnimationPlayed:Connect(function(p47) --[[ Line: 97 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u45
                        [3] = u46
                    --]]
                    local v48 = p47.Animation
                    if v48 ~= nil then
                        v48 = v48.AnimationId
                    end
                    if v48 ~= u12:getAssetId(u45) then
                        return nil
                    end
                    u46(p47)
                end)
            else
                return u5({ u12:getAssetId(u45) }, function(p49, p50) --[[ Line: 109 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u46
                    --]]
                    if p49.UserId ~= u43 then
                        return nil
                    end
                    u46(p50)
                end)
            end
        end,
        ["handleRightHandItemWithEmote"] = function(_, p51, p52, p53, p54, p55) --[[ Name: handleRightHandItemWithEmote, Line 118 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u9
                [3] = u6
                [4] = u10
                [5] = u13
                [6] = u14
            --]]
            local v56 = u7.new()
            local u57 = u9:GetPlayerByUserId(p51)
            u6.Controllers.ViewmodelController:setHeldItem(nil)
            local v58 = p53(u57)
            if not v58 then
                return v56
            end
            local v59 = u10:FindFirstChild("Items")
            if v59 ~= nil then
                v59 = v59:FindFirstChild(v58)
            end
            if v59 == nil or not v59:IsA("Accessory") then
                return v56
            end
            local v60 = v59:Clone()
            for v61, v62 in v60:GetDescendants() do
                local _ = v61 - 1
                if v62:IsA("BasePart") then
                    v62.CanCollide = false
                end
            end
            v60.Parent = p52
            local v63 = v60:WaitForChild("Handle")
            if v63 ~= nil then
                local v64 = v63:FindFirstChild("RightGripAttachment")
                if v64 ~= nil then
                    v64:Destroy()
                end
            end
            local v65 = v60:WaitForChild("Handle")
            if v65 == nil then
                return v56
            end
            local u66 = v65:Clone()
            u66.Parent = p52
            if p55 ~= nil then
                p55 = p55.name
            end
            u66.Name = p55 == nil and "item" or p55
            u66:SetAttribute("DisableInPlayerViewport", true)
            v60:Destroy()
            local u67 = p54(u66, v58)
            v56:GiveTask(function() --[[ Line: 175 ]]
                --[[
                Upvalues:
                    [1] = u66
                    [2] = u67
                    [3] = u57
                    [4] = u9
                    [5] = u13
                    [6] = u14
                    [7] = u6
                --]]
                u66:Destroy()
                u67:Destroy()
                if u57 == u9.LocalPlayer then
                    local v68 = u13.getInventory(u57).hand
                    if v68 ~= nil then
                        v68 = v68.itemType
                    end
                    if not v68 then
                        return nil
                    end
                    local v69 = u14.createItemInstance(v68)
                    u6.Controllers.ViewmodelController:setHeldItem(v69)
                end
            end)
            return v56
        end,
        ["handleLeftHandItemWithEmote"] = function(_, p70, p71, p72, p73, p74) --[[ Name: handleLeftHandItemWithEmote, Line 194 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u9
                [3] = u6
                [4] = u10
                [5] = u13
                [6] = u14
            --]]
            local v75 = u7.new()
            local u76 = u9:GetPlayerByUserId(p70)
            u6.Controllers.ViewmodelController:setHeldItem(nil)
            local v77 = p72(u76)
            if not v77 then
                return v75
            end
            local v78 = u10:FindFirstChild("Items")
            if v78 ~= nil then
                v78 = v78:FindFirstChild(v77)
            end
            if v78 == nil or not v78:IsA("Accessory") then
                return v75
            end
            local v79 = v78:Clone()
            for v80, v81 in v79:GetDescendants() do
                local _ = v80 - 1
                if v81:IsA("BasePart") then
                    v81.CanCollide = false
                end
            end
            v79.Parent = p71
            local v82 = v79:WaitForChild("Handle")
            if v82 ~= nil then
                local v83 = v82:FindFirstChild("LeftGripAttachment")
                if v83 ~= nil then
                    v83:Destroy()
                end
            end
            local v84 = v79:WaitForChild("Handle")
            if v84 == nil then
                return v75
            end
            local u85 = v84:Clone()
            u85.Parent = p71
            if p74 ~= nil then
                p74 = p74.name
            end
            u85.Name = p74 == nil and "item" or p74
            u85:SetAttribute("DisableInPlayerViewport", true)
            v79:Destroy()
            local u86 = p73(u85, v77)
            v75:GiveTask(function() --[[ Line: 251 ]]
                --[[
                Upvalues:
                    [1] = u85
                    [2] = u86
                    [3] = u76
                    [4] = u9
                    [5] = u13
                    [6] = u14
                    [7] = u6
                --]]
                u85:Destroy()
                u86:Destroy()
                if u76 == u9.LocalPlayer then
                    local v87 = u13.getInventory(u76).hand
                    if v87 ~= nil then
                        v87 = v87.itemType
                    end
                    if not v87 then
                        return nil
                    end
                    local v88 = u14.createItemInstance(v87)
                    u6.Controllers.ViewmodelController:setHeldItem(v88)
                end
            end)
            return v75
        end
    }
}