local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u8 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "CrabDanceEmoteController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p12)
    p12.Name = "CrabDanceEmoteController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u6
        [4] = u8
        [5] = u4
        [6] = u2
        [7] = u7
    --]]
    u5.KnitStart(p13)
    local v14 = u3.Controllers.EmoteHandlerController
    local v15 = u6.CRAB_DANCE
    local u16 = u8
    local u17 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
            return "Anonymous"
        end,
        ["__index"] = u16
    })
    u17.__index = u17
    function u17.new(...) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v18 = u17
        local v19 = setmetatable({}, v18)
        return v19:constructor(...) or v19
    end
    function u17.constructor(p20, ...) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.constructor(p20, ...)
    end
    function u17.onEnable(_, _, p21, _, p22) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u7
        --]]
        local u23 = {}
        local v24 = p21:FindFirstChild("LeftHand")
        local v25 = p21:FindFirstChild("RightHand")
        table.insert(u23, v24)
        table.insert(u23, v25)
        for v26, v27 in u23 do
            local _ = v26 - 1
            if v27:IsA("MeshPart") then
                v27.Transparency = 1
            end
        end
        p22:GiveTask(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            for v28, v29 in u23 do
                local _ = v28 - 1
                if v29:IsA("MeshPart") then
                    v29.Transparency = 0
                end
            end
        end)
        local u30 = u4.Assets.Misc.Summer2024.CrabClawLeft:Clone()
        local u31 = u4.Assets.Misc.Summer2024.CrabClawRight:Clone()
        u30.Parent = p21
        u31.Parent = p21
        for v32, v33 in u30:GetDescendants() do
            local _ = v32 - 1
            if v33:IsA("BasePart") then
                u2:setQueryIgnored(v33, true)
            end
        end
        for v34, v35 in u31:GetDescendants() do
            local _ = v34 - 1
            if v35:IsA("BasePart") then
                u2:setQueryIgnored(v35, true)
            end
        end
        u7:weldCharacterAccessories(p21)
        p22:GiveTask(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            u30:Destroy()
            u31:Destroy()
        end)
    end
    function u17.onDisable(_, _, _, _) --[[ Line: 107 ]] end
    v14:registerHandler(v15, u17)
end
u3.CreateController(u9.new())
return nil