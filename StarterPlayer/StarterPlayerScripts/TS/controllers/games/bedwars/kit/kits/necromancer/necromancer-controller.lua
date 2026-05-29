local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.ColorUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.TweenService
local u17 = v12.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u26 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u27 = v1.import(script, script.Parent, "ui", "necromancer-staff-ui").NecromancerStaffDisplay
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "NecromancerController"
    end,
    ["__index"] = u26
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u22
    --]]
    u26.constructor(p31, u22.NECROMANCER)
    p31.Name = "NecromancerController"
    p31.settingUpStackTree = false
    p31.gravestoneSecretsMap = {}
end
function u28.onKitLocalActivated(u32, u33) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u15
        [3] = u17
        [4] = u13
        [5] = u6
        [6] = u9
        [7] = u14
        [8] = u25
        [9] = u19
        [10] = u18
        [11] = u8
    --]]
    u32:setUpStackTree(u33)
    u23.Client:Get("NecromancerNewTarget"):Connect(function(p34) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:newTarget(p34.entityInstance)
    end)
    u23.Client:OnEvent("SpawnGravestone", function(p35) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u17
            [3] = u32
            [4] = u13
        --]]
        local v36 = u15.Assets.Misc.Gravestone:Clone()
        v36.Parent = u17
        v36:SetAttribute("GravestoneSecret", p35.secret)
        v36:SetAttribute("GravestonePosition", p35.position)
        v36:SetAttribute("GravestonePlayerUserId", p35.skeletonData.associatedPlayerUserId)
        v36:SetAttribute("ArmorType", p35.skeletonData.armorType)
        v36:SetAttribute("SwordType", p35.skeletonData.weaponType)
        v36:SetAttribute("BowType", p35.skeletonData.bowType)
        v36:PivotTo(CFrame.new(p35.position))
        u32.gravestoneSecretsMap[p35.secret] = v36
        u13:AddTag(v36, "Gravestone")
    end):andThen(function(p37) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:GiveTask(p37)
    end)
    u33:GiveTask((u23.Client:Get("UseGravestone"):Connect(function(p38) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        local v39 = u32.gravestoneSecretsMap[p38.secret]
        if not v39 then
            return nil
        end
        u32:lowerGravestone(v39, p38.secret)
    end)))
    u33:GiveTask(u6("Gravestone", function(u40) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u15
            [4] = u25
            [5] = u19
            [6] = u18
            [7] = u8
            [8] = u23
            [9] = u32
        --]]
        local u41 = u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Claim Skeleton",
            ["ObjectText"] = "Gravestone",
            ["HoldDuration"] = 0.1,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 12,
            ["ClickablePrompt"] = true,
            ["Parent"] = u40:WaitForChild("Root"):WaitForChild("GravestoneModel"):WaitForChild("Gravestone"):WaitForChild("PromptAttachment")
        })
        local v42 = u14:GetPlayerByUserId(u40:GetAttribute("GravestonePlayerUserId"))
        if v42 ~= nil then
            v42 = v42.Name
        end
        if v42 ~= "" and v42 then
            u40.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText.Text = v42
            u40.Root.GravestoneModel.Gravestone.SurfaceGui.AlwaysOnTop = false
        end
        local v43 = u40:GetAttribute("ArmorType")
        local v44 = u15.Assets.Armor:WaitForChild(v43):Clone()
        if v44 then
            for _, v45 in v44:GetDescendants() do
                if v45:IsA("Accessory") then
                    v45.Parent = u40.Root.GravestoneModel
                    u25:weldCharacterAccessories(u40.Root.GravestoneModel)
                end
            end
        end
        u41.PromptButtonHoldEnded:Connect(function(p46) --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u41
                [3] = u19
                [4] = u18
                [5] = u8
                [6] = u40
                [7] = u23
                [8] = u32
            --]]
            if p46 == u14.LocalPlayer then
                u41.Enabled = false
                u19:playAnimation(p46, u18.PUNCH)
                u8.Controllers.ViewmodelController:playAnimation(u18.FP_USE_ITEM)
                local v47 = u40:GetAttribute("GravestoneSecret")
                local v48 = {
                    ["associatedPlayerUserId"] = u40:GetAttribute("GravestonePlayerUserId"),
                    ["armorType"] = u40:GetAttribute("ArmorType"),
                    ["weaponType"] = u40:GetAttribute("SwordType"),
                    ["bowType"] = u40:GetAttribute("BowType")
                }
                if u23.Client:Get("ActivateGravestone"):CallServer({
                    ["secret"] = v47,
                    ["position"] = u40:GetAttribute("GravestonePosition"),
                    ["skeletonData"] = v48
                }).success then
                    u41:Destroy()
                    u32:useGravestone(p46, u40)
                end
                if u41 then
                    u41.Enabled = true
                end
            end
        end)
    end))
end
function u28.setUpStackTree(u49, p50) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u11
        [4] = u27
    --]]
    if not (u49.skeletonStackTree or u49.settingUpStackTree) then
        u49.settingUpStackTree = true
        local v51 = u14.LocalPlayer:GetAttribute("SkeletonCount")
        local v52 = u8.Controllers.StatusInfoListController
        local v53 = {
            ["skeletonStacks"] = v51 == nil and 0 or v51
        }
        u49.skeletonStackTree = v52:waitForSetupAddElement(u11.createElement(u27, v53))
    end
    u14.LocalPlayer:GetAttributeChangedSignal("SkeletonCount"):Connect(function(_) --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49:updateTree()
    end)
    p50:GiveTask(function() --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u11
        --]]
        if u49.skeletonStackTree then
            u11.unmount(u49.skeletonStackTree)
        end
    end)
end
function u28.updateTree(p54) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u27
    --]]
    if p54.skeletonStackTree then
        local v55 = u14.LocalPlayer:GetAttribute("SkeletonCount")
        local v56 = u11
        local v57 = p54.skeletonStackTree
        local v58 = {
            ["skeletonStacks"] = v55 == nil and 0 or v55
        }
        v56.update(v57, u11.createElement(u27, v58))
    end
end
function u28.useGravestone(_, u59, u60) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u24
        [3] = u21
        [4] = u5
        [5] = u15
        [6] = u17
        [7] = u3
        [8] = u19
        [9] = u18
        [10] = u20
    --]]
    task.spawn(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u9
            [3] = u24
            [4] = u21
            [5] = u5
            [6] = u60
            [7] = u15
            [8] = u17
            [9] = u3
            [10] = u19
            [11] = u18
            [12] = u20
        --]]
        if u59.Parent ~= nil and u59.Character then
            local v61 = u9.Controllers.KitSkinController:getKitSkin(u59)
            local v62 = u24.GRAVESTONE_USE
            if v61 == u21.CRYPTWRECKED then
                v62 = u24.GRAVESTONE_USE_CRYPTWRECKED
            end
            u5:playSound(v62, {
                ["position"] = u60:GetPivot().Position
            })
            local u63 = u15.Assets.Effects.GravestoneBeams:Clone()
            u63.CFrame = u60:GetPivot()
            u63.Parent = u17
            for _, v64 in u63:GetChildren() do
                if v64:IsA("Beam") then
                    v64.Attachment0 = u60.Root.GravestoneModel.Gravestone.BeamAttachment
                    local v65 = u59.Character:WaitForChild("LeftHand", 3)
                    if v65 ~= nil then
                        v65 = v65:WaitForChild("LeftGripAttachment", 3)
                    end
                    v64.Attachment1 = v65
                    v64.Enabled = true
                end
            end
            u3:playAnimation(u59, u19:getAssetId(u18.USE_GRAVESTONE), {
                ["looped"] = false
            })
            task.delay(u20.NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION, function() --[[ Line: 206 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:Destroy()
            end)
        end
    end)
end
function u28.lowerGravestone(u66, u67, u68) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u5
        [3] = u24
        [4] = u15
        [5] = u17
        [6] = u16
    --]]
    local u69 = u20.NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION
    local v70 = u67.PrimaryPart
    if v70 == nil then
        v70 = nil
        for v71, v72 in u67:GetDescendants() do
            local _ = v71 - 1
            if v72:IsA("BasePart") == true then
                v70 = v72
                break
            end
        end
    end
    u5:playSound(u24.GRAVESTONE_LOWER, {
        ["position"] = v70.Position
    })
    task.spawn(function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u67
            [3] = u15
            [4] = u17
            [5] = u16
            [6] = u66
            [7] = u68
        --]]
        local u73 = TweenInfo.new(u69, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
        for _, u74 in u67:GetDescendants() do
            task.spawn(function() --[[ Line: 238 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u17
                    [3] = u67
                --]]
                local v75 = u15.Assets.Effects.GravestoneLower:Clone()
                v75.Parent = u17
                v75:PivotTo(u67:GetPivot() - Vector3.new(0, 3, 0))
                v75:WaitForChild("Bits"):Emit(10)
                task.wait(1)
                v75:Destroy()
            end)
            task.spawn(function() --[[ Line: 250 ]]
                --[[
                Upvalues:
                    [1] = u74
                    [2] = u16
                    [3] = u73
                --]]
                if u74:IsA("BasePart") then
                    u16:Create(u74, u73, {
                        ["CFrame"] = u74:GetPivot() - Vector3.new(0, 5, 0)
                    }):Play()
                end
            end)
        end
        task.wait(u69)
        u67:Destroy()
        u66.gravestoneSecretsMap[u68] = nil
    end)
end
function u28.onKitLocalDeactivated(_) --[[ Line: 270 ]] end
function u28.onKitReplicationActivated(_, _) --[[ Line: 272 ]] end
function u28.onKitReplicationDeactivated(_) --[[ Line: 274 ]] end
function u28.onInnateAbilityEnabled(_, _, _) --[[ Line: 276 ]] end
function u28.onAbilityUsed(_, _, _) --[[ Line: 278 ]] end
function u28.newTarget(p76, p77) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    if p77 then
        if p76.targetIcon then
            p76.targetIcon.Parent = p77
        else
            local v78 = u10
            local v79 = {
                ["ResetOnSpawn"] = false,
                ["AlwaysOnTop"] = true,
                ["Parent"] = p77.PrimaryPart,
                ["Size"] = UDim2.fromScale(3, 3),
                ["Children"] = { u10("ImageLabel", {
                        ["ImageTransparency"] = 0.25,
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = "rbxassetid://71410359692884",
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.new(1.5, 0, 1.5, 0),
                        ["ImageColor3"] = u4.WHITE
                    }) }
            }
            p76.targetIcon = v78("BillboardGui", v79)
        end
    else
        local v80 = p76.targetIcon
        if v80 ~= nil then
            v80:Destroy()
        end
        p76.targetIcon = nil
        return nil
    end
end
u8.CreateController(u28.new())
return nil