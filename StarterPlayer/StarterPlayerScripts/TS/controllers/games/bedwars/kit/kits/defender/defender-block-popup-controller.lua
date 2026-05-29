local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "DefenderPopupController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "DefenderPopupController"
    p17.popup = nil
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p18)
end
function u14.showPopup(p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    if not p19.popup then
        p19.popup = u7.Assets.Misc.DefenderBlockPopup:Clone()
        p19.popup.Parent = u8
    end
    p19.popup.BillboardGui.Enabled = true
end
function u14.hidePopup(p20) --[[ Line: 44 ]]
    if p20.popup then
        p20.popup.BillboardGui.Enabled = false
    end
end
function u14.updatePopup(p21, p22, p23) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
        [4] = u8
        [5] = u13
        [6] = u10
        [7] = u11
        [8] = u12
    --]]
    local v24 = u6.LocalPlayer.Character
    if v24 ~= nil then
        v24 = v24:GetPivot()
    end
    if not v24 then
        return nil
    end
    local v25 = u4.Controllers.DefenderKitController:getBlockCostFromBlock(p22)
    if not v25 then
        return nil
    end
    local v26 = v25.price
    local v27 = v25.currency
    if not p21.popup then
        p21.popup = u7.Assets.Misc.DefenderBlockPopup:Clone()
        p21.popup.Parent = u8
    end
    local v28
    if p22 == u13.WOOL_WHITE then
        local v29 = u4.Controllers.TeamController:getPlayerTeam(u6.LocalPlayer)
        if v29 then
            p22 = u10.getTeamWoolById(v29.id) or u13.WOOL_WHITE
        end
        v28 = true
    else
        v28 = false
    end
    local v30 = u11.hasEnough(u6.LocalPlayer, v27, v26)
    local v31 = p21.popup.BillboardGui.Cost
    local v32
    if v30 or v28 then
        v32 = Color3.fromRGB(65, 144, 255)
    else
        v32 = Color3.fromRGB(200, 44, 55)
    end
    v31.BackgroundColor3 = v32
    p21.popup.BillboardGui.Cost.Price.Text = v28 and "FREE" or tostring(v26)
    local v33
    if v28 then
        v33 = ""
    else
        local v34 = u12(v27).image
        v33 = v34 == nil and "" or v34
    end
    p21.popup.BillboardGui.Cost.CurrencyIcon.Image = v33
    local v35 = u12(p22).image
    local v36 = v35 == nil and "" or v35
    p21.popup.BillboardGui.BlockRender.Image = v36
    p21.popup.BillboardGui.BlockName.Text = u12(p22).displayName
    p21.popup:PivotTo(CFrame.new(p23))
    p21:showPopup()
end
v3.CreateController(u14.new())
return nil