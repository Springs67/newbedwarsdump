local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacterAnimation
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.InOutCubic
local u11 = v9.Linear
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Lighting
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u31 = {
    {
        ["tpAnimation"] = u23.JUGGERNAUT_ATTACK_1,
        ["fpAnimation"] = u23.JUGGERNAUT_ATTACK_1_FP,
        ["swingSound"] = v29.JUGGERNAUT_ATTACK_SWING_1,
        ["impactSound"] = v29.JUGGERNAUT_ATTACK_IMPACT_1
    },
    {
        ["tpAnimation"] = u23.JUGGERNAUT_ATTACK_2,
        ["fpAnimation"] = u23.JUGGERNAUT_ATTACK_2_FP,
        ["swingSound"] = v29.JUGGERNAUT_ATTACK_SWING_2,
        ["impactSound"] = v29.JUGGERNAUT_ATTACK_IMPACT_2
    },
    {
        ["tpAnimation"] = u23.JUGGERNAUT_ATTACK_3,
        ["fpAnimation"] = u23.JUGGERNAUT_ATTACK_3_FP,
        ["swingSound"] = v29.JUGGERNAUT_ATTACK_SWING_2,
        ["impactSound"] = v29.JUGGERNAUT_ATTACK_IMPACT_3
    }
}
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "JuggernautRageBladeController"
    end,
    ["__index"] = u22
})
u32.__index = u32
function u32.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22.constructor(p35)
    p35.Name = "JuggernautRageBladeController"
    p35.originalEffectRotations = {}
end
function u32.KnitStart(u36) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u7
        [3] = u28
        [4] = u31
        [5] = u20
        [6] = u8
        [7] = u16
        [8] = u26
        [9] = u25
        [10] = u27
        [11] = u23
        [12] = u24
        [13] = u6
    --]]
    u22.KnitStart(u36)
    u7.Controllers.PreloadController:preloadForItemType(u28.JUGGERNAUT_RAGE_BLADE, {
        ["animations"] = {
            u31[1].tpAnimation,
            u31[2].tpAnimation,
            u31[3].tpAnimation,
            u31[1].fpAnimation,
            u31[2].fpAnimation,
            u31[3].fpAnimation
        },
        ["sounds"] = {
            u31[1].swingSound,
            u31[2].swingSound,
            u31[3].swingSound,
            u31[1].impactSound,
            u31[2].impactSound,
            u31[3].impactSound
        }
    })
    u20.SwordSwing:setPriority(u8.HIGHEST):connect(function(p37) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
            [3] = u26
            [4] = u25
        --]]
        local v38 = u16.LocalPlayer.Character
        if v38 ~= nil then
            v38 = v38:GetAttribute("JuggSpinning")
        end
        if v38 ~= 0 and (v38 == v38 and (v38 ~= "" and v38)) then
            p37:setCancelled(true)
            return nil
        end
        if p37.swordType == u28.JUGGERNAUT_RAGE_BLADE then
            local v39 = u26:getLocalPlayerEntity()
            if not v39 then
                return nil
            end
            local v40 = v39:getInstance():GetAttribute("RageBladeCount")
            local v41 = v40 == nil and 0 or v40
            p37.attackSpeed = u25.JUGGERNAUT_SWORD_COOLDOWN
            if v41 == 0 and u25:isSwinging(v39) then
                p37.attackSpeed = 0.9
            end
        end
    end)
    u20.SwordSwing:connect(function(p42) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u16
            [3] = u28
            [4] = u26
            [5] = u25
            [6] = u36
        --]]
        if p42:isCancelled() then
            return nil
        end
        local v43 = u27.getInventory(u16.LocalPlayer).hand
        if v43 ~= nil then
            v43 = v43.itemType
        end
        local v44 = v43 == u28.JUGGERNAUT_RAGE_BLADE and u26:getEntity(u16.LocalPlayer)
        if v44 then
            local v45 = u25:updateSwingCount(v44)
            u36:playAnimation(u16.LocalPlayer, v45)
            v44:getInstance():SetAttribute("RageBladeCount", (v45 + 1) % 3)
        end
    end)
    local v46 = { u23.JUGGERNAUT_ATTACK_1, u23.JUGGERNAUT_ATTACK_2, u23.JUGGERNAUT_ATTACK_3 }
    local u47 = table.create(#v46)
    for v48, v49 in v46 do
        local _ = v48 - 1
        u47[v48] = u24:getAssetId(v49)
    end
    u6(u47, function(p50, p51) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u27
            [3] = u28
            [4] = u36
            [5] = u47
        --]]
        if p50 == u16.LocalPlayer then
            return nil
        end
        local v52 = u27.getInventory(p50).hand
        if v52 ~= nil then
            v52 = v52.itemType
        end
        if v52 ~= u28.JUGGERNAUT_RAGE_BLADE then
            return nil
        end
        local v53 = u36
        local v54 = p51.Animation.AnimationId
        v53:registerAnimationEffects(p50, (table.find(u47, v54) or 0) - 1, p51)
    end)
end
function u32.playAnimation(p55, p56, p57) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u4
        [3] = u24
        [4] = u16
        [5] = u7
    --]]
    local v58 = u31[p57 + 1]
    local v59 = u4:playAnimation(p56, u24:getAssetId(v58.tpAnimation))
    if p56 == u16.LocalPlayer then
        u7.Controllers.ViewmodelController:playAnimation(v58.fpAnimation)
    end
    p55:registerAnimationEffects(p56, p57, v59)
end
function u32.registerAnimationEffects(u60, u61, u62, u63) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u12
    --]]
    local v64 = u31[u62 + 1]
    local v65 = u61.Character
    if v65 ~= nil then
        v65 = v65.PrimaryPart
        if v65 ~= nil then
            v65 = v65.CFrame
        end
    end
    if not v65 then
        return nil
    end
    local v66 = v64.swingSound
    if v66 ~= "" and v66 then
        u60:playSound(u61, v65.Position, v66)
    end
    local u67 = u12.new()
    u67:GiveTask(u63:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u61
            [3] = u62
            [4] = u63
        --]]
        u60:playEffect(u61, u62)
        local u68 = u63.Speed
        u63:AdjustSpeed(0.02)
        task.delay(0.08, function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u68
            --]]
            u63:AdjustSpeed(u68)
        end)
    end))
    task.delay(4, function() --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u67
        --]]
        u67:DoCleaning()
    end)
end
function u32.playSound(_, p69, p70, p71) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
    --]]
    if p69 == u16.LocalPlayer then
        p70 = nil
    end
    u5:playSound(p71, {
        ["rollOffMaxDistance"] = 250,
        ["rollOffMinDistance"] = 40,
        ["position"] = p70
    })
end
function u32.playEffect(u72, p73, p74) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u31
        [3] = u21
        [4] = u13
        [5] = u15
        [6] = u19
        [7] = u11
        [8] = u18
        [9] = u17
        [10] = u10
        [11] = u30
    --]]
    local v75 = p73 == u16.LocalPlayer
    local v76 = u31[p74 + 1]
    local v77 = p73.Character
    if v77 ~= nil then
        v77 = v77:GetPrimaryPartCFrame()
    end
    if not v77 then
        return nil
    end
    local v78 = v76.impactSound
    if v78 ~= "" and v78 then
        u72:playSound(p73, v77.Position, v78)
    end
    if v75 then
        local v79 = ({ Vector2.new(1, 0.2), Vector2.new(-1, 0.2), Vector2.new(-0.2, 1) })[p74 + 1]
        u21.shakeScreenDirection(v79, {
            ["duration"] = 0.22,
            ["cycles"] = 2,
            ["magnitude"] = p74 == 2 and 0.75 or 0.5
        })
        local u80 = u13("DepthOfFieldEffect", {
            ["Name"] = "RagebladeDepthOfField",
            ["InFocusRadius"] = 20,
            ["FocusDistance"] = 0,
            ["FarIntensity"] = 0,
            ["Parent"] = u15
        })
        local u82 = u19(0.14, u11, function(p81) --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u80
            --]]
            u80.FarIntensity = (math.sqrt(p81) - p81) / 1.2 * 0.8
        end)
        task.spawn(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u80
            --]]
            u82:Wait()
            u80:Destroy()
        end)
    end
    local v83 = v77 + v77.LookVector.Unit * 5
    local u84 = u13("Part", {
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["CFrame"] = v83,
        ["Parent"] = u18
    })
    local u85 = u13("PointLight", {
        ["Range"] = 16.1,
        ["Brightness"] = 0,
        ["Color"] = Color3.fromRGB(255, 145, 30),
        ["Parent"] = u84
    })
    local u87 = u19(0.24, u11, function(p86) --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        u85.Brightness = (math.sqrt(p86) - p86) / 1.2 * 4 * 8
    end)
    task.spawn(function() --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u87
            [2] = u84
        --]]
        u87:Wait()
        u84:Destroy()
    end)
    local u88
    if p74 < 2 then
        local u89 = u17.Assets.Effects.JuggernautSwingEffectHorizontal:Clone()
        u88 = u89
        local u90 = p74 == 0 and 1 or -1
        u88:PivotTo(v83 * CFrame.Angles(0, u90 * -3.141592653589793 / 4, 0))
        local u91 = { u89.Main.SlashInner, u89.Main.SlashOuter }
        local u92 = 1
        u19(0.22, u10, function(p93) --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u89
                [2] = u91
                [3] = u30
                [4] = u92
                [5] = u72
                [6] = u90
            --]]
            if not u89.Parent then
                return nil
            end
            for v94, v95 in u91 do
                local _ = v94 - 1
                local v96 = p93 - 0.5
                local v97 = math.abs(v96) * 4 - 1
                v95.Transparency = math.clamp(v97, 0, 1)
            end
            local v98 = 1 + p93 * 0.8
            u30.scaleModel(u89, v98 / u92)
            u92 = v98
            local v99 = 0
            local v100 = { Vector3.new(0, 1.3351768, 0), Vector3.new(0, 1.8849556, 0) }
            for _, v101 in u91 do
                local v102 = u72
                local v103 = u89.Main.Center.WorldCFrame
                local v104 = v99 + 1
                v102:rotateAround(v101, v103, p93, v100[v99 + 1] * u90)
                v99 = v104
            end
        end)
    else
        u88 = u17.Assets.Effects.JuggernautSwingEffectVerticle:Clone()
        u88:PivotTo(v83)
    end
    u88.Parent = u18
    task.delay(0.22, function() --[[ Line: 303 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        local v105 = u88
        if v105 ~= nil then
            v105:Destroy()
        end
    end)
end
function u32.rotateAround(p106, p107, p108, p109, p110) --[[ Line: 310 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v111 = u2
    local v112 = p106.originalEffectRotations
    local v113 = p108:Inverse()
    local v114 = p107.CFrame
    local v115 = v111.getOrCreate(v112, p107, v113 * v114)
    local v116 = p108 * CFrame.Angles(p110.X * p109, p110.Y * p109, p110.Z * p109) * v115
    p107.Position = v116.Position
    local v117 = { v116:ToOrientation() }
    local v118 = v117[1]
    local v119 = math.deg(v118)
    local v120 = v117[2]
    local v121 = math.deg(v120)
    local v122 = v117[3]
    local v123 = math.deg(v122)
    p107.Orientation = Vector3.new(v119, v121, v123)
end
u7.CreateController(u32.new())
return nil