local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "JuggernuatRagebladeLuckyBlockController"
    end,
    ["__index"] = u11
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
        [1] = u11
    --]]
    u11.constructor(p17)
    p17.Name = "JuggernuatRagebladeLbController"
    p17.swordMap = {}
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u9
        [4] = u10
        [5] = u6
        [6] = u3
        [7] = u8
        [8] = u12
        [9] = u2
    --]]
    u11.KnitStart(u18)
    u13.Client:Get("SpawnLuckyBlockJuggnautSword"):Connect(function(p19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u18
            [4] = u6
            [5] = u3
            [6] = u8
            [7] = u12
            [8] = u2
        --]]
        local u20 = u9.Assets.Effects.JuggernautRageBlade:Clone()
        u20.Parent = u10
        for v21, v22 in u20:GetDescendants() do
            local _ = v21 - 1
            if v22:IsA("Sound") then
                v22:Play()
            end
        end
        if u20 then
            local v23 = u20.PrimaryPart
            if not v23 then
                return nil
            end
            u18.swordMap[p19.secret] = u20
            u20:SetAttribute("Secret", p19.secret)
            p19.position = p19.position - Vector3.new(0, 1, 0)
            u20:PivotTo(CFrame.new(p19.position))
            local u24 = u6.Controllers.ProximityPromptController:createProximityPrompt({
                ["ActionText"] = "Pick Up",
                ["ObjectText"] = "This Will Cost You Everything",
                ["HoldDuration"] = 3,
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 5,
                ["Parent"] = v23,
                ["ClickablePrompt"] = u3.isMobileControls()
            })
            u24.Triggered:Connect(function(p25) --[[ Line: 72 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u12
                    [3] = u18
                    [4] = u20
                    [5] = u24
                    [6] = u2
                --]]
                if p25 == u8.LocalPlayer then
                    local v26 = u12:getEntity(p25)
                    if v26 ~= nil then
                        v26 = v26:isAlive()
                    end
                    if not v26 then
                        return nil
                    end
                    if u18:useSword(u20) then
                        u24:Destroy()
                        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            ["message"] = "You are now the Juggernaut!"
                        })
                        return
                    end
                    u24:Destroy()
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "You are late! Somebody else has took the sword!"
                    })
                end
            end)
        end
    end)
    u13.Client:Get("UseJuggernautSword"):Connect(function(p27) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v28 = u18.swordMap[p27.secret]
        if v28 then
            u18.swordMap[p27.secret] = nil
            v28:Destroy()
        end
    end)
end
function u14.useSword(_, p29) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v30 = {
        ["secret"] = p29:GetAttribute("Secret")
    }
    return u13.Client:Get("UseLuckyBlockJuggSword"):CallServer(v30)
end
v5.CreateController(u14.new())
return nil