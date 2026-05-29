local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Debris
local u11 = v9.HttpService
local u12 = v9.ReplicatedStorage
local u13 = v9.TweenService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "bacon-blade-balance").BaconBladeBalance
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = {
    u21.BACON_BLADE_DRIP_1,
    u21.BACON_BLADE_DRIP_2,
    u21.BACON_BLADE_DRIP_3,
    u21.BACON_BLADE_DRIP_4,
    u21.BACON_BLADE_DRIP_5,
    u21.BACON_BLADE_DRIP_6
}
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "BaconBladeController"
    end,
    ["__index"] = u15
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p26)
    p26.Name = "BaconBladeController"
end
function u23.KnitStart(u27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
        [3] = u19
        [4] = u21
        [5] = u20
        [6] = u16
        [7] = u14
    --]]
    u15.KnitStart(u27)
    u6.Controllers.PreloadController:preloadForItemType(u19.BACON_BLADE, {
        ["sounds"] = {
            u21.BACON_BLADE_SWING_1,
            u21.BACON_BLADE_SWING_2,
            u21.BACON_BLADE_SWING_3,
            u21.BACON_BLADE_SWING_4,
            u21.BACON_BLADE_DRIP_1,
            u21.BACON_BLADE_DRIP_2,
            u21.BACON_BLADE_DRIP_3,
            u21.BACON_BLADE_DRIP_4,
            u21.BACON_BLADE_DRIP_5,
            u21.BACON_BLADE_DRIP_6,
            u21.BACON_BLADE_HIT_1,
            u21.BACON_BLADE_HIT_2,
            u21.BACON_BLADE_HIT_3,
            u21.BACON_BLADE_HIT_4
        }
    })
    u20.Client:OnEvent("GreaseSpill", function(p28) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u27
            [3] = u14
        --]]
        local v29 = Random.new(p28.seed)
        if p28.isDripping then
            local v30 = v29:NextNumber() * 3.141592653589793 * 2
            local v31 = u27
            local v32 = p28.position
            local v33 = math.cos(v30) * v29:NextNumber(10, 30)
            local v34 = math.sin(v30) * v29:NextNumber(10, 30)
            v31:launchGreaseSplash(v32, Vector3.new(v33, 0, v34), u16.GREASE_DURATION, v29, p28.playerHit, nil)
        else
            local v35 = v29:NextInteger(u16.MIN_GREASE_ZONE_AMOUNT, u16.MAX_GREASE_ZONE_AMOUNT)
            local v36 = false
            local v37 = 0
            while true do
                if true then
                    if v36 then
                        v37 = v37 + 1
                    else
                        v36 = true
                    end
                end
                if v37 >= v35 then
                    break
                end
                local v38 = v29:NextNumber() * 3.141592653589793 * 2
                local v39 = u27
                local v40 = p28.position + Vector3.new(0, 3, 0)
                local v41 = math.cos(v38) * v29:NextNumber(10, 30)
                local v42 = v29:NextInteger(5, 20)
                local v43 = math.sin(v38) * v29:NextNumber(10, 30)
                v39:launchGreaseSplash(v40, Vector3.new(v41, v42, v43), p28.expirationTime - u14:GetServerTimeNow(), v29, p28.playerHit, nil)
            end
        end
    end)
    u20.Client:OnEvent("GreaseSpillEntity", function(p44) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u27
            [3] = u14
        --]]
        local v45 = Random.new(p44.seed)
        local v46 = v45:NextInteger(u16.MIN_GREASE_ZONE_AMOUNT, u16.MAX_GREASE_ZONE_AMOUNT)
        local v47 = false
        local v48 = 0
        while true do
            if v47 then
                v48 = v48 + 1
            else
                v47 = true
            end
            if v48 >= v46 then
                return
            end
            local v49 = v45:NextNumber() * 3.141592653589793 * 2
            local v50 = u27
            local v51 = p44.position + Vector3.new(0, 3, 0)
            local v52 = math.cos(v49) * v45:NextNumber(10, 30)
            local v53 = v45:NextInteger(5, 20)
            local v54 = math.sin(v49) * v45:NextNumber(10, 30)
            v50:launchGreaseSplash(v51, Vector3.new(v52, v53, v54), p44.expirationTime - u14:GetServerTimeNow(), v45, nil, p44.entityHit)
        end
    end)
end
u23.greaseSpillInTween = v1.async(function(_, p55, p56) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v57 = u13
    local v58 = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local v59 = {}
    local v60 = p55.Size.Y
    v59.Size = Vector3.new(p56, v60, p56)
    local v61 = v57:Create(p55, v58, v59)
    v61:Play()
    v61.Completed:Wait()
end)
u23.greaseSpillOutTween = v1.async(function(_, p62, p63) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v64 = u13:Create(p62, TweenInfo.new(p63, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["Size"] = Vector3.new(0, 0, 0)
    })
    v64:Play()
    v64.Completed:Wait()
end)
function u23.makeGreaseSlippery(_, p65, p66) --[[ Line: 115 ]]
    p65.CanCollide = true
    local v67 = p66:NextNumber(-1, 1)
    local v68 = p66:NextNumber(-1, 1)
    p65.AssemblyLinearVelocity = Vector3.new(v67, v68, p66:NextNumber(-1, 1)) * 20
    p65.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0)
end
function u23.launchGreaseSplash(u69, u70, p71, u72, u73, p74, p75) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u12
        [3] = u4
        [4] = u8
        [5] = u18
        [6] = u17
        [7] = u11
        [8] = u2
        [9] = u7
        [10] = u10
    --]]
    if u73 == nil then
        u73 = Random.new()
    end
    local u76 = u73:NextNumber(u16.MIN_SPLASH_SIZE, u16.MAX_SPLASH_SIZE)
    local v77 = p75 ~= nil
    local v78 = u12.Assets.Effects.GreasePart:Clone()
    v78.Anchored = false
    v78.Size = Vector3.new(u76, u76, u76)
    u4:setQueryIgnored(v78, true)
    local u79 = u8("Model", {
        ["Children"] = { v78 }
    })
    u79.PrimaryPart = v78
    local v80
    if p74 then
        v80 = u18:getEntity(p74)
    else
        v80 = nil
    end
    u17.fireProjectile(v80, u79, "grease:" .. u11:GenerateGUID(false), u70, p71, 196.2, function(u81, p82) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u70
            [3] = u7
            [4] = u69
            [5] = u76
            [6] = u73
            [7] = u72
            [8] = u79
        --]]
        local v83 = u2:getHandlerRegistry():getHandler(p82.Name)
        if v83 then
            local v84 = nil
            for v85, v86 in v83:getContainedPositions(p82) do
                local _ = v85 - 1
                if (u2:getWorldPosition(v86) - u81).Magnitude <= 3.1 == true then
                    v84 = v86
                    break
                end
            end
            if v84 then
                local u87 = nil
                for _, v88 in Enum.NormalId:GetEnumItems() do
                    if u2:getStore():getBlockAt(v84 + Vector3.FromNormalId(v88)) == nil then
                        local v89 = u2:getWorldPosition(v84) + Vector3.FromNormalId(v88) * 1.5
                        local v90 = (v89 - (u81 + (u70 - u81).Unit)).Magnitude
                        if u87 == nil or v90 < u87.distance then
                            u87 = {
                                ["surface"] = v88,
                                ["distance"] = v90,
                                ["surfacePosition"] = v89
                            }
                        end
                    end
                end
                task.spawn(function() --[[ Line: 182 ]]
                    --[[
                    Upvalues:
                        [1] = u87
                        [2] = u81
                        [3] = u7
                        [4] = u69
                        [5] = u76
                        [6] = u73
                        [7] = u72
                    --]]
                    if u87 then
                        local v91 = Vector3.FromNormalId(u87.surface)
                        local v92 = v91.X
                        local v93
                        if math.abs(v92) == 1 then
                            v93 = u87.surfacePosition.X
                        else
                            v93 = u81.X
                        end
                        local v94 = v91.Y
                        local v95
                        if math.abs(v94) == 1 then
                            v95 = u87.surfacePosition.Y
                        else
                            v95 = u81.Y
                        end
                        local v96 = v91.Z
                        local v97
                        if math.abs(v96) == 1 then
                            v97 = u87.surfacePosition.Z
                        else
                            v97 = u81.Z
                        end
                        local u98 = u7.new()
                        local u99 = u69:createGreaseSplashPart(Vector3.new(v93, v95, v97), u76, v91, u73)
                        u98:GiveTask(u99)
                        u69:makeGreaseSlippery(u99, u73)
                        u69:greaseSpillInTween(u99, u76 * 2):andThen(function() --[[ Line: 193 ]]
                            --[[
                            Upvalues:
                                [1] = u69
                                [2] = u99
                                [3] = u72
                                [4] = u98
                            --]]
                            u69:greaseSpillOutTween(u99, u72):expect()
                            u98:DoCleaning()
                        end)
                    end
                end)
            end
        end
        u79:Destroy()
    end, nil, nil, {
        ["playerCollisionDisabled"] = true,
        ["detectHitTerrain"] = true,
        ["collisionDisabled"] = v77
    })
    u10:AddItem(u79, 10)
end
function u23.createGreaseSplashPart(_, p100, p101, p102, p103) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u22
        [4] = u5
        [5] = u14
    --]]
    if p103 == nil then
        p103 = Random.new()
    end
    local v104 = u12.Assets.Effects.GreasePart:Clone()
    u4:setQueryIgnored(v104, true)
    u5:playSound(u22[p103:NextInteger(1, #u22) + 1], {
        ["rollOffMaxDistance"] = 150,
        ["position"] = p100,
        ["playbackSpeedMultiplier"] = p103:NextNumber(1, 1.5)
    })
    local v105 = p103:NextNumber(0.1, 1)
    v104.Size = Vector3.new(p101, v105, p101)
    v104.CFrame = CFrame.lookAt(p100, p100 + p102) * CFrame.Angles(1.5707963267948966, 0, 0)
    v104.Parent = u14
    return v104
end
u6.CreateController(u23.new())
return nil