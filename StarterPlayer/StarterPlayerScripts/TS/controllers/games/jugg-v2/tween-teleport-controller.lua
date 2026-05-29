local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.TweenService
local u6 = v3.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TweenTeleportController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "TweenTeleportController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
    --]]
    u7.KnitStart(u15)
    u10.Client:Get("TweenTeleport"):Connect(function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:tweenEffect(p16.player, p16.oldPosition, p16.targetPosition, p16.time, p16.animation, p16.cFrame, p16.invisible, p16.animationMultiplier)
    end)
end
function u11.tweenEffect(_, u17, _, p18, p19, p20, p21, p22, p23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u4
        [4] = u5
        [5] = u8
    --]]
    local u24 = u9:getEntity(u17)
    local v25 = u17.Character
    v25.Archivable = true
    local v26 = u17.Character
    if v26 ~= nil then
        v26 = v26.PrimaryPart
        if v26 ~= nil then
            v26 = v26.CFrame
        end
    end
    if not v26 then
        return nil
    end
    local u27 = v25:Clone()
    if p22 then
        u27:SetAttribute("Transparency", 1)
    end
    local v28 = u27.Humanoid.Animator
    if u24 ~= nil then
        u24:hideNametag()
    end
    u17.Character:SetAttribute("Transparency", 1)
    u27.PrimaryPart.CFrame = v26
    u27.Parent = u6
    if u17 == u4.LocalPlayer then
        u6.CurrentCamera.CameraSubject = u27.Humanoid
        task.delay(p19, function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u6
            --]]
            local v29 = u4.LocalPlayer.Character
            if v29 then
                u6.CurrentCamera.CameraSubject = v29.Humanoid
            end
        end)
    end
    local v30 = TweenInfo.new(p19)
    local v31 = u5:Create(u27.PrimaryPart, v30, {
        ["CFrame"] = p21 or CFrame.new(p18)
    })
    v31:Play()
    if p20 ~= 0 and (p20 == p20 and p20) then
        local v32 = v28:LoadAnimation(u8:getAnimation(p20))
        if p23 ~= nil then
            v32:AdjustSpeed(p23)
        end
        v32:Play()
        u8:playAnimation(v25, p20)
    end
    v31.Completed:Connect(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u17
            [3] = u24
        --]]
        u27:Destroy()
        local v33 = u17.Character
        if v33 ~= nil then
            v33:SetAttribute("Transparency", 0)
        end
        local v34 = u24
        if v34 ~= nil then
            v34:showNametag()
        end
    end)
end
v2.CreateController(u11.new())
return nil