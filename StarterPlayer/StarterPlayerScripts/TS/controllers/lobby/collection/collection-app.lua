local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local v23 = v5.new(u4)(function(_, p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u8
        [4] = u4
        [5] = u7
    --]]
    local v10 = p9.useState
    local u11, u12 = v10(nil)
    local v13, u14 = v10(false)
    local function v15() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u3.MAIN)
    end
    local v16 = {
        ["ContainerSize"] = UDim2.fromScale(1, 1)
    }
    local v17 = {}
    for v18, v19 in u8.GENERIC_BW_IMAGE_PRESET do
        v17[v18] = v19
    end
    v16.Background = v17
    v16.ExitButton = {
        ["OnClick"] = v15
    }
    v16.BackButton = {
        ["ShouldShow"] = v13,
        ["OnClick"] = function() --[[ Name: OnClick, Line 30 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u14
                [3] = u12
            --]]
            local v20 = u11
            if v20 ~= nil then
                v20()
            end
            local v21 = u14
            if v21 ~= nil then
                v21(false)
            end
            local v22 = u12
            if v22 ~= nil then
                v22(function() --[[ Line: 41 ]] end)
            end
        end
    }
    v16.EnableButtonBackgroundPanel = true
    v16.DisableScaleComponent = true
    v16.ScreenGuiProps = {
        ["ClipToDeviceSafeArea"] = false
    }
    v16.UseFrame = true
    return u4.createElement(u7, v16)
end)
return {
    ["CollectionApp"] = v6.connect(function(p24, p25) --[[ Line: 54 ]]
        local v26 = {}
        for v27, v28 in p25 do
            v26[v27] = v28
        end
        v26.SelectedEmotes = p24.Locker.selectedEmotes
        return v26
    end)(v23)
}