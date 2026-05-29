local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = {
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "RainbowBackpackController"
    end,
    ["__index"] = u12
})
u16.__index = u16
function u16.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p19)
    p19.Name = "RainbowBackpackController"
    p19.maidMap = {}
    p19.prismsMap = {}
end
function u16.KnitStart(u20) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u13
        [4] = u3
        [5] = u7
        [6] = u5
        [7] = u15
        [8] = u10
        [9] = u2
    --]]
    u12.KnitStart(u20)
    u14.Client:OnEvent("RainbowBackpackEquip", function(p21) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
        --]]
        if p21.item == u13.RAINBOW_BACKPACK then
            if not u20:hasPrisms(p21.player) then
                u20:summonPrisms(p21.player)
                return
            end
        else
            u20:removePrisms(p21.player)
        end
    end)
    u3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p22) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u7
        --]]
        local v23 = u20.prismsMap[u7.LocalPlayer]
        if v23 ~= nil then
            for v24, v25 in v23 do
                local _ = v24 - 1
                if p22 == 0 then
                    v25.Transparency = 1
                else
                    v25.Transparency = 0
                end
            end
        end
    end)
    u14.Client:OnEvent("RainbowBackpackPrismAttack", function(p26) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u5
            [3] = u15
            [4] = u10
            [5] = u2
        --]]
        local v27 = u20.prismsMap[p26.fromPlayer]
        if not v27 then
            return nil
        end
        local v28 = u20:getClosestPrism(v27, p26.targetEntity:GetPivot().Position)
        local v29 = p26.targetEntity.PrimaryPart
        if v29 ~= nil then
            v29 = v29:FindFirstChild("RainbowPrismAttachment")
        end
        if v29 == nil then
            v29 = u5("Attachment", {
                ["Name"] = "RainbowPrismAttachment",
                ["Parent"] = p26.targetEntity.PrimaryPart
            })
        end
        local v30 = v28:FindFirstChild("RainbowPrismAttachment") or u5("Attachment", {
            ["Name"] = "RainbowPrismAttachment",
            ["Parent"] = v28
        })
        if v30 and v29 then
            local u31 = u5("Beam", {
                ["Width0"] = 0.5,
                ["Width1"] = 0.5,
                ["FaceCamera"] = true,
                ["Attachment0"] = v30,
                ["Attachment1"] = v29,
                ["Color"] = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, u15[1]),
                    ColorSequenceKeypoint.new(0.2, u15[2]),
                    ColorSequenceKeypoint.new(0.3, u15[3]),
                    ColorSequenceKeypoint.new(0.5, u15[4]),
                    ColorSequenceKeypoint.new(0.6, u15[5]),
                    ColorSequenceKeypoint.new(0.8, u15[6]),
                    ColorSequenceKeypoint.new(1, u15[7])
                }),
                ["Parent"] = v30,
                ["Transparency"] = NumberSequence.new(0.1)
            })
            u10:Create(u31, TweenInfo.new(0.5), {
                ["Width0"] = 0,
                ["Width1"] = 0,
                ["CurveSize0"] = 1.5 * u2.fromList(-1, 1),
                ["CurveSize1"] = 1.5 * u2.fromList(-1, 1)
            }):Play()
            task.delay(0.5, function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31:Destroy()
            end)
        end
    end)
end
function u16.getClosestPrism(_, p32, u33) --[[ Line: 121 ]]
    table.sort(p32, function(p34, p35) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        return (p34.Position - u33).Magnitude < (p35.Position - u33).Magnitude
    end)
    return p32[1]
end
function u16.hasPrisms(p36, p37) --[[ Line: 134 ]]
    local v38 = p36.prismsMap[p37]
    return v38 and #v38 ~= 0 and true or false
end
function u16.summonPrisms(p39, u40) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u11
        [4] = u9
    --]]
    local v41 = u4.new()
    local u42 = 0
    local v43 = false
    local v44 = {}
    while true do
        if v43 then
            u42 = u42 + 1
        else
            v43 = true
        end
        if u42 >= 3 then
            p39.maidMap[u40] = v41
            p39.prismsMap[u40] = v44
            return
        end
        local u45 = u8.Assets.Misc.RainbowPrism:Clone()
        u45.Parent = u11
        u45.CanCollide = false
        local u46 = 0
        v41:GiveTask(u9.Heartbeat:Connect(function(p47) --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u46
                [3] = u42
                [4] = u45
            --]]
            local v48 = u40.Character
            if v48 ~= nil then
                v48 = v48:GetPivot().Position
            end
            if not v48 then
                return nil
            end
            u46 = u46 + p47 * 2
            local v49 = 2.0943951023931953 * u42
            local v50 = u46 + v49
            local v51 = math.sin(v50) * 3.5
            local v52 = u46 + v49
            local v53 = math.cos(v52) * 3.5
            u45.Position = v48 + Vector3.new(v51, 0, v53)
        end))
        table.insert(v44, u45)
        v41:GiveTask(u45)
    end
end
function u16.removePrisms(p54, p55) --[[ Line: 190 ]]
    local v56 = p54.prismsMap[p55]
    if v56 ~= nil then
        table.clear(v56)
    end
    local v57 = p54.maidMap[p55]
    if v57 ~= nil then
        v57:DoCleaning()
    end
end
u3.CreateController(u16.new())
return nil