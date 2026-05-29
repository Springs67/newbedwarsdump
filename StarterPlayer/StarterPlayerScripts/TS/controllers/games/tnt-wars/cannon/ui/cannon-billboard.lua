local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.TweenService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").CANNON_COLLECTION_TAGS
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v11 = u3.Component:extend("CannonBillboard")
function v11.init(p12) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    p12.billboardRef = u3.createRef()
    p12.hpOuterRef = u3.createRef()
    p12.autoOuterRef = u3.createRef()
    p12.ammoCounterRef = u3.createRef()
    p12.autoFireMaid = u2.new()
end
function v11.render(p13) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u9
    --]]
    local v14 = {
        [u3.Ref] = p13.billboardRef,
        ["Adornee"] = p13.props.cannon:WaitForChild("Camera"),
        ["ExtentsOffset"] = Vector3.new(0, 7.5, 0),
        ["Size"] = UDim2.fromScale(4, 5),
        ["MaxDistance"] = 25
    }
    local v15 = {}
    local _ = #v15
    local v16 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Image"] = u8.BILLBOARD
    }
    local v17 = {}
    local _ = #v17
    local v18 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.6),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.8, 0.7)
    }
    local v19 = {}
    local v20 = u3.createElement
    local v21 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.25)
    }
    local v22 = {
        ["HpLabel"] = u3.createElement("TextLabel", {
            ["Text"] = "HP",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextStrokeTransparency"] = 0,
            ["Font"] = Enum.Font.Arcade,
            ["Size"] = UDim2.fromScale(0.25, 1),
            ["Position"] = UDim2.fromScale(0, 0.15),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        })
    }
    local v23 = u3.createElement
    local v24 = {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(0.7, 0.4),
        ["Position"] = UDim2.fromScale(0.28, 0.5),
        ["BackgroundColor3"] = u9.Gray
    }
    local v25 = {
        u3.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        u3.createElement("UICorner"),
        ["HpBarOuter"] = u3.createElement("Frame", {
            [u3.Ref] = p13.hpOuterRef,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u9.mcGreen
        }, { u3.createElement("UICorner") })
    }
    v22.HpBarInner = v23("Frame", v24, v25)
    v19.HpContainer = v20("Frame", v21, v22)
    local v26 = u3.createElement
    local v27 = "Frame"
    local v28 = {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(1, 0.45)
    }
    local v29
    if p13.props.config.autoFire then
        v29 = UDim2.fromScale(0, 0.32)
    else
        v29 = UDim2.fromScale(0, 0.42)
    end
    v28.Position = v29
    v28.BackgroundColor3 = u9.Gray
    local v30 = {
        u3.createElement("UICorner"),
        u3.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        ["TNTIcon"] = u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = u8.LOGO,
            ["Size"] = UDim2.fromScale(0.4, 0.4),
            ["Position"] = UDim2.fromScale(0.225, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
        })
    }
    local v31 = u3.createElement
    local v32 = {
        [u3.Ref] = p13.ammoCounterRef,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v33 = p13.props.config.ammoCapacity
    v32.Text = "0/" .. tostring(v33)
    v32.Font = Enum.Font.Arcade
    v32.Size = UDim2.fromScale(0.5, 0.5)
    v32.Position = UDim2.fromScale(0.7, 0.5)
    v32.TextStrokeTransparency = 0
    v32.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v32.TextColor3 = Color3.fromRGB(255, 255, 255)
    v32.TextScaled = true
    v32.BackgroundTransparency = 1
    v30.Counter = v31("TextLabel", v32)
    v19.AmmoContainer = v26(v27, v28, v30)
    local v34 = #v19
    local v35 = p13.props.config.autoFire
    if v35 then
        local v36 = u3.createFragment
        local v37 = {}
        local v38 = u3.createElement
        local v39 = {
            ["BackgroundTransparency"] = 0.3,
            ["Position"] = UDim2.fromScale(0, 0.85),
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["BackgroundColor3"] = u9.Gray
        }
        local v40 = {
            u3.createElement("UICorner"),
            u3.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            ["AutoFireBarOuter"] = u3.createElement("Frame", {
                [u3.Ref] = p13.autoOuterRef,
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundColor3"] = u9.mcBlue
            }, { u3.createElement("UICorner") })
        }
        v37.AutoFireBarInner = v38("Frame", v39, v40)
        v35 = v36(v37)
    end
    if v35 then
        v19[v34 + 1] = v35
    end
    v17.UsableArea = u3.createElement("Frame", v18, v19)
    v15.BillboardFrame = u3.createElement("ImageLabel", v16, v17)
    return u3.createFragment({
        ["CannonBillboard"] = u3.createElement("BillboardGui", v14, v15)
    })
end
function v11.didMount(p41) --[[ Line: 150 ]]
    p41:addTag()
    p41:startAutoFireTween()
    p41:setupDamageListener()
    p41:setupAmmoListener()
end
function v11.willUnmount(p42) --[[ Line: 156 ]]
    p42.autoFireMaid:DoCleaning()
end
function v11.addTag(p43) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
    --]]
    local v44 = p43.billboardRef:getValue()
    if not v44 then
        return nil
    end
    u5:AddTag(v44, u7.billboard)
end
function v11.startAutoFireTween(p45) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if not p45.props.config.autoFire then
        return nil
    end
    local v46 = p45.autoOuterRef:getValue()
    if not v46 then
        return nil
    end
    local u47 = u6:Create(v46, TweenInfo.new(p45.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, (1 / 0)), {
        ["Size"] = UDim2.fromScale(1, 1)
    })
    u47:Play()
    p45.autoFireMaid:GiveTask(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:Destroy()
    end)
end
function v11.setupDamageListener(u48) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
    --]]
    local u49 = u48.hpOuterRef:getValue()
    if not u49 then
        return nil
    end
    u48.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function() --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u49
            [3] = u6
            [4] = u10
        --]]
        local v50 = u48.props.cannon:GetAttribute("CannonDurability") / u48.props.cannon:GetAttribute("MaxHealth")
        u6:Create(u49, u10, {
            ["Size"] = UDim2.fromScale(v50, u49.Size.Y.Scale)
        }):Play()
    end)
end
function v11.setupAmmoListener(u51) --[[ Line: 198 ]]
    local u52 = u51.ammoCounterRef:getValue()
    if not u52 then
        return nil
    end
    u51.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function() --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u52
        --]]
        local v53 = u51.props.cannon:GetAttribute("CannonAmmo")
        local v54 = u51.props.config.ammoCapacity
        u52.Text = tostring(v53) .. "/" .. tostring(v54)
    end)
end
return {
    ["CannonBillboard"] = v11
}