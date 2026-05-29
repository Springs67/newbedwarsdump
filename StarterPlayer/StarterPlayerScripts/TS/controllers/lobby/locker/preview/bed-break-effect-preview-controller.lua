local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "BedBreakEffectPreviewController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "BedBreakEffectPreviewController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p12)
end
function u8.previewBedBreakEffect(_, p13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u2
        [4] = u5
        [5] = u4
    --]]
    local v14 = u3.new()
    local v15 = u7[p13]
    u2.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(-0.3490658503988659, 0.6108652381980153, 0))
    local v16 = u2.Controllers.LockerPreviewController
    local v17 = v15.preview
    if v17 ~= nil then
        v17 = v17.offset
    end
    v16:setPreviewOffset(v17 == nil and Vector3.new(0, 0, 0) or v17)
    local v18 = u2.Controllers.LockerPreviewController:getBedAttachment()
    local v19 = u2.Controllers.LockerPreviewController:getBedCenterAttachment()
    local v20 = u5.StartBedBreakEffectPreview:fire(p13, u4.LocalPlayer, CFrame.new(v18.WorldPosition), "0", v19.WorldPosition)
    if v20.maid then
        v14:GiveTask(v20.maid)
    end
    return v14
end
u2.CreateController(u8.new())
return nil