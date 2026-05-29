local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.RunService
local u6 = v4.TweenService
local v7 = {}
local u8 = {
    Color3.fromRGB(255, 89, 89),
    Color3.fromRGB(218, 133, 65),
    Color3.fromRGB(91, 154, 76),
    Color3.fromRGB(82, 124, 174),
    Color3.fromRGB(180, 128, 255)
}
function v7.applyRGB(u9, p10, p11) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u2
        [4] = u6
    --]]
    local u12 = u3.new()
    local u13 = p10 or u8
    if p11 ~= nil then
        p11 = p11.randomizeOrder
    end
    if p11 then
        u13 = u2.shuffleArray(u13)
    end
    task.spawn(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
            [3] = u9
            [4] = u6
        --]]
        local v14 = Instance.new("Color3Value")
        v14.Value = u13[1]
        u12:GiveTask(v14.Changed:Connect(function(u15) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
            --]]
            local v16 = u9
            local function v18(p17) --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u15
                --]]
                if p17 == nil then
                    u12:DoCleaning()
                end
                if p17:IsA("ParticleEmitter") then
                    p17.Color = ColorSequence.new(u15)
                    return
                elseif p17:IsA("BasePart") then
                    p17.Color = u15
                elseif p17:IsA("ImageLabel") then
                    p17.ImageColor3 = u15
                end
            end
            for v19, v20 in v16 do
                v18(v20, v19 - 1, v16)
            end
        end))
        for v21, u22 in u9 do
            local _ = v21 - 1
            if u22:IsA("MeshPart") then
                local u23 = u22.TextureID
                local u24 = u22.Material
                u12:GiveTask(function() --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u23
                        [3] = u24
                    --]]
                    u22.TextureID = u23
                    u22.Material = u24
                end)
                u22.TextureID = ""
                u22.Material = Enum.Material.Neon
            end
        end
        local u25 = true
        u12:GiveTask(function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25 = false
            return u25
        end)
        local v26 = 1
        while u25 do
            local v27 = u6:Create(v14, TweenInfo.new(1), {
                ["Value"] = u13[v26 + 1]
            })
            v27:Play()
            v27.Completed:Wait()
            local v28 = v26 + 1
            v26 = #u13 <= v28 and 0 or v28
        end
        u12:DoCleaning()
    end)
    return u12
end
function v7.applyMotionEffects(u29, u30) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local u31 = 0
    local u41 = u5.Heartbeat:Connect(function(p32) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u30
            [3] = u29
        --]]
        u31 = u31 + p32
        local v33 = u30
        if v33 ~= nil then
            v33 = v33.bob
        end
        local v34
        if v33 then
            local v35 = (os.clock() - 0) / 0.5
            v34 = math.sin(v35) * 0.005 + 0
        else
            v34 = 0
        end
        local v36 = u30
        if v36 ~= nil then
            v36 = v36.rotate
        end
        local v37 = not v36 and 0 or 6.283185307179586 * u31 * 0.1
        local v38 = CFrame.new(u29.Position)
        local v39 = Vector3.new(0, v34, 0)
        local v40 = CFrame.Angles(0, v37, 0)
        u29:PivotTo((v38 + v39) * v40)
    end)
    return {
        ["Destroy"] = function() --[[ Name: Destroy, Line 118 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41:Disconnect()
        end
    }
end
return {
    ["PartEffectUtil"] = v7
}