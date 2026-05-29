local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BarrierBlockController"
    end,
    ["__index"] = u9
})
u11.__index = u11
function u11.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
    --]]
    u9.constructor(p14)
    p14.Name = "BarrierBlockController"
    p14.maid = u3.new()
end
function u11.KnitStart(p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p15)
end
function u11.isRelevantItem(_, p16) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p16.itemType == u10.BARRIER
end
function u11.onEnable(p17) --[[ Line: 38 ]]
    p17:revealBarriers()
end
function u11.onDisable(p18) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p18.maid:DoCleaning()
    for v19, v20 in u6:GetTagged("BARRIER_BLOCK") do
        local _ = v19 - 1
        local v21 = v20:FindFirstChildOfClass("SelectionBox")
        if v21 then
            v21.Visible = false
        end
    end
end
function u11.revealBarriers(p22) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u4
    --]]
    local u23 = 0
    local v32 = u8.Heartbeat:Connect(function(_) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u7
            [3] = u6
            [4] = u4
        --]]
        if u23 > time() then
            return nil
        end
        u23 = time() + 0.1
        local u24 = u7.LocalPlayer.Character
        if not u24 then
            return nil
        end
        if u24 ~= nil then
            u24 = u24:GetPivot()
        end
        local v25 = u6:GetTagged("BARRIER_BLOCK")
        local function v29(p26) --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u4
            --]]
            local v27 = (u24.Position - p26.Position).Magnitude <= 30
            local v28 = p26:FindFirstChildOfClass("SelectionBox")
            if v27 then
                if v28 then
                    v28.Visible = true
                else
                    u4("SelectionBox", {
                        ["LineThickness"] = 0.04,
                        ["Transparency"] = 0,
                        ["SurfaceTransparency"] = 0.6,
                        ["Adornee"] = p26,
                        ["Parent"] = p26,
                        ["Color3"] = Color3.fromRGB(255, 61, 61),
                        ["SurfaceColor3"] = Color3.fromRGB(186, 41, 41)
                    })
                end
            else
                if v28 then
                    v28.Visible = false
                end
                return
            end
        end
        for v30, v31 in v25 do
            v29(v31, v30 - 1, v25)
        end
    end)
    p22.maid:GiveTask(v32)
end
return {
    ["BarrierBlockController"] = v2.CreateController(u11.new())
}