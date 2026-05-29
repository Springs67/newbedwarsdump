local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GamepadAction
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ContextActionService
local u9 = v7.TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v13 = u6.Component:extend("ActiveCannonHud")
function v13.init(p14) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    p14.hpOuterRef = u6.createRef()
    p14.autoOuterRef = u6.createRef()
    p14.ammoCounterRef = u6.createRef()
    p14.autoFireMaid = u5.new()
end
function v13.render(u15) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u6
        [4] = u10
    --]]
    local v16 = {
        ["ResetOnSpawn"] = true
    }
    local v17 = {}
    local _ = #v17
    local v18 = {
        ["BackgroundTransparency"] = 0.1,
        ["BackgroundColor3"] = u3.darken(u11.Gray, 0.25),
        ["Size"] = UDim2.fromScale(0.2, 0.4),
        ["Position"] = UDim2.fromScale(0.8, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v19 = { u6.createElement("UICorner"), (u6.createElement("UIStroke", {
            ["Thickness"] = 6,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        })) }
    local v20 = u6.createElement
    local v21 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.05, 0),
        ["Size"] = UDim2.fromScale(0.9, 0.15)
    }
    local v22 = {
        ["HpLabel"] = u6.createElement("TextLabel", {
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
    local v23 = u6.createElement
    local v24 = {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(0.7, 0.4),
        ["Position"] = UDim2.fromScale(0.28, 0.5),
        ["BackgroundColor3"] = u11.Gray
    }
    local v25 = {
        u6.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        u6.createElement("UICorner"),
        ["HpBarOuter"] = u6.createElement("Frame", {
            [u6.Ref] = u15.hpOuterRef,
            ["Size"] = u15:getCurrentDurability(),
            ["BackgroundColor3"] = u11.mcGreen
        }, { u6.createElement("UICorner") })
    }
    v22.HpBarInner = v23("Frame", v24, v25)
    v19.HpContainer = v20("Frame", v21, v22)
    local v26 = u6.createElement
    local v27 = {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(0.8, 0.25),
        ["Position"] = UDim2.fromScale(0.1, 0.2),
        ["BackgroundColor3"] = u11.Gray
    }
    local v28 = {
        u6.createElement("UICorner"),
        u6.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        ["TNTIcon"] = u6.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = u10.LOGO,
            ["Size"] = UDim2.fromScale(0.4, 0.4),
            ["Position"] = UDim2.fromScale(0.225, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
        })
    }
    local v29 = u6.createElement
    local v30 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        [u6.Ref] = u15.ammoCounterRef
    }
    local v31 = u15.props.cannon
    local v32 = tostring(v31:GetAttribute("CannonAmmo"))
    local v33 = u15.props.config.ammoCapacity
    v30.Text = v32 .. "/" .. tostring(v33)
    v30.Font = Enum.Font.Arcade
    v30.Size = UDim2.fromScale(0.5, 0.6)
    v30.Position = UDim2.fromScale(0.7, 0.5)
    v30.TextStrokeTransparency = 0
    v30.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v30.TextColor3 = Color3.fromRGB(255, 255, 255)
    v30.TextScaled = true
    v30.BackgroundTransparency = 1
    v28.Counter = v29("TextLabel", v30)
    v19.AmmoContainer = v26("Frame", v27, v28)
    local v34 = #v19
    local v35 = u15.props.config.autoFire
    if v35 then
        local v36 = u6.createFragment
        local v37 = {}
        local v38 = u6.createElement
        local v39 = {
            ["BackgroundTransparency"] = 0.3,
            ["Position"] = UDim2.fromScale(0.05, 0.5),
            ["Size"] = UDim2.fromScale(0.9, 0.075),
            ["BackgroundColor3"] = u11.Gray
        }
        local v40 = {
            u6.createElement("UICorner"),
            u6.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            ["AutoFireBarOuter"] = u6.createElement("Frame", {
                [u6.Ref] = u15.autoOuterRef,
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundColor3"] = u11.mcBlue
            }, { u6.createElement("UICorner") })
        }
        v37.AutoFireBarInner = v38("Frame", v39, v40)
        v35 = v36(v37)
    end
    if v35 then
        v19[v34 + 1] = v35
    end
    local _ = #v19
    local v41 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.9, 0.4)
    }
    local v42
    if u15.props.config.autoFire then
        v42 = UDim2.fromScale(0.05, 0.6)
    else
        v42 = UDim2.fromScale(0.05, 0.525)
    end
    v41.Position = v42
    local v43 = {}
    local v44 = #v43
    local v45 = not u15.props.config.autoFire
    if v45 then
        local v46 = u6.createFragment
        local v47 = {}
        local v48 = u6.createElement
        local v49 = {
            ["Active"] = true,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(0, 0),
            ["BackgroundTransparency"] = 1,
            [u6.Event.TouchTap] = function() --[[ Line: 154 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.props.requestFire(u15.props.cannon)
            end
        }
        local v50 = {}
        local v51 = u6.createElement
        local v52 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v53 = {
            u6.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            u6.createElement("UICorner"),
            ["FireButton"] = u6.createElement("TextLabel", {
                ["Text"] = "X",
                ["TextStrokeTransparency"] = 0,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.4),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }),
            ["FireText"] = u6.createElement("TextLabel", {
                ["Text"] = "Fire",
                ["TextStrokeTransparency"] = 0,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
                ["Size"] = UDim2.fromScale(0.9, 0.4),
                ["Position"] = UDim2.fromScale(0.5, 0.75),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
        }
        v50.FireOutline = v51("Frame", v52, v53)
        v47.FireControl = v48("Frame", v49, v50)
        v45 = v46(v47)
    end
    if v45 then
        v43[v44 + 1] = v45
    end
    local _ = #v43
    local v54 = u6.createElement
    local v55 = "Frame"
    local v56 = {
        ["Active"] = true,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v57
    if u15.props.config.autoFire then
        v57 = UDim2.fromScale(0.25, 0)
    else
        v57 = UDim2.fromScale(0.5, 0)
    end
    v56.Position = v57
    v56.BackgroundTransparency = 1
    v56[u6.Event.TouchTap] = function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15.props.unmount()
    end
    local v58 = {}
    local v59 = u6.createElement
    local v60 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v61 = {
        u6.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        u6.createElement("UICorner"),
        ["UnmountButton"] = u6.createElement("TextLabel", {
            ["Text"] = "F",
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["Size"] = UDim2.fromScale(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.4),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }),
        ["UnmountText"] = u6.createElement("TextLabel", {
            ["Text"] = "Unmount",
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["Size"] = UDim2.fromScale(0.9, 0.4),
            ["Position"] = UDim2.fromScale(0.5, 0.75),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    }
    v58.UnmountOutline = v59("Frame", v60, v61)
    v43.UnmountControl = v54(v55, v56, v58)
    v19.ControlContainer = u6.createElement("Frame", v41, v43)
    v17.ActiveHudContainer = u6.createElement("Frame", v18, v19)
    return u6.createFragment({
        ["ActiveCannonHud"] = u6.createElement("ScreenGui", v16, v17)
    })
end
function v13.didMount(p62) --[[ Line: 252 ]]
    p62:startAutoFireTween()
    p62:setupDamageListener()
    p62:setupAmmoListener()
    p62:setupKeybinds()
end
function v13.willUnmount(p63) --[[ Line: 258 ]]
    p63:cleanupKeybinds()
end
function v13.setupKeybinds(u64) --[[ Line: 261 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    if not u64.props.config.autoFire then
        u8:BindAction("fire-cannon", function(_, p65, _) --[[ Line: 263 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            if p65 == Enum.UserInputState.Begin then
                u64.props.requestFire(u64.props.cannon)
            end
        end, false, Enum.KeyCode.X, u4.Interact)
    end
    u8:BindAction("unmount-cannon", function(_, p66, _) --[[ Line: 269 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        if p66 == Enum.UserInputState.Begin then
            u64.props.unmount()
        end
    end, false, Enum.KeyCode.F)
end
function v13.cleanupKeybinds(_) --[[ Line: 275 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8:UnbindAction("fire-cannon")
    u8:UnbindAction("unmount-cannon")
end
function v13.getCurrentDurability(p67) --[[ Line: 279 ]]
    local v68 = p67.props.cannon:GetAttribute("CannonDurability") / p67.props.cannon:GetAttribute("MaxHealth")
    return UDim2.fromScale(v68, 1)
end
function v13.startAutoFireTween(p69) --[[ Line: 285 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not p69.props.config.autoFire then
        return nil
    end
    local v70 = p69.autoOuterRef:getValue()
    if not v70 then
        return nil
    end
    local u71 = u9:Create(v70, TweenInfo.new(p69.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, (1 / 0)), {
        ["Size"] = UDim2.fromScale(1, 1)
    })
    u71:Play()
    p69.autoFireMaid:GiveTask(function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u71
        --]]
        u71:Destroy()
    end)
end
function v13.setupDamageListener(u72) --[[ Line: 302 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
    --]]
    local u73 = u72.hpOuterRef:getValue()
    if not u73 then
        return nil
    end
    u72.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function() --[[ Line: 307 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u73
            [3] = u9
            [4] = u12
        --]]
        local v74 = u72.props.cannon:GetAttribute("CannonDurability") / u72.props.cannon:GetAttribute("MaxHealth")
        u9:Create(u73, u12, {
            ["Size"] = UDim2.fromScale(v74, u73.Size.Y.Scale)
        }):Play()
    end)
end
function v13.setupAmmoListener(u75) --[[ Line: 317 ]]
    local u76 = u75.ammoCounterRef:getValue()
    if not u76 then
        return nil
    end
    u75.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function() --[[ Line: 322 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u76
        --]]
        local v77 = u75.props.cannon:GetAttribute("CannonAmmo")
        local v78 = u75.props.config.ammoCapacity
        u76.Text = tostring(v77) .. "/" .. tostring(v78)
    end)
end
return {
    ["ActiveCannonHud"] = v13
}