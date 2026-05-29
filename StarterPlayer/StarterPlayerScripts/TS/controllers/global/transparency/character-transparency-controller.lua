local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StatusModifier
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "CharacterTransparencyController"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p12)
    p12.Name = "CharacterTransparencyController"
    p12.transparencyModifiers = {}
    p12.overrideModifiers = {}
    p12.modifierSetByUpdate = {}
end
function u9.KnitStart(u13) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u6
    --]]
    u4("entity", function(u14) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u13
        --]]
        local u15 = u8:getEntity(u14)
        if u15 ~= nil then
            u15 = u15:getInstance()
        end
        if not u15 then
            return nil
        end
        local u16 = u6.new()
        u16:GiveTask(u15.AncestryChanged:Connect(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u16
            --]]
            if not u14.Parent then
                u16:DoCleaning()
            end
        end))
        local u17 = u13:getTransparencyModifier(u15)
        u16:GiveTask(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u15
            --]]
            u13.transparencyModifiers[u15] = nil
            u13.overrideModifiers[u15] = nil
            u13.modifierSetByUpdate[u15] = nil
        end)
        u16:GiveTask(u15:GetAttributeChangedSignal("Transparency"):Connect(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u13
                [3] = u17
            --]]
            local v18 = u15:GetAttribute("Transparency")
            if v18 == u13.modifierSetByUpdate[u15] then
                return nil
            end
            local v19 = {}
            local v20 = #v19
            for v21 in u17:getModifiers() do
                v20 = v20 + 1
                v19[v20] = v21
            end
            local v22 = nil
            for v23, v24 in v19 do
                local _ = v23 - 1
                if v24.transparency == (v18 == nil and 0 or v18) == true then
                    v22 = v24
                    break
                end
            end
            if not v22 then
                if u13.overrideModifiers[u15] ~= nil then
                    u17:removeModifier(u13.overrideModifiers[u15])
                end
                local v25 = {
                    ["transparency"] = v18 == nil and 0 or v18
                }
                u17:addModifier(v25)
                u13.overrideModifiers[u15] = v25
            end
            u17:updateModifiers()
        end))
    end)
end
function u9.getTransparencyModifier(u26, u27) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v28 = u26.transparencyModifiers[u27]
    if v28 then
        return v28
    end
    local v34 = u3.new(function(p29) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
        --]]
        local v30 = 0
        if #p29 == 1 then
            v30 = p29[1].transparency
        elseif #p29 > 1 then
            v30 = 0
            for v31 = 1, #p29 do
                local v32 = p29[v31]
                local _ = v31 - 1
                local v33 = v32.transparency
                v30 = math.max(v30, v33)
            end
        end
        u26.modifierSetByUpdate[u27] = v30
        u27:SetAttribute("Transparency", v30)
    end)
    u26.transparencyModifiers[u27] = v34
    v34:updateModifiers()
    return v34
end
function u9.getCharacterWithoutModifiers(p35, p36) --[[ Line: 148 ]]
    local v37 = p35:getTransparencyModifier(p36):getModifiers()
    p35:getTransparencyModifier(p36):clear()
    local v38 = p36:Clone()
    for v39 in v37 do
        p35:getTransparencyModifier(p36):addModifier(v39)
    end
    return v38
end
v5.CreateController(u9.new())
return nil