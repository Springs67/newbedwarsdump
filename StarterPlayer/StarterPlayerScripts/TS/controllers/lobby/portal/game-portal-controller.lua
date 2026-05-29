local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "GamePortalController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "GamePortalController"
    p11.teleportTime = 0
end
function u8.KnitStart(u12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    task.spawn(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
        --]]
        local v13 = u5:WaitForChild("Lobby"):FindFirstChild("GamePortals")
        if v13 ~= nil then
            v13 = v13:FindFirstChild("Islands")
        end
        if v13 then
            u12:hookPortal(v13)
        end
    end)
end
function u8.hookPortal(u14, p15) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u7
    --]]
    local v16 = p15:FindFirstChild("Portal")
    if v16 then
        v16.Touched:Connect(function(p17) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u14
                [3] = u8
                [4] = u7
            --]]
            if u4.LocalPlayer.Character and (p17.Parent == u4.LocalPlayer.Character and tick() - u14.teleportTime >= u8.TELEPORT_COOLDOWN) then
                u14.teleportTime = tick()
                u7.Client:Get("TeleportToGame"):SendToServer({
                    ["game"] = "islands"
                })
            end
        end)
    end
end
u8.TELEPORT_COOLDOWN = 5
return {
    ["GamePortalController"] = v2.CreateController(u8.new())
}