local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").PlayerRender
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v6 = u4.Component:extend("HotbarPartyMember")
function v6.init(_) --[[ Line: 10 ]] end
function v6.render(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
        [4] = u3
    --]]
    return u4.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["ImageTransparency"] = 1,
        ["LayoutOrder"] = p7.props.LayoutOrder,
        [u4.Event.MouseButton1Click] = function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u5
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u5.PARTY, {})
        end
    }, { u4.createElement(u3, {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["PlayerUserId"] = p7.props.Member.userId,
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }) }) })
end
return {
    ["HotbarPartyMember"] = v6
}