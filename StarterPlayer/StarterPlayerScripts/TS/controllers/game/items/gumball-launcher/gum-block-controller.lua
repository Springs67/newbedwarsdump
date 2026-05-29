local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").TeamIdAttr
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u10 = v1.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "sticky-boots-client-status-effect-handler").StickyBootsClientStatusEffectHandler
local u11 = Color3.new(1, 0.4, 0.8)
local u12 = Color3.new(1, 0.35, 0.35)
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "GumBlockController"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(_) --[[ Line: 26 ]] end
function u13.onStart(_) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u7
        [4] = u4
        [5] = u6
        [6] = u11
        [7] = u12
        [8] = u8
        [9] = u10
    --]]
    u3("GumBlock", function(p16) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u4
            [4] = u6
            [5] = u11
            [6] = u12
        --]]
        local v17 = u9(p16, u7)
        local v18 = u4.Controllers.TeamController:getPlayerTeam(u6.LocalPlayer)
        if v18 ~= nil then
            v18 = v18.id
        end
        local v19 = v17 == v18
        local v20 = v19 and "rbxassetid://14192071543" or "rbxassetid://14192071748"
        local v21
        if v19 then
            v21 = u11
        else
            v21 = u12
        end
        local v22 = p16:WaitForChild("Part"):WaitForChild("Decal")
        p16:GetRootPart().Color = v21
        v22.Texture = v20
        if v22.Parent then
            v22.Parent.Color = v21
        end
    end)
    u4.Controllers.StatusEffectController:setHandler(u8.STICKY_BOOTS, u10)
end
v2.defineMetadata(u13, "identifier", "client/controllers/game/items/gumball-launcher/gum-block-controller@GumBlockController")
v2.defineMetadata(u13, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u13, "$:flamework@Controller", v5, {
    {}
})
return {
    ["FRIENDLY_BLOCK_COLOR"] = u11,
    ["ENEMY_BLOCK_COLOR"] = u12,
    ["default"] = u13
}