local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").PrismaticMarinaColors
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "MarinaLobbyDisplayController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "MarinaLobbyDisplayController"
end
function u12.KnitStart(u16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
    --]]
    u8.KnitStart(u16)
    for v17, v18 in u6:GetTagged("PrismaticMarinaModel") do
        local _ = v17 - 1
        if v18:IsA("Model") then
            u16:applyRGBEffect(v18)
        end
    end
    u6:GetInstanceAddedSignal("PrismaticMarinaModel"):Connect(function(p19) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p19:IsA("Model") then
            u16:applyRGBEffect(p19)
        end
    end)
    for v20, v21 in u6:GetTagged("JellyfishLobbyDisplay") do
        local _ = v20 - 1
        if v21:IsA("Model") then
            u16:setUpAnimations(v21)
        end
    end
    u6:GetInstanceAddedSignal("JellyfishLobbyDisplay"):Connect(function(p22) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p22:IsA("Model") then
            u16:setUpAnimations(p22)
        end
    end)
    for v23, v24 in u6:GetTagged("PrismaticBanner") do
        local _ = v23 - 1
        if v24:IsA("MeshPart") then
            u16:setUpRGBBanner(v24)
        end
    end
    u6:GetInstanceAddedSignal("PrismaticBanner"):Connect(function(p25) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p25:IsA("MeshPart") then
            u16:setUpRGBBanner(p25)
        end
    end)
end
function u12.setUpRGBBanner(_, u26) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    local u27 = {
        Color3.fromRGB(206, 15, 0),
        Color3.fromRGB(206, 79, 0),
        Color3.fromRGB(48, 160, 0),
        Color3.fromRGB(0, 142, 169),
        Color3.fromRGB(0, 16, 242),
        Color3.fromRGB(181, 37, 112)
    }
    task.spawn(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u27
            [3] = u26
            [4] = u7
        --]]
        local v28 = u4.new()
        local v29 = Instance.new("Color3Value")
        v29.Value = u27[1]
        v28:GiveTask(v29.Changed:Connect(function(p30) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26.Color = p30
        end))
        local v31 = 1
        while u26.Parent ~= nil do
            local v32 = u7:Create(v29, TweenInfo.new(3), {
                ["Value"] = u27[v31 + 1]
            })
            v32:Play()
            v32.Completed:Wait()
            local v33 = v31 + 1
            v31 = #u27 <= v33 and 0 or v33
        end
        v28:DoCleaning()
    end)
end
function u12.setUpAnimations(_, p34) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    local v35 = Instance.new("AnimationController")
    v35.Parent = p34
    local v36 = Instance.new("Animator")
    v36.Parent = v35
    local u37 = v36:LoadAnimation(u10:getAnimation(u9.JELLYFISH_IDLE))
    task.delay(math.random() * 2, function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:Play(nil, nil, 1 - math.random() * 0.5)
    end)
end
function u12.applyRGBEffect(_, u38) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u2
        [4] = u7
    --]]
    local v39 = u38:WaitForChild("3DClothing")
    local u40 = { v39:WaitForChild("Head"):WaitForChild("Prismatic_InnerHat"), v39:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"), v39:WaitForChild("LowerTorso"):WaitForChild("Prismatic_Skirt") }
    local v41 = 0
    local u42 = {}
    for v43, v44 in v39:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"):GetChildren() do
        local _ = v43 - 1
        if v44:IsA("Decal") == true then
            v41 = v41 + 1
            u42[v41] = v44
        end
    end
    task.spawn(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
            [3] = u40
            [4] = u2
            [5] = u42
            [6] = u38
            [7] = u7
        --]]
        local v45 = u4.new()
        local v46 = Instance.new("Color3Value")
        v46.Value = u11[1]
        v45:GiveTask(v46.Changed:Connect(function(p47) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u2
                [3] = u42
            --]]
            for v48, v49 in u40 do
                local _ = v48 - 1
                v49.Color = p47
            end
            for v50, v51 in u42 do
                local _ = v50 - 1
                v51.Color3 = u2.darken(p47, 0.3)
            end
        end))
        local v52 = 1
        while u38.Parent ~= nil do
            local v53 = u7:Create(v46, TweenInfo.new(2), {
                ["Value"] = u11[v52 + 1]
            })
            v53:Play()
            v53.Completed:Wait()
            local v54 = v52 + 1
            v52 = #u11 <= v54 and 0 or v54
        end
        v45:DoCleaning()
    end)
end
v3.CreateController(u12.new())
return nil