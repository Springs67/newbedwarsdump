local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out")
local u6 = v5.BaseComponent
local v7 = v5.Component
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard", "attributes")
local u12 = v11.BillboardAlwaysOnTopAttr
local u13 = v11.BillboardAutomaticSizeAttr
local u14 = v11.BillboardMaxSizeAttr
local u15 = v11.BillboardSizeAttr
local u16 = v11.BillboardStudsOffsetAttr
local u17 = v11.BillboardSubtitleAttr
local u18 = v11.BillboardTitleAttr
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard", "ui", "billboard-ui").BillboardUI
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BillboardComponent"
    end,
    ["__index"] = u6
})
u20.__index = u20
function u20.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u18
        [4] = u17
        [5] = u15
        [6] = u14
        [7] = u16
        [8] = u12
        [9] = u13
    --]]
    u6.constructor(p23)
    if not p23.instance:IsA("BasePart") then
        error("Any instance with Billboard tag must be a BasePart")
    end
    local v24 = {
        u18,
        u17,
        u15,
        u14,
        u16,
        u12,
        u13
    }
    p23.config = u10.new(p23.instance, v24)
end
function u20.getTag(_) --[[ Line: 43 ]]
    return "Billboard"
end
function u20.onStart(p25) --[[ Line: 46 ]]
    local v26 = {}
    for v27, v28 in p25.config.Values do
        v26[v27] = v28
    end
    for v29, v30 in p25.attributes do
        v26[v29] = v30
    end
    p25.config.Values = v26
    local v31 = {}
    for v32, v33 in p25.config.Values do
        v31[v32] = v33
    end
    for v34, v35 in p25.attributes do
        v31[v34] = v35
    end
    p25.attributes = v31
    p25:createBillboard()
end
function u20.createBillboard(p36) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u8
        [4] = u19
    --]]
    if u9:IsServer() then
        return nil
    end
    local v37 = p36.config.Values
    local v38 = {}
    local v39 = v37.BillboardTitle
    v38.Text = v39 == nil and "" or v39
    v38.TextColor = u4.hexColor(16382311)
    v38.LabelSize = UDim2.fromScale(1, 0.6)
    local v40 = table.create(1, v38)
    local v41 = v37.BillboardSubtitle
    if v41 ~= "" and v41 then
        local v42 = {
            ["Text"] = v37.BillboardSubtitle,
            ["TextColor"] = u4.hexColor(9893366),
            ["LabelSize"] = UDim2.fromScale(1, 0.45)
        }
        table.insert(v40, v42)
    end
    local v43 = {
        ["LightInfluence"] = 0,
        ["MaxDistance"] = 115,
        ["Size"] = v37.BillboardSize or UDim2.fromScale(10, 2),
        ["StudsOffset"] = v37.BillboardStudsOffset
    }
    local v44 = p36.config.Values.AlwaysOnTop
    v43.AlwaysOnTop = v44 == nil and true or v44
    local v45 = u8.createFragment({
        ["roact_billboard"] = u8.createElement("BillboardGui", v43, { u8.createElement(u19, {
                ["Texts"] = v40,
                ["ItemPadding"] = UDim.new(0, 5),
                ["MaxSize"] = v37.BillboardMaxSize,
                ["AutomaticSize"] = v37.AutomaticSize
            }) })
    })
    u8.mount(v45, p36.instance)
end
v2.defineMetadata(u20, "identifier", "shared/components/billboard/init@BillboardComponent")
v2.defineMetadata(u20, "flamework:implements", { "$:flamework@OnStart" })
local v46 = v2.decorate
local v47 = u20
local v48 = {}
local v49 = {
    ["tag"] = "Billboard",
    ["attributes"] = {
        ["BillboardTitle"] = v3.optional(v3.string),
        ["BillboardSubtitle"] = v3.optional(v3.string),
        ["BillboardSize"] = v3.optional(v3.UDim2),
        ["BillboardMaxSize"] = v3.optional(v3.Vector2),
        ["BillboardStudsOffset"] = v3.optional(v3.Vector3),
        ["AlwaysOnTop"] = v3.optional(v3.boolean),
        ["AutomaticSize"] = v3.optional(v3.boolean)
    }
}
__set_list(v48, 1, {v49})
v46(v47, "$c:init@Component", v7, v48)
return {
    ["default"] = u20
}