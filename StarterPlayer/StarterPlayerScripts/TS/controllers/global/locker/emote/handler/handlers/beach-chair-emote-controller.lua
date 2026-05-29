local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u10 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BeachChairEmoteController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "BeachChairEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u3
        [4] = u8
        [5] = u10
        [6] = u5
        [7] = u2
        [8] = u9
    --]]
    u7.KnitStart(p15)
    for v16, v17 in u6:GetChildren() do
        local _ = v16 - 1
        if v17.Name == "BlueBeachChair" and v17:IsA("Model") then
            local v18 = v17.PrimaryPart
            if v18 ~= nil then
                local _ = v18.CFrame * CFrame.Angles(0, 3.141592653589793, 0)
            end
        end
    end
    local v19 = u3.Controllers.EmoteHandlerController
    local v20 = u8.BEACH_VACATION
    local u21 = u10
    local u22 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 53 ]]
            return "Anonymous"
        end,
        ["__index"] = u21
    })
    u22.__index = u22
    function u22.new(...) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v23 = u22
        local v24 = setmetatable({}, v23)
        return v24:constructor(...) or v24
    end
    function u22.constructor(p25, ...) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.constructor(p25, ...)
    end
    function u22.onEnable(_, _, p26, _, p27) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u2
            [4] = u9
        --]]
        u5.Assets.Misc.BlueBeachChair:Clone()
        local u28 = u5.Assets.Misc.BlueBeachChair:Clone()
        local u29 = u5.Assets.Misc.CoconutDrink:Clone()
        u28.Parent = u6
        local v30 = p26.LowerTorso.CFrame
        local v31 = CFrame.Angles(0, 3.141592653589793, 0)
        u28:PivotTo((v30 + Vector3.new(0, 1.3, 0)) * v31)
        for v32, v33 in u28:GetDescendants() do
            local _ = v32 - 1
            if v33:IsA("BasePart") then
                u2:setQueryIgnored(v33, true)
                v33.CanCollide = false
                v33.Anchored = true
            end
        end
        u29.Parent = p26
        u9:weldCharacterAccessories(p26)
        p27:GiveTask(function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
            --]]
            u28:Destroy()
            u29:Destroy()
        end)
    end
    function u22.onDisable(_, _, _, _) --[[ Line: 94 ]] end
    v19:registerHandler(v20, u22)
end
u3.CreateController(u11.new())
return nil