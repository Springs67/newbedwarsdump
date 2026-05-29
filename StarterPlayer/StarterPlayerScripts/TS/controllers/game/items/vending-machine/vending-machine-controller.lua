local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.ExpireList
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.RunService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-const").VendingMachineConst
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "VendingMachineController"
    end,
    ["__index"] = u17
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u4
        [3] = u23
    --]]
    u17.constructor(p28)
    p28.Name = "VendingMachineController"
    p28.animationCooldowns = u4.new(2)
    p28.vendingMachineNamespace = u23.Client:GetNamespace("VendingMachine")
end
function u25.KnitStart(p29) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u20
        [4] = u21
        [5] = u9
        [6] = u3
        [7] = u22
        [8] = u10
        [9] = u19
        [10] = u13
        [11] = u18
        [12] = u23
        [13] = u16
        [14] = u15
        [15] = u5
        [16] = u24
        [17] = u14
    --]]
    u17.KnitStart(p29)
    u6("VendingMachine", function(u30) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u21
            [3] = u9
            [4] = u3
            [5] = u22
            [6] = u10
            [7] = u19
            [8] = u13
            [9] = u18
            [10] = u23
        --]]
        local v31 = u20(u21.COST_ITEM)
        local v32 = u9.Controllers.ProximityPromptController
        local v33 = {
            ["ObjectText"] = "Use Vending Machine",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 8,
            ["HoldDuration"] = 1,
            ["Parent"] = u30
        }
        local v34 = u21.COST_AMOUNT
        v33.ActionText = tostring(v34) .. " " .. v31.displayName
        v33.ClickablePrompt = u3.isMobileControls()
        local u35 = v32:createProximityPrompt(v33)
        u30:GetAttributeChangedSignal("VendingMachineState"):Connect(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u22
                [3] = u35
            --]]
            if u30:GetAttribute("VendingMachineState") == u22.IDLE then
                u35.Enabled = true
            else
                u35.Enabled = false
            end
        end)
        u35.PromptButtonHoldBegan:Connect(function(_) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u19
                [3] = u13
                [4] = u18
                [5] = u35
            --]]
            local u36 = u10.new()
            local u37 = u19:playAnimation(u13.LocalPlayer, u18.OPEN_CRATE)
            u36:GiveTask(function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                local v38 = u37
                if v38 ~= nil then
                    v38:Stop()
                end
                local v39 = u37
                if v39 ~= nil then
                    v39:Destroy()
                end
            end)
            u35.PromptButtonHoldEnded:Connect(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:DoCleaning()
            end)
        end)
        u35.Triggered:Connect(function(_) --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u30
            --]]
            u23.Client:GetNamespace("VendingMachine"):Get("OpenVendingMachine"):CallServer(u30)
        end)
    end)
    u6("VendingMachine", function(p40) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
            [3] = u15
        --]]
        local u41 = p40:WaitForChild("LuckyBlock")
        local u42 = u41.Position
        local u43 = u10.new()
        local u44 = u16:GetServerTimeNow()
        u43:GiveTask(u15.Heartbeat:Connect(function(p45) --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u42
                [3] = u41
            --]]
            u44 = u44 + p45
            local v46 = u44 / 2
            local v47 = math.sin(v46) * 1 + 0.3
            local v48 = Vector3.new(0, v47, 0)
            local v49 = CFrame.new(u42 + v48)
            local v50 = CFrame.Angles
            local v51 = u44 / 3
            local v52 = math.sin(v51) * 3.141592653589793 * 2
            local v53 = u44 / 4
            local v54 = math.cos(v53) * 3.141592653589793 * 2
            local v55 = u44 / 3.5
            u41.CFrame = v49 * v50(v52, v54, math.sin(v55) * 3.141592653589793 * 2 + 1.0471975511965976)
        end))
        u41.AncestryChanged:Connect(function(_, p56) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            if p56 == nil then
                u43:DoCleaning()
            end
        end)
    end)
    p29.vendingMachineNamespace:OnEvent("VendingMachineSelfDestruct", function(p57) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u24
            [3] = u14
            [4] = u16
            [5] = u9
        --]]
        local u58 = p57 + Vector3.new(0, 5, 0)
        task.spawn(function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u24
                [3] = u58
                [4] = u14
                [5] = u16
                [6] = u9
            --]]
            local v59 = {
                ["rollOffMaxDistance"] = 100,
                ["position"] = u58
            }
            u5:playSound(u24.TNT_EXPLODE_1, v59)
            local v60 = u14.Assets.Effects.RocketLauncherExplode:Clone()
            v60.Parent = u16
            v60:PivotTo(CFrame.new(u58))
            local v61 = {
                ["radius"] = 15,
                ["randomSizeOffset"] = 10,
                ["randomPositionOffset"] = 1,
                ["rotationSpeed"] = 15,
                ["inDuration"] = 0.3,
                ["outDuration"] = 0.3,
                ["position"] = u58,
                ["model"] = v60
            }
            u9.Controllers.FancyExplosionController:createExplosion(v61):await()
            v60:Destroy()
        end)
        local u62 = u58
        local v63 = false
        local v64 = 0
        while true do
            if v63 then
                v64 = v64 + 1
            else
                v63 = true
            end
            if v64 >= math.random() * 2 + 2 then
                return
            end
            task.spawn(function() --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u16
                    [3] = u62
                --]]
                local v65 = u14.Assets.Effects.RocketLauncherDebris:Clone()
                v65.Parent = u16
                v65.Position = u62
                local v66 = math.random() * 3.141592653589793 * 2
                local v67 = math.cos(v66) * 40
                local v68 = math.sin(v66) * 40
                v65:ApplyImpulse(Vector3.new(v67, 70, v68) * v65.Mass)
                task.wait(1)
                v65:Destroy()
            end)
        end
    end)
end
function u25.getClosestVendingMachine(_, u69) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v70 = u12:GetTagged("VendingMachine")
    table.sort(v70, function(p71, p72) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u69
        --]]
        return (p71.Position - u69).Magnitude < (p72.Position - u69).Magnitude
    end)
    local v73 = nil
    for v74, v75 in v70 do
        local _ = v74 - 1
        if true == true then
            v73 = v75
            break
        end
    end
    return v73
end
v8.CreateController(u25.new())
return nil