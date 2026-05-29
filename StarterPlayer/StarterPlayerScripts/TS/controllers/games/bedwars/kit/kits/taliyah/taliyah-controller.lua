local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "taliyah", "taliyah-util").TaliyahUtil
local u7 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u8 = v1.import(script, script.Parent, "ui", "chicken-ui").ChickenUi
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "TaliyahController"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    u7.constructor(p12, u5.TALIYAH)
    p12.Name = "TaliyahController"
    p12.settingUpStackTree = false
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p13)
end
function u9.onKitLocalActivated(u14, p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u3
        [4] = u8
        [5] = u4
    --]]
    if u14.priceTree or u14.settingUpStackTree then
        return nil
    end
    u14.settingUpStackTree = true
    local v16 = u6:getPrice()
    u14.priceTree = u2.Controllers.StatusInfoListController:waitForSetupAddElement(u3.createElement(u8, {
        ["chickenPrice"] = v16.price,
        ["currency"] = v16.currency
    }))
    p15:GiveTask(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u3
        --]]
        if u14.priceTree then
            u3.unmount(u14.priceTree)
        end
    end)
    p15:GiveTask(u4:GetAttributeChangedSignal("ChickenPrice"):Connect(function(_) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:updateTree()
    end))
end
function u9.onKitLocalDeactivated(_) --[[ Line: 51 ]] end
function u9.onKitReplicationActivated(_, _) --[[ Line: 53 ]] end
function u9.onKitReplicationDeactivated(_) --[[ Line: 55 ]] end
function u9.onInnateAbilityEnabled(_, _, _) --[[ Line: 57 ]] end
function u9.onAbilityUsed(_, _, _) --[[ Line: 59 ]] end
function u9.updateTree(p17) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u8
    --]]
    if p17.priceTree then
        local v18 = u6:getPrice()
        u3.update(p17.priceTree, u3.createElement(u8, {
            ["chickenPrice"] = v18.price,
            ["currency"] = v18.currency
        }))
    end
end
u2.CreateController(u9.new())
return nil