local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u6 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u7 = v1.import(script, script.Parent, "ui", "bully-stack-ui").BullyStacksUi
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "PvpArenaBullyAugmentController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.constructor(p11, u5.BULLY)
    p11.Name = "PvpArenaBullyAugmentController"
    p11.settingUpStackTree = false
end
function u8.onActivated(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u7
    --]]
    if not (u12.bullyStackTree or u12.settingUpStackTree) then
        u12.settingUpStackTree = true
        local v13 = u4.LocalPlayer:GetAttribute("BullyStack")
        local v14 = v13 == nil and 0 or v13
        local v15 = u3
        local v16 = u3.createElement(u7, {
            ["bullyStacks"] = v14
        })
        local v17 = u4.LocalPlayer:WaitForChild("PlayerGui", 3)
        if v17 ~= nil then
            v17 = v17:WaitForChild("StatusInfoListGui", 3)
            if v17 ~= nil then
                v17 = v17:WaitForChild("FakeHotbar", 3)
            end
        end
        u12.bullyStackTree = v15.mount(v16, v17)
    end
    u4.LocalPlayer:GetAttributeChangedSignal("BullyStack"):Connect(function(_) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:updateTree()
    end)
end
function u8.updateTree(p18) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u7
    --]]
    if p18.bullyStackTree then
        local v19 = {
            ["bullyStacks"] = u4.LocalPlayer:GetAttribute("BullyStack")
        }
        u3.update(p18.bullyStackTree, u3.createElement(u7, v19))
    end
end
v2.CreateController(u8.new())
return nil