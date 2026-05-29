local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "MagmaBlockComponent"
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
function u6.constructor(_, p9) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u2
        [4] = u4
    --]]
    p9.Touched:Connect(function(p10) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
            [4] = u4
        --]]
        if not p10.Parent then
            return nil
        end
        local v11 = u5:getEntity(p10.Parent)
        local v12
        if v11 == nil then
            v12 = v11
        else
            v12 = v11:getInstance()
        end
        if v12 == u3.LocalPlayer.Character then
            if v11 ~= nil then
                v11 = v11:isAlive()
            end
            if v11 then
                u2.Controllers.DamageController:requestSelfDeath(u4.MAGMA_BLOCK)
            end
        end
    end)
end
function u6.Destroy(_) --[[ Line: 40 ]] end
u6.Tag = "MagmaBlock"
return u6