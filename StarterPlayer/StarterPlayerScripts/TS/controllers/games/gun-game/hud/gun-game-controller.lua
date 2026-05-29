local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, script.Parent, "ui", "hud-progress").HudProgressWrapper
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "GunGameController"
    end,
    ["__index"] = u11
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p20)
    p20.Name = "GunGameController"
    p20.rayMap = {}
end
function u17.KnitStart(u21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u15
        [4] = u12
        [5] = u14
        [6] = u13
        [7] = u6
        [8] = u16
        [9] = u8
        [10] = u9
    --]]
    u11.KnitStart(u21)
    local u22 = u4.new()
    u15.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p23, _, _) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u14
            [3] = u13
            [4] = u6
            [5] = u16
            [6] = u8
            [7] = u22
        --]]
        local v24 = u12:getState().Game.queueType
        if p23 == u14.RUNNING and v24 == u13.GUN_GAME then
            local u25 = u6.mount(u16(), u8.LocalPlayer:WaitForChild("PlayerGui"))
            u22:GiveTask(function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u25
                --]]
                u6.unmount(u25)
            end)
        end
        if p23 == u14.POST then
            u22:DoCleaning()
        end
    end)
    u15.Client:WaitFor("GunGameLastWeaponUpdate"):expect():Connect(function(p26) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        if p26.onLastWeapon then
            u21:createRay(p26.player)
        else
            local v27 = u21.rayMap[p26.player]
            if v27 then
                v27:Destroy()
            end
        end
    end)
    u9.Heartbeat:Connect(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        for v28, v29 in u21.rayMap do
            local v30
            if v29 then
                if v28 == nil then
                    v30 = v28
                else
                    v30 = v28.Character
                end
            else
                v30 = v29
            end
            if v30 then
                v29.Position = v28.Character:GetPrimaryPartCFrame().Position
            end
        end
    end)
end
function u17.createRay(p31, p32) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u2
    --]]
    local v33 = {
        ["Parent"] = u10
    }
    local v34 = p32.Character
    if v34 ~= nil then
        v34 = v34:GetPrimaryPartCFrame()
    end
    v33.CFrame = v34
    v33.Shape = Enum.PartType.Cylinder
    v33.Color = Color3.fromRGB(230, 255, 0)
    v33.Material = Enum.Material.ForceField
    v33.CastShadow = false
    v33.Size = Vector3.new(1200, 6, 6)
    v33.Orientation = Vector3.new(0, 0, 90)
    v33.Transparency = 0.25
    v33.Anchored = true
    v33.CanCollide = false
    v33.CanQuery = false
    v33.CanTouch = false
    local v35 = u5("Part", v33)
    u2:setQueryIgnored(v35, true)
    p31.rayMap[p32] = v35
end
v3.CreateController(u17.new())
return nil