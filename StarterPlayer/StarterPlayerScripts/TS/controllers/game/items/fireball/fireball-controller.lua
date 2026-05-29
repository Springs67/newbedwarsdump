local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Debris
local u10 = v8.TweenService
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "FireballController"
    end,
    ["__index"] = u12
})
u15.__index = u15
function u15.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18, ...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p18, ...)
    p18.Name = "FireballController"
end
function u15.KnitStart(_) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u4
        [4] = u14
        [5] = u7
        [6] = u11
        [7] = u3
        [8] = u9
        [9] = u10
    --]]
    u13.Client:WaitFor("FireballExplode"):andThen(function(p19) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u14
            [4] = u7
            [5] = u11
            [6] = u3
            [7] = u9
            [8] = u10
        --]]
        p19:Connect(function(p20) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u14
                [4] = u7
                [5] = u11
                [6] = u3
                [7] = u9
                [8] = u10
            --]]
            u5:playSound(u4.fromList(u14.TNT_EXPLODE_1, u14.FIREBALL_EXPLODE), {
                ["rollOffMaxDistance"] = 220,
                ["position"] = p20.position
            })
            local v21 = u7("Part", {
                ["Size"] = Vector3.new(1, 1, 1),
                ["Anchored"] = true,
                ["CanCollide"] = false,
                ["Transparency"] = 1,
                ["CFrame"] = CFrame.new(p20.position),
                ["Parent"] = u11:WaitForChild("Explosions")
            })
            u3:setQueryIgnored(v21, true)
            u9:AddItem(v21, 3)
            local v22 = false
            local v23 = 0
            local v24 = {
                "rbxassetid://6852338879",
                "rbxassetid://6852338938",
                "rbxassetid://6852338995",
                "rbxassetid://6852339059",
                "rbxassetid://6852339122",
                "rbxassetid://6852339192",
                "rbxassetid://6852339277"
            }
            while true do
                if v22 then
                    v23 = v23 + 1
                else
                    v22 = true
                end
                if v23 >= 20 then
                    return
                end
                local v25 = u7
                local v26 = {
                    ["AlwaysOnTop"] = true,
                    ["LightInfluence"] = 0,
                    ["Adornee"] = v21
                }
                local v27 = math.random(-7, 7)
                local v28 = math.random(-7, 7)
                local v29 = math.random
                v26.StudsOffsetWorldSpace = Vector3.new(v27, v28, v29(-7, 7))
                v26.Size = UDim2.fromScale(math.random(4, 8), math.random(4, 8))
                v26.Parent = v21
                v26.Children = { u7("ImageLabel", {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = u4.fromList(unpack(v24)),
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) }
                local v30 = v25("BillboardGui", v26)
                u10:Create(v30, TweenInfo.new(math.random(6, 10)), {
                    ["StudsOffset"] = v30.StudsOffsetWorldSpace + Vector3.new(0, 8, 0)
                }):Play()
                u9:AddItem(v30, math.random(3, 9) / 10)
            end
        end)
    end)
end
v6.CreateController(u15.new())
return nil