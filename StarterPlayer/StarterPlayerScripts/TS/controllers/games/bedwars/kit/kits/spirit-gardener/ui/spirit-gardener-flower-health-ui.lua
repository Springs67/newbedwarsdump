local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "shared", "block", "block-meta").BlockHealthType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ProgressBar
local u6 = v4.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance
return {
    ["SpiritGardenerFlowerHealthUi"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u9
            [4] = u10
            [5] = u6
            [6] = u7
            [7] = u5
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local u15 = u2:getStore():getBlockData(u2:getBlockPosition(u11.spiritGardenerFlower.Position))
        local v16 = u2:getHandlerRegistry():getHandler(u11.spiritGardenerFlower.Name)
        if v16 ~= nil then
            v16 = v16:getBlockMeta()
        end
        local u17 = ""
        local v18
        if v16 == nil then
            v18 = v16
        else
            v18 = v16.healthType
        end
        if v18 == u3.GLOBAL then
            u17 = "Health"
        else
            if v16 ~= nil then
                v16 = v16.healthType
            end
            if v16 == u3.PERSONAL then
                local _ = u17 == u9.LocalPlayer.Name .. "_Health"
            else
                local v19 = u2
                u17 = tostring(v19:getDefaultHealthKey())
            end
        end
        local u20 = u11.spiritGardenerFlower:GetAttribute("MaxHealth")
        local v21, u22 = v13(0)
        local v23 = (1 - u10.FLOWER_DAMAGED_THRESHOLD) / u10.FLOWER_DECAY_PER_SECOND
        local v24 = math.max(0, v23)
        local v25, u26 = v13((u6.formatCountdownTime(v24, {
            ["hours"] = false,
            ["days"] = false,
            ["seperator"] = ":"
        })))
        local v27, u28 = v13(false)
        local v29, u30 = v13(false)
        v14(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u11
                [3] = u28
                [4] = u30
                [5] = u17
                [6] = u22
                [7] = u10
                [8] = u20
                [9] = u26
                [10] = u6
            --]]
            if not u15 then
                return nil
            end
            local u32 = u11.spiritGardenerFlower:GetAttributeChangedSignal("FlowerDamaged"):Connect(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u28
                --]]
                local v31 = u11.spiritGardenerFlower:GetAttribute("FlowerDamaged")
                if v31 == 0 or (v31 ~= v31 or (v31 == "" or not v31)) then
                    u28(false)
                else
                    u28(true)
                end
            end)
            local u34 = u11.spiritGardenerFlower:GetAttributeChangedSignal("HasFullyGrown"):Connect(function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u30
                --]]
                local v33 = u11.spiritGardenerFlower:GetAttribute("HasFullyGrown")
                if v33 == 0 or (v33 ~= v33 or (v33 == "" or not v33)) then
                    u30(false)
                else
                    u30(true)
                end
            end)
            local u40 = u15.AttributeChanged:Connect(function(p35) --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u15
                    [3] = u22
                    [4] = u10
                    [5] = u20
                    [6] = u26
                    [7] = u6
                --]]
                if p35 ~= u17 then
                    return nil
                end
                local v36 = u15:GetAttribute(u17)
                u22((v36 - u10.FLOWER_DAMAGED_THRESHOLD) / (u20 - u10.FLOWER_DAMAGED_THRESHOLD))
                local v37 = u26
                local v38 = (v36 - u10.FLOWER_DAMAGED_THRESHOLD) / u10.FLOWER_DECAY_PER_SECOND
                local v39 = math.max(0, v38)
                v37((u6.formatCountdownTime(v39, {
                    ["hours"] = false,
                    ["days"] = false,
                    ["seperator"] = ":"
                })))
            end)
            return function() --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u32
                    [3] = u34
                --]]
                u40:Disconnect()
                u32:Disconnect()
                u34:Disconnect()
            end
        end, {
            v25,
            v21,
            v27,
            v29
        })
        local v41 = {
            ["StudsOffset"] = Vector3.new(0, 2.5, 0),
            ["MaxDistance"] = 33,
            ["AlwaysOnTop"] = true,
            ["Adornee"] = u11.billboardPart,
            ["Size"] = UDim2.fromScale(4, 0.45)
        }
        local v42 = {}
        local v43 = #v42
        local v44 = not v29
        if v44 then
            v44 = u7.createElement("TextLabel", {
                ["Text"] = "NEEDS ENERGY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["TextStrokeTransparency"] = 0,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            })
        end
        if v44 then
            v42[v43 + 1] = v44
        end
        local v45 = #v42
        local v46 = v29 and not v27
        if v46 then
            v46 = u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["TextStrokeTransparency"] = 0,
                ["ZIndex"] = 60,
                ["Text"] = tostring(v25),
                ["Size"] = UDim2.fromScale(1, 1),
                ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            })
        end
        if v46 then
            v42[v45 + 1] = v46
        end
        local v47 = #v42
        if v27 then
            v27 = u7.createElement("TextLabel", {
                ["Text"] = "WITHERED",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["TextStrokeTransparency"] = 0,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            })
        end
        if v27 then
            v42[v47 + 1] = v27
        end
        v42[#v42 + 1] = u7.createElement(u5, {
            ["AcceptZero"] = true,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Progress"] = v21,
            ["ChangingBarColor"] = {
                ["MinBarColor"] = Color3.fromRGB(255, 0, 0),
                ["MaxBarColor"] = Color3.fromRGB(0, 255, 0)
            },
            ["BarCornerRadius"] = UDim.new(0.2)
        })
        return u7.createElement("BillboardGui", v41, v42)
    end)
}