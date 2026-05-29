local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "BeamController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "BeamController"
end
u7.createBeam = v1.async(function(_, p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v12 = u3("Attachment", {
        ["Parent"] = p11.source
    })
    local v13 = u3("Attachment", {
        ["Parent"] = p11.target
    })
    if v12 and v13 then
        local u14 = u3("Beam", {
            ["Width0"] = 0,
            ["Width1"] = 0,
            ["CurveSize0"] = 0,
            ["CurveSize1"] = 0,
            ["FaceCamera"] = true,
            ["Attachment0"] = v12,
            ["Attachment1"] = v13,
            ["Color"] = ColorSequence.new(p11.color),
            ["Parent"] = v12
        })
        local v15 = u4
        local v16 = TweenInfo.new(p11.duration)
        local v17 = {}
        local v18 = p11.width0
        v17.Width0 = v18 == nil and 1 or v18
        local v19 = p11.width1
        v17.Width1 = v19 == nil and 1 or v19
        local v20 = p11.curveSize0
        v17.CurveSize0 = v20 == nil and 1 or v20
        local v21 = p11.curveSize1
        v17.CurveSize1 = v21 == nil and 1 or v21
        v15:Create(u14, v16, v17):Play()
        task.delay(p11.duration, function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14:Destroy()
        end)
    end
end)
function u7.KnitStart(u22) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.KnitStart(u22)
    u6.Client:Get("BeamEffect"):Connect(function(p23) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:createBeam({
            ["source"] = p23.source,
            ["target"] = p23.target,
            ["width0"] = p23.width0,
            ["width1"] = p23.width1,
            ["curveSize0"] = p23.curveSize0,
            ["curveSize1"] = p23.curveSize1,
            ["color"] = p23.color,
            ["duration"] = p23.duration
        })
    end)
end
v2.CreateController(u7.new())
return nil