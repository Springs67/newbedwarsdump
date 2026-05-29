local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = u1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "BalloonsBedBreakEffect"
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
        [2] = u14
    --]]
    u17.constructor(p21, u14.BALLOONS)
    p21.Name = "BalloonsBedBreakEffect"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p22)
end
function u18.onBedBreak(u23, _, p24, p25, _) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u7
        [4] = u11
        [5] = u4
        [6] = u15
        [7] = u1
    --]]
    local u26 = u6.new()
    u23.maid:GiveTask(u26)
    local u27 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p25)
    u26:GiveTask(u27)
    u27:PivotTo(p24)
    for v28, v29 in u27:GetDescendants() do
        local _ = v28 - 1
        if v29:IsA("BasePart") then
            v29.Anchored = false
            v29.CanCollide = false
            u7("WeldConstraint", {
                ["Part0"] = v29,
                ["Part1"] = u27.PrimaryPart,
                ["Parent"] = v29
            })
        end
    end
    u27.Parent = u11
    local v30
    if u27 == nil then
        v30 = u27
    else
        v30 = u27:WaitForChild("Root", 1)
    end
    local u31 = u7("Attachment", {
        ["Parent"] = v30
    })
    local v32 = false
    local v33 = 0
    local u34 = {}
    while true do
        if v32 then
            v33 = v33 + 1
        else
            v32 = true
        end
        if v33 >= 3 then
            local v35 = #u34 / 2 + 7
            for v36, u37 in u34 do
                local v38 = v36 - 1
                u1.Promise.delay(7 + v38 / 2):andThen(function() --[[ Line: 107 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u23
                    --]]
                    if u37.Parent then
                        u23:popBalloon(u37)
                    end
                end)
            end
            task.delay(v35, function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:DoCleaning()
            end)
            return
        end
        task.delay(v33 * 0.25, function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
                [3] = u34
                [4] = u31
                [5] = u26
                [6] = u4
                [7] = u15
            --]]
            local v39 = u23:inflateBalloon(u27)
            if v39 then
                local v40 = u34
                table.insert(v40, v39)
                u23:hookBalloon(u31, v39)
                u26:GiveTask(v39)
                u4:playSound(u15.BALLOON_INFLATE, {
                    ["position"] = v39.Balloon.Position
                })
            end
        end)
    end
end
function u18.hookBalloon(_, p41, p42) --[[ Line: 121 ]]
    local v43 = p42:WaitForChild("RopeConstraint")
    v43.Attachment0 = p41
    v43.Attachment1 = p42.Balloon.Attachment
end
function u18.inflateBalloon(_, p44) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u13
        [3] = u3
        [4] = u10
        [5] = u7
        [6] = u11
        [7] = u9
        [8] = u12
    --]]
    if not (p44 and p44.PrimaryPart) then
        return nil
    end
    local v45 = "InflatedBalloon"
    local v46
    if u16.isLobbyServer() then
        v46 = u13.BALLOON_SKIN_MODELS_LOBBY
    else
        v46 = u13.BALLOON_SKIN_MODELS
    end
    if v46 and #v46 > 0 then
        v45 = u3.fromList(unpack(v46))
    end
    local v47 = u10:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v45):Clone()
    v47.Balloon:SetAttribute("IgnoreProjectileCollision", true)
    v47.Balloon.CFrame = p44:GetPrimaryPartCFrame()
    local v48 = u7
    local v49 = {
        ["Name"] = "BodyForce"
    }
    local v50 = u11.Gravity * v47.Balloon.Mass * 7
    v49.Force = Vector3.new(0, v50, 0)
    v49.Parent = v47.Balloon
    v48("BodyForce", v49)
    if v45 == "InflatedBalloon" then
        u7("BodyGyro", {
            ["D"] = 0,
            ["CFrame"] = v47.Balloon.CFrame,
            ["Parent"] = v47.Balloon
        })
    else
        u7("BodyGyro", {
            ["D"] = 1000,
            ["P"] = 10,
            ["CFrame"] = v47.Balloon.CFrame,
            ["Parent"] = v47.Balloon
        })
    end
    v47.Parent = p44
    u9:AddTag(v47, "InflatedBalloon:" .. p44.Name)
    local v51 = Color3.fromRGB(216, 50, 53)
    local v52 = u12:getState().Game.myTeam
    if v52 then
        if v52 ~= nil then
            v52 = v52.color
        end
    else
        v52 = v51
    end
    v47.Balloon.Color = v52
    v47.Balloon.PopEffect.Color = ColorSequence.new(v52)
    return v47
end
function u18.popBalloon(_, u53) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
        [3] = u15
    --]]
    u53.Balloon.BodyForce.Force = Vector3.new(0, 0, 0)
    u53:SetAttribute("DeflatedBalloon", true)
    u1.Promise.delay(2):andThen(function() --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u4
            [3] = u15
        --]]
        u53:Destroy()
        u4:playSound(u15.BALLOON_POP, {
            ["position"] = u53.Balloon.Position
        })
    end)
end
u5.CreateController(u18.new())
return nil