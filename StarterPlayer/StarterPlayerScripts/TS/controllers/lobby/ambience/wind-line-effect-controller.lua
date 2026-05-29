local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.TweenService
local v7 = v4.Workspace
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u11 = u1.import(script, script.Parent, "ambience-settings").WIND_DIRECTION
local u12 = u1.import(script, script.Parent, "number-sequence-builder").NumberSequenceBuilder
local u13 = Instance.new("Folder")
u13.Name = "WindTrailAmbientEffects"
u13.Parent = v7
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "WindLineEffectController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17)
    p17.Name = "WindLineEffectController"
end
function u14.KnitStart(_) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    if not u10(u9.ForceLobbyServer) then
        return nil
    end
end
function u14.followPath(_, p18, p19) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v20 = false
    local v21 = 0
    while true do
        if v20 then
            v21 = v21 + 1
        else
            v20 = true
        end
        if v21 >= #p19 then
            return
        end
        local v22 = (v21 / #p19 - 0.5) * 4
        local v23 = math.pow(v22, 2) * 0.05 + 0.05
        local v24 = {
            ["Position"] = p19[v21 + 1]
        }
        local v25 = u6:Create(p18, TweenInfo.new(v23, Enum.EasingStyle.Linear), v24)
        v25:Play()
        v25.Completed:Wait()
    end
end
function u14.spawnWindParticle(u26) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u11
        [4] = u3
        [5] = u13
        [6] = u12
    --]]
    u1.Promise.defer(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u3
            [4] = u13
            [5] = u12
            [6] = u1
            [7] = u26
        --]]
        local v27 = u5.LocalPlayer
        if v27 ~= nil then
            v27 = v27.Character
            if v27 ~= nil then
                v27 = v27.PrimaryPart
                if v27 ~= nil then
                    v27 = v27.Position
                end
            end
        end
        if not v27 then
            return nil
        end
        local v28 = math.random() * 2 * 3.141592653589793
        local v29 = math.random() * 15 + 30
        local v30 = (15 + math.random() * 30) * math.cos(v28)
        local v31 = (15 + math.random() * 30) * math.sin(v28)
        local v32 = Vector3.new(v30, v29, v31)
        local v33 = (u11 + Vector3.new(0.1, 0.1, 0.075) * (math.random() * 2 - 1)).Unit
        local v34 = v32 + v27 + v33 * 52.5
        local v35 = v34 + v33 * 105
        local v36 = false
        local v37 = 0
        local u38 = {}
        while true do
            if v36 then
                v37 = v37 + 0.05
            else
                v36 = true
            end
            if v37 >= 1 then
                local u39 = u3("Part", {
                    ["Name"] = "Wind",
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["Transparency"] = 1,
                    ["Position"] = v34,
                    ["Parent"] = u13
                })
                local v40 = Instance.new("Attachment", u39)
                local v41 = Instance.new("Attachment", u39)
                v41.CFrame = v41.CFrame + Vector3.new(0, 0.5, 0)
                u3("Trail", {
                    ["FaceCamera"] = true,
                    ["LightInfluence"] = 0.3,
                    ["Lifetime"] = 0.65,
                    ["Transparency"] = u12.new():addKeypoint(0, 0.85):build(),
                    ["WidthScale"] = u12.new():addKeypoint(0, 0.2):addKeypoint(0.5, 1):addKeypoint(1, 0.2):build(),
                    ["Attachment0"] = v40,
                    ["Attachment1"] = v41,
                    ["Parent"] = u39
                })
                u1.Promise.defer(function() --[[ Line: 157 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u39
                        [3] = u38
                    --]]
                    u26:followPath(u39, u38)
                    task.wait(0.65)
                    u39:Destroy()
                end)
                return
            end
            local v42 = CFrame.new(v34, v35)
            local v43 = v37 * 3.141592653589793 * 2
            local v44 = math.sin(v43)
            local v45 = (v42 * CFrame.new(0, v44 * 2, v37 * (v34 - v35).Magnitude)).Position
            table.insert(u38, v45)
        end
    end)
end
return {
    ["WindLineEffectController"] = v2.CreateController(u14.new())
}