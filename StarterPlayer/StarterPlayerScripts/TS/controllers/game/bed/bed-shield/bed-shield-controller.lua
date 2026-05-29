local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InQuint
local u8 = v6.OutExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.ReplicatedStorage
local u14 = v12.RunService
local u15 = v12.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "BedShieldController"
    end,
    ["__index"] = u17
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p22)
    p22.Name = "BedShieldController"
end
function u19.KnitStart(u23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u4
        [3] = u15
    --]]
    u17.KnitStart(u23)
    u4("bed", function(u24) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u23
        --]]
        local v25 = u24:GetAttribute("BedShieldEndTime")
        if v25 ~= nil and u15:GetServerTimeNow() < v25 then
            u23:hookBedShield(u24)
        end
        u24:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u15
                [3] = u23
            --]]
            local v26 = u24:GetAttribute("BedShieldEndTime")
            if v26 ~= nil and u15:GetServerTimeNow() < v26 then
                u23:hookBedShield(u24)
            end
        end)
    end)
end
function u19.hookBedShield(_, u27) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u11
        [4] = u15
        [5] = u16
        [6] = u8
        [7] = u18
        [8] = u3
        [9] = u14
        [10] = u9
        [11] = u7
    --]]
    local u28 = u10.new()
    u27:GetAttribute("BedShieldEndTime")
    u27:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u28
        --]]
        if u27:GetAttribute("BedShieldEndTime") == nil then
            u28:DoCleaning()
        end
    end)
    u27.Destroying:Connect(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:DoCleaning()
    end)
    local u29 = u27.CFrame + Vector3.new(0, 1, 1.5)
    local u30 = u13.Assets.Effects.BedShield:Clone()
    u30:PivotTo(u29)
    u11(u30, 0.1)
    u30.Parent = u15
    u16(1.1, u8, function(p31) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.Shields.Transparency = p31
    end, 1, 0)
    u18.tweenModelSize(u30, 1.1, u8, 10)
    for _, v32 in u30:GetChildren() do
        if v32:IsA("BasePart") then
            u3:setQueryIgnored(v32, true)
        end
    end
    local u33 = 0
    u28:GiveTask(u14.Heartbeat:Connect(function(p34) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u30
            [3] = u9
            [4] = u29
        --]]
        u33 = u33 + p34
        if u30.PrimaryPart == nil then
            u9.Error("Shield effect has no primary part")
            return nil
        end
        local v35 = CFrame.Angles(0, u33 * 0.8, 0)
        u30.Shields.CFrame = u29 * v35
    end))
    u28:GiveTask(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u30
            [3] = u7
        --]]
        u18.tweenModelSize(u30, 0.75, u7, 0):andThen(function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:Destroy()
        end)
    end)
end
v5.CreateController(u19.new())
return nil