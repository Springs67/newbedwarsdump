local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v7 = u2.Component:extend("TNTWarsBlockCounter")
function v7.init(p8) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p8.avatarRef = u2.createRef()
    p8.counterRef = u2.createRef()
    p8.blockCount = 0
end
function v7.render(p9) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u4
    --]]
    local v10 = u2.createFragment
    local v11 = {}
    local v12 = u2.createElement
    local v13 = {
        ["BackgroundTransparency"] = 0.2,
        ["Size"] = UDim2.fromScale(0.225, 0.1),
        ["Position"] = UDim2.fromScale(0.5, -0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u6.Gray
    }
    local v14 = {
        u2.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        u2.createElement("UICorner"),
        ["BlockImage"] = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u4.GRASS_BLOCK,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(-0.1, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["Size"] = UDim2.fromScale(0.3, 0.3)
        })
    }
    local v15 = u2.createElement
    local v16 = {
        [u2.Ref] = p9.counterRef
    }
    local v17 = p9.blockCount
    v16.Text = "X" .. tostring(v17) .. " DESTROYED"
    v16.Font = Enum.Font.Arcade
    v16.AnchorPoint = Vector2.new(0.5, 0.5)
    v16.Size = UDim2.fromScale(1, 1)
    v16.Position = UDim2.fromScale(0.5, 0.5)
    v16.TextScaled = true
    v16.BackgroundTransparency = 1
    v16.TextColor3 = Color3.fromRGB(255, 255, 255)
    v16.TextStrokeTransparency = 0
    v16.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v14.CounterText = v15("TextLabel", v16, { u2.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 5)
        }) })
    v14.AvatarImage = u2.createElement("ImageLabel", {
        [u2.Ref] = p9.avatarRef,
        ["BackgroundTransparency"] = 0,
        ["BackgroundColor3"] = u6.Gray,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(1.125, 0.5),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
        ["Size"] = UDim2.fromScale(0.25, 0.25)
    }, { u2.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }), u2.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 30)
        }) })
    v11.BlockDestroyedCounter = v12("Frame", v13, v14)
    return v10(v11)
end
function v7.didMount(p18) --[[ Line: 77 ]]
    p18:setAvatar()
    p18:handleBlockUpdates()
end
function v7.setAvatar(p19) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v20 = p19.avatarRef:getValue()
    if not v20 then
        return nil
    end
    v20.Image = u3:GetUserThumbnailAsync(u3.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
end
function v7.handleBlockUpdates(u21) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local u22 = u21.counterRef:getValue()
    if not u22 then
        return nil
    end
    u5.Client:WaitFor("BlocksBrokenByExplosion"):expect():Connect(function(p23) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
        --]]
        local v24 = u21
        v24.blockCount = v24.blockCount + p23.amount
        local v25 = u22
        local v26 = u21.blockCount
        v25.Text = "X" .. tostring(v26) .. " DESTROYED"
    end)
end
return {
    ["TNTWarsBlockCounter"] = v7
}