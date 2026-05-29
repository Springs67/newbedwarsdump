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
local v29 = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
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
        else
            local u23 = u7.Controllers.PermissionController:hasAnyPermissions({
                "anticheat_mod",
                "admin",
                "artist",
                "director",
                "tester"
            })
            if u23 then
                u22(true)
                return nil
            else
                local u25 = u11.LocalPlayer:GetAttributeChangedSignal(u15):Connect(function() --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u15
                        [3] = u22
                        [4] = u23
                        [5] = u14
                    --]]
                    local v24 = u11.LocalPlayer:GetAttribute(u15)
                    u22(u23 or (v24 == u14.COHOST and true or v24 == u14.HOST))
                end)
                return function() --[[ Line: 38 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    u25:Disconnect()
                end
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
        local v26 = u17.LocalPlayerId
        if v26 == nil then
            v26 = u11.LocalPlayer.UserId
        end
        if v26 == u17.CustomHostUserId then
            u22(true)
        end
    end, { u17.CustomHostUserId })
    local v27 = {}
    local v28 = #v27
    if v21 then
        v21 = u8.createElement(u6, {
            ["Text"] = "HOST PANEL",
            ["LayoutOrder"] = u17.LayoutOrder,
            ["OnClick"] = function() --[[ Name: OnClick, Line 58 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                    [3] = u5
                    [4] = u16
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.CUSTOM_MATCH_HOST_PANEL, {})
                u5:playSound(u16.UI_OPEN_2)
            end
        })
    end
    if v21 then
        v27[v28 + 1] = v21
    end
    return u8.createFragment(v27)
end)
return {
    ["HudHostPanelButton"] = v10.connect(function(p30, p31) --[[ Line: 69 ]]
        local v32 = {}
        for v33, v34 in p31 do
            v32[v33] = v34
        end
        local v35 = p30.Game.customMatch
        if v35 ~= nil then
            v35 = v35.hostUserId
        end
        v32.CustomHostUserId = v35
        return v32
    end)(v29)
}