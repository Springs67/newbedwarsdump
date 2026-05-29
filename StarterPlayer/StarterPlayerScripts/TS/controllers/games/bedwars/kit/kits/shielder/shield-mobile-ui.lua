local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v6 = u3.Component:extend("ShieldMobileUI")
function v6.init(p7, _) --[[ Line: 10 ]]
    p7:setState({
        ["raised"] = false
    })
end
function v6.render(u8) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u5
        [4] = u4
    --]]
    local v9 = u3.createElement
    local v10 = u2
    local v11 = {}
    local v12
    if u8.state.raised then
        v12 = u5.SHIELD_ON_MOBILE
    else
        v12 = u5.SHIELD_OFF_MOBILE
    end
    v11.Image = v12
    v11.Position = u4:getActionMobileButtonPosition()
    function v11.OnClick() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v13 = not u8.state.raised
        u8:setState({
            ["raised"] = v13
        })
        u8.props.OnChange(v13)
    end
    return v9(v10, v11)
end
return {
    ["ShieldMobileUI"] = v6
}