local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "KingPenguinController"
    end,
    ["__index"] = u14
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p21)
    p21.Name = "KingPenguinController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u15
        [4] = u7
        [5] = u9
        [6] = u17
        [7] = u11
        [8] = u12
        [9] = u3
        [10] = u8
        [11] = u4
        [12] = u16
        [13] = u13
    --]]
    u14.KnitStart(p22)
    u5("Monster", function(u23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
            [3] = u9
            [4] = u17
            [5] = u11
            [6] = u12
            [7] = u3
            [8] = u8
            [9] = u4
            [10] = u16
            [11] = u13
        --]]
        if u23:GetAttribute("MonsterType") == u15.KING_PENGUIN and u23:IsA("Model") then
            local u24 = u7.new()
            local u25 = u9.mount(u9.createElement("BillboardGui", {
                ["ResetOnSpawn"] = false,
                ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 18, 0),
                ["MaxDistance"] = 200,
                ["Adornee"] = u23.PrimaryPart,
                ["Size"] = UDim2.new(0, 200, 0, 100)
            }, { u9.createElement(u17, {
                    ["health"] = 1000,
                    ["maxHealth"] = 1000
                }) }), u11.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
            u24:GiveTask(function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u25
                --]]
                return u9.unmount(u25)
            end)
            u24:GiveTask(u23:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u9
                    [3] = u25
                    [4] = u17
                --]]
                local v26 = u23:GetAttribute("Health")
                local v27 = u23:GetAttribute("MaxHealth")
                u9.update(u25, u9.createElement("BillboardGui", {
                    ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 18, 0),
                    ["MaxDistance"] = 200,
                    ["Adornee"] = u23.PrimaryPart,
                    ["Size"] = UDim2.new(0, 200, 0, 100)
                }, { u9.createElement(u17, {
                        ["health"] = v26,
                        ["maxHealth"] = v27
                    }) }))
            end))
            u24:GiveTask(u23:GetAttributeChangedSignal("IsSummoning"):Connect(function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u12
                    [3] = u3
                    [4] = u8
                    [5] = u4
                    [6] = u16
                --]]
                if u23:GetAttribute("IsSummoning") == true then
                    local v28 = u12.Assets.Effects.KingPenguinCharge:Clone()
                    v28.Anchored = false
                    v28.CanCollide = false
                    v28.CFrame = u23:GetPrimaryPartCFrame()
                    u3:setQueryIgnored(v28, true)
                    v28.Name = "EffectPart"
                    v28.Parent = u23
                    u8("WeldConstraint", {
                        ["Part0"] = v28,
                        ["Part1"] = u23.PrimaryPart,
                        ["Parent"] = v28
                    })
                else
                    local v29 = u23:FindFirstChild("EffectPart")
                    if v29 and v29:IsA("BasePart") then
                        v29:Destroy()
                        u4:playSound(u16.KING_PENGUIN_SUMMON, {
                            ["rollOffMaxDistance"] = 300,
                            ["position"] = u23:GetPrimaryPartCFrame().Position
                        })
                    end
                end
            end))
            u24:GiveTask(u23.AncestryChanged:Connect(function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u13
                    [3] = u24
                --]]
                if not u23:IsDescendantOf(u13) then
                    u24:DoCleaning()
                end
            end))
        end
    end)
end
v6.CreateController(u18.new())
return nil