local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u10 = v1.import(script, script.Parent, "ui", "hud", "status-effect-hud-list").StatusEffectHudListScreen
local u11 = v1.import(script, script.Parent, "ui", "nametag", "status-effect-tag-list").StatusEffectTagListBillboard
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "StatusEffectHudController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "StatusEffectHudController"
    p15.nametagTrees = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u8
        [4] = u4
        [5] = u6
        [6] = u5
        [7] = u9
    --]]
    u7.KnitStart(u16)
    u16:mountStatusEffectHud()
    u2(function(p17, u18, u19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u16
            [3] = u4
        --]]
        local u20 = u8:getEntity(p17)
        if not u20 then
            return nil
        end
        local v21 = u16.nametagTrees[u20]
        if v21 then
            u4.unmount(v21)
        end
        task.spawn(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u18
                [3] = u20
                [4] = u19
            --]]
            local v22 = u16:mountStatusEffectNametag(u18)
            if v22 then
                u16.nametagTrees[u20] = v22
                u19:GiveTask(function() --[[ Line: 49 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u20
                    --]]
                    u16.nametagTrees[u20] = nil
                end)
            end
        end)
    end)
    u6.StatusEffectAdded:connect(function(u23) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u16
        --]]
        if u23.entityInstance == u5.LocalPlayer.Character then
            return nil
        end
        if u23.statusEffect == u9.INVISIBILITY then
            task.spawn(function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u23
                --]]
                u16:hideStatusEffectNameTag(u23.entityInstance)
            end)
        end
    end)
    u6.StatusEffectRemoved:connect(function(u24) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u16
        --]]
        if u24.entityInstance == u5.LocalPlayer.Character then
            return nil
        end
        if u24.statusEffect == u9.INVISIBILITY then
            task.spawn(function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u24
                --]]
                u16:showStatusEffectNameTag(u24.entityInstance)
            end)
        end
    end)
end
function u12.mountStatusEffectHud(_) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u5
    --]]
    u4.mount(u4.createElement(u10), u5.LocalPlayer:WaitForChild("PlayerGui"))
end
function u12.mountStatusEffectNametag(_, p25) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
    --]]
    local v26 = p25:WaitForChild("Head", 1)
    if v26 then
        if v26:FindFirstChild("StatusEffectTagBillboard") then
            return nil
        else
            return u4.mount(u4.createElement(u11, {
                ["EntityInstance"] = p25
            }), v26)
        end
    else
        return nil
    end
end
function u12.hideStatusEffectNameTag(_, p27) --[[ Line: 92 ]]
    local v28 = p27:FindFirstChild("Head")
    if not v28 then
        return nil
    end
    v28:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = false
end
function u12.showStatusEffectNameTag(_, p29) --[[ Line: 100 ]]
    local v30 = p29:FindFirstChild("Head")
    if not v30 then
        return nil
    end
    v30:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = true
end
v3.CreateController(u12.new())
return nil