local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local v6 = v4.ReplicatedStorage
local u7 = v4.RunService
local u8 = v4.TweenService
local u9 = v4.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v6.Assets.Effects.BannerConnection
local u14 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true)
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "LifeStealController"
    end,
    ["__index"] = u10
})
u15.__index = u15
function u15.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "LifeStealController"
    p18.playerBeamMap = {}
    p18.hitTimeMap = {}
end
function u15.KnitStart(u19) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    u10.KnitStart(u19)
    u19:beamCleanupTicker()
    u11.Client:OnEvent("LifeStealHit", function(p20, p21, p22, p23) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v24 = u19
        local v25 = {}
        local v26
        if p23 == nil then
            v26 = p23
        else
            v26 = p23.beamColors
        end
        v25.extraBeams = v26
        v24:playRegenEffect(p20, p21, v25)
        local v27 = u19
        if p23 ~= nil then
            p23 = p23.volumeMultiplier
        end
        v27:playRegenSound(p20, p22, p23)
    end)
end
function u15.playRegenEffect(u28, u29, u30, p31) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u14
        [4] = u9
    --]]
    local v32 = u28:isLocal(u29) or u28:isLocal(u30)
    if not v32 then
        if p31 == nil then
            v32 = p31
        else
            v32 = p31.skipLocalCheck
        end
    end
    if v32 then
        local u33 = u29:WaitForChild("UpperTorso", 1)
        if u33 ~= nil then
            u33 = u33:WaitForChild("BodyFrontAttachment", 1)
        end
        local u34 = u30:WaitForChild("UpperTorso", 1)
        if u34 ~= nil then
            u34 = u34:WaitForChild("BodyFrontAttachment", 1)
        end
        local v35
        if p31 == nil then
            v35 = p31
        else
            v35 = p31.mainBeamColor
        end
        if v35 == nil then
            v35 = Color3.new(0, 90, 0)
        end
        local v36 = ColorSequence.new(v35)
        local v37
        if p31 == nil then
            v37 = p31
        else
            v37 = p31.secondaryBeamColor
        end
        if v37 == nil then
            v37 = Color3.new(0, 0, 0)
        end
        local v38 = {
            { v36, ColorSequence.new(v37) }
        }
        local v39
        if p31 == nil then
            v39 = p31
        else
            v39 = p31.extraBeams
        end
        local v40
        if v39 then
            v40 = {}
            local v41 = #v40
            local v42 = #v38
            table.move(v38, 1, v42, v41 + 1, v40)
            local v43 = v41 + v42
            local v44 = p31.extraBeams
            table.move(v44, 1, #v44, v43 + 1, v40)
        else
            v40 = v38
        end
        if u33 and u34 then
            local u45 = u28.playerBeamMap[u29]
            local v46
            if u45 == nil then
                v46 = u45
            else
                v46 = nil
                for v47, v48 in u45 do
                    local _ = v47 - 1
                    if v48.target == u30 == true then
                        v46 = v48
                        break
                    end
                end
            end
            if not v46 then
                local function v55(p49) --[[ Line: 140 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u33
                        [3] = u34
                        [4] = u29
                        [5] = u8
                        [6] = u14
                        [7] = u45
                        [8] = u30
                        [9] = u28
                    --]]
                    local v50 = u13.Beam1:Clone()
                    local v51 = u13.Beam2:Clone()
                    v50.Color = p49[1]
                    v50.Attachment0 = u33
                    v50.Attachment1 = u34
                    v50.Parent = u29
                    v51.Color = p49[2]
                    v51.Attachment0 = u33
                    v51.Attachment1 = u34
                    v51.Parent = u29
                    u8:Create(v50, u14, {
                        ["CurveSize0"] = -1.25,
                        ["CurveSize1"] = 1.25,
                        ["Width0"] = 1.4,
                        ["Width1"] = 1.4
                    }):Play()
                    u8:Create(v51, u14, {
                        ["CurveSize0"] = 1.25,
                        ["CurveSize1"] = -1.25,
                        ["Width0"] = 1.2,
                        ["Width1"] = 1.2
                    }):Play()
                    if u45 then
                        local v52 = {
                            ["target"] = u30,
                            ["front"] = v50,
                            ["back"] = v51
                        }
                        local v53 = u45
                        table.insert(v53, v52)
                    else
                        local v54 = {
                            {
                                ["target"] = u30,
                                ["front"] = v50,
                                ["back"] = v51
                            }
                        }
                        u28.playerBeamMap[u29] = v54
                    end
                end
                for v56, v57 in v40 do
                    v55(v57, v56 - 1, v40)
                end
            end
        end
        local v58 = u28.hitTimeMap[u29]
        if v58 then
            v58[u30] = u9:GetServerTimeNow()
            return
        end
        local v59 = {
            [u30] = u9:GetServerTimeNow()
        }
        u28.hitTimeMap[u29] = v59
    end
end
function u15.beamCleanupTicker(u60) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
    --]]
    u7.Heartbeat:Connect(function() --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u9
        --]]
        local v61 = u60.hitTimeMap
        local function v80(p62, u63) --[[ Line: 210 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u60
            --]]
            local function v77(p64, p65) --[[ Line: 212 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u60
                    [3] = u63
                --]]
                if u9:GetServerTimeNow() - p64 >= 1 then
                    local v66 = u60.playerBeamMap[u63]
                    local v67
                    if v66 == nil then
                        v67 = v66
                    else
                        local v68 = 0
                        v67 = {}
                        for v69, v70 in v66 do
                            local _ = v69 - 1
                            if v70.target == p65 == true then
                                v68 = v68 + 1
                                v67[v68] = v70
                            end
                        end
                    end
                    if v66 ~= nil then
                        local v71 = 0
                        v66 = {}
                        for v72, v73 in v66 do
                            local _ = v72 - 1
                            if v73.target ~= p65 == true then
                                v71 = v71 + 1
                                v66[v71] = v73
                            end
                        end
                    end
                    if v66 then
                        u60.playerBeamMap[u63] = v66
                    end
                    if v67 ~= nil then
                        for v74, v75 in v67 do
                            local _ = v74 - 1
                            v75.front:Destroy()
                            v75.front.Parent = nil
                            v75.back:Destroy()
                            v75.back.Parent = nil
                        end
                    end
                    local v76 = u60.hitTimeMap[u63]
                    if v76 ~= nil then
                        v76[p65] = nil
                    end
                end
            end
            for v78, v79 in p62 do
                v77(v79, v78, p62)
            end
        end
        for v81, v82 in v61 do
            v80(v82, v81, v61)
        end
    end)
end
function u15.playRegenSound(p83, p84, p85, p86) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
    --]]
    local v87
    if p85 then
        v87 = u12.LIFE_STEAL_OVERHEAL
    else
        v87 = u12.LIFE_STEAL_HEAL
    end
    local v88 = u2
    local v89 = {}
    local v90
    if p83:isLocal(p84) then
        v90 = nil
    else
        v90 = p84.PrimaryPart
        if v90 ~= nil then
            v90 = v90.Position
        end
    end
    v89.position = v90
    v89.volumeMultiplier = p86 == nil and 1 or p86
    v88:playSound(v87, v89)
end
function u15.isLocal(_, p91) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return p91 == u5.LocalPlayer.Character
end
v3.CreateController(u15.new())
return nil