local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.RunService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "RainbowKeyController"
    end,
    ["__index"] = u8
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p14)
    p14.Name = "RainbowKeyController"
    p14.currentKeyHoldingPlayer = nil
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u5
    --]]
    u8.KnitStart(u15)
    u10.Client:Get("EntityDeathEvent"):Connect(function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
        --]]
        local v17 = u5:GetPlayerFromCharacter(p16.entityInstance)
        if not v17 then
            return nil
        end
        local v18 = v17.UserId
        local v19 = u15.currentKeyHoldingPlayer
        if v19 ~= nil then
            v19 = v19.UserId
        end
        if v18 == v19 then
            u15:refreshKeyStatus(nil)
        end
    end)
    u10.Client:OnEvent("RainbowKeyHolderUpdated", function(p20) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:refreshKeyStatus(p20.updatedKeyHoldingPlayer)
    end)
end
function u11.refreshKeyStatus(u21, p22) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u7
    --]]
    local u23 = u6.Assets.Effects.RainbowKey:Clone()
    if not u23 then
        return nil
    end
    u21.currentKeyHoldingPlayer = p22
    if u21.currentKeyHoldingPlayer ~= nil then
        local u24 = 0
        local u25 = u9:getEntity(u21.currentKeyHoldingPlayer)
        local u26 = u21.currentKeyHoldingPlayer.Character
        u23.Parent = u26
        u21:highlightKey(u23, true)
        local u27 = nil
        u27 = u7.Heartbeat:Connect(function(p28) --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u25
                [3] = u21
                [4] = u23
                [5] = u27
                [6] = u26
            --]]
            u24 = u24 + p28
            if u25 ~= nil then
                local v29 = u25:getHealth()
                if v29 == 0 or (v29 ~= v29 or not v29) then
                    u21:highlightKey(u23, false)
                    u23:Destroy()
                    u27:Disconnect()
                    return nil
                end
                local v30 = u21.currentKeyHoldingPlayer
                if v30 ~= nil then
                    v30 = v30:GetAttribute("KeyStatus")
                end
                local v31 = u23.PrimaryPart and u26
                if v31 then
                    if v29 <= 0 then
                        v30 = false
                    end
                else
                    v30 = v31
                end
                if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
                    local v32 = u26:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0)
                    u23:PivotTo(CFrame.new(v32) * CFrame.Angles(0, u24 * 3.141592653589793 / 2, 0))
                    return
                end
                u21:highlightKey(u23, false)
                u23:Destroy()
                u27:Disconnect()
            end
        end)
    end
end
function u11.highlightKey(_, p33, p34) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v35 = u3("Highlight", {
        ["FillTransparency"] = 0.7,
        ["OutlineTransparency"] = 0.2,
        ["Parent"] = nil,
        ["FillColor"] = Color3.fromRGB(255, 237, 0),
        ["OutlineColor"] = Color3.fromRGB(255, 255, 255)
    })
    if p34 then
        v35.Parent = p33
        v35.Enabled = true
    else
        v35.Enabled = false
        v35:Destroy()
    end
end
v2.CreateController(u11.new())
return nil