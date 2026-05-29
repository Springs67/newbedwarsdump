local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.WatchCharacter
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.HttpService
local u10 = v7.Players
local u11 = v7.Workspace
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("EffectTransparencyFP", v12.optional(v12.NumberSequence))
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "FirstPersonVisibilityController"
    end,
    ["__index"] = u13
})
u16.__index = u16
function u16.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p19)
    p19.Name = "FirstPersonVisibilityController"
    p19.instanceMap = {}
    p19.thirdPersonDataSave = {}
end
function u16.KnitStart(u20) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u5
        [4] = u4
    --]]
    u3(function(p21, p22) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
        --]]
        if p21 == u10.LocalPlayer then
            u20:updateAll(p22)
            p22.DescendantAdded:Connect(function(p23) --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:update(p23)
            end)
        end
    end)
    u5.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u10
        --]]
        u20:updateAll(u10.LocalPlayer.Character)
    end)
    u4("FirstPersonHidden", function(p24) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:update(p24)
    end)
end
function u16.updateAll(p25, p26) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p26 then
        for _, v27 in p26:GetDescendants() do
            p25:update(v27)
        end
    end
    for _, v28 in u8:GetTagged("FirstPersonHidden") do
        local v29 = {}
        local v30 = #v29
        local v31 = v28:GetDescendants()
        local v32 = #v31
        table.move(v31, 1, v32, v30 + 1, v29)
        v29[v30 + v32 + 1] = v28
        for _, v33 in v29 do
            p25:update(v33)
        end
    end
end
function u16.update(p34, p35) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u8
        [4] = u6
    --]]
    if not p35:IsDescendantOf(u11) then
        return nil
    end
    if p35:GetAttribute("FirstPersonVisible_UpdateDisabled") == true then
        return nil
    end
    local v36 = u5.Controllers.CameraPerspectiveController:getCameraPerspective()
    if p35:IsA("BasePart") and p35:GetAttribute("LocalTransparency") ~= nil then
        p35.LocalTransparencyModifier = p35:GetAttribute("LocalTransparency")
    end
    local v37 = p35:GetAttribute("FirstPersonVisible")
    local v38 = u8:HasTag(p35, "FirstPersonHidden")
    if v37 == nil and not v38 then
        return nil
    end
    local v39 = p34:createVisiblityAttributesConfig(p35)
    local v40 = false
    for v41, v42 in u6.values(v39.Values) do
        local _ = v41 - 1
        if v42 ~= nil then
            v40 = true
            break
        end
    end
    if v40 then
        if v36 == 0 then
            p34:setFirstPersonAttributes(p35)
        else
            p34:applyThirdPersonSave(p35)
        end
    else
        local v43 = v37 == false and true or v38
        if p35:IsA("Beam") or (p35:IsA("ParticleEmitter") or (p35:IsA("Trail") or p35:IsA("BillboardGui"))) then
            if v36 == 0 and v43 then
                if p35:IsA("ParticleEmitter") then
                    p35:Clear()
                end
                p35.Enabled = false
            else
                p35.Enabled = true
            end
        end
        if p35:IsA("BasePart") or p35:IsA("MeshPart") then
            if v36 == 0 and v43 then
                p35.Transparency = 1
                return
            end
            local v44 = p35:GetAttribute("InitialTransparency")
            if v44 ~= 0 and (v44 == v44 and (v44 ~= "" and v44)) then
                p35.Transparency = p35:GetAttribute("InitialTransparency")
                return
            end
            p35.Transparency = 0
        end
        return
    end
end
function u16.setFirstPersonAttributes(p45, p46) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v47 = p45:createVisiblityAttributesConfig(p46)
    local v48 = {}
    local v49 = false
    for v50, v51 in u6.values(v47.Values) do
        local _ = v50 - 1
        if v51 ~= nil then
            v49 = true
            break
        end
    end
    if not v49 then
        return nil
    end
    local v52 = (p46:IsA("Beam") or (p46:IsA("ParticleEmitter") or p46:IsA("Trail"))) and v47.Values.EffectTransparencyFP
    if v52 then
        v48.EffectTransparencyFP = p46.Transparency
        p46.Transparency = v52
    end
    local v53 = p45:getOrCreateInstanceId(p46)
    p45.thirdPersonDataSave[v53] = v48
end
function u16.applyThirdPersonSave(p54, p55) --[[ Line: 178 ]]
    local v56 = p54:getOrCreateInstanceId(p55)
    local v57 = p54.thirdPersonDataSave[v56]
    if p55:IsA("Beam") or (p55:IsA("ParticleEmitter") or p55:IsA("Trail")) then
        local v58
        if v57 == nil then
            v58 = v57
        else
            v58 = v57.EffectTransparencyFP
        end
        if v58 then
            if v57 ~= nil then
                v57 = v57.EffectTransparencyFP
            end
            p55.Transparency = v57
        end
    end
    p54.thirdPersonDataSave[v56] = nil
end
function u16.getOrCreateInstanceId(u59, p60) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v61 = p60:GetAttribute("FirstPersonVisibleId")
    if v61 ~= nil then
        return v61
    end
    local u62 = u9:GenerateGUID(false)
    p60:SetAttribute("FirstPersonVisibleId", u62)
    u59.instanceMap[u62] = p60
    p60.Destroying:Once(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u62
        --]]
        u59.instanceMap[u62] = nil
        u59.thirdPersonDataSave[u62] = nil
    end)
    return u62
end
function u16.createVisiblityAttributesConfig(_, p63) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
    --]]
    local v64 = { u15 }
    return u14.new(p63, v64)
end
return {
    ["FirstPersonVisibilityController"] = u5.CreateController(u16.new())
}