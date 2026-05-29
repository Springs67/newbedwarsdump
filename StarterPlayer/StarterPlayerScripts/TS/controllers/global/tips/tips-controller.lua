local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent, "ui", "tips-ui").TipsUi
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "TipsController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "TipsController"
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u11
    --]]
    u9.KnitStart(u18)
    u10.changed:connect(function(p19, p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u18
        --]]
        if p19.Settings[u11.SHOW_TIPS] ~= p20.Settings[u11.SHOW_TIPS] and not u10:getState().Settings[u11.SHOW_TIPS] then
            u18:dismissTip()
        end
    end)
end
function u14.showTip(u21, u22, u23) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u8
    --]]
    if not u10:getState().Settings[u11.SHOW_TIPS] then
        return false
    end
    if not u21.currentTipTree then
        u21:mountTip(u22, u23)
        return true
    end
    local u24 = nil
    u24 = u8.Heartbeat:Connect(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
            [3] = u23
            [4] = u24
        --]]
        if not u21.currentTipTree then
            u21:mountTip(u22, u23)
            u24:Disconnect()
        end
    end)
    return true
end
function u14.mountTip(u25, p26, p27) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u4
        [4] = u2
        [5] = u12
        [6] = u5
        [7] = u13
        [8] = u7
    --]]
    if not u10:getState().Settings[u11.SHOW_TIPS] then
        return nil
    end
    local v28
    if p27 == nil then
        v28 = p27
    else
        v28 = p27.duration
    end
    local v29 = v28 == nil and 10 or v28
    u25.tipMaid = u4.new()
    local v30
    if p27 == nil then
        v30 = p27
    else
        v30 = p27.onMount
    end
    if v30 then
        p27.onMount()
    end
    u2:playSound(u12.UI_OPEN)
    u25.currentTipTree = u5.mount(u5.createElement(u13, {
        ["Text"] = p26,
        ["Lifetime"] = v29
    }), u7.LocalPlayer:WaitForChild("PlayerGui"))
    u25.tipMaid:GiveTask(task.delay(v29, function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:dismissTip()
    end))
    local v31
    if p27 == nil then
        v31 = p27
    else
        v31 = p27.onDismount
    end
    if v31 then
        u25.tipMaid:GiveTask(p27.onDismount)
    end
end
function u14.dismissTip(p32) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p32.currentTipTree then
        u5.unmount(p32.currentTipTree)
        p32.currentTipTree = nil
        local v33 = p32.tipMaid
        if v33 ~= nil then
            v33:DoCleaning()
        end
    end
end
v3.CreateController(u14.new())
return nil