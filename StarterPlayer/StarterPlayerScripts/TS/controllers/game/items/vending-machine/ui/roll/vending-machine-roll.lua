local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.TweenService
local u11 = v9.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["VendingMachineRoll"] = v8.new(u7)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u15
            [4] = u14
            [5] = u4
            [6] = u11
            [7] = u5
            [8] = u16
            [9] = u10
            [10] = u13
            [11] = u12
            [12] = u3
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local u21 = u7.createRef()
        local v22 = nil
        local u23 = v22
        local v24 = 0
        local v25 = {}
        for v26, v27 in u6.values(u15) do
            local _ = v26 - 1
            local v28
            if v27.id == u14.NONE or v27.id == u23 then
                v28 = false
            else
                v28 = not v27.disabled
            end
            if v28 == true then
                v24 = v24 + 1
                v25[v24] = v27
            end
        end
        local u29 = table.create(#v25)
        for v30, v31 in v25 do
            local _ = v30 - 1
            u29[v30] = v31.id
        end
        local function v33() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u29
            --]]
            local v32 = u29
            return u4.fromList(unpack(v32))
        end
        local u34, _ = v19(tick())
        local v35, u36 = v19(v33())
        local u37, u38 = v19(false)
        local u39 = false
        v20(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u17
                [3] = u11
                [4] = u36
                [5] = u38
                [6] = u5
                [7] = u16
                [8] = u34
                [9] = u4
                [10] = u29
                [11] = u23
            --]]
            if u39 == true then
                return nil
            end
            local u40 = true
            task.spawn(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u11
                    [3] = u40
                    [4] = u39
                    [5] = u36
                    [6] = u38
                    [7] = u5
                    [8] = u16
                    [9] = u34
                    [10] = u4
                    [11] = u29
                    [12] = u23
                --]]
                if u17.dispenseTime == 0 then
                    return nil
                end
                task.delay(u17.dispenseTime - u11:GetServerTimeNow(), function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                        [2] = u39
                        [3] = u36
                        [4] = u17
                        [5] = u38
                        [6] = u5
                        [7] = u16
                    --]]
                    if not u40 then
                        return nil
                    end
                    u39 = true
                    u36(u17.choosenReward)
                    u38(true)
                    task.spawn(function() --[[ Line: 70 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u16
                            [3] = u17
                        --]]
                        u5:playSound(u16.VENDING_ROLL_PRIZE, {
                            ["position"] = u17.soundPosition
                        })
                    end)
                end)
                while true do
                    local v41 = tick() - u34
                    local v42 = u29
                    local v43 = u4.fromList(unpack(v42))
                    u23 = v43
                    u36(v43)
                    task.spawn(function() --[[ Line: 83 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u16
                            [3] = u17
                        --]]
                        u5:playSound(u16.VENDING_ROLL_TICK, {
                            ["position"] = u17.soundPosition
                        })
                    end)
                    local v44 = v41 / 4
                    local v45 = math.clamp(v44, 0.1, 1) * 0.8
                    local v46 = task.wait(v45)
                    if v46 ~= 0 and (v46 == v46 and v46) then
                        v46 = u40
                        if v46 then
                            v46 = not u39
                        end
                    end
                    if v46 == 0 or (v46 ~= v46 or not v46) then
                        return
                    end
                end
            end)
            return function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40 = false
            end
        end, { u17.choosenReward, u34, u17.dispenseTime })
        v20(function() --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u21
                [3] = u10
            --]]
            local u47 = true
            if not u37 then
                return nil
            end
            local u48 = u21:getValue()
            if not u48 then
                return nil
            end
            task.spawn(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u48
                    [3] = u47
                --]]
                local v49 = true
                while true do
                    local v50 = u10
                    local v51 = TweenInfo.new(2.5, Enum.EasingStyle.Quad)
                    local v52 = {
                        ["ImageTransparency"] = v49 and 0.4 or 0.6
                    }
                    local v53 = u48.Size
                    local v54
                    if v49 then
                        v54 = UDim2.fromScale(0.2, 0.2)
                    else
                        v54 = UDim2.fromScale(-0.2, -0.2)
                    end
                    v52.Size = v53 + v54
                    local v55 = v50:Create(u48, v51, v52)
                    v55:Play()
                    v55.Completed:Wait()
                    if not u47 then
                        return
                    end
                    v49 = not v49
                end
            end)
            return function() --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                u47 = false
            end
        end, { u37 })
        local v56
        if v35 == 0 or (v35 ~= v35 or not v35) then
            v56 = nil
        else
            v56 = u15[v35]
        end
        local v57 = UDim2.fromScale(0.5, 0.5)
        if u37 then
            v57 = UDim2.fromScale(0.7, 0.7)
        end
        local v58 = v56 ~= nil
        if v58 then
            local v59 = {}
            local v60 = #v59
            if u37 then
                u37 = u7.createElement("ImageLabel", {
                    [u7.Ref] = u21,
                    ["Image"] = u13.VENDING_RING,
                    ["Size"] = UDim2.fromScale(2.5, 2.5),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["SizeConstraint"] = "RelativeXX",
                    ["ImageTransparency"] = 0.8
                })
            end
            if u37 then
                v59[v60 + 1] = u37
            end
            local v61 = #v59
            local v62
            if v56.item == nil then
                v62 = false
            else
                v62 = u7.createElement(u12, {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["SizeConstraint"] = "RelativeXX",
                    ["ItemType"] = v56.item.itemType,
                    ["Size"] = v57,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            end
            if v62 then
                v59[v61 + 1] = v62
            end
            local v63 = #v59
            local v64
            if v56.custom == nil then
                v64 = false
            else
                v64 = u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["SizeConstraint"] = "RelativeXX",
                    ["Image"] = v56.custom.image,
                    ["Size"] = v57,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            end
            if v64 then
                v59[v63 + 1] = v64
            end
            v58 = u7.createFragment(v59)
        end
        local v65 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v66 = {}
        local v67 = #v66
        if v58 then
            v66[v67 + 1] = v58
        end
        return u7.createElement(u3, v65, v66)
    end)
}