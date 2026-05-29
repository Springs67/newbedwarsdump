local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v9.TweenService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "tesla-trap-balance").TeslaTrapBalance
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "TeslaTrapController"
    end,
    ["__index"] = u15
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, ...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p24, ...)
    p24.Name = "TeslaTrapController"
    p24.teslaTrapToTargets = {}
    p24.lastEffectReconcileTime = {}
end
function u21.KnitStart(u25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u19
        [3] = u10
    --]]
    u15.KnitStart(u25)
    u19.Client:OnEvent("TeslaTrapTargetsChanged", function(p26, p27) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v28 = u25
        local v29 = {}
        for _, v30 in p27 do
            v29[v30] = true
        end
        v28:reconcileEffects(p26, v29)
    end)
    for v31, v32 in u10:GetTagged("tesla-trap") do
        local _ = v31 - 1
        u25:updateTeamIndicator(v32)
    end
    u10:GetInstanceAddedSignal("tesla-trap"):Connect(function(p33) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:updateTeamIndicator(p33)
    end)
    u10:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p34) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v35 = u25.teslaTrapToTargets[p34]
        if v35 == nil then
            return nil
        end
        for _, v36 in v35 do
            v36:DoCleaning()
        end
        u25.teslaTrapToTargets[p34] = nil
    end)
end
u21.updateTeamIndicator = v1.async(function(_, p37) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
        [3] = u14
        [4] = u13
    --]]
    local v38 = p37:WaitForChild("TeamIndicator", 3)
    if v38 == nil then
        return nil
    end
    local v39 = u16(p37)
    if v39 then
        v38.Color = u3.darken(v39.color, 0.25)
        if u14:GetServerTimeNow() < p37:GetAttribute("ActivationTime") then
            u13:Create(v38, TweenInfo.new(p37:GetAttribute("ActivationTime") - u14:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Color"] = u3.darken(v39.color, 0.8)
            }):Play()
            return
        end
        v38.Color = v39.color
    end
end)
function u21.reconcileEffects(u40, u41, p42) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u17
        [3] = u18
    --]]
    local u43 = os.clock()
    u40.lastEffectReconcileTime[u41] = u43
    local v44 = u40.teslaTrapToTargets[u41]
    local v45 = v44 == nil and {} or v44
    for v46, v47 in v45 do
        if p42[v46] == nil then
            v47:DoCleaning()
            v45[v46] = nil
        end
    end
    local v48 = u6.copy(v45)
    for v49 in p42 do
        local v50 = v49.PrimaryPart
        if v50 ~= nil then
            v50 = (v50.Position - u41.Position).Magnitude
        end
        if (v50 == nil and 100 or v50) <= u17.SEARCH_RANGE and v45[v49] == nil then
            local v51 = u18:getEntity(v49)
            if v51 ~= nil then
                v51 = v51:isAlive()
            end
            if v51 then
                v48[v49] = u40:createTeslaTrapEffect(u41, v49)
            end
        end
    end
    u40.teslaTrapToTargets[u41] = v48
    task.delay(1, function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u41
            [3] = u43
        --]]
        if u40.lastEffectReconcileTime[u41] == u43 then
            u40:reconcileEffects(u41, {})
        end
    end)
end
function u21.createTeslaTrapEffect(_, u52, u53) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u8
        [4] = u12
        [5] = u18
        [6] = u17
        [7] = u20
        [8] = u11
        [9] = u4
    --]]
    local u54 = u53:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment")
    if not u54 then
        error("Could not find targetAttachment")
    end
    local v55 = u16(u52)
    local v56 = u7.link
    local v57 = u52.SourceAttachment
    local v58
    if v55 then
        v58 = v55.color
    else
        v58 = Color3.fromRGB(255, 255, 255)
    end
    local v59 = v56(u54, v57, v58)
    local u60 = u8.new()
    if v59 then
        u60:GiveTask(v59)
    end
    u60:GiveTask(u12.Heartbeat:Connect(function(_) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u53
            [3] = u60
            [4] = u54
            [5] = u52
            [6] = u17
        --]]
        local v61 = u18:getEntity(u53)
        if v61 ~= nil then
            v61 = v61:isDead()
        end
        if v61 then
            u60:DoCleaning()
        end
        if (u54.WorldPosition - u52.SourceAttachment.WorldPosition).Magnitude > u17.ARC_MAX_ATTACHMENT_DISTANCE then
            u60:DoCleaning()
        end
    end))
    local v62 = u20.TESLA_ZAP
    if v62 ~= "" and v62 then
        local v63 = u4
        local v64 = {
            ["looped"] = true
        }
        local v65
        if u53 == u11.LocalPlayer.Character then
            v65 = nil
        else
            v65 = u52.Position
        end
        v64.position = v65
        local u66 = v63:playSound(v62, v64)
        if u66 then
            u60:GiveTask(function() --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u66
                --]]
                local v67 = u66
                if v67 ~= nil then
                    v67:Stop()
                end
            end)
        end
    end
    return u60
end
v5.CreateController(u21.new())
return nil