local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Lighting
local u11 = v9.MarketplaceService
local u12 = v9.Players
local u13 = v9.ProximityPromptService
local u14 = v9.TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vip", "vip-util").VIPUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "RankPurchaseController"
    end,
    ["__index"] = u15
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
        [1] = u15
    --]]
    u15.constructor(p23)
    p23.Name = "RankPurchaseController"
end
function u20.KnitStart(_) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u13
        [5] = u12
        [6] = u19
        [7] = u2
        [8] = u16
        [9] = u17
        [10] = u11
        [11] = u18
        [12] = u8
        [13] = u10
        [14] = u14
    --]]
    u3("VIPRankPurchase", function(u24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u13
            [4] = u12
            [5] = u19
            [6] = u2
            [7] = u16
            [8] = u17
            [9] = u11
            [10] = u18
            [11] = u8
            [12] = u10
            [13] = u14
        --]]
        local u25 = u7.new()
        local u26 = true
        u25:GiveTask(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26 = false
        end)
        local u27 = u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "VIP Rank",
            ["ObjectText"] = "Click to Purchase",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 20,
            ["HoldDuration"] = 0,
            ["Parent"] = u24
        })
        u25:GiveTask(u13.PromptTriggered:Connect(function(p28, p29) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u12
                [3] = u19
                [4] = u2
                [5] = u16
                [6] = u17
                [7] = u11
                [8] = u18
            --]]
            if p28 == u27 and p29 == u12.LocalPlayer then
                if u19.isPlayerVIP(u12.LocalPlayer) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.GIFTING, {
                        ["GiftType"] = u17.VIP_RANK
                    })
                    return
                end
                u11:PromptGamePassPurchase(p29, u18.VIP)
            end
        end))
        u24.AncestryChanged:Connect(function(_, p30) --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            if p30 == nil then
                u25:DoCleaning()
            end
        end)
        if not u24.PrimaryPart then
            u24:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u31 = u8("CFrameValue", {
            ["Parent"] = u10,
            ["Value"] = u24:GetPrimaryPartCFrame()
        })
        u25:GiveTask(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:Destroy()
        end)
        u31.Changed:Connect(function(p32) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:PivotTo(p32)
        end)
        while u26 do
            local v33 = u14:Create(u31, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
                ["Value"] = u31.Value * CFrame.Angles(0, 2.792526803190927, 0)
            })
            v33:Play()
            v33.Completed:Wait()
        end
    end)
end
return {
    ["RankPurchaseController"] = v5.CreateController(u20.new())
}