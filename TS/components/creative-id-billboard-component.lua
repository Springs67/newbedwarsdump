local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.GameComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "CreativeIdBillboardComponent"
    end,
    ["__index"] = u6
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
    --]]
    u6.constructor(p15, ...)
    p15.billboardMaid = u9.new()
end
function u12.onStart(p16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if not u7 then
        return nil
    end
    if u7.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
        p16:displayBillboard()
    end
end
function u12.getTag(_) --[[ Line: 41 ]]
    return "CreativeIdBillboardComponent"
end
function u12.displayBillboard(p17) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u5
    --]]
    local v18 = u10.mount
    local v19 = u10.createFragment
    local v20 = {
        ["UIDBillboard"] = u10.createElement("BillboardGui", {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 3.7, 0),
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 110,
            ["Size"] = UDim2.fromScale(7, 0.75)
        }, { u10.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                ["BackgroundTransparency"] = u11.nametagBackgroundTransparency
            }, { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical"
                }), u10.createElement("TextLabel", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Font"] = "RobotoMono",
                    ["TextScaled"] = true,
                    ["Text"] = "Id: " .. p17.attributes.Id,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u5.WHITE
                }, { u10.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0)
                    }) }) }) })
    }
    local u21 = v18(v19(v20), p17.instance)
    p17.billboardMaid:GiveTask(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u21
        --]]
        u10.unmount(u21)
    end)
    p17.maid:GiveTask(p17.billboardMaid)
end
function u12.removeBillboard(p22) --[[ Line: 83 ]]
    p22.billboardMaid:DoCleaning()
end
v2.defineMetadata(u12, "identifier", "shared/components/creative-id-billboard-component@CreativeIdBillboardComponent")
v2.defineMetadata(u12, "flamework:implements", { "$:flamework@OnStart" })
local v23 = {
    ["tag"] = "CreativeIdBillboardComponent",
    ["defaults"] = {
        ["Id"] = "",
        ["BlockPosition"] = Vector3.new()
    },
    ["attributes"] = {
        ["Id"] = v3.string,
        ["BlockPosition"] = v3.Vector3
    },
    ["instanceGuard"] = v3.instanceIsA("BasePart")
}
v2.decorate(u12, "$c:init@Component", v8, { v23 })
return {
    ["default"] = u12
}