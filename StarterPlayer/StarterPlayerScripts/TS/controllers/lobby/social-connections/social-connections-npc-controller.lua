local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SocialConnectionsNPCController"
    end,
    ["__index"] = u10
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p16)
    p16.Name = "SocialConnectionsNPCController"
end
function u13.KnitStart(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u9
        [4] = u2
        [5] = u11
        [6] = u3
        [7] = u8
    --]]
    u12("VerifyNPC", function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u2
            [4] = u11
            [5] = u3
            [6] = u8
        --]]
        u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Verify Account",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 14,
            ["Parent"] = p17
        }).Triggered:Connect(function(p18) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u2
                [3] = u11
            --]]
            if p18 == u9.LocalPlayer then
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.SOCIAL_CONNECTIONS, {})
            end
        end)
        local v19 = p17.PrimaryPart
        v19:SetAttribute("BillboardTitle", "<font color=\"" .. u3.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Verify Account</font>")
        v19:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3))
        v19:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0))
        u8:AddTag(v19, "Billboard")
    end)
end
v5.CreateController(u13.new())
return nil