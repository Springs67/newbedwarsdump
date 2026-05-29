local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "battery", "battery-util").BatteryUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u21 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "BatteryEffectsController"
    end,
    ["__index"] = u21
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u14
        [3] = u17
    --]]
    u21.constructor(p25, u14.BATTERY, {
        ["sounds"] = {
            u17.OVERLOAD_BEEP,
            u17.OVERLOAD_LOOP,
            u17.MIDNIGHT_ATTACK_3,
            u17.TRINITY_VOID_ORB_HEAL
        }
    })
    p25.Name = "BatteryEffectsController"
    p25.batteryIds = {}
    p25.liveBatteries = {}
end
function u22.onKitLocalActivated(_, _) --[[ Line: 45 ]] end
function u22.onKitLocalDeactivated(_) --[[ Line: 47 ]] end
function u22.onKitReplicationActivated(u26, p27) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u10
        [4] = u3
        [5] = u13
        [6] = u12
        [7] = u4
        [8] = u17
        [9] = u9
        [10] = u18
        [11] = u6
        [12] = u15
        [13] = u5
        [14] = u19
        [15] = u14
        [16] = u20
    --]]
    p27:GiveTask((u16.Client:WaitFor("BatterySpawn"):expect():Connect(function(u28) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u26
            [4] = u3
            [5] = u13
            [6] = u12
            [7] = u4
            [8] = u17
        --]]
        local u29 = u7.new()
        local u30 = true
        u29:GiveTask(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30 = false
        end)
        local u31 = u10.Assets.Misc.Battery.Closed:Clone()
        u29:GiveTask(u31)
        u26.liveBatteries[u28.batteryId] = {
            ["consumeTime"] = 0,
            ["maid"] = u29,
            ["activateTime"] = u28.activateTime,
            ["position"] = u28.position
        }
        u29:GiveTask(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u28
            --]]
            u26.liveBatteries[u28.batteryId] = nil
        end)
        u3:setQueryIgnored(u31, true)
        local v32 = u28.position
        local v33 = u13 / 2
        local v34 = Vector3.new(0, v33, 0)
        u31:PivotTo(CFrame.new(v32 - v34))
        u31.Parent = u12
        local v35 = task.delay
        local v36 = u28.activateTime - u12:GetServerTimeNow()
        v35(math.max(0, v36), function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u4
                [3] = u17
                [4] = u31
                [5] = u10
                [6] = u29
                [7] = u26
                [8] = u28
                [9] = u3
                [10] = u12
            --]]
            if not u30 then
                return nil
            end
            u4:playSound(u17.MIDNIGHT_ATTACK_3, {
                ["volumeMultiplier"] = 0.25,
                ["position"] = u31:GetPrimaryPartCFrame().Position
            })
            local v37 = u10.Assets.Misc.Battery.Open:Clone()
            u29:GiveTask(v37)
            u26:registerBattery(v37, u28.batteryId)
            u3:setQueryIgnored(v37, true)
            v37:PivotTo(u31:GetPrimaryPartCFrame())
            u31:Destroy()
            v37.Parent = u12
        end)
        local v38 = task.delay
        local v39 = u28.despawnTime - u12:GetServerTimeNow()
        v38(math.max(0, v39), function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:DoCleaning()
        end)
    end)))
    p27:GiveTask((u16.Client:WaitFor("BatteryConsumed"):expect():Connect(function(p40) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u4
            [3] = u17
            [4] = u9
            [5] = u10
            [6] = u12
            [7] = u18
        --]]
        local v41 = u26.liveBatteries[p40.batteryId]
        if v41 then
            v41.maid:DoCleaning()
            local v42 = u4
            local v43 = u17.TRINITY_VOID_ORB_HEAL
            local v44 = {}
            local v45
            if p40.player == u9.LocalPlayer then
                v45 = nil
            else
                v45 = v41.position
            end
            v44.position = v45
            v42:playSound(v43, v44)
            local v46 = u10.Assets.Misc.Battery.BatteryPop:Clone()
            v46.Position = v41.position
            v46.Parent = u12
            u18:playEffects({ v46 }, nil, {
                ["destroyAfterSec"] = 4
            })
        end
        u26.liveBatteries[p40.batteryId] = nil
    end)))
    p27:GiveTask((u16.Client:WaitFor("BatteryOverload"):expect():Connect(function(u47) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u7
            [4] = u6
            [5] = u15
            [6] = u4
            [7] = u17
            [8] = u26
        --]]
        local v48 = u47.endTime - u12:GetServerTimeNow()
        local u49 = u47.character == u9.LocalPlayer.Character
        local u50 = u7.new()
        local u51 = true
        u50:GiveTask(function() --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51 = false
        end)
        if u49 then
            u50:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = u15.OVERLOAD_SPEED_MULT
            }))
        end
        if u49 or u47.character.PrimaryPart then
            local v52 = u4
            local v53 = u17.OVERLOAD_LOOP
            local v54 = {
                ["volumeMultiplier"] = 0.2
            }
            local v55
            if u49 then
                v55 = nil
            else
                v55 = u47.character.PrimaryPart
            end
            v54.parent = v55
            local u56 = v52:playSound(v53, v54)
            task.delay(v48 - 2, function() --[[ Line: 138 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u4
                --]]
                if u56 then
                    u4:tweenSoundVolume(u56, 0, 2)
                end
            end)
        end
        local u57 = u51
        local u58 = {}
        for _, v59 in u47.character:GetDescendants() do
            if v59:IsA("BasePart") and (v59.Material == Enum.Material.Neon and v59.Color == u15.BATTERY_BLUE) then
                table.insert(u58, v59)
            end
        end
        task.spawn(function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u17
                [3] = u47
                [4] = u49
                [5] = u26
                [6] = u58
                [7] = u50
                [8] = u57
            --]]
            while true do
                local v60 = u4
                local v61 = u17.OVERLOAD_BEEP
                local v62 = {
                    ["volumeMultiplier"] = 0.2
                }
                local v63
                if u47.character.PrimaryPart and not u49 then
                    v63 = u47.character:GetPrimaryPartCFrame().Position
                else
                    v63 = nil
                end
                v62.position = v63
                v60:playSound(v61, v62)
                u26:flashParts(u58, u50)
                local v64 = task.wait(1.8)
                if v64 ~= 0 and (v64 == v64 and v64) then
                    v64 = u57
                end
                if v64 == 0 or (v64 ~= v64 or not v64) then
                    return
                end
            end
        end)
        task.delay(v48, function() --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u58
                [3] = u15
            --]]
            u50:DoCleaning()
            for _, v65 in u58 do
                if v65.Parent then
                    v65.Color = u15.BATTERY_BLUE
                end
            end
        end)
    end)))
    p27:GiveTask(u5(function(p66, u67, p68) --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u10
            [4] = u20
        --]]
        if not u19(p66, u14.BATTERY) then
            return nil
        end
        local u69 = u10.Assets.Misc.Battery.battery_pack:Clone()
        u69.Parent = u67
        u20:weldCharacterAccessories(u67)
        p68:GiveTask(u67:GetAttributeChangedSignal("ActiveBatteries"):Connect(function() --[[ Line: 186 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u69
            --]]
            local v70 = u67:GetAttribute("ActiveBatteries")
            local v71 = v70 == nil and 0 or v70
            local v72 = false
            local v73 = 0
            while true do
                if v72 then
                    v73 = v73 + 1
                else
                    v72 = true
                end
                if v73 >= 3 then
                    return
                end
                local v74 = v73 < v71
                local v75 = {}
                local v76 = v73 + 1
                local v77 = "Battery" .. tostring(v76)
                local v78 = v73 + 1
                __set_list(v75, 1, {v77, "Neon" .. tostring(v78)})
                for v79, v80 in v75 do
                    local _ = v79 - 1
                    u69:FindFirstChild("Handle"):FindFirstChild(v80).Transparency = v74 and 0 or 1
                end
            end
        end))
    end))
end
function u22.onKitReplicationDeactivated(_) --[[ Line: 217 ]] end
function u22.onInnateAbilityEnabled(_, _, _) --[[ Line: 219 ]] end
function u22.onAbilityUsed(_, _, _) --[[ Line: 221 ]] end
function u22.flashParts(_, p81, p82) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
    --]]
    for _, v83 in p81 do
        if v83.Parent then
            v83.Color = Color3.fromRGB(255, 255, 255)
            local u84 = u11:Create(v83, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Color"] = u15.BATTERY_RED
            })
            u84:Play()
            p82:GiveTask(function() --[[ Line: 233 ]]
                --[[
                Upvalues:
                    [1] = u84
                --]]
                u84:Cancel()
            end)
        end
    end
end
function u22.registerBattery(u85, p86, p87) --[[ Line: 238 ]]
    for _, u88 in p86:GetDescendants() do
        if u88:IsA("BasePart") then
            u85.batteryIds[u88] = p87
            local u89 = nil
            u89 = u88.AncestryChanged:Connect(function() --[[ Line: 245 ]]
                --[[
                Upvalues:
                    [1] = u88
                    [2] = u85
                    [3] = u89
                --]]
                if u88.Parent then
                    return nil
                end
                u85.batteryIds[u88] = nil
                u89:Disconnect()
            end)
        end
    end
end
function u22.getBatteryIdFromPart(p90, p91) --[[ Line: 255 ]]
    return p90.batteryIds[p91]
end
function u22.getBatteryInfo(p92, p93) --[[ Line: 260 ]]
    return p92.liveBatteries[p93]
end
u6.CreateController(u22.new())
return nil