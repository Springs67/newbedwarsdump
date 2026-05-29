local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ComponentUtil
local u6 = v4.GameQueryUtil
local u7 = v4.SoundManager
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u13 = v12.Linear
local u14 = v12.OutBack
local u15 = v12.OutExpo
local u16 = v12.OutSine
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u20 = v19.CollectionService
local u21 = v19.Players
local u22 = v19.ReplicatedStorage
local u23 = v19.RunService
local u24 = v19.Workspace
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u26 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u27 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic")
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").snapBlockRotation
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u36 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u37 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u38 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u39 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u40 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u41 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u42 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u43 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u44 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u45 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "BlackMarketeerController"
    end,
    ["__index"] = u44
})
u45.__index = u45
function u45.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    local v46 = u45
    local v47 = setmetatable({}, v46)
    return v47:constructor(...) or v47
end
function u45.constructor(p48) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u38
        [3] = u41
        [4] = u39
        [5] = u30
    --]]
    u44.constructor(p48, u38.BLACK_MARKET_TRADER, {
        ["sounds"] = { u41.WREN_PANFLUTE_SUMMON, u41.WREN_PANFLUTE_UNSUMMON },
        ["imageIds"] = { u39.OPEN_BLACK_MARKET_ABILITY_ICON, u39.CLOSE_BLACK_MARKET_ABILITY_ICON },
        ["animations"] = { u30.SLIME_TAMER_FLUTE_USE, u30.SLIME_TAMER_FLUTE_USE_FP }
    })
    p48.Name = "BlackMarketeerController"
end
function u45.KnitStart(p49) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u44
    --]]
    u44.KnitStart(p49)
end
function u45.onKitLocalActivated(_, p50) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u40
        [3] = u21
        [4] = u2
        [5] = u28
        [6] = u29
    --]]
    local u51 = u10.Controllers.BlackMarketeerCoinController:listenToPickup()
    if u51 then
        p50:GiveTask(function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            return u51.Destroy()
        end)
    end
    p50:GiveTask(u40.Client:Get("BlackMarketBlockBreak"):Connect(function(p52) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u2
            [3] = u28
            [4] = u29
        --]]
        if p52.shopOwnerUserId ~= u21.LocalPlayer.UserId then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u28.CLOSE_BLACK_MARKET)
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u28.OPEN_BLACK_MARKET, u29[u28.OPEN_BLACK_MARKET].triggerConfig)
    end))
end
function u45.onKitLocalDeactivated(_) --[[ Line: 87 ]] end
function u45.onKitReplicationActivated(u53, p54) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u21
        [3] = u26
        [4] = u11
        [5] = u28
        [6] = u2
        [7] = u29
        [8] = u3
        [9] = u22
        [10] = u24
        [11] = u7
        [12] = u41
        [13] = u42
        [14] = u10
    --]]
    p54:GiveTask((u40.Client:Get("BlackMarketPlaceShop"):Connect(function(u55) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u26
            [3] = u11
            [4] = u28
            [5] = u2
            [6] = u29
            [7] = u3
            [8] = u22
            [9] = u53
            [10] = u24
            [11] = u7
            [12] = u41
            [13] = u42
            [14] = u10
        --]]
        if not u55.blockPosition then
            if u55.shopOwnerUserId == u21.LocalPlayer.UserId then
                local u56 = nil
                u56 = u26.AbilityUsed:setPriority(u11.MONITOR + 1):connect(function(p57) --[[ Line: 95 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u28
                        [3] = u2
                        [4] = u29
                        [5] = u56
                    --]]
                    if p57.userCharacter ~= u21.LocalPlayer.Character then
                        return nil
                    end
                    if p57.ability ~= u28.OPEN_BLACK_MARKET then
                        return nil
                    end
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u28.CLOSE_BLACK_MARKET)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u28.OPEN_BLACK_MARKET, u29[u28.OPEN_BLACK_MARKET].triggerConfig)
                    u56:Destroy()
                end)
            end
            return nil
        end
        local v58 = u3:getWorldPosition(u55.blockPosition)
        local u59 = CFrame.new(v58 - Vector3.new(0, 1.5, 0))
        local v60 = u22.Assets.Effects.MatchLevelUp
        local v61 = u21:GetPlayerByUserId(u55.shopOwnerUserId)
        if v61 then
            v60 = u53:getSummonEffect(v61) or v60
        end
        local v62 = v60:Clone()
        v62:PivotTo(u59)
        v62.Parent = u24
        u7:playSound(u41.MATCH_LEVEL_UP_1, {
            ["position"] = u59.Position
        })
        u42:playInstanceEffects({ v62 }, {
            ["destroyAfterSec"] = 3
        })
        task.delay(1, function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u55
                [3] = u10
                [4] = u53
                [5] = u59
            --]]
            local v63 = u21:GetPlayerByUserId(u55.shopOwnerUserId)
            if v63 ~= nil then
                v63 = v63.Character
            end
            if not v63 then
                return nil
            end
            local v64 = u10.Controllers.KitController:getKitSkin(v63)
            local u65 = u53:createPortalEffect(u59, u59.Position, v64)
            task.delay(4, function() --[[ Line: 142 ]]
                --[[
                Upvalues:
                    [1] = u65
                --]]
                return u65:DoCleaning()
            end)
        end)
    end)))
end
function u45.onKitReplicationDeactivated(_) --[[ Line: 149 ]] end
function u45.onInnateAbilityEnabled(_, _, _) --[[ Line: 151 ]] end
function u45.onAbilityUsed(p66, p67, p68) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v69 = p68.ability
    if v69 == u28.OPEN_BLACK_MARKET then
        p66:playFluteEffect(p67, true)
        return
    elseif v69 == u28.CLOSE_BLACK_MARKET then
        p66:playFluteEffect(p67, false)
    end
end
function u45.getShopComponent(_, p70) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u5
        [3] = u33
    --]]
    local v71 = u20:GetTagged("BLackMarketShop")
    local v72 = p70.UserId
    local v73 = "BLACKMARKET_" .. tostring(v72)
    local v74 = nil
    local v75 = v74
    for v76, v77 in v71 do
        local _ = v76 - 1
        local v78 = u5:getComponent(v77, u33)
        local v79
        if v78 == nil then
            v79 = v78
        else
            v79 = v78.attributes.Id
        end
        local v80
        if v79 == v73 then
            v74 = v78
            v75 = v74
            v80 = true
        else
            v80 = nil
        end
        if v80 == true then
            break
        end
    end
    return v75
end
function u45.playFluteEffect(_, p81, p82) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u35
        [3] = u1
        [4] = u34
        [5] = u10
        [6] = u36
        [7] = u22
        [8] = u43
        [9] = u31
        [10] = u30
        [11] = u9
        [12] = u7
        [13] = u41
    --]]
    local v83 = u21:GetPlayerFromCharacter(p81)
    local u84 = u35:getEntity(p81)
    if not u1.instanceof(u84, u34) then
        return nil
    end
    if u84 ~= nil then
        u84 = u84:getHandItemInstanceFromCharacter()
        if u84 ~= nil then
            u84 = u84:WaitForChild("Handle", 0.6)
        end
    end
    if u84 then
        u84.Transparency = 1
    end
    local v85 = u10.Controllers.KitController:getKitSkin(p81)
    local u86
    if v85 == u36.HALLOWEEN_WREN then
        u86 = u22.Assets.Misc.BlackMarketTraderPanFluteHalloween:Clone()
    elseif v85 == u36.HOLIDAY_WREN then
        u86 = u22.Assets.Misc.BlackMarketTraderPanFluteHoliday:Clone()
    elseif v85 == u36.TIDAL_WREN then
        u86 = u22.Assets.Misc.BlackMarketTraderPanFluteTidal:Clone()
    else
        local _ = v85 == u36.DEFAULT
        u86 = u22.Assets.Misc.BlackMarketTraderPanFlute:Clone()
    end
    if not u86 then
        return nil
    end
    local v87 = p81:FindFirstChildWhichIsA("Humanoid")
    if v87 ~= nil then
        v87:AddAccessory(u86)
    end
    u43:weldCharacterAccessories(p81)
    if v83 then
        u31:playAnimation(v83, u30.SLIME_TAMER_FLUTE_USE)
        if v83 == u21.LocalPlayer then
            u9.Controllers.ViewmodelController:playAnimation(u30.SLIME_TAMER_FLUTE_USE_FP)
        end
    end
    local v88 = u7
    local v89
    if p82 then
        v89 = u41.WREN_PANFLUTE_SUMMON
    else
        v89 = u41.WREN_PANFLUTE_UNSUMMON
    end
    v88:playSound(v89, {
        ["position"] = p81:GetPivot().Position
    })
    task.delay(0.65, function() --[[ Line: 257 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u84
        --]]
        local v90 = u86
        if v90 ~= nil then
            v90:Destroy()
        end
        if u84 then
            u84.Transparency = 0
        end
    end)
end
function u45.createPortalEffect(_, p91, p92, p93) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u24
        [4] = u6
        [5] = u27
        [6] = u22
        [7] = u36
        [8] = u32
        [9] = u41
        [10] = u7
        [11] = u25
        [12] = u14
        [13] = u42
        [14] = u16
        [15] = u13
        [16] = u15
        [17] = u23
    --]]
    local u94 = u17.new()
    local u95 = u18("Part", {
        ["Size"] = Vector3.new(0.0001, 7, 7),
        ["Rotation"] = Vector3.new(0, -90, -90),
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Shape"] = Enum.PartType.Cylinder,
        ["Position"] = p92,
        ["Parent"] = u24
    })
    u6:setQueryIgnored(u95, true)
    u94:GiveTask(u95)
    local u96 = u95.Size
    local u97 = u27.createFaces(u95, nil, { Enum.NormalId.Left })
    task.spawn(function() --[[ Line: 285 ]]
        --[[
        Upvalues:
            [1] = u97
            [2] = u22
            [3] = u18
        --]]
        for _, v98 in u97 do
            u22.Assets.Effects.PortalKillEffect.ViewportSkybox:Clone().Parent = v98.slice.viewportFrame
            u18("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0),
                ["Parent"] = v98.slice.viewportFrame
            })
        end
    end)
    local u99 = nil
    if p93 == u36.HALLOWEEN_WREN then
        u99 = u22.Assets.Blocks.halloween_black_market_shop:Clone()
    elseif p93 == u36.HOLIDAY_WREN then
        u99 = u22.Assets.Blocks.holiday_black_market_shop:Clone()
    elseif p93 == u36.TIDAL_WREN then
        u99 = u22.Assets.Blocks.tidal_black_market_shop:Clone()
    end
    if not u99 then
        return u94
    end
    local u100 = {}
    for v101, v102 in u99:GetDescendants() do
        local _ = v101 - 1
        if v102.Name ~= "Root" then
            if v102:IsA("BasePart") then
                u100[v102.Name] = v102.Transparency
                v102.Transparency = 1
            end
        end
    end
    u6:setQueryIgnored(u99, true)
    local v103 = { p91:ToOrientation() }
    local v104 = p91.Position
    local v105 = p93 == u36.HOLIDAY_WREN and Vector3.new(0, 1.5, 0) or Vector3.new(0, 0, 0)
    local v106 = CFrame.new(v104 + v105)
    local v107 = CFrame.Angles
    local v108 = u32
    local v109 = v103[2]
    local v110 = v108((math.deg(v109)))
    local v111 = v106 * v107(0, math.rad(v110), 0)
    u99:PivotTo(v111)
    u99.Parent = u24
    local u112 = nil
    if p93 == u36.HALLOWEEN_WREN then
        u112 = u22.Assets.Effects.PortalParticlesHalloween:Clone()
    elseif p93 == u36.HOLIDAY_WREN then
        u112 = u22.Assets.Effects.PortalParticlesHoliday:Clone()
    elseif p93 == u36.TIDAL_WREN then
        u112 = u22.Assets.Effects.PortalParticlesTidal:Clone()
    end
    if not u112 then
        return u94
    end
    u94:GiveTask(u112)
    u112:PivotTo(CFrame.new(u95:GetPivot().Position) * CFrame.Angles(0, 0, 1.5707963267948966))
    u112.Parent = u95
    local v113 = nil
    if p93 == u36.HALLOWEEN_WREN then
        v113 = u41.HALLOWEEN_BLACK_MARKET_SHOP_SUMMON
    elseif p93 == u36.HOLIDAY_WREN then
        v113 = u41.HOLIDAY_BLACK_MARKET_SHOP_SUMMON
    elseif p93 == u36.TIDAL_WREN then
        v113 = u41.TIDAL_BLACK_MARKET_SHOP_SUMMON
    end
    if v113 == "" or not v113 then
        return u94
    end
    u7:playSound(v113, {
        ["position"] = u95:GetPivot().Position
    })
    local u114 = u7:playSound(u41.CURSE_SUMMON_MOB_PORTAL_LOOP, {
        ["rollOffMaxDistance"] = 100,
        ["looped"] = true,
        ["position"] = u95:GetPivot().Position
    })
    u94:GiveTask(function() --[[ Line: 396 ]]
        --[[
        Upvalues:
            [1] = u114
        --]]
        local v115 = u114
        if v115 ~= nil then
            v115:Stop()
        end
        local v116 = u114
        if v116 ~= nil then
            v116:Destroy()
        end
    end)
    u25(0.7, u14, function(p117) --[[ Line: 407 ]]
        --[[
        Upvalues:
            [1] = u95
            [2] = u96
        --]]
        local v118 = math.noise(os.clock() * 15) * 1.5
        local v119 = u95
        local v120 = (u96.X + v118) * p117
        local v121 = (u96.Y + v118) * p117
        local v122 = u96.Z
        v119.Size = Vector3.new(v120, v121, v122)
    end, 0, 1):Wait()
    u42:playEffects({ u112.OnOpen }, nil)
    u42:playEffects({ u112.OnOpened }, nil)
    u7:playSound(u41.GLITCH_KILL_EFFECT, {
        ["position"] = p92
    })
    u25(0.6, u16, function(p123) --[[ Line: 418 ]]
        --[[
        Upvalues:
            [1] = u99
            [2] = u100
        --]]
        local v124 = u99
        if v124 ~= nil then
            for v125, v126 in v124:GetDescendants() do
                local _ = v125 - 1
                if v126.Name ~= "Root" then
                    if v126:IsA("BasePart") then
                        local v127 = u100[v126.Name]
                        local v128 = v127 == nil and 0 or v127
                        v126.Transparency = 1 - p123 + p123 * v128
                    end
                end
            end
        end
    end)
    u25(0.6, u14, function(p129) --[[ Line: 442 ]]
        --[[
        Upvalues:
            [1] = u99
        --]]
        local v130 = u99
        if v130 ~= nil then
            v130:PivotTo(p129)
        end
    end, v111 - Vector3.new(0, 3, 0), v111)
    task.delay(1.6, function() --[[ Line: 452 ]]
        --[[
        Upvalues:
            [1] = u99
        --]]
        local v131 = u99
        if v131 ~= nil then
            v131:Destroy()
        end
    end)
    task.spawn(function() --[[ Line: 458 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u13
            [3] = u112
            [4] = u14
            [5] = u95
            [6] = u96
            [7] = u15
            [8] = u94
        --]]
        task.wait(2)
        local u132 = nil
        u132 = u25(1, u13, function(u133) --[[ Line: 462 ]]
            --[[
            Upvalues:
                [1] = u112
                [2] = u132
            --]]
            local v134 = u112
            if v134 ~= nil then
                v134 = v134.OnOpened
            end
            if not v134 then
                u132:Cancel()
                return nil
            end
            local v135 = u112
            if v135 ~= nil then
                local v136 = v135.OnOpened:GetDescendants()
                local function v142(p137) --[[ Line: 474 ]]
                    --[[
                    Upvalues:
                        [1] = u133
                    --]]
                    if p137:IsA("ParticleEmitter") or p137:IsA("Beam") then
                        local v138 = 1
                        local v139 = v138
                        for v140, v141 in p137.Transparency.Keypoints do
                            local _ = v140 - 1
                            if v141.Value < v139 then
                                v138 = v141.Value
                                v139 = v138
                            end
                        end
                        if v139 < u133 then
                            p137.Transparency = NumberSequence.new(u133)
                        end
                    elseif p137:IsA("ImageLabel") and p137.ImageTransparency < u133 then
                        p137.ImageTransparency = u133
                    end
                end
                for v143, v144 in v136 do
                    v142(v144, v143 - 1, v136)
                end
            end
        end)
        u25(1, u14, function(p145) --[[ Line: 501 ]]
            --[[
            Upvalues:
                [1] = u95
                [2] = u96
            --]]
            local v146 = math.noise(os.clock() * 15) * 1.5
            local v147 = u95
            local v148 = (u96.X + v146) * p145
            local v149 = (u96.Y + v146) * p145
            local v150 = u96.Z
            v147.Size = Vector3.new(v148, v149, v150)
        end, 1, 0.3):Wait()
        task.wait(0.2)
        u25(0.2, u15, function(p151) --[[ Line: 506 ]]
            --[[
            Upvalues:
                [1] = u95
                [2] = u96
            --]]
            local v152 = math.random() * 3
            local v153 = u95
            local v154 = (u96.X + v152) * p151
            local v155 = (u96.Y + v152) * p151
            local v156 = u96.Z
            v153.Size = Vector3.new(v154, v155, v156)
        end, 0.3, 0)
        task.delay(1, function() --[[ Line: 510 ]]
            --[[
            Upvalues:
                [1] = u94
            --]]
            u94:DoCleaning()
        end)
    end)
    u94:GiveTask(u23.Heartbeat:Connect(function() --[[ Line: 515 ]]
        --[[
        Upvalues:
            [1] = u97
            [2] = u27
        --]]
        for _, v157 in u97 do
            u27.update(v157.surfaceGui, {
                ["viewportFrame"] = v157.slice.viewportFrame,
                ["camera"] = v157.slice.camera
            })
        end
    end))
    u94:GiveTask(function() --[[ Line: 523 ]]
        --[[
        Upvalues:
            [1] = u97
        --]]
        for _, v158 in u97 do
            v158.surfaceGui:Destroy()
        end
    end)
    return u94
end
function u45.getSkin(_, p159) --[[ Line: 530 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v160
    if p159.Character then
        v160 = u9.Controllers.KitSkinController:getKitSkin(p159.Character)
    else
        v160 = nil
    end
    return v160
end
function u45.getSummonEffect(p161, p162) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v163 = p161:getSkin(p162)
    if not v163 then
        return nil
    end
    local v164 = u37[v163].wren
    if v164 ~= nil then
        v164 = v164.summonEffect
    end
    if v164 then
        return v164
    end
end
u9.CreateController(u45.new())
return nil