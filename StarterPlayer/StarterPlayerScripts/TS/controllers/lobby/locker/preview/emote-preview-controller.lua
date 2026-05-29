local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "EmotePreviewController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "EmotePreviewController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p11)
end
function u7.previewEmote(_, p12, u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
        [4] = u2
    --]]
    local v14 = u3.new()
    local v15 = u5[p12]
    if v15.emoteDisplayType == u6.IMAGE_DEFAULT then
        return v14
    end
    u2.Controllers.LockerPreviewController:setPreviewOffset(Vector3.new(0.5, 2.5, 0))
    if u13 ~= nil then
        u13:PivotTo(CFrame.new(u2.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    end
    v14:GiveTask(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
        --]]
        local v16 = u13
        if v16 ~= nil then
            v16:PivotTo(u2.Controllers.LockerPreviewController:getBackstageWorldPosition())
        end
    end)
    for v17, v18 in u13:GetChildren() do
        local _ = v17 - 1
        local v19 = v18:GetAttribute("DisableInPlayerViewport")
        if v19 ~= 0 and (v19 == v19 and (v19 ~= "" and v19)) then
            v18:Destroy()
        end
    end
    u13:SetAttribute("PlayingEmote", p12)
    v14:GiveTask(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        return u13:SetAttribute("PlayingEmote", nil)
    end)
    if v15.animation then
        v14:GiveTask(u2.Controllers.EmoteController:playEmoteAnimation(-1, u13, v15.animation, p12))
    end
    local u20 = u2.Controllers.EmoteController:playEmoteBeginSounds(p12)
    v14:GiveTask(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        if v21 ~= nil then
            for v22, v23 in v21 do
                local _ = v22 - 1
                v23:Stop()
                v23:Destroy()
            end
        end
    end)
    return v14
end
u2.CreateController(u7.new())
return nil