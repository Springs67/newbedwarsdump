local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Debris
local u13 = v11.HttpService
local u14 = v11.ReplicatedStorage
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u23 = v1.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "oil-client-status-effect-handler").OilClientStatusEffectHandler
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "OilBlobController"
    end,
    ["__index"] = u17
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, ...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p27, ...)
    p27.Name = "OilBlobController"
    p27.spillMap = {}
end
function u24.KnitStart(u28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u22
        [4] = u23
        [5] = u20
        [6] = u9
        [7] = u16
        [8] = u14
    --]]
    u17.KnitStart(u28)
    u8.Controllers.StatusEffectController:setHandler(u22.OIL_SPILLED, u23)
    u20.Client:OnEvent("OilSpill", function(u29) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u28
            [3] = u16
        --]]
        local v30 = Random.new(u29.seed)
        local v31 = u29.radius
        local u32 = u9.new()
        local u33 = u28:createOilSplashPart(u29.position + Vector3.new(0, 0.05, 0), 4, Vector3.new(0, 1, 0), v30)
        u32:GiveTask(u33)
        u28:makeOilSlippery(u33, v30)
        u32:GiveTask(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
            --]]
            u28.spillMap[u29.seed] = nil
        end)
        u28.spillMap[u29.seed] = u33
        u28:oilSpillInTween(u33, v31):andThen(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u33
                [3] = u29
                [4] = u16
                [5] = u32
            --]]
            u28:oilSpillOutTween(u33, u29.expirationTime - u16:GetServerTimeNow()):expect()
            u32:DoCleaning()
        end)
        local v34 = v30:NextInteger(6, 15)
        local v35 = false
        local v36 = 0
        while true do
            if v35 then
                v36 = v36 + 1
            else
                v35 = true
            end
            if v36 >= v34 then
                return
            end
            local v37 = v30:NextNumber() * 3.141592653589793 * 2
            local v38 = u28
            local v39 = u29.position + Vector3.new(0, 3, 0)
            local v40 = math.cos(v37) * v30:NextNumber(30, 60)
            local v41 = v30:NextInteger(15, 50)
            local v42 = math.sin(v37) * v30:NextNumber(30, 60)
            v38:launchOilSplash(v39, Vector3.new(v40, v41, v42), u29.expirationTime - u16:GetServerTimeNow(), v30)
        end
    end)
    u20.Client:Get("OilFlame"):Connect(function(p43) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u14
        --]]
        local v44 = u28.spillMap[p43.seed]
        if v44 then
            for _, v45 in u14.Assets.Effects.Burn:GetChildren() do
                local v46 = v45:Clone()
                v46.Parent = v44
                if v46:IsA("ParticleEmitter") then
                    v46.Rate = 45
                end
            end
        end
    end)
end
u24.oilSpillInTween = v1.async(function(_, p47, p48) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v49 = u15
    local v50 = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local v51 = {}
    local v52 = p47.Size.Y
    v51.Size = Vector3.new(p48, v52, p48)
    local v53 = v49:Create(p47, v50, v51)
    v53:Play()
    v53.Completed:Wait()
end)
u24.oilSpillOutTween = v1.async(function(_, p54, p55) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v56 = u15:Create(p54, TweenInfo.new(p55, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["Size"] = Vector3.new(0, 0, 0)
    })
    v56:Play()
    v56.Completed:Wait()
end)
function u24.makeOilSlippery(_, p57, p58) --[[ Line: 121 ]]
    p57.CanCollide = true
    local v59 = p58:NextNumber(-1, 1)
    local v60 = p58:NextNumber(-1, 1)
    p57.AssemblyLinearVelocity = Vector3.new(v59, v60, p58:NextNumber(-1, 1)) * 20
    p57.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0)
end
function u24.launchOilSplash(u61, u62, p63, u64, u65) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u10
        [4] = u18
        [5] = u19
        [6] = u13
        [7] = u2
        [8] = u12
    --]]
    if u65 == nil then
        u65 = Random.new()
    end
    local u66 = u65:NextNumber(0.5, 2)
    local v67 = u14.Assets.Effects.OilPart:Clone()
    v67.Anchored = false
    v67.Size = Vector3.new(u66, u66, u66)
    u4:setQueryIgnored(v67, true)
    local u68 = u10("Model", {
        ["Children"] = { v67 }
    })
    u68.PrimaryPart = v67
    u18.fireProjectile(u19:getLocalPlayerEntity(), u68, "oil:" .. u13:GenerateGUID(false), u62, p63, 196.2, function(u69, p70) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u62
            [3] = u61
            [4] = u66
            [5] = u65
            [6] = u64
            [7] = u68
        --]]
        local v71 = u2:getHandlerRegistry():getHandler(p70.Name)
        if v71 then
            local v72 = nil
            for v73, v74 in v71:getContainedPositions(p70) do
                local _ = v73 - 1
                if (u2:getWorldPosition(v74) - u69).Magnitude <= 3.1 == true then
                    v72 = v74
                    break
                end
            end
            if v72 then
                local u75 = nil
                for _, v76 in Enum.NormalId:GetEnumItems() do
                    if u2:getStore():getBlockAt(v72 + Vector3.FromNormalId(v76)) == nil then
                        local v77 = u2:getWorldPosition(v72) + Vector3.FromNormalId(v76) * 1.5
                        local v78 = (v77 - (u69 + (u62 - u69).Unit)).Magnitude
                        if u75 == nil or v78 < u75.distance then
                            u75 = {
                                ["surface"] = v76,
                                ["distance"] = v78,
                                ["surfacePosition"] = v77
                            }
                        end
                    end
                end
                task.spawn(function() --[[ Line: 182 ]]
                    --[[
                    Upvalues:
                        [1] = u75
                        [2] = u69
                        [3] = u61
                        [4] = u66
                        [5] = u65
                        [6] = u64
                    --]]
                    if u75 then
                        local v79 = Vector3.FromNormalId(u75.surface)
                        local v80 = v79.X
                        local v81
                        if math.abs(v80) == 1 then
                            v81 = u75.surfacePosition.X
                        else
                            v81 = u69.X
                        end
                        local v82 = v79.Y
                        local v83
                        if math.abs(v82) == 1 then
                            v83 = u75.surfacePosition.Y
                        else
                            v83 = u69.Y
                        end
                        local v84 = v79.Z
                        local v85
                        if math.abs(v84) == 1 then
                            v85 = u75.surfacePosition.Z
                        else
                            v85 = u69.Z
                        end
                        local u86 = u61:createOilSplashPart(Vector3.new(v81, v83, v85), u66, v79, u65)
                        u61:makeOilSlippery(u86, u65)
                        u61:oilSpillInTween(u86, u66 * 2):andThen(function() --[[ Line: 191 ]]
                            --[[
                            Upvalues:
                                [1] = u61
                                [2] = u86
                                [3] = u64
                            --]]
                            u61:oilSpillOutTween(u86, u64):expect()
                            u86:Destroy()
                        end)
                    end
                end)
            end
        end
        u68:Destroy()
    end)
    u12:AddItem(u68, 10)
end
function u24.createOilSplashPart(_, p87, p88, p89, p90) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u5
        [4] = u21
        [5] = u16
    --]]
    if p90 == nil then
        p90 = Random.new()
    end
    local v91 = u14.Assets.Effects.OilPart:Clone()
    u4:setQueryIgnored(v91, true)
    u5:playSound(u21.GOO_SPLAT, {
        ["rollOffMaxDistance"] = 150,
        ["position"] = p87,
        ["playbackSpeedMultiplier"] = p90:NextNumber(1, 1.5)
    })
    local v92 = p90:NextNumber(0.1, 0.5)
    v91.Size = Vector3.new(p88, v92, p88)
    v91.CFrame = CFrame.lookAt(p87, p87 + p89) * CFrame.Angles(-1.5707963267948966, 0, 0)
    v91.Parent = u16
    return v91
end
v7.CreateController(u24.new())
return nil