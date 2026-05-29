local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MazeEnemyController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15)
    p15.Name = "MazeEnemyController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u8
        [4] = u3
        [5] = u11
        [6] = u4
        [7] = u7
    --]]
    u9.KnitStart(p16)
    u10.Client:WaitFor("EntityDeathEvent"):andThen(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u11
        --]]
        p17:Connect(function(p18) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u3
                [3] = u11
            --]]
            if not u8:HasTag(p18.entityInstance, "MazeEnemy") then
                return nil
            end
            u3:playSound(u11.SKELETON_DEATH, {
                ["position"] = p18.cframe.Position
            })
            for v19, v20 in p18.entityInstance:GetDescendants() do
                local _ = v19 - 1
                if v20:IsA("ParticleEmitter") then
                    v20.Enabled = false
                end
            end
        end)
    end)
    u4("MazeEnemy", function(p21) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
        --]]
        if not p21:IsA("Model") then
            return nil
        end
        u7.Controllers.FootstepsController:hookCharacter(nil, p21, {
            ["walk"] = {
                u11.SKELETON_FOOTSTEP_1,
                u11.SKELETON_FOOTSTEP_2,
                u11.SKELETON_FOOTSTEP_3,
                u11.SKELETON_FOOTSTEP_4
            },
            ["run"] = {
                u11.SKELETON_FOOTSTEP_1,
                u11.SKELETON_FOOTSTEP_2,
                u11.SKELETON_FOOTSTEP_3,
                u11.SKELETON_FOOTSTEP_4
            }
        })
    end)
end
v6.CreateController(u12.new())
return nil