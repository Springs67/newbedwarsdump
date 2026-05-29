local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.ConstraintType
local u6 = v3.IndicatorUIType
local u7 = v3.WatchCharacter
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "IndicatorController"
    end,
    ["__index"] = u13
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p20)
    p20.Name = "IndicatorController"
end
function u17.KnitStart(u21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u16
        [4] = u7
        [5] = u11
    --]]
    u13.KnitStart(u21)
    local v22, v23 = u8.Controllers.MatchController:getCustomMatchConfigAsync():await()
    if not v22 or (v23 or not u16.isGameServer()) then
        return nil
    end
    u7(function(u24) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u21
        --]]
        if u24 ~= u11.LocalPlayer then
            return nil
        end
        u24:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u24
            --]]
            u21:createBaseIndicator(u24)
        end)
    end)
    u21:createBaseIndicator(u11.LocalPlayer)
end
function u17.createBaseIndicator(p25, p26) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u14
        [4] = u6
        [5] = u9
        [6] = u4
        [7] = u15
        [8] = u12
        [9] = u11
        [10] = u5
    --]]
    local v27 = u2.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
    local v28 = u8.Controllers.TeamController:getPlayerTeam(p26)
    if not v28 then
        return nil
    end
    local v29 = u8.Controllers.MapController:getCFrameWithoutYield(v28.id .. "_generator")
    if v29 ~= nil then
        local v30 = v29.Position
        local v31 = u14 * 3
        v29 = v30 + Vector3.new(0, v31, 0)
    end
    local v32 = not v29
    if v32 then
        v32 = p25.activeIndicatorId
    end
    if v32 ~= "" and v32 then
        v27:removeIndicator(p25.activeIndicatorId)
        return nil
    end
    if not v29 then
        return nil
    end
    local v33 = p25.activeIndicatorId
    if v33 ~= "" and v33 then
        v27:removeIndicator(p25.activeIndicatorId)
    end
    local v34 = {
        ["uiType"] = u6.Custom
    }
    local v35 = {
        ["distanceRelativeToPlayer"] = true,
        ["scaleWithAlpha"] = false,
        ["scaleOnFade"] = false,
        ["easeOutOnAppoach"] = false,
        ["color3"] = Color3.new(255, 255, 255)
    }
    local v36 = u9
    local v37 = {
        ["Name"] = "Container",
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["Children"] = { u9("ImageLabel", {
                ["Name"] = "BedIcon",
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.85),
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["ImageColor3"] = u4.brighten(v28.color, 0.1),
                ["Image"] = u15.HOME
            }) }
    }
    v35.template = v36("Frame", v37)
    function v35.transparency(p38, p39, _) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v40 = (p39 - u14 * 30) / (u14 * 5)
        local v41 = 1 - math.min(v40, 1)
        for v42, v43 in p38:GetDescendants() do
            local _ = v42 - 1
            if v43:IsA("TextLabel") then
                v43.TextTransparency = v41
            end
            if v43:IsA("ImageLabel") then
                v43.ImageTransparency = v41
            end
        end
        return v41
    end
    function v35.onEnterAnimation(p44) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local u45 = p44:FindFirstChild("PingIcon")
        if u45 ~= nil then
            u45 = u45:Clone()
        end
        if not u45 then
            return nil
        end
        u45.Parent = p44
        local u46 = u12:Create(u45, TweenInfo.new(0.15), {
            ["ImageTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1.5, 1.5)
        })
        u46:Play()
        u46.Completed:Connect(function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u45
            --]]
            u46:Destroy()
            u45:Destroy()
        end)
    end
    v34.uiConfig = v35
    v34.creator = u11.LocalPlayer
    v34.attachTo = v29
    v34.constraintType = u5.Hidden
    p25.activeIndicatorId = v27:addIndicator(v34):getId()
end
u8.CreateController(u17.new())
return nil