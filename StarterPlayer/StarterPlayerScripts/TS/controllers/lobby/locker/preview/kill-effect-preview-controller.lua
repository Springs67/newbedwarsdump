local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "KillEffectPreviewController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p15)
    p15.Name = "KillEffectPreviewController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p16)
end
function u12.previewKillEffect(_, p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u3
        [4] = u8
        [5] = u9
        [6] = u4
        [7] = u7
    --]]
    local v18 = u5.new()
    local v19 = u11[p17]
    local v20 = u3.Controllers.LockerPreviewController
    local v21 = v19.preview
    if v21 ~= nil then
        v21 = v21.customAngle
    end
    if v21 == nil then
        v21 = CFrame.Angles(0, 3.7524578917878086, 0)
    end
    v20:setPreviewAngle(v21)
    local v22 = u3.Controllers.LockerPreviewController
    local v23 = v19.preview
    if v23 ~= nil then
        v23 = v23.offset
    end
    v22:setPreviewOffset(v23 == nil and Vector3.new(0, 0, 0) or v23)
    local v24 = v19.preview
    if v24 ~= nil then
        v24 = v24.floorVisible
    end
    if v24 then
        u3.Controllers.LockerPreviewController:setFloorVisible(true)
    else
        u3.Controllers.LockerPreviewController:setFloorVisible(false)
    end
    local v25 = u8.Assets.Misc.Dummy:Clone()
    v25.Name = "PreviewDummy"
    v25.Parent = u9
    v25:PivotTo(CFrame.new(u3.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    v18:GiveTask(v25)
    if p17 then
        v18:GiveTask(u4.Controllers.KillEffectController:getKillEffects()[p17].new(u7.LocalPlayer):onKill(u7.LocalPlayer, v25, v25:GetPivot()))
    end
    return v18
end
u3.CreateController(u12.new())
return nil