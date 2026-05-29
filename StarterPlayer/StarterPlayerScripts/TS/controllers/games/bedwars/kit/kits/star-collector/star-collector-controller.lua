local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local v9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u10 = v9.InteractionCategory
local u11 = v9.InteractionPriority
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "StarCollectorController"
    end,
    ["__index"] = u17
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
        [1] = u17
    --]]
    u17.constructor(p21)
    p21.Name = "StarCollectorController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p22)
end
function u18.validCollectableEntityTypes(_) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return { u14.STARS }
end
function u18.pickDisplayModel(p23, p24, _) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u11
    --]]
    local v25 = p23:getRandomStar()
    local v27 = {
        ["repStorageModel"] = u8:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v25),
        ["collectionTag"] = p24,
        ["proximityPrompt"] = {
            ["interactionLabel"] = "Collect",
            ["interactionObjectText"] = function(p26) --[[ Name: interactionObjectText, Line 50 ]]
                return string.gsub(p26.Name, "Star", "") .. " Star"
            end,
            ["category"] = u10.ABILITY,
            ["priority"] = u11.ABILITY
        }
    }
    return v27
end
function u18.onWillRemoveEntity(_, _, _, _, _) --[[ Line: 60 ]] end
function u18.onCreatedEntity(_, _, _, u28) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u13
        [4] = u12
        [5] = u1
    --]]
    u28:PivotTo(CFrame.new(u28:GetPrimaryPartCFrame().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0))
    u4:playSound(u16.STAR_IDLE, {
        ["looped"] = true,
        ["parent"] = u28.PrimaryPart,
        ["position"] = u28.PrimaryPart.Position
    })
    local u29 = u28:FindFirstChildWhichIsA("AnimationController")
    if u29 ~= nil then
        u29 = u29:WaitForChild("Animator")
    end
    if u29 then
        u13:playAnimation(u29, u12.STAR_IDLE)
        task.spawn(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u28
                [3] = u13
                [4] = u29
                [5] = u12
            --]]
            while u1.Promise.delay(math.random(15, 25)):await() and u28.Parent do
                u13:playAnimation(u29, u12.STAR_RANDOM_SPIN)
            end
        end)
    end
end
function u18.collectEntity(_, p30, p31, p32) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u16
        [4] = u15
    --]]
    if p30 == u7.LocalPlayer then
        u4:playSound(u16.STAR_PICKUP)
        u15.Client:Get("CollectCollectableEntity"):SendToServer({
            ["id"] = p31:GetAttribute("Id"),
            ["collectableName"] = p32
        })
    end
end
function u18.getRandomStar(_) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.fromList(unpack({ "VitalityStar", "CritStar" }))
end
v5.CreateController(u18.new())
return nil