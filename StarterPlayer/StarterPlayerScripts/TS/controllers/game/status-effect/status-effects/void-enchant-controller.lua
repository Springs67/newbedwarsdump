local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacter
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.HttpService
local u10 = v7.Players
local u11 = v7.ReplicatedStorage
local u12 = v7.RunService
local u13 = v7.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "VoidEnchantController"
    end,
    ["__index"] = u15
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p22)
    p22.Name = "VoidEnchantController"
end
function u19.KnitStart(u23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
        [3] = u10
        [4] = u5
        [5] = u14
        [6] = u8
    --]]
    u15.KnitStart(u23)
    u4(function(u24, u25, p26) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u14
            [4] = u23
            [5] = u8
        --]]
        u25:GetAttributeChangedSignal("VoidEnchantStacks"):Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u24
                [3] = u10
                [4] = u5
                [5] = u14
                [6] = u23
            --]]
            local v27 = u25:GetAttribute("VoidEnchantStacks")
            local v28 = v27 == nil and 0 or v27
            if u24 == u10.LocalPlayer then
                local v29
                if v28 == 0 or (v28 ~= v28 or not v28) then
                    v29 = v28
                else
                    v29 = v28 > 0
                end
                if v29 == 0 or (v29 ~= v29 or not v29) then
                    u5.Controllers.VignetteController:destroyVignette(u14.EXECUTE)
                else
                    u5.Controllers.VignetteController:createVignette(u14.EXECUTE)
                end
            end
            u23:updateStacks(u24, u25, v28)
        end)
        local v30 = u25:GetAttribute("VoidEnchantStacks")
        if v30 ~= nil then
            u23:updateStacks(u24, u25, v30)
        end
        p26:GiveTask(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u24
            --]]
            for v31, v32 in u8:GetTagged(u24.Name .. ":void_enchant_orb") do
                local _ = v31 - 1
                v32:Destroy()
            end
        end)
    end)
end
function u19.updateStacks(_, _, u33, p34) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u11
        [4] = u13
        [5] = u9
        [6] = u12
        [7] = u16
        [8] = u3
        [9] = u17
        [10] = u10
        [11] = u5
        [12] = u18
    --]]
    local v35 = u8:GetTagged(u33.Name .. ":void_enchant_orb")
    local v36
    if #v35 > 0 then
        v36 = v35[1]
    else
        v36 = nil
    end
    if p34 == 0 and v36 then
        v36:Destroy()
        return nil
    end
    if v36 == nil then
        local u37 = u6.new()
        local u38 = u11.Assets.Effects.VoidEnchantOrb:Clone()
        u38.Parent = u13
        u8:AddTag(u38, u33.Name .. ":void_enchant_orb")
        u38:SetAttribute("CurrentSize", 1)
        local v39 = u9:GenerateGUID(false)
        local u40 = 0
        u12:BindToRenderStep(v39, Enum.RenderPriority.Last.Value, function(p41) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u33
                [3] = u38
            --]]
            u40 = u40 + p41
            local v42 = u33:FindFirstChild("Head")
            if not v42 then
                return nil
            end
            local v43 = u38
            if v43 ~= nil then
                v43 = v43.PrimaryPart
            end
            if not v43 then
                return nil
            end
            local v44 = v42.Position + Vector3.new(0, 5, 0)
            local v45 = CFrame.Angles(6.283185307179586 * (u40 % 2), 6.283185307179586 * (u40 % 3), 6.283185307179586 * (u40 % 1.5))
            u38:PivotTo(CFrame.new(v44) * v45)
        end)
        u37:GiveTask(u16.Client:Get("EntityDeathEvent"):Connect(function(p46) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u38
                [3] = u3
                [4] = u17
                [5] = u10
                [6] = u5
                [7] = u11
            --]]
            if p46.entityInstance == u33 and u38 then
                local v47 = u38.PrimaryPart
                if v47 ~= nil then
                    v47 = v47.Position
                end
                u38:Destroy()
                if v47 then
                    local v48 = u3
                    local v49 = u17.ENCHANT_VOID_EXPLODE
                    local v50 = {}
                    local v51
                    if u33 == u10.LocalPlayer.Character then
                        v51 = nil
                    else
                        v51 = v47
                    end
                    v50.position = v51
                    v48:playSound(v49, v50)
                    u5.Controllers.FancyExplosionController:createExplosion({
                        ["radius"] = 3,
                        ["randomSizeOffset"] = 0,
                        ["randomPositionOffset"] = 0,
                        ["inDuration"] = 0.1,
                        ["outDuration"] = 0.3,
                        ["position"] = v47,
                        ["model"] = u11.Assets.Effects.EnchantVoidOrbExplosion
                    })
                end
            end
        end))
        u38.AncestryChanged:Connect(function(_, p52) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            if p52 == nil then
                u37:DoCleaning()
            end
        end)
        v36 = u38
    end
    u18:playEffects({ v36.Ball.StackBurst }, u33)
    if v36.PrimaryPart then
        local v53 = u3
        local v54 = u17.ENCHANT_VOID_HIT
        local v55 = {}
        local v56
        if u33 == u10.LocalPlayer.Character then
            v56 = nil
        else
            v56 = v36.PrimaryPart.Position
        end
        v55.position = v56
        v53:playSound(v54, v55)
    end
end
u5.CreateController(u19.new())
return nil