local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lightning-beams", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u10 = {
    ["default"] = Color3.fromRGB(62, 214, 255)
}
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LightningController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, ...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14, ...)
    p14.Name = "LightningController"
    p14.random = Random.new()
end
function u11.updateColor(_, p15, p16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v17 = u10[p16]
    if v17 then
        for _, v18 in p15:GetDescendants() do
            local v19 = v18:IsA("ParticleEmitter")
            if v19 then
                v19 = v18:GetAttribute("ColorType")
            end
            if v19 ~= 0 and (v19 == v19 and (v19 ~= "" and v19)) then
                v18.Color = ColorSequence.new(v17)
            end
        end
    end
end
function u11.playDefaultExplosion(p20, p21) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u8
        [4] = u9
        [5] = u3
    --]]
    local v22 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value
    local v23 = p21.colorType
    local v24 = p21.position
    local v25 = p21.sparkCount
    local u26 = u5.Assets.Effects.DefaultLightningImpact:Clone()
    if v23 ~= "" and v23 then
        p20:updateColor(u26, v23)
    end
    local v27 = u26:FindFirstChild("Attachment")
    u26.Position = v24
    u26.Parent = u6
    u8:playEffects({ u26 }, nil)
    if v27 ~= nil and (v27:IsA("Attachment") and (Enum.SavedQualitySetting.QualityLevel2.Value <= v22 and (v25 == 0 or (v25 ~= v25 or (not v25 or v25 > 0))))) then
        if v25 == 0 or (v25 ~= v25 or not v25) then
            v25 = p20.random:NextNumber(5, 7)
        end
        local v28 = false
        local v29 = 0
        while true do
            if true then
                if v28 then
                    v29 = v29 + 1
                else
                    v28 = true
                end
            end
            if v29 >= v25 then
                break
            end
            local v30 = v27.WorldPosition + u9.randomUnitVector(Vector3.new(0, 1, 0), 1.5707963267948966) * 20
            local v31 = u3.new(v27, {
                ["WorldPosition"] = v30,
                ["WorldAxis"] = (v27.WorldPosition - v30).Unit
            }, 7)
            v31.Thickness = 1
            v31.MinThicknessMultiplier = 1
            v31.MaxThicknessMultiplier = 1
            v31.AnimationSpeed = 1
            v31.FadeLength = 0.1
            v31.PulseSpeed = p20.random:NextNumber(6, 9)
            v31.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255))
            v31.PulseLength = 0.6
        end
    end
    task.delay(3, function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:Destroy()
    end)
end
function u11.playSpearExplosion(p32, p33) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u8
        [4] = u9
        [5] = u3
    --]]
    local v34 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value
    local v35 = p33.colorType
    local v36 = p33.position
    local v37 = p33.sparkCount
    local u38 = u5.Assets.Effects.SpearLightningImpact:Clone()
    if v35 ~= "" and v35 then
        p32:updateColor(u38, v35)
    end
    local v39 = u38:FindFirstChild("Attachment")
    u38.Position = v36
    u38.Parent = u6
    u8:playEffects({ u38 }, nil)
    if v39 ~= nil and (v39:IsA("Attachment") and (Enum.SavedQualitySetting.QualityLevel2.Value <= v34 and (v37 == 0 or (v37 ~= v37 or (not v37 or v37 > 0))))) then
        if v37 == 0 or (v37 ~= v37 or not v37) then
            v37 = p32.random:NextNumber(5, 7)
        end
        local v40 = false
        local v41 = 0
        while true do
            if true then
                if v40 then
                    v41 = v41 + 1
                else
                    v40 = true
                end
            end
            if v41 >= v37 then
                break
            end
            local v42 = v39.WorldPosition + u9.randomUnitVector(Vector3.new(0, 1, 0), 2.0943951023931953) * p32.random:NextNumber(3, 7)
            local v43 = u3.new(v39, {
                ["WorldPosition"] = v42,
                ["WorldAxis"] = (v39.WorldPosition - v42).Unit
            }, 7)
            v43.Thickness = 0.25
            v43.MinThicknessMultiplier = 1
            v43.MaxThicknessMultiplier = 1
            v43.AnimationSpeed = 3
            v43.FadeLength = 0.1
            v43.PulseSpeed = p32.random:NextNumber(5, 7)
            v43.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255))
            v43.PulseLength = 0.45
        end
    end
    task.delay(3, function() --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:Destroy()
    end)
end
function u11.KnitStart(p44) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p44)
end
function u11.createLightningStike(p45, p46) --[[ Line: 155 ]]
    p45:createExplosion(p46.explosionData)
end
function u11.createExplosion(p47, p48) --[[ Line: 159 ]]
    if p48.explosionType == "spearExplosion" then
        p47:playSpearExplosion(p48)
    else
        p47:playDefaultExplosion(p48)
    end
end
v2.CreateController(u11.new())
return nil