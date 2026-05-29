local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.RunService
local u12 = v9.TweenService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u21 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "JellyfishBreakEffectController"
    end,
    ["__index"] = u21
})
u22.__index = u22
function u22.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u18
    --]]
    u21.constructor(p25, u18.JELLYFISH)
    p25.Name = "JellyfishBreakEffectController"
end
function u22.KnitStart(p26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.KnitStart(p26)
end
function u22.onBedBreak(u27, u28, u29, u30, u31) --[[ Line: 45 ]]
    task.spawn(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u28
            [3] = u29
            [4] = u31
            [5] = u30
        --]]
        u27:createEffect(u28, u29, u31, u30)
    end)
end
function u22.createEffect(u32, p33, p34, u35, p36) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u13
        [4] = u8
        [5] = u10
        [6] = u17
        [7] = u11
        [8] = u19
        [9] = u16
        [10] = u15
        [11] = u14
        [12] = u6
        [13] = u4
        [14] = u3
    --]]
    local u37 = u7.new()
    u32.maid:GiveTask(u37)
    local u38 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p36)
    u38:PivotTo(p34)
    local v39 = u38:FindFirstChild("Root")
    if v39 ~= nil then
        for v40, v41 in v39:GetDescendants() do
            local _ = v40 - 1
            if v41:IsA("BasePart") then
                v41.Transparency = 0.55
            end
        end
    end
    if not u38 then
        return nil
    end
    u32.maid:GiveTask(u38)
    u38.Name = "BedBreakEffectBedClone"
    u38.Parent = u13
    local v42 = u8("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false,
        ["Position"] = u35
    })
    local u43 = u8("Attachment", {
        ["Parent"] = v42
    })
    u37:GiveTask(v42)
    u37:GiveTask(u43)
    local u44 = u10.Assets.Misc.Jellyfish
    local u45 = u5.Controllers.KitController:getKitSkin(p33)
    if u45 == u17.JELLYFISH_HOLIDAY then
        u44 = u10.Assets.Misc.JellyfishHoliday
    elseif u45 == u17.JELLYFISH_DESSERT then
        u44 = u10.Assets.Misc.JellyfishDessert
    end
    local u46 = {}
    local u47 = false
    local u48 = 0
    u37:GiveTask(u11.Heartbeat:Connect(function(p49) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u48
            [3] = u32
            [4] = u35
            [5] = u46
        --]]
        if u47 then
            return nil
        end
        u48 = u48 + p49
        for v50, v51 in u46 do
            local _ = v50 - 1
            u32:setJellyfishPosition(v51, u35, u48)
        end
    end))
    local v52 = { u19.JELLYFISH_DEPLOY_1, u19.JELLYFISH_DEPLOY_2, u19.JELLYFISH_DEPLOY_3 }
    local u53
    if u45 == u17.JELLYFISH_HOLIDAY then
        u53 = { u19.HOLIDAY_JELLYFISH_DEPLOY_1, u19.HOLIDAY_JELLYFISH_DEPLOY_2, u19.HOLIDAY_JELLYFISH_DEPLOY_3 }
    else
        u53 = u45 == u17.JELLYFISH_DESSERT and { u19.DESSERT_JELLYFISH_DEPLOY_1, u19.DESSERT_JELLYFISH_DEPLOY_2, u19.DESSERT_JELLYFISH_DEPLOY_3 } or v52
    end
    local v54 = { u19.JELLYFISH_ZAP_1, u19.JELLYFISH_ZAP_2 }
    local u55
    if u45 == u17.JELLYFISH_HOLIDAY then
        u55 = { u19.HOLIDAY_JELLYFISH_ZAP_1, u19.HOLIDAY_JELLYFISH_ZAP_2 }
    else
        u55 = u45 == u17.JELLYFISH_DESSERT and { u19.DESSERT_JELLYFISH_ZAP_1, u19.DESSERT_JELLYFISH_ZAP_2 } or v54
    end
    local v56 = {
        u19.JELLYFISH_PULSE_2,
        u19.JELLYFISH_PULSE_3,
        u19.JELLYFISH_PULSE_4,
        u19.JELLYFISH_PULSE_5
    }
    local u57
    if u45 == u17.JELLYFISH_HOLIDAY then
        u57 = {
            u19.HOLIDAY_JELLYFISH_PULSE_2,
            u19.HOLIDAY_JELLYFISH_PULSE_3,
            u19.HOLIDAY_JELLYFISH_PULSE_4,
            u19.HOLIDAY_JELLYFISH_PULSE_5
        }
    else
        u57 = u45 == u17.JELLYFISH_DESSERT and {
            u19.DESSERT_JELLYFISH_PULSE_2,
            u19.DESSERT_JELLYFISH_PULSE_3,
            u19.DESSERT_JELLYFISH_PULSE_4,
            u19.DESSERT_JELLYFISH_PULSE_5
        } or v56
    end
    u32.maid:GiveTask(task.spawn(function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u37
            [3] = u45
            [4] = u13
            [5] = u16
            [6] = u15
            [7] = u32
            [8] = u14
            [9] = u6
            [10] = u46
            [11] = u35
            [12] = u4
            [13] = u3
            [14] = u53
        --]]
        local v58 = false
        local v59 = 0
        while true do
            if v58 then
                v59 = v59 + 1
            else
                v58 = true
            end
            if v59 >= 4 then
                return
            end
            local u60 = u44:Clone()
            u37:GiveTask(u60)
            u60:SetAttribute("KitSkin", u45)
            u60:ScaleTo(0.85)
            u60:WaitForChild("RootPart")
            for v61, v62 in u60:GetChildren() do
                local _ = v61 - 1
                if v62:IsA("MeshPart") then
                    v62.LocalTransparencyModifier = 1
                end
            end
            u60.Parent = u13
            local v63 = Instance.new("AnimationController")
            v63.Parent = u60
            local v64 = Instance.new("Animator")
            v64.Parent = v63
            local v65 = v64:LoadAnimation(u16:getAnimation(u15.JELLYFISH_SPAWN))
            local u66 = v64:LoadAnimation(u16:getAnimation(u15.JELLYFISH_MOUNT_IDLE))
            local v67 = v64:LoadAnimation(u16:getAnimation(u15.JELLYFISH_ATTACK))
            v65:Play()
            v65.Ended:Connect(function() --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u66
                --]]
                u66:Play()
            end)
            u32.maid:GiveTask(task.spawn(function() --[[ Line: 190 ]]
                --[[
                Upvalues:
                    [1] = u60
                    [2] = u14
                    [3] = u6
                --]]
                for v68, u69 in u60:GetChildren() do
                    local _ = v68 - 1
                    if u69:IsA("MeshPart") then
                        u14(1, u6, function(p70) --[[ Line: 194 ]]
                            --[[
                            Upvalues:
                                [1] = u69
                            --]]
                            u69.LocalTransparencyModifier = p70
                            return u69.LocalTransparencyModifier
                        end, 1, 0):Play()
                    end
                end
            end))
            local v71 = {
                ["index"] = v59,
                ["model"] = u60,
                ["animationController"] = v63,
                ["animator"] = v64,
                ["idleAnimationTrack"] = u66,
                ["attackAnimationTrack"] = v67
            }
            local v72 = u46
            table.insert(v72, v71)
            u32:setJellyfishPosition(v71, u35, 0)
            local v73 = u53
            u32.maid:GiveTask(u4:playSound(u3.fromList(unpack(v73)), {
                ["position"] = u60:GetPivot().Position
            }))
            task.wait(0.2)
        end
    end))
    u32.maid:GiveTask(task.spawn(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u32
            [3] = u43
            [4] = u46
            [5] = u45
            [6] = u35
            [7] = u4
            [8] = u3
            [9] = u55
            [10] = u57
            [11] = u38
            [12] = u14
            [13] = u6
            [14] = u37
        --]]
        task.wait(2)
        u47 = true
        for v74, u75 in u46 do
            local _ = v74 - 1
            u75.attackAnimationTrack:Play()
            u75.attackAnimationTrack.Stopped:Connect(function() --[[ Line: 233 ]]
                --[[
                Upvalues:
                    [1] = u75
                --]]
                u75.idleAnimationTrack:Play()
            end)
            u32:createLightningBeam(u75.model, u43)
        end
        u32:createStaticHitEffect(u45, u35)
        local v76 = u55
        local v77 = {
            ["position"] = u35
        }
        u32.maid:GiveTask(u4:playSound(u3.fromList(unpack(v76)), v77))
        local v78 = u57
        local v79 = {
            ["position"] = u35
        }
        u32.maid:GiveTask(u4:playSound(u3.fromList(unpack(v78)), v79))
        u38:Destroy()
        u32.maid:GiveTask(task.delay(0.5, function() --[[ Line: 253 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47 = false
        end))
        task.wait(2)
        u32.maid:GiveTask(task.spawn(function() --[[ Line: 258 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u6
                [3] = u46
            --]]
            local function v84(p80) --[[ Line: 259 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u6
                --]]
                for v81, u82 in p80.model:GetChildren() do
                    local _ = v81 - 1
                    if u82:IsA("MeshPart") then
                        u14(1, u6, function(p83) --[[ Line: 263 ]]
                            --[[
                            Upvalues:
                                [1] = u82
                            --]]
                            u82.LocalTransparencyModifier = p83
                            return u82.LocalTransparencyModifier
                        end, 0, 1):Play()
                    end
                end
            end
            for v85, v86 in u46 do
                v84(v86, v85 - 1, u46)
            end
        end))
        task.wait(2)
        u37:DoCleaning()
    end))
end
function u22.setJellyfishPosition(_, p87, p88, p89) --[[ Line: 282 ]]
    local v90
    if p87 == nil then
        v90 = p87
    else
        v90 = p87.model
    end
    if not v90 or p87.model.Parent == nil then
        return nil
    end
    local v91 = p87.index / 6 * 2 * 3.141592653589793 + (p89 == nil and 0 or p89) * 1
    local v92 = p88.X + math.cos(v91) * 6
    local v93 = p88.Z + math.sin(v91) * 6
    local v94 = p88.Y + 1
    local v95 = Vector3.new(v92, v94, v93)
    p87.model:PivotTo(CFrame.new(v95))
end
function u22.createLightningBeam(p96, p97, p98) --[[ Line: 309 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u10
        [3] = u12
    --]]
    local v99 = p97:GetAttribute("KitSkin") or u17.DEFAULT
    local v100 = u10.Assets.Effects.StaticConnection
    if v99 == u17.JELLYFISH_DESSERT then
        v100 = u10.Assets.Effects.JellyfishDessertStaticConnection
    end
    local u101 = v100.Beam1:Clone()
    local u102 = v100.Beam2:Clone()
    local u103 = v100.PointLight:Clone()
    p96.maid:GiveTask(u101)
    p96.maid:GiveTask(u102)
    p96.maid:GiveTask(u103)
    local v104 = p97:FindFirstChild("BellUnder")
    if v104 ~= nil then
        v104 = v104:FindFirstChild("BeamAttachment")
    end
    u101.Parent = p97
    u101.Attachment0 = v104
    u101.Attachment1 = p98
    u102.Parent = p97
    u102.Attachment0 = v104
    u102.Attachment1 = p98
    u103.Parent = p98
    p96.maid:GiveTask(task.delay(0.24, function() --[[ Line: 333 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u101
            [3] = u102
            [4] = u103
        --]]
        u12:Create(u101, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        u12:Create(u102, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        task.wait(0.12)
        u101:Destroy()
        u102:Destroy()
        u103:Destroy()
    end))
end
function u22.createStaticHitEffect(p105, p106, p107) --[[ Line: 348 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u13
        [4] = u20
    --]]
    local u108 = u10.Assets.Effects.StaticHit:Clone()
    if p106 == u17.JELLYFISH_DESSERT then
        u108 = u10.Assets.Effects.JellyfishDessertStaticHit:Clone()
    end
    p105.maid:GiveTask(u108)
    u108.Parent = u13
    u108.Anchored = false
    u108:PivotTo(CFrame.new(p107))
    u108.Lightning.Anchored = false
    u108.Lightning:PivotTo(CFrame.new(p107))
    u20:playEffects(u108:GetChildren())
    p105.maid:GiveTask(task.delay(0.2, function() --[[ Line: 360 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        u108.Attachment.PointLight.Enabled = false
    end))
    p105.maid:GiveTask(task.delay(5, function() --[[ Line: 363 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        u108:Destroy()
    end))
end
u5.CreateController(u22.new())
return nil