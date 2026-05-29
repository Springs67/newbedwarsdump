local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "AccessoryUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.addAccessory(p9, p10, p11) --[[ Line: 21 ]]
    local v12 = p10:FindFirstChild("Humanoid")
    if not v12 then
        return nil
    end
    local v13 = v12:FindFirstChild("BodyDepthScale")
    local v14
    if v13 == nil then
        v14 = v13
    else
        v14 = v13:IsA("NumberValue")
    end
    local v15 = not v14 and 1 or v13.Value
    v12:AddAccessory(p11)
    p9:scaleAccessory(p11, v15)
end
function u6.updateAccessoryScale(p16, p17, p18, p19) --[[ Line: 35 ]]
    local v20 = p17:FindFirstChild("Humanoid")
    if not v20 then
        return nil
    end
    local v21 = false
    local v22 = p17:FindFirstChild("Head")
    if v22 then
        for _, v23 in p18:GetDescendants() do
            if v21 then
                break
            end
            if v23:IsA("Weld") or v23:IsA("WeldConstraint") then
                for _, v24 in { v23.Part0, v23.Part1 } do
                    if v24 == v22 then
                        v21 = true
                        break
                    end
                end
            end
        end
    end
    if p19 == nil then
        local v25 = v20:FindFirstChild("BodyDepthScale")
        local v26
        if v25 == nil then
            v26 = v25
        else
            v26 = v25:IsA("NumberValue")
        end
        p19 = not v26 and 1 or v25.Value
    end
    p16:scaleAccessory(p18, p19)
end
function u6.scaleAccessory(_, p27, p28) --[[ Line: 67 ]]
    local v29 = p27:GetAttribute("SizeScale")
    local v30 = v29 == nil and 1 or v29
    if p28 == v30 then
        return nil
    end
    p27:SetAttribute("SizeScale", p28)
    local v31 = p28 / v30
    local v32 = p27:FindFirstChild("Handle")
    local v33
    if v32 == nil then
        v33 = v32
    else
        v33 = v32:IsA("BasePart")
    end
    if not v33 then
        return nil
    end
    for _, v34 in p27:GetDescendants() do
        if v34:IsA("BasePart") then
            v34.Position = v32.Position:Lerp(v34.Position, v31)
        end
    end
    for _, v35 in p27:GetDescendants() do
        if v35:IsA("Attachment") then
            v35.Position = v35.Position * v31
        end
        if v35:IsA("BasePart") then
            v35.Size = v35.Size * v31
        end
    end
end
function u6.setAccessoryTransparency(_, p36, u37) --[[ Line: 100 ]]
    local v38 = p36:GetDescendants()
    local function v40(p39) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        if p39:IsA("BasePart") or (p39:IsA("MeshPart") or (p39:IsA("Decal") or (p39:IsA("Texture") or p39:IsA("GuiObject")))) then
            p39.Transparency = u37
        end
        if p39:IsA("ParticleEmitter") then
            p39.Transparency = NumberSequence.new(u37)
        end
    end
    for v41, v42 in v38 do
        v40(v42, v41 - 1, v38)
    end
end
function u6.tweenAccessoryTransparency(_, p43, u44, p45, p46) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
        [4] = u5
    --]]
    if p46 == nil then
        p46 = u2
    end
    local v47 = u3.new()
    for _, u48 in p43:GetDescendants() do
        if u48:IsA("BasePart") or (u48:IsA("MeshPart") or (u48:IsA("Decal") or (u48:IsA("Texture") or u48:IsA("GuiObject")))) then
            local u49 = u48.Transparency
            if u49 ~= u44 then
                local u53 = u4(p45, p46, function(p50) --[[ Line: 125 ]]
                    --[[
                    Upvalues:
                        [1] = u48
                        [2] = u49
                        [3] = u44
                    --]]
                    local v51 = u49
                    local v52 = u44
                    u48.Transparency = math.lerp(v51, v52, p50)
                end, 0, 1)
                u53:Play()
                v47:GiveTask(function() --[[ Line: 129 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    if u53.Running then
                        u53:Cancel()
                    end
                end)
            end
        elseif u48:IsA("ParticleEmitter") then
            u5:tweenEffectTransparency({ u48 }, u44, p45, p46)
        end
    end
    return v47
end
return {
    ["AccessoryUtil"] = u6
}