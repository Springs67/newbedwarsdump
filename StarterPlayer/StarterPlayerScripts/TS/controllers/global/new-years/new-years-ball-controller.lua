local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Lighting
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "new-years-ball", "new-years-ball-pattern-meta")
local u20 = v19.NEW_YEARS_BALL_COLOR_SET
local u21 = v19.newYearsPatternMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "NewYearsBallController"
    end,
    ["__index"] = u16
})
u25.__index = u25
function u25.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p28)
    p28.Name = "NewYearsBallController"
    p28.active = false
end
function u25.KnitStart(u29) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u22
        [3] = u5
        [4] = u23
        [5] = u8
        [6] = u24
        [7] = u10
        [8] = u12
        [9] = u14
        [10] = u4
        [11] = u17
        [12] = u18
        [13] = u13
    --]]
    u16.KnitStart(u29)
    u22.Client:OnEvent("DropNewYearsBall", function(u30) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u23
            [3] = u8
            [4] = u29
            [5] = u24
            [6] = u10
            [7] = u12
            [8] = u14
            [9] = u4
            [10] = u17
            [11] = u18
            [12] = u13
        --]]
        u5.Controllers.PreloadController:runPreload({
            ["sounds"] = { u23.BALL_DROP_COMPLETE }
        })
        local u31 = u8.new()
        if u29.active then
            return nil
        end
        u29.active = true
        u31:GiveTask(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29.active = false
        end)
        if u24.isLobbyServer() then
            local function u54(u32) --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                local v33 = u10:GetTagged("LobbyBoard")
                local function v37(p34) --[[ Line: 68 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    for v35, v36 in p34:GetDescendants() do
                        local _ = v35 - 1
                        if v36:IsA("SurfaceGui") then
                            v36.Enabled = u32
                        end
                    end
                end
                for v38, v39 in v33 do
                    v37(v39, v38 - 1, v33)
                end
                local v40 = u10:GetTagged("NewYearCountdownBoard")
                local function v44(p41) --[[ Line: 83 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    for v42, v43 in p41:GetDescendants() do
                        local _ = v42 - 1
                        if v43:IsA("SurfaceGui") then
                            v43.Enabled = u32
                        end
                    end
                end
                for v45, v46 in v40 do
                    v44(v46, v45 - 1, v40)
                end
                local v47 = u10:GetTagged("VIPRankPurchase")
                local function v51(p48) --[[ Line: 98 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    for v49, v50 in p48:GetDescendants() do
                        local _ = v49 - 1
                        if v50:IsA("SurfaceGui") then
                            v50.Enabled = u32
                        end
                    end
                end
                for v52, v53 in v47 do
                    v51(v53, v52 - 1, v47)
                end
            end
            u54(false)
            u31:GiveTask(function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                u54(true)
            end)
        end
        local u55 = u10:GetTagged("NewYearsBall")[1] or u12.Assets.Effects.NewYearsBall:Clone()
        u55.Parent = u14
        for v56, v57 in u55.Lights:GetChildren() do
            local _ = v56 - 1
            v57.Brightness = 3
        end
        u31:GiveTask(u55)
        local u58 = CFrame.new(u30.startPosition)
        local u59 = CFrame.new(u30.finalPosition)
        u55:PivotTo(u58)
        local u60 = u4:playSound(u23.NYE_COUNTDOWN)
        task.delay(u17.NEW_YEARS_BALL_DROP_TIME, function() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u23
                [3] = u60
                [4] = u5
                [5] = u30
                [6] = u18
            --]]
            u4:playSound(u23.BALL_DROP_COMPLETE, {
                ["fadeInTime"] = 1,
                ["volumeMultiplier"] = 0.45
            })
            local v61 = u60
            if v61 ~= nil then
                v61:Destroy()
            end
            u5.Controllers.FireworkController:playFireworkEffect(u30.finalPosition, u18.NEW_YEARS, {
                ["sizeMultiplier"] = 3,
                ["volumeMultiplier"] = 1.25
            })
            local u62 = 0
            task.spawn(function() --[[ Line: 148 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u30
                    [3] = u5
                    [4] = u18
                --]]
                while u62 < 90.9090909090909 do
                    task.wait(0.22)
                    local v63 = u30.finalPosition
                    local v64 = math.random(-400, 400)
                    local v65 = math.random(100, 200)
                    local v66 = math.random
                    local v67 = v63 + Vector3.new(v64, v65, v66(-400, 400))
                    local v68 = math.random(2, 12)
                    local v69 = {
                        ["volumeMultiplier"] = 3,
                        ["sizeMultiplier"] = v68
                    }
                    u5.Controllers.FireworkController:playFireworkEffect(v67, u18.NEW_YEARS, v69)
                    u62 = u62 + 1
                end
            end)
        end)
        u29:changeLighting(u31)
        local v70 = 0
        local u71 = {}
        for v72, v73 in u55.Lights:GetChildren() do
            local _ = v72 - 1
            if v73:IsA("SurfaceLight") == true then
                v70 = v70 + 1
                u71[v70] = v73
            end
        end
        local v74 = 0
        local u75 = {}
        for v76, v77 in u55.Triangles:GetChildren() do
            local _ = v76 - 1
            if v77:IsA("BasePart") == true then
                v74 = v74 + 1
                u75[v74] = v77
            end
        end
        u29:createPanelPatternGroups(u75, u31)
        local u78 = 0
        local u79 = 0
        u31:GiveTask(u13.Heartbeat:Connect(function(p80) --[[ Line: 199 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u31
                [3] = u78
                [4] = u17
                [5] = u79
                [6] = u29
                [7] = u71
                [8] = u75
                [9] = u58
                [10] = u59
            --]]
            if u55.Parent == nil then
                u31:DoCleaning()
                return nil
            end
            u78 = u78 + p80
            local v81 = u78 / u17.NEW_YEARS_BALL_DROP_TIME
            if v81 >= 1 then
                u31:DoCleaning()
                return nil
            end
            u79 = u79 + p80
            if u79 > 0.5 then
                u79 = 0
                u29:changeBallPattern(u71, u75)
            end
            local v82 = u58:Lerp(u59, v81)
            local v83 = CFrame.Angles
            local v84 = 6.283185307179586 * u78 * 4
            local _ = v82 * v83(0, math.rad(v84), 0)
            u55:PivotTo(v82)
        end))
    end)
end
function u25.createPanelPatternGroups(_, p85, p86) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    for _, u87 in u21 do
        local v88 = 1
        local v89 = false
        local v90 = {}
        while true do
            if true then
                if v89 then
                    v88 = v88 + 1
                else
                    v89 = true
                end
            end
            if v88 >= u87.colors + 1 then
                break
            end
            local v91 = 0
            local v92 = {}
            for v93, v94 in p85 do
                local _ = v93 - 1
                local v95 = u87.symbol .. tostring(v88)
                if string.match(v94.Name, v95) == v95 == true then
                    v91 = v91 + 1
                    v92[v91] = v94
                end
            end
            table.insert(v90, v92)
        end
        u87.groups = v90
        p86:GiveTask(function() --[[ Line: 260 ]]
            --[[
            Upvalues:
                [1] = u87
            --]]
            u87.groups = nil
        end)
    end
end
function u25.changeBallPattern(_, _, _) --[[ Line: 265 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u21
        [3] = u20
    --]]
    local v96 = u21
    local v97 = u3.fromList(unpack(v96))
    local v98 = v97.colors
    if v97.groups == nil then
        return nil
    end
    local v99 = u3.randomArraySelectN(u20, v98)
    local v100 = 0
    for _, v101 in v97.groups do
        for _, v102 in v101 do
            v102.Color = v99[v100 + 1]
        end
        v100 = v100 + 1
        if v100 == v98 then
            break
        end
    end
end
function u25.randomizeLightColors(_, p103, p104) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for _, v105 in p103 do
        v105.Color = u3.fromList(unpack(p104))
    end
end
function u25.changeLighting(_, p106) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u15
        [4] = u7
        [5] = u6
    --]]
    local u107 = u5.Controllers.LightingController.atmosphereModifier
    if u107 ~= nil then
        u107 = u107:addModifier(20, {
            ["Density"] = 0.3,
            ["Offset"] = 0.3,
            ["Glare"] = 1,
            ["Haze"] = 0.75,
            ["Color"] = Color3.fromRGB(141, 141, 199),
            ["Decay"] = Color3.fromRGB(76, 82, 136)
        })
    end
    if u107 then
        p106:GiveTask(function() --[[ Line: 303 ]]
            --[[
            Upvalues:
                [1] = u107
            --]]
            task.delay(20, function() --[[ Line: 304 ]]
                --[[
                Upvalues:
                    [1] = u107
                --]]
                u107:Destroy()
            end)
        end)
    end
    local u108 = {
        ["Ambient"] = u11.Ambient,
        ["Brightness"] = u11.Brightness,
        ["ColorShift_Bottom"] = u11.ColorShift_Bottom,
        ["ColorShift_Top"] = u11.ColorShift_Top,
        ["EnvironmentDiffuseScale"] = u11.EnvironmentDiffuseScale,
        ["EnvironmentSpecularScale"] = u11.EnvironmentSpecularScale,
        ["OutdoorAmbient"] = u11.OutdoorAmbient,
        ["ShadowSoftness"] = u11.ShadowSoftness,
        ["ExposureCompensation"] = u11.ExposureCompensation,
        ["ClockTime"] = u11.ClockTime
    }
    local u109 = {
        ["Brightness"] = 25,
        ["EnvironmentDiffuseScale"] = 0,
        ["EnvironmentSpecularScale"] = 1,
        ["ShadowSoftness"] = 0.3,
        ["ExposureCompensation"] = 0,
        ["ClockTime"] = 0,
        ["Ambient"] = Color3.fromRGB(61, 61, 79),
        ["ColorShift_Bottom"] = Color3.fromRGB(255, 255, 255),
        ["ColorShift_Top"] = Color3.fromRGB(184, 69, 255),
        ["OutdoorAmbient"] = Color3.fromRGB(107, 110, 115)
    }
    local u110 = u5.Controllers.LightingController.lightingModifier:addModifier(20, u109)
    p106:GiveTask(function() --[[ Line: 334 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
            [3] = u6
            [4] = u109
            [5] = u108
            [6] = u110
        --]]
        task.delay(20, function() --[[ Line: 335 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u6
                [4] = u109
                [5] = u108
                [6] = u110
            --]]
            u15(1, u7, function(p111) --[[ Line: 336 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u109
                    [3] = u108
                    [4] = u110
                --]]
                local v112 = u6.deepCopy(u109)
                for _, v113 in u6.entries(v112) do
                    local v114 = v113[1]
                    local v115 = v113[2]
                    if type(v115) == "number" then
                        v112[v114] = v115 * (1 - p111) + p111 * u108[v114]
                    end
                    if typeof(v115) == "Color3" then
                        v112[v114] = v115:Lerp(u108[v114], p111)
                    end
                end
                u110:setProperties(v112)
            end)
            task.delay(1, function() --[[ Line: 350 ]]
                --[[
                Upvalues:
                    [1] = u110
                --]]
                u110:Destroy()
            end)
        end)
    end)
    local u116 = u5.Controllers.LightingController.skyModifier:addModifier(20, {
        ["CelestialBodiesShown"] = false,
        ["SkyboxBk"] = "rbxassetid://10290026331",
        ["SkyboxDn"] = "rbxassetid://10290026184",
        ["SkyboxFt"] = "rbxassetid://10290026023",
        ["SkyboxLf"] = "rbxassetid://10290025786",
        ["SkyboxRt"] = "rbxassetid://10290025545",
        ["SkyboxUp"] = "rbxassetid://10290025302"
    })
    p106:GiveTask(function() --[[ Line: 364 ]]
        --[[
        Upvalues:
            [1] = u116
        --]]
        task.delay(20, function() --[[ Line: 365 ]]
            --[[
            Upvalues:
                [1] = u116
            --]]
            u116:Destroy()
        end)
    end)
end
u5.CreateController(u25.new())
return nil