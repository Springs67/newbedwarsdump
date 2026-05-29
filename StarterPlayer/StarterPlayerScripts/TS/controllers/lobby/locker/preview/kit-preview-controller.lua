local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "armor-item-skin-util").ArmorItemSkinUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").getKitSkinMetadata
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerKitSkinPreviewGui
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "KitPreviewController"
    end,
    ["__index"] = u14
})
u32.__index = u32
function u32.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p35)
    p35.Name = "KitPreviewController"
end
function u32.KnitStart(p36) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p36)
end
function u32.cloneDefaultR15Rig(_) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    local v37 = u11:FindFirstChild("Assets")
    local v38
    if v37 == nil then
        v38 = v37
    else
        v38 = v37:FindFirstChild("BaseR15Rig")
    end
    if v38 then
        v37 = v38
    elseif v37 ~= nil then
        v37 = v37:FindFirstChild("Villagers")
        if v37 ~= nil then
            v37 = v37:FindFirstChild("BaseR15Rig")
        end
    end
    if v37 then
        return v37:Clone()
    end
    u6.Warn("KitPreviewController: BaseR15Rig not found under ReplicatedStorage.Assets.")
    return nil
end
function u32.setupLockerKitPreviewScene(_, p39) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 3.141592653589793, 0))
    if u5.Controllers.LockerPreviewController.isFullscreen then
        u5.Controllers.CameraController:setMaxZoom(8)
        u5.Controllers.CameraController:setMinZoom(8)
        u5.Controllers.CameraController:setZoom(8)
    end
    u5.Controllers.LockerPreviewController:toggleLighting(true)
    p39:GiveTask(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5.Controllers.LockerPreviewController:toggleLighting(false)
    end)
end
function u32.unanchorRigParts(_, p40) --[[ Line: 89 ]]
    for v41, v42 in p40:GetDescendants() do
        local _ = v41 - 1
        if v42:IsA("BasePart") then
            v42.Anchored = false
        end
    end
end
function u32.spawnPreviewRig(p43, p44) --[[ Line: 100 ]]
    local v45 = p43:cloneDefaultR15Rig()
    local v46 = v45 or p44:Clone()
    if v45 then
        p43:unanchorRigParts(v46)
    end
    return v46
end
function u32.applyArmorTrimToRig(_, p47, p48) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u18
        [3] = u29
        [4] = u17
        [5] = u31
        [6] = u5
    --]]
    local v49 = u11:FindFirstChild("Assets")
    if v49 ~= nil then
        v49 = v49:FindFirstChild("Armor")
    end
    local v50 = u18[p48.armorSet or "LEATHER"] or u18.LEATHER
    if v49 then
        for _, v51 in v50 do
            local v52 = v49:FindFirstChild(v51)
            if v52 then
                for _, v53 in v52:GetChildren() do
                    if v53:IsA("Accessory") then
                        u29:addAccessory(p47, v53:Clone())
                    end
                end
            end
        end
    end
    for v54, v55 in u17.createArmorTrims(p48.type, p48.color, p48.effectRank) do
        local _ = v54 - 1
        u29:addAccessory(p47, v55)
    end
    u31:weldCharacterAccessories(p47)
    u5.Controllers.ArmorTrimController:attachArmorTrimEffects(p47, p48.type, p48.color, p48.effectRank, p48.effectType)
end
function u32.playIdleOnRig(_, p56) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v57 = u16:getAnimationFromCharacter(p56, "idle")
    if v57 then
        local v58 = p56:FindFirstChild("Humanoid")
        if v58 ~= nil then
            v58 = v58:FindFirstChild("Animator")
        end
        if v58 ~= nil then
            v58 = v58:LoadAnimation(v57)
        end
        if v58 ~= nil then
            v58:Play()
        end
    end
end
function u32.getPreviewLobbyDisplayAnimation(_, p59) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u23
        [3] = u24
    --]]
    if p59 == nil or p59 == u22.NONE then
        return nil
    end
    local v60 = u23(p59)
    local v61 = v60.previewLobbyDisplayConfig
    if v61 ~= nil then
        v61 = v61.poseAnimation
    end
    if v61 ~= nil then
        return v60.previewLobbyDisplayConfig.poseAnimation
    end
    local v62 = v60.kitItems
    if not v62 then
        return nil
    end
    for _, v63 in v62 do
        if v63.previewOnLobbyDisplayModel then
            local v64 = u24(v63.itemType)
            local v65 = v64.thirdPerson
            if v65 ~= nil then
                v65 = v65.holdAnimation
            end
            if v65 == nil then
                v65 = v64.projectileSource
                if v65 ~= nil then
                    v65 = v65.thirdPerson
                    if v65 ~= nil then
                        v65 = v65.idleAnimation
                    end
                end
                if v65 == nil then
                    v65 = v64.sword
                    if v65 ~= nil then
                        v65 = v65.idleAnimation
                    end
                end
            end
            if v65 ~= nil then
                return v65
            end
        end
    end
    return nil
end
function u32.getPreviewLobbyDisplayMount(_, p66) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u23
    --]]
    if p66 == nil or p66 == u22.NONE then
        return nil
    end
    local v67 = u23(p66).previewLobbyDisplayConfig
    if v67 ~= nil then
        v67 = v67.mount
    end
    return v67
end
function u32.getPreviewLobbyDisplayCharacterScaleMultiplier(_, p68) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u23
    --]]
    if p68 == nil or p68 == u22.NONE then
        return nil
    end
    local v69 = u23(p68).previewLobbyDisplayConfig
    if v69 ~= nil then
        v69 = v69.characterScaleMultiplier
    end
    return v69
end
function u32.mountPreviewRig(p70, p71, u72, p73) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u5
        [3] = u12
        [4] = u16
        [5] = u15
    --]]
    local v74 = p70:getPreviewLobbyDisplayMount(p73)
    if v74 == nil then
        return false
    end
    local u75 = u27[v74]
    local v76 = p70:getPreviewLobbyDisplayCharacterScaleMultiplier(p73)
    if v76 ~= nil then
        u72:ScaleTo(u72:GetScale() * v76)
    end
    local u77 = u5.Controllers.MountController:weldMountToCharacter(v74, u72)
    if not u77 then
        return false
    end
    p71:GiveTask(u12.Stepped:Connect(function() --[[ Line: 241 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u77
            [3] = u75
            [4] = u72
        --]]
        u5.Controllers.MountSittingController:performStep(u77, u75, u72)
    end))
    local u78 = u16:playAnimation(u72, u15.SIT_ON_DODO_BIRD, {
        ["looped"] = true
    })
    if u78 then
        u78.Priority = Enum.AnimationPriority.Movement
        p71:GiveTask(function() --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u78
            --]]
            u78:Stop()
            u78:Destroy()
        end)
    end
    local u79 = u5.Controllers.MountAnimationController:playAnimationInMount(u77, u75.animations.idle, 1, true)
    if u79 then
        u79.Priority = Enum.AnimationPriority.Idle
        p71:GiveTask(function() --[[ Line: 257 ]]
            --[[
            Upvalues:
                [1] = u79
            --]]
            u79:Stop()
            u79:Destroy()
        end)
    end
    return true
end
function u32.playPreviewAnimationOnRig(p80, p81, p82) --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v83 = p80:getPreviewLobbyDisplayAnimation(p82)
    if v83 == nil then
        p80:playIdleOnRig(p81)
        return nil
    end
    local v84 = u16:playAnimation(p81, v83, {
        ["looped"] = true
    })
    if not v84 then
        p80:playIdleOnRig(p81)
        return nil
    end
    v84.Priority = Enum.AnimationPriority.Action
end
function u32.getKitSkinItemSkin(_, p85, p86) --[[ Line: 279 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
    --]]
    if p85 == nil then
        return nil
    end
    local v87 = u21(p85).itemSkins
    if not v87 then
        return nil
    end
    for _, v88 in v87 do
        if u20(v88).itemType == p86 then
            return v88
        end
    end
    return nil
end
function u32.mountKitSkinPreviewLoadingSpinner(_, p89) --[[ Line: 294 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u3
    --]]
    local v90 = u4.isSmallScreen() and 36 or 54
    local u91 = u8.mount(u8.createElement("ScreenGui", {
        ["Name"] = "KitSkinPreviewLoading",
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 1000,
        ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
    }, { u8.createElement(u3, {
            ["Size"] = UDim2.fromOffset(v90, v90),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }) }), p89)
    return function() --[[ Line: 307 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u91
        --]]
        u8.unmount(u91)
    end
end
function u32.applyPreviewArmorSetToRig(p92, p93, p94, p95) --[[ Line: 311 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u23
        [3] = u11
        [4] = u18
        [5] = u24
        [6] = u19
        [7] = u29
        [8] = u31
    --]]
    if p94 == nil or p94 == u22.NONE then
        return nil
    end
    local v96 = u23(p94).previewLobbyDisplayConfig
    if v96 ~= nil then
        v96 = v96.armorSet
    end
    if v96 == nil then
        return nil
    end
    local v97 = u11:FindFirstChild("Assets")
    if v97 ~= nil then
        v97 = v97:FindFirstChild("Armor")
    end
    local v98 = u18[v96]
    if not v97 or v98 == nil then
        return nil
    end
    for _, v102 in v98 do
        local v100 = p92:getKitSkinItemSkin(p95, v102)
        local v101 = u24(v102).armor
        if v101 ~= nil then
            v101 = v101.slot
        end
        if v101 ~= nil then
            local v102 = u19.getArmorFolderName(v102, v100, v101)
        end
        local v103 = v97:FindFirstChild(v102)
        if v103 then
            for _, v104 in v103:GetChildren() do
                if v104:IsA("Accessory") then
                    u29:addAccessory(p93, v104:Clone())
                end
            end
        end
    end
    u31:weldCharacterAccessories(p93)
end
function u32.attachPreviewKitItems(p105, p106, p107, p108) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u23
        [3] = u24
        [4] = u25
        [5] = u31
    --]]
    if p107 == nil or p107 == u22.NONE then
        return nil
    end
    local v109 = u23(p107).kitItems
    if not v109 then
        return nil
    end
    for _, v110 in v109 do
        if v110.previewOnLobbyDisplayModel and not u24(v110.itemType).block then
            local v111 = p105:getKitSkinItemSkin(p108, v110.itemType)
            u31:weldAccessory(p106, (u25.createItemInstance(v110.itemType, 1, v111)))
        end
    end
end
function u32.previewArmorTrim(p112, p113) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u13
        [4] = u5
    --]]
    local v114 = u7.new()
    p112:setupLockerKitPreviewScene(v114)
    local v115 = p112:cloneDefaultR15Rig()
    if not v115 then
        u6.Warn("KitPreviewController.previewArmorTrim: no BaseR15Rig; cannot show armor trim preview.")
        return v114
    end
    p112:unanchorRigParts(v115)
    v115.Parent = u13
    v115:PivotTo(CFrame.new(u5.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    v114:GiveTask(v115)
    p112:applyArmorTrimToRig(v115, p113)
    p112:playIdleOnRig(v115)
    return v114
end
function u32.previewKit(p116, p117, p118) --[[ Line: 388 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u22
        [4] = u30
        [5] = u10
        [6] = u28
        [7] = u26
        [8] = u13
        [9] = u5
    --]]
    local v119 = u7.new()
    p116:setupLockerKitPreviewScene(v119)
    local v120 = p117.kind == "kitSkin"
    local v121
    if v120 then
        v121 = p117.kitSkin
    else
        v121 = nil
    end
    local v122
    if p117.kind == "kitSkin" then
        v122 = p117.kit or u21(p117.kitSkin).kit
    else
        v122 = nil
    end
    if v120 then
        if v121 == nil or (v122 == nil or v122 == u22.NONE) then
            v120 = false
        else
            v120 = u30.isLobbyServer()
        end
    end
    if v120 then
        local v123 = u10.LocalPlayer:WaitForChild("PlayerGui", 10)
        if v123 then
            v133 = p116:mountKitSkinPreviewLoadingSpinner(v123)
        else
            v133 = nil
        end
        if u28.Client:Get("LockerKitSkinPreviewRequest"):CallServer({
            ["kit"] = v122,
            ["kitSkin"] = v121
        }) then
            local v124 = nil
            if v123 then
                local v125 = false
                local v126 = 0
                while true do
                    if true then
                        if v125 then
                            v126 = v126 + 1
                        else
                            v125 = true
                        end
                    end
                    if v126 >= 50 then
                        break
                    end
                    v124 = v123:FindFirstChild(u26.FolderName)
                    if v124 ~= nil then
                        v124 = v124:FindFirstChild(u26.ModelName)
                    end
                    if v124 then
                        break
                    end
                    task.wait(0.1)
                end
            end
            local v127 = v133
            if v127 ~= nil then
                v127()
            end
            v133 = nil
            if v124 then
                local v128 = v124:Clone()
                v128.Name = "KitSkinLockerPreview"
                local v129 = v128:FindFirstChild("Animate")
                local v130
                if v129 == nil then
                    v130 = v129
                else
                    v130 = v129:IsA("LocalScript")
                end
                if v130 then
                    v129.Enabled = false
                end
                local v131 = v128:FindFirstChild("HumanoidRootPart")
                if v131 then
                    v131.Anchored = true
                end
                v128.Parent = u13
                v128:PivotTo(CFrame.new(u5.Controllers.LockerPreviewController:getPreviewDummyPosition()))
                v119:GiveTask(v128)
                v119:GiveTask(function() --[[ Line: 457 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.Client:Get("LockerKitSkinPreviewClear"):SendToServer()
                end)
                p116:applyPreviewArmorSetToRig(v128, v122, v121)
                p116:attachPreviewKitItems(v128, v122, v121)
                if not p116:mountPreviewRig(v119, v128, v122) then
                    p116:playPreviewAnimationOnRig(v128, v122)
                end
                return v119
            end
            u28.Client:Get("LockerKitSkinPreviewClear"):SendToServer()
        end
        local v132 = v133
        if v132 ~= nil then
            v132()
        end
        local v133 = nil
    end
    local v134 = p116:spawnPreviewRig(p118)
    v134.Parent = u13
    v134:PivotTo(CFrame.new(u5.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    v119:GiveTask(v134)
    if p117.kind == "kit" then
        v122 = p117.kit
    end
    p116:applyPreviewArmorSetToRig(v134, v122, v121)
    p116:attachPreviewKitItems(v134, v122, v121)
    if not p116:mountPreviewRig(v119, v134, v122) then
        p116:playPreviewAnimationOnRig(v134, v122)
    end
    return v119
end
u5.CreateController(u32.new())
return nil