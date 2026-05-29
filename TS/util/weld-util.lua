local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "WeldUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 20 ]] end
function u6.rigidWeldAttachments(_, p9, p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4("RigidConstraint", {
        ["Name"] = "AccessoryRigidConstraint",
        ["Attachment0"] = p9,
        ["Attachment1"] = p10,
        ["Parent"] = p9.Parent
    })
end
function u6.weldAttachments(_, p11, p12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4("Weld", {
        ["Name"] = "AccessoryAttachment",
        ["Part0"] = p11.Parent,
        ["Part1"] = p12.Parent,
        ["C0"] = p11.CFrame,
        ["C1"] = p12.CFrame,
        ["Parent"] = p11.Parent
    })
end
function u6.weldParts(_, p13, p14) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4("WeldConstraint", {
        ["Name"] = p14.Name,
        ["Part0"] = p13,
        ["Part1"] = p14,
        ["Parent"] = p13
    })
end
function u6.weldPartsWithJoint(_, p15, p16, p17) --[[ Line: 48 ]]
    local v18 = Instance.new(p17)
    v18.Name = "WELD_" .. tostring(p15) .. "_" .. tostring(p16)
    v18.Part0 = p15
    v18.Part1 = p16
    v18.C0 = CFrame.new()
    v18.C1 = p16.CFrame:ToObjectSpace(p15.CFrame)
    v18.Parent = p15
    return v18
end
function u6.findFirstMatchAttachment(p19, p20, u21) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u3
    --]]
    local v22 = p19.firstMatchAttachment[p20]
    local v23 = v22 and v22[u21]
    if v23 then
        return v23
    end
    local v24 = nil
    for _, v25 in p20:GetChildren() do
        if (v25:IsA("Bone") or v25:IsA("Attachment")) and v25.Name == u21 then
            local v26 = u5.endsWith(v25.Name, "KneeRigAttachment")
            if v26 then
                local v27 = u5
                local v28 = v25.Parent
                if v28 ~= nil then
                    v28 = v28.Name
                end
                local v29 = v28 == nil and "" or v28
                v26 = v27.includes(v29, "Upper")
            end
            if not v26 then
                v24 = v25
                break
            end
        elseif not (v25:IsA("Accoutrement") or v25:IsA("Tool")) then
            local v30 = p19:findFirstMatchAttachment(v25, u21)
            if v30 then
                v24 = v30
                break
            end
        end
    end
    if v24 then
        local u31 = u2.getOrCreate(p19.firstMatchAttachment, p20, {})
        u31[u21] = v24
        local u32 = u3.new()
        u32:GiveTask(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u31
            --]]
            u31[u21] = nil
        end)
        u32:GiveTask(v24:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32:DoCleaning()
        end))
        u32:GiveTask(v24.AncestryChanged:Connect(function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32:DoCleaning()
        end))
    end
    return v24
end
function u6.weldCharacterAccessories(p33, p34, p35) --[[ Line: 121 ]]
    for _, v36 in (p35 or p34):GetChildren() do
        if v36:IsA("Accessory") then
            p33:weldAccessory(p34, v36)
        end
    end
end
function u6.weldAccessory(u37, p38, u39) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if u39.Parent ~= p38 then
        u39.Parent = p38
    end
    local v40 = u37.characterAccessoryWelds[u39]
    if v40 and v40.weld.Parent ~= nil then
        if v40.memoizedAttachment.attachment.Position == v40.memoizedAttachment.currentPosition then
            if v40.weld:IsA("Weld") and (v40.weld.Part0 and v40.weld.Part1) then
                return nil
            end
            if v40.weld:IsA("RigidConstraint") and (v40.weld.Attachment0 and v40.weld.Attachment1) then
                return nil
            end
        end
        if v40 ~= nil then
            v40.weld:Destroy()
        end
    end
    local v41 = u39:FindFirstChild("Handle")
    if v41 then
        for _, v42 in v41:GetChildren() do
            if v42:IsA("Attachment") then
                local v43 = u37:findFirstMatchAttachment(p38, v42.Name)
                if v43 then
                    local u44
                    if v43:IsA("Bone") then
                        u44 = u37:rigidWeldAttachments(v42, v43)
                    else
                        u44 = u37:weldAttachments(v43, v42)
                    end
                    u37.characterAccessoryWelds[u39] = {
                        ["weld"] = u44,
                        ["memoizedAttachment"] = {
                            ["attachment"] = v43,
                            ["currentPosition"] = v43.Position
                        }
                    }
                    local u45 = u3.new()
                    u45:GiveTask(function() --[[ Line: 174 ]]
                        --[[
                        Upvalues:
                            [1] = u37
                            [2] = u39
                        --]]
                        u37.characterAccessoryWelds[u39] = nil
                    end)
                    u45:GiveTask(function() --[[ Line: 179 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        u44:Destroy()
                    end)
                    u45:GiveTask(v42.AncestryChanged:Connect(function(_, p46) --[[ Line: 182 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                        --]]
                        if p46 == nil then
                            u45:DoCleaning()
                        end
                    end))
                    break
                end
            end
        end
    end
    for _, v47 in u39:GetDescendants() do
        if v47:IsA("BasePart") then
            v47.CanCollide = false
        end
    end
end
function u6.weldModel(_, p48) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v49 = p48.PrimaryPart
    if not v49 then
        return nil
    end
    for v50, v51 in v49:GetDescendants() do
        local _ = v50 - 1
        if v51:IsA("BasePart") then
            u4("WeldConstraint", {
                ["Name"] = "WeldUtil_WeldModel",
                ["Part0"] = v51,
                ["Part1"] = v49,
                ["Parent"] = v51
            })
        end
    end
end
function u6.wellDescendentsToPart(_, u52) --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v53 = u52:GetDescendants()
    local function v56(p54) --[[ Line: 221 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u52
        --]]
        if p54:IsA("BasePart") then
            local v55 = p54:FindFirstChildWhichIsA("WeldConstraint")
            if v55 then
                v55:Destroy()
            end
            u4("WeldConstraint", {
                ["Name"] = "WeldUtil_WeldModel",
                ["Part0"] = p54,
                ["Part1"] = u52,
                ["Parent"] = p54
            })
        end
    end
    for v57, v58 in v53 do
        v56(v58, v57 - 1, v53)
    end
end
u6.characterAccessoryWelds = {}
u6.firstMatchAttachment = {}
return {
    ["WeldUtil"] = u6
}