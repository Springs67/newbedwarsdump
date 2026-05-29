local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent, "interaction", "interaction-registry-controller").InteractionCategory
local v9 = {}
local v10 = setmetatable({}, {
    ["__index"] = v9
})
v10.Ability = 1
v9[1] = "Ability"
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "MobileInteractController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "MobileInteractController"
end
function u11.KnitStart(p15) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p15)
end
function u11.abilityInteract(_) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u8
        [4] = u6
    --]]
    local u16 = nil
    local u17 = 100
    local v18 = u4.Controllers.InteractionRegistryController:getProximityPrompts()
    local v19 = u5.entries(v18)
    local function v32(p20) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u6
            [4] = u17
            [5] = u16
        --]]
        local v21 = p20[1]
        local v22 = p20[2]
        local v23 = u4.Controllers.InteractionRegistryController:getInteractionDefinition(v21)
        if v23 ~= nil then
            v23 = v23.category
        end
        if v23 ~= u8.ABILITY then
            return nil
        end
        local function v29(p24) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u17
                [3] = u16
            --]]
            local v25 = u6.LocalPlayer.Character
            if v25 ~= nil then
                v25 = v25:GetPivot().Position
            end
            local v26 = p24.Parent
            if not v26 then
                return nil
            end
            local v27 = nil
            if v26:IsA("BasePart") then
                v27 = v26.Position
            elseif v26:IsA("Model") then
                v27 = v26.PrimaryPart
                if v27 ~= nil then
                    v27 = v27.Position
                end
            end
            if not (v25 and v27) then
                return nil
            end
            local v28 = (v25 - v27).Magnitude
            if p24.MaxActivationDistance < v28 then
                return nil
            end
            if v28 < u17 then
                u17 = v28
                u16 = p24
            end
        end
        for v30, v31 in v22 do
            v29(v31, v30 - 1, v22)
        end
    end
    local v33 = u16
    for v34, v35 in v19 do
        v32(v35, v34 - 1, v19)
    end
    if v33 ~= nil then
        v33:InputHoldBegin()
    end
end
v3.CreateController(u11.new())
return {
    ["PromptPriorioty"] = v10
}