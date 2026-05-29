local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.RunService
local u7 = v5.StarterGui
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "ResetController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15, ...)
    p15.Name = "ResetController"
end
function u12.KnitStart(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u9
        [4] = u12
        [5] = u1
        [6] = u7
        [7] = u6
    --]]
    local u16
    if u11.isGameServer() then
        local v17, v18 = u4.Controllers.MatchController:getQueueTypeAsync():await()
        local v19 = v17
        if v19 then
            v19 = u9(v18)
            if v19 ~= nil then
                v19 = v19.disableCharacterReset
            end
        end
        if v19 then
            u16 = false
        else
            u16 = u12:createBindable()
        end
    else
        u16 = u12:createBindable()
    end
    local u20 = false
    while not u20 do
        u1.try(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
                [3] = u20
            --]]
            u7:SetCore("ResetButtonCallback", u16)
            u20 = true
        end, function(_) --[[ Line: 57 ]] end)
        u6.Stepped:Wait()
    end
end
function u12.createBindable(_) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v21 = Instance.new("BindableEvent")
    v21.Event:Connect(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10.Client:Get("ResetCharacter"):SendToServer()
    end)
    return v21
end
v3.CreateController(u12.new())
return nil