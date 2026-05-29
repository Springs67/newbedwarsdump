local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.MobileTouchType
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ContextActionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.RunService
local u16 = v11.TweenService
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").WarlockBalance
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v31 = v1.import(script, script.Parent.Parent.Parent, "target-selector", "target-selector-util")
local u32 = v31.TargetSelector
local u33 = v31.TargetType
local u34 = v1.import(script, script.Parent, "ui", "warlock-staff-ui").WarlockStaffDisplay
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "WarlockStaffController"
    end,
    ["__index"] = u18
})
u35.__index = u35
function u35.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u8
    --]]
    u18.constructor(p38)
    p38.Name = "WarlockStaffController"
    p38.maid = u8.new()
    p38.animationMaid = u8.new()
    p38.linkMap = {}
    p38.soundMap = {}
    p38.settingUpStackTree = false
    p38.energyStack = 0
    p38.warning = false
end
function u35.KnitStart(u39) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u20
        [4] = u26
        [5] = u29
        [6] = u27
        [7] = u13
        [8] = u17
        [9] = u19
        [10] = u32
        [11] = u28
        [12] = u23
        [13] = u25
        [14] = u14
    --]]
    u18.KnitStart(u39)
    u7.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.WARLOCK_IDLE, u20.WARLOCK_WALK, u20.HALLOWEEN_BOSS_CAST },
        ["imageIds"] = { u26.WHITE_BEAM_ARROW }
    })
    u29.HandItemRendered:connect(function(p40) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u13
            [3] = u39
        --]]
        if p40.itemType == u27.WARLOCK_STAFF then
            local u41 = u13:GetPlayerFromCharacter(p40.entity)
            if not u41 then
                return nil
            end
            task.delay(1, function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u41
                --]]
                u39:updateSoulStack(u41)
            end)
        end
    end)
    u17.AbilityUsed:connect(function(p42) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
            [3] = u32
            [4] = u39
            [5] = u28
        --]]
        if p42.userCharacter == u13.LocalPlayer.Character and p42.ability == u19.WARLOCK_LINK then
            local v43 = u32:getTargetEntity()
            if not v43 then
                return nil
            end
            if v43 == u39.target then
                return nil
            end
            u28.Client:Get("WarlockLinkTarget"):CallServer({
                ["target"] = v43:getInstance()
            })
        end
    end)
    u28.Client:Get("CreateWarlockLink"):Connect(function(p44) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u39
        --]]
        local v45 = u23:getEntity(p44.target)
        if not v45 then
            return nil
        end
        u39:createLink(p44.user, v45, p44.isAlly)
    end)
    u28.Client:Get("WarlockLinkRemove"):Connect(function(p46) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39:removeLink(p46.user)
        u39:clearSound(p46.user)
    end)
    u7.Controllers.KitController:watchLocalKit(function(p47) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u39
            [3] = u13
        --]]
        if p47 ~= u25.WARLOCK then
            return nil
        end
        if not (u39.energyStackTree or u39.settingUpStackTree) then
            u39.settingUpStackTree = true
            u39:mountStacksUI()
        end
        u13.LocalPlayer:GetAttributeChangedSignal("WarlockEnergy"):Connect(function(_) --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39:updateStacksUI()
        end)
    end)
    u28.Client:Get("WarlockGainStack"):Connect(function(u48) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u23
            [3] = u27
            [4] = u7
            [5] = u39
        --]]
        local v49 = u14.Assets.Effects.WarlockSoul:Clone()
        local v50 = u23:getEntity(u48.warlock)
        if v50 ~= nil then
            v50 = v50:getHandItemInstanceFromCharacter()
        end
        local v51
        if v50 == nil then
            v51 = v50
        else
            v51 = v50.Name
        end
        if v51 ~= u27.WARLOCK_STAFF or not v50 then
            return nil
        end
        local u52 = v50:FindFirstChild("Handle")
        if u52 ~= nil then
            u52 = u52:FindFirstChild("1")
        end
        if u52 then
            u7.Controllers.ReceiveItemEffectController:playEffect(v49, u48.fromPosition, function() --[[ Line: 141 ]]
                --[[
                Upvalues:
                    [1] = u52
                --]]
                return u52.WorldCFrame
            end, 1)
            task.delay(1, function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u48
                --]]
                u39:updateSoulStack(u48.warlock)
            end)
        end
    end)
end
function u35.isRelevantItem(_, p53) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    return p53.itemType == u27.WARLOCK_STAFF
end
function u35.onEnable(p54, _, _) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u33
        [3] = u22
        [4] = u23
        [5] = u7
        [6] = u24
        [7] = u2
        [8] = u19
        [9] = u5
    --]]
    local v55 = u32
    local v56 = u33.ALL
    local v57 = {
        ["requireSight"] = true
    }
    local v58 = u22.SELECTOR_RANGE
    local v59 = p54.energyStack * u22.BOUNS_RANGE_PER_STACK
    v57.distance = v58 + math.min(v59, 21)
    v55:enableTargetSelector(v56, v57)
    p54:setUpAnimation()
    local v60 = "rbxassetid://15186577197"
    local v61 = u23:getLocalPlayerEntity()
    if v61 then
        local v62 = u24[u7.Controllers.KitSkinController:getKitSkin(v61:getInstance())]
        if v62.eldric then
            v60 = v62.eldric.staffIcon
        end
    end
    local v63 = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v60
        }
    }
    p54.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u19.WARLOCK_LINK, v63):expect())
    local v64 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v65 = {
        ["action"] = "Attack",
        ["actionId"] = "WARLOCK",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 178 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u19
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u19.WARLOCK_LINK)
        end,
        ["mobile"] = {
            ["touchType"] = u5.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 183 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u19.WARLOCK_LINK)
            end
        }
    }
    local v66 = v64:bindAction(v65)
    p54.maid:GiveTask(v66)
end
function u35.onDisable(p67) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u12
    --]]
    u32:disableTargetSelector()
    p67.maid:DoCleaning()
    u12:UnbindAction("WARLOCK")
    p67:cleanUpAnimation()
end
function u35.createLink(u68, u69, p70, p71) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u21
        [3] = u20
        [4] = u13
        [5] = u7
        [6] = u23
        [7] = u27
        [8] = u9
        [9] = u26
        [10] = u16
    --]]
    local v72 = u4:playAnimation(u69, u21:getAssetId(u20.HALLOWEEN_BOSS_CAST))
    if v72 ~= nil then
        v72:AdjustSpeed(0.75)
    end
    u68:setUpSoundTrack(u69, p70, p71)
    if u69 == u13.LocalPlayer then
        u7.Controllers.ViewmodelController:playAnimation(u20.FP_TWIRLBLADE_ATTACK_2)
        local v73 = u69.Character
        local v74
        if v73 == nil then
            v74 = v73
        else
            v74 = v73.PrimaryPart
            if v74 ~= nil then
                v74 = v74.Position
            end
        end
        local v75 = p70:getInstance().PrimaryPart
        if v75 ~= nil then
            v75 = v75.Position
        end
        if v73 and (v75 and v74) then
            v73:PivotTo(CFrame.new(v74, v75))
        end
    end
    local v76 = u69.Character
    local v77 = p70:getInstance()
    if not (v76 and v77) then
        return nil
    end
    local v78 = u23:getEntity(u69)
    if v78 ~= nil then
        v78 = v78:getHandItemInstanceFromCharacter()
    end
    local v79
    if v78 == nil then
        v79 = v78
    else
        v79 = v78.Name
    end
    if v79 ~= u27.WARLOCK_STAFF or not v78 then
        return nil
    end
    local u80 = v78:FindFirstChild("Handle")
    local u81
    if u80 == nil then
        u81 = u80
    else
        u81 = u80:FindFirstChild("1")
    end
    local u82 = u9("Model", {
        ["Parent"] = v76
    })
    local u83
    if v77 == nil then
        u83 = v77
    else
        u83 = v77:WaitForChild("UpperTorso", 1)
        if u83 ~= nil then
            u83 = u83:WaitForChild("BodyFrontAttachment", 1)
        end
    end
    if not u83 and v77.PrimaryPart then
        u83 = u9("Attachment", {
            ["Parent"] = v77.PrimaryPart
        })
    end
    local u84 = p71 and 1 or -1
    if u80 ~= nil then
        u80 = u80:FindFirstChild("Parts")
    end
    if u80 ~= nil then
        u80 = u80:GetChildren()
    end
    if u81 and u83 then
        task.spawn(function() --[[ Line: 278 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u80
                [3] = u69
                [4] = u13
                [5] = u68
                [6] = u9
                [7] = u81
                [8] = u83
                [9] = u26
                [10] = u16
                [11] = u84
            --]]
            local v85 = false
            local v86 = 0
            while true do
                if v85 then
                    v86 = v86 + 1
                else
                    v85 = true
                end
                if v86 >= 5 or (not u82 or u82.Parent == nil) then
                    return
                end
                if u80 and #u80 >= 10 then
                    u80[v86 * 2 + 1].Material = Enum.Material.Neon
                    u80[v86 * 2 + 1 + 1].Material = Enum.Material.Neon
                end
                local v87 = math.random(-1.5, 1.5)
                local v88 = ColorSequence.new(Color3.fromRGB(33, 247, 61))
                if u69 == u13.LocalPlayer then
                    if u68.warning then
                        v88 = ColorSequence.new(Color3.fromRGB(250, 163, 0))
                    else
                        v88 = ColorSequence.new(Color3.fromRGB(33, 247, 61))
                    end
                elseif u69.Team ~= u13.LocalPlayer.Team then
                    v88 = ColorSequence.new(Color3.fromRGB(250, 0, 0))
                end
                u16:Create(u9("Beam", {
                    ["TextureSpeed"] = 0,
                    ["Width0"] = 0,
                    ["Width1"] = 0,
                    ["FaceCamera"] = true,
                    ["TextureLength"] = 0,
                    ["Attachment0"] = u81,
                    ["Attachment1"] = u83,
                    ["Texture"] = u26.WHITE_BEAM_ARROW,
                    ["Color"] = v88,
                    ["Parent"] = u82,
                    ["Transparency"] = NumberSequence.new(0, 0)
                }), TweenInfo.new(1.5), {
                    ["TextureLength"] = 1,
                    ["Width0"] = 5,
                    ["Width1"] = 5,
                    ["TextureSpeed"] = u84 * (math.random() + 0.5),
                    ["CurveSize0"] = v87,
                    ["CurveSize1"] = v87
                }):Play()
                task.wait(1.75)
            end
        end)
        u68.linkMap[u69] = u82
        if u69 == u13.LocalPlayer then
            u68:initRangeIndicator(p70, u82)
        end
    end
end
function u35.removeLink(u89, u90) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u23
        [3] = u27
    --]]
    local v91 = u89.linkMap[u90]
    if v91 then
        v91:Destroy()
    end
    u89.linkMap[u90] = nil
    if u90 == u13.LocalPlayer then
        u89.target = nil
    end
    task.delay(1, function() --[[ Line: 351 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u90
            [3] = u23
            [4] = u27
        --]]
        if u89.linkMap[u90] == nil then
            local v92 = u23:getEntity(u90)
            if v92 ~= nil then
                v92 = v92:getHandItemInstanceFromCharacter()
            end
            local v93
            if v92 == nil then
                v93 = v92
            else
                v93 = v92.Name
            end
            if v93 ~= u27.WARLOCK_STAFF or not v92 then
                return nil
            end
            local v94 = v92:FindFirstChild("Handle")
            if v94 ~= nil then
                v94 = v94:FindFirstChild("Parts")
            end
            if v94 ~= nil then
                v94 = v94:GetChildren()
            end
            if v94 then
                for v95, v96 in v94 do
                    local _ = v95 - 1
                    v96.Material = Enum.Material.Plastic
                end
            end
        end
    end)
end
function u35.initRangeIndicator(u97, u98, u99) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u22
    --]]
    u97.target = u98
    local u100 = nil
    u100 = u15.Heartbeat:Connect(function() --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u97
            [2] = u100
            [3] = u98
            [4] = u13
            [5] = u22
            [6] = u99
        --]]
        if not u97.target then
            u100:Disconnect()
            return nil
        end
        local v101 = u98:getInstance().PrimaryPart
        if v101 ~= nil then
            v101 = v101.Position
        end
        local v102 = u13.LocalPlayer.Character
        if v102 ~= nil then
            v102 = v102.PrimaryPart
            if v102 ~= nil then
                v102 = v102.Position
            end
        end
        if not (v101 and v102) then
            u100:Disconnect()
            return nil
        end
        if (v101 - v102).Magnitude > u22.SELECTOR_RANGE + u97.energyStack and not u97.warning then
            u97.warning = true
            u97:enableRangeWarning(u98, u99)
        end
        if u97.warning and (v101 - v102).Magnitude < u22.SELECTOR_RANGE + u97.energyStack then
            u97.warning = false
            u97:disableRangeWarning(u98, u99)
        end
    end)
end
function u35.enableRangeWarning(_, _, p103) --[[ Line: 427 ]]
    local v104 = p103:GetChildren()
    local function v106(p105) --[[ Line: 429 ]]
        if p105:IsA("Beam") then
            p105.Transparency = NumberSequence.new(0.75, 0.75)
            p105.Color = ColorSequence.new(Color3.fromRGB(250, 163, 0))
        end
    end
    for v107, v108 in v104 do
        v106(v108, v107 - 1, v104)
    end
end
function u35.disableRangeWarning(_, _, p109) --[[ Line: 439 ]]
    local v110 = p109:GetChildren()
    local function v112(p111) --[[ Line: 441 ]]
        if p111:IsA("Beam") then
            p111.Transparency = NumberSequence.new(0, 0)
            p111.Color = ColorSequence.new(Color3.fromRGB(33, 247, 61))
        end
    end
    for v113, v114 in v110 do
        v112(v114, v113 - 1, v110)
    end
end
function u35.updateStacksUI(p115) --[[ Line: 451 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u10
        [3] = u34
    --]]
    if p115.energyStackTree then
        local v116 = u13.LocalPlayer:GetAttribute("WarlockEnergy")
        local v117 = v116 == nil and 0 or v116
        p115.energyStack = v117
        local v118 = "rbxassetid://15186577197"
        local v119 = u13.LocalPlayer.Character
        if v119 then
            local v120 = p115:getKitSkinData(v119)
            if v120 then
                v118 = v120.staffIcon
            end
        end
        local v121 = u10
        local v122 = p115.energyStackTree
        local v123 = {
            ["energyStacks"] = v117 == nil and 0 or v117,
            ["icon"] = v118
        }
        v121.update(v122, u10.createElement(u34, v123))
    end
end
function u35.mountStacksUI(p124) --[[ Line: 479 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u22
        [4] = u10
        [5] = u34
    --]]
    local v125 = "rbxassetid://15186577197"
    local v126 = u13.LocalPlayer.Character
    if v126 then
        local v127 = p124:getKitSkinData(v126)
        if v127 then
            v125 = v127.staffIcon
        end
    end
    local v128 = u13.LocalPlayer:GetAttribute("WarlockEnergy")
    local v129 = u7.Controllers.StatusInfoListController
    local v130 = {}
    local v131 = math
    local v132 = v128 == nil and 0 or v128
    local v133 = u22.MAX_ENERGY
    v130.energyStacks = v131.clamp(v132, 0, v133)
    v130.icon = v125
    p124.energyStackTree = v129:waitForSetupAddElement(u10.createElement(u34, v130))
end
function u35.getKitSkinData(_, p134) --[[ Line: 500 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u24
    --]]
    local v135 = u24[u7.Controllers.KitSkinController:getKitSkin(p134)]
    if v135.eldric then
        return v135.eldric
    end
end
function u35.setUpAnimation(p136) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u21
        [4] = u20
    --]]
    local u137 = u13.LocalPlayer
    local v138 = u137.Character
    if not v138 then
        return nil
    end
    local u139 = v138.Humanoid
    local u140 = false
    local u141 = nil
    p136.animationMaid:GiveTask(function() --[[ Line: 516 ]]
        --[[
        Upvalues:
            [1] = u141
        --]]
        local v142 = u141
        if v142 ~= nil then
            v142:Stop()
        end
        local v143 = u141
        if v143 ~= nil then
            v143:Destroy()
        end
    end)
    p136.animationMaid:GiveTask(u139:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 526 ]]
        --[[
        Upvalues:
            [1] = u139
            [2] = u140
            [3] = u141
            [4] = u4
            [5] = u137
            [6] = u21
            [7] = u20
        --]]
        if u139.MoveDirection.Magnitude > 0 and (u139:GetState() == Enum.HumanoidStateType.Running and not u140) then
            local v144 = u141
            if v144 ~= nil then
                v144:Stop()
            end
            local v145 = u141
            if v145 ~= nil then
                v145:Destroy()
            end
            u141 = u4:playAnimation(u137, u21:getAssetId(u20.WARLOCK_WALK))
            local v146 = u141
            if v146 ~= nil then
                v146:AdjustSpeed(2)
            end
            u140 = true
        end
        if u139.MoveDirection.Magnitude == 0 and u139:GetState() == Enum.HumanoidStateType.Running then
            u140 = false
            local v147 = u141
            if v147 ~= nil then
                v147:Stop()
            end
            local v148 = u141
            if v148 ~= nil then
                v148:Destroy()
            end
            u140 = false
            u141 = u4:playAnimation(u137, u21:getAssetId(u20.WARLOCK_IDLE))
        end
    end))
end
function u35.cleanUpAnimation(p149) --[[ Line: 558 ]]
    p149.animationMaid:DoCleaning()
end
function u35.setUpSoundTrack(p150, p151, _, p152) --[[ Line: 561 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u23
        [3] = u6
        [4] = u9
    --]]
    local v153
    if p152 then
        v153 = u30.WARLOCK_HEAL_START
    else
        v153 = u30.WARLOCK_SIPHON_START
    end
    local v154
    if p152 then
        v154 = u30.WARLOCK_HEAL_LOOP
    else
        v154 = u30.WARLOCK_SIPHON_LOOP
    end
    local v155 = p151.Character
    if v155 ~= nil then
        v155 = v155.PrimaryPart
    end
    if not v155 then
        return nil
    end
    local v156 = u23:getEntity(p151)
    if v156 then
        local v157 = p150:getKitSkinData(v156:getInstance())
        if v157 then
            v153 = v157.drainCastSound
            v154 = v157.drainLoopSound
        end
    end
    u6:playSound(v153, {
        ["position"] = v155.Position
    })
    local v158 = u9("Sound", {
        ["RollOffMinDistance"] = 20,
        ["RollOffMaxDistance"] = 40,
        ["Volume"] = 0.5,
        ["Playing"] = true,
        ["Looped"] = true,
        ["SoundId"] = v154,
        ["Parent"] = v155
    })
    v158:Play()
    p150.soundMap[p151] = v158
    return v158
end
function u35.clearSound(p159, p160) --[[ Line: 599 ]]
    local v161 = p159.soundMap[p160]
    if v161 ~= nil then
        v161:Stop()
    end
    if v161 ~= nil then
        v161:Destroy()
    end
    p159.soundMap[p160] = nil
end
function u35.updateSoulStack(_, p162) --[[ Line: 615 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u27
    --]]
    local v163 = u23:getEntity(p162)
    if v163 ~= nil then
        v163 = v163:getHandItemInstanceFromCharacter()
    end
    local v164
    if v163 == nil then
        v164 = v163
    else
        v164 = v163.Name
    end
    if v164 ~= u27.WARLOCK_STAFF or not v163 then
        return nil
    end
    local v165 = v163:WaitForChild("Handle", 3)
    if p162 ~= nil then
        p162 = p162:GetAttribute("WarlockEnergy")
    end
    local v166 = p162 == nil and 0 or p162
    if v165 ~= nil then
        v165 = v165:WaitForChild("StackIndicator", 3)
    end
    if v165 then
        v165.Rate = v166
    end
end
u7.CreateController(u35.new())
return nil