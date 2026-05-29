local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.Component
local v4 = v2.KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u6 = u1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ComponentController"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10, ...)
    p10.Name = "ComponentController"
end
function u7.KnitStart(_) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u5
    --]]
    local v11 = os.clock()
    local v12 = script.Parent
    if v12 ~= nil then
        v12 = v12.Parent
        if v12 ~= nil then
            v12 = v12.Parent
            if v12 ~= nil then
                v12 = v12:WaitForChild("components")
            end
        end
    end
    if not v12 then
        error("No components folder")
    end
    local u13 = 0
    for _, u14 in v12:GetDescendants() do
        local _, _ = u1.try(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u1
                [3] = u3
                [4] = u13
            --]]
            if not u14:IsA("ModuleScript") then
                return u1.TRY_CONTINUE
            end
            local v15 = string.find(u14.Name, "-component")
            if v15 == 0 or (v15 ~= v15 or not v15) then
                return u1.TRY_CONTINUE
            end
            local v16 = require(u14)
            local v17 = v16.Tag
            if v17 == "" or not v17 then
                v17 = u14.Name
            end
            u3.new(v17, v16)
            u13 = u13 + 1
        end, function(p18) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            print("[Knit Client]: Error registering component:", u5(p18))
        end)
    end
    local v19 = os.clock() - v11
    local v20 = math.floor(v19)
    print("[Knit Client]: Registered " .. tostring(u13) .. " components in " .. tostring(v20) .. "ms")
end
return {
    ["ComponentController"] = v4.CreateController(u7.new())
}