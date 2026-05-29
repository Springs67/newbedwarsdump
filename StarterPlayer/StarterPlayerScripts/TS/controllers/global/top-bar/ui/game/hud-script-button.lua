local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local u6 = v3.TopBarButton
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u14 = v13.CustomMatchRole
local u15 = v13.CustomMatchRoleAttribute
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v28 = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u11
        [4] = u15
        [5] = u14
        [6] = u8
        [7] = u6
        [8] = u2
        [9] = u12
        [10] = u5
        [11] = u16
    --]]
    local v19 = p18.useState
    local v20 = p18.useEffect
    local v21, u22 = v19(false)
    v20(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u22
            [4] = u11
            [5] = u15
            [6] = u14
        --]]
        if u4.isHoarceKat() then
            return nil
        elseif u7.Controllers.PermissionController:hasAnyPermissions({
            "anticheat_mod",
            "admin",
            "artist",
            "director"
        }) then
            u22(true)
            return nil
        else
            local u24 = u11.LocalPlayer:GetAttributeChangedSignal(u15):Connect(function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u15
                    [3] = u22
                    [4] = u14
                --]]
                local v23 = u11.LocalPlayer:GetAttribute(u15)
                u22(v23 == u14.COHOST and true or v23 == u14.HOST)
            end)
            return function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:Disconnect()
            end
        end
    end, {})
    v20(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u11
            [3] = u22
        --]]
        local v25 = u17.LocalPlayerId
        if v25 == nil then
            v25 = u11.LocalPlayer.UserId
        end
        if v25 == u17.CustomHostUserId then
            u22(true)
        end
    end, { u17.CustomHostUserId })
    local v26 = {}
    local v27 = #v26
    if v21 then
        v21 = u8.createElement(u6, {
            ["Text"] = "SCRIPTS",
            ["LayoutOrder"] = u17.LayoutOrder,
            ["OnClick"] = function() --[[ Name: OnClick, Line 58 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                    [3] = u5
                    [4] = u16
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.SCRIPT_EDITOR, {})
                u5:playSound(u16.UI_OPEN_2)
            end
        })
    end
    if v21 then
        v26[v27 + 1] = v21
    end
    return u8.createFragment(v26)
end)
return {
    ["HudScriptButton"] = v10.connect(function(p29, p30) --[[ Line: 69 ]]
        local v31 = {}
        for v32, v33 in p30 do
            v31[v32] = v33
        end
        local v34 = p29.Game.customMatch
        if v34 ~= nil then
            v34 = v34.hostUserId
        end
        v31.CustomHostUserId = v34
        return v31
    end)(v28)
}