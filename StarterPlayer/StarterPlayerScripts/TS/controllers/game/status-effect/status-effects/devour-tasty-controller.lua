local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v15 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u16 = v15.InteractionCategory
local u17 = v15.InteractionPriority
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "effects", "devour-status-effect-util").DevourStatusEffectUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "DevourTastyController"
    end,
    ["__index"] = u18
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u8
    --]]
    u18.constructor(p30)
    p30.Name = "DevourController"
    p30.maidMap = {}
    p30.speedMaid = u8.new()
end
function u27.KnitStart(u31) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u25
        [4] = u26
        [5] = u23
        [6] = u6
        [7] = u8
        [8] = u13
        [9] = u9
        [10] = u7
        [11] = u22
        [12] = u12
        [13] = u21
        [14] = u24
        [15] = u11
        [16] = u4
        [17] = u17
        [18] = u16
        [19] = u3
        [20] = u20
        [21] = u19
    --]]
    u18.KnitStart(u31)
    u14.StatusEffectChanged:connect(function(p32) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u26
            [3] = u31
            [4] = u23
            [5] = u6
        --]]
        if p32.statusEffect ~= u25.TASTY then
            return nil
        end
        local v33 = u26:getActive(p32.entityInstance, p32.statusEffect)
        if not v33 then
            return nil
        end
        if v33.stacks <= 0 then
            return nil
        end
        local v34 = u31.maidMap[p32.entityInstance]
        if v34 ~= nil then
            v34 = v34.effectPart
        end
        if not v34 then
            return nil
        end
        local v35 = u23.DEVOUR_STATUS_STACKS_SCALING_FUNCTION(v33.stacks)
        local _ = v34.Trail
        local v36 = v34.Beam
        v36.Enabled = u6.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0
        v36.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1 - v35 / u23.MAX_STACKS), NumberSequenceKeypoint.new(0.9, 0.5), NumberSequenceKeypoint.new(1, 1) })
        v36.TextureSpeed = 0.25 * v35 / u23.MAX_STACKS
        v36:SetAttribute("FirstPersonVisible", false)
    end)
    u14.StatusEffectAdded:connect(function(p37) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u31
            [3] = u8
            [4] = u13
            [5] = u9
        --]]
        if p37.statusEffect ~= u25.TASTY then
            return nil
        end
        local v38 = p37.entityInstance.PrimaryPart
        if not v38 then
            return nil
        end
        if u31.maidMap[p37.entityInstance] ~= nil then
            return nil
        end
        local v39 = u8.new()
        local v40 = u13.Assets.Effects.TastyStatusEffect:Clone()
        v40.CFrame = v38.CFrame
        v40.Parent = v38
        local v41 = u9("WeldConstraint", {
            ["Parent"] = v40,
            ["Part0"] = v38,
            ["Part1"] = v40
        })
        v39:GiveTask(v40)
        v39:GiveTask(v41)
        u31.maidMap[p37.entityInstance] = {
            ["effectPart"] = v40,
            ["maid"] = v39
        }
    end)
    u14.StatusEffectRemoved:connect(function(u42) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u31
            [3] = u7
        --]]
        if u42.statusEffect == u25.DEVOURER_SPEED then
            u31.speedMaid:DoCleaning()
        elseif u42.statusEffect == u25.TASTY then
            local u43 = u31.maidMap[u42.entityInstance]
            if not u43 then
                return nil
            end
            task.delay(1, function() --[[ Line: 125 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u31
                    [3] = u42
                --]]
                u43.maid:DoCleaning()
                u31.maidMap[u42.entityInstance] = nil
            end)
            local v44 = u42.entityInstance:FindFirstChild("Devour Stacks")
            if v44 then
                v44:Destroy()
            end
            u7.Controllers.InteractionRegistryController:removePrompt(u42.entityInstance, "Devour")
        end
    end)
    u22.Client:Get("DevourerSpeed"):Connect(function(p45) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u6
        --]]
        u31.speedMaid:DoCleaning()
        u31.speedMaid:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = p45.speedMultiplier
        }))
    end)
    u22.Client:Get("DevourStacked"):Connect(function(p46) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u21
            [3] = u26
            [4] = u25
            [5] = u24
            [6] = u23
            [7] = u11
            [8] = u9
        --]]
        local v47 = u12:GetPlayerFromCharacter(p46.entity)
        if not v47 or v47 == u12.LocalPlayer then
            return nil
        end
        local v48 = u21:getLocalPlayerEntity()
        local v49 = u21:getEntity(p46.entity)
        if v48 and (v49 and not v48:canAttack(v49)) then
            return nil
        end
        local v50 = p46.entity:FindFirstChild("Devour Stacks")
        local v51 = u26:getStacks(p46.entity, u25.TASTY)
        local v52 = u24[u25.TASTY].image
        if u23.SHOULD_DEVOUR(v51) then
            u11:AddTag(p46.entity, "Devour")
            v52 = u24[u25.DEVOURER_SPEED].image
        end
        if v50 then
            local v53 = v50:FindFirstChildWhichIsA("ImageLabel")
            if v53 then
                v53.Image = v52
                return
            end
        else
            local v54 = u9
            local v55 = {
                ["Name"] = "Devour Stacks",
                ["AlwaysOnTop"] = true,
                ["MaxDistance"] = 100,
                ["StudsOffset"] = Vector3.new(-1.5, 7, 0),
                ["Parent"] = p46.entity,
                ["Adornee"] = p46.entity.Head,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Children"] = { u9("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Image"] = v52,
                        ["Size"] = UDim2.fromScale(3, 3),
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }) }
            }
            v54("BillboardGui", v55)
        end
    end)
    u6.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Devour",
        ["interactionTag"] = "Devour",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = 10,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u17.ABILITY,
        ["category"] = u16.ABILITY,
        ["onInteracted"] = function(p56, p57, _) --[[ Name: onInteracted, Line 194 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u21
                [3] = u26
                [4] = u25
                [5] = u22
                [6] = u3
                [7] = u20
                [8] = u19
            --]]
            if not p57:IsA("Model") then
                return nil
            end
            if not u12:GetPlayerFromCharacter(p57) then
                return nil
            end
            local v58 = u21:getEntity(p56)
            if v58 ~= nil then
                v58 = v58:getInstance()
            end
            if v58 and u26:isActive(v58, u25.GROUNDED) then
                return nil
            end
            if v58 and u26:isActive(v58, u25.FROSTED) then
                return nil
            end
            if not u22.Client:Get("DevourAction"):CallServer({
                ["devourer"] = u12.LocalPlayer,
                ["devouredEntity"] = p57
            }) then
                return nil
            end
            local v59 = p57:FindFirstChild("Devour Stacks")
            if v59 then
                v59:Destroy()
            end
            local v60 = u12.LocalPlayer.Character
            if v60 ~= nil then
                v60 = v60.PrimaryPart
            end
            local v61 = p57.PrimaryPart
            if v60 and v61 then
                v60.CFrame = CFrame.lookAt(v60.Position, v61.Position)
            end
            u3:playAnimation(p56, u20:getAssetId(u19.DEVOUR_ACTION))
        end
    })
    u22.Client:Get("EntityDeathEvent"):Connect(function(p62) --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v63 = p62.entityInstance:FindFirstChild("Devour Stacks")
        if v63 then
            v63:Destroy()
        end
        u7.Controllers.InteractionRegistryController:removePrompt(p62.entityInstance, "Devour")
    end)
end
u6.CreateController(u27.new())
return nil