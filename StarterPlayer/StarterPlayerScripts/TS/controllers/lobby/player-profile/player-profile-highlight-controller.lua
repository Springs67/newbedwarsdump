local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameQueryUtil
local u6 = v3.UILayers
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u16 = v1.import(script, script.Parent, "ui", "player-info-billboard").PlayerInfoBillboard
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "PlayerProfileHighlightController"
    end,
    ["__index"] = u14
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
    --]]
    u14.constructor(p20)
    p20.Name = "PlayerProfileHighlightController"
    p20.highlightMaid = u10.new()
end
function u17.KnitStart(u21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u2
        [4] = u6
        [5] = u11
        [6] = u15
        [7] = u5
        [8] = u13
        [9] = u4
        [10] = u9
    --]]
    u14.KnitStart(u21)
    u8.Controllers.EntityHoverController:enable()
    u8.Controllers.EntityHoverController:watchEntityMouseHover(function(p22) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u21
            [4] = u11
            [5] = u8
        --]]
        if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isLayerOpen(u6.MAIN) then
            return nil
        end
        local v23 = p22:getInstance()
        if v23:FindFirstChild("PlayerProfileHighlight") then
            return nil
        end
        local u24 = p22:getPlayer()
        if u24 then
            u21.highlightMaid:GiveTask(u11("Highlight", {
                ["Name"] = "PlayerProfileHighlight",
                ["FillTransparency"] = 1,
                ["OutlineTransparency"] = 0,
                ["Parent"] = v23,
                ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
                ["FillColor"] = Color3.fromRGB(255, 255, 255),
                ["DepthMode"] = Enum.HighlightDepthMode.Occluded
            }))
            u21.highlightMaid:GiveTask(u8.Controllers.MouseController:hookToMouseMovement(function(p25) --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u24
                --]]
                local v26 = p25.X * 1.02
                local v27 = p25.Y * 1.02
                u21:mountPlayerInfoBillboard(u24, (Vector3.new(v26, v27, 0)))
            end))
        end
    end)
    u8.Controllers.EntityHoverController:watchEntityMouseUnHover(function(_) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.highlightMaid:DoCleaning()
        u21:unmountPlayerInfoBillboard()
    end)
    if u15.isLobbyServer() then
        u8.Controllers.MouseController:hookToMouseClick(function(u28, u29) --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u13
                [3] = u4
                [4] = u9
                [5] = u21
            --]]
            local v30 = u28.UnitRay
            local v31 = RaycastParams.new()
            local u32 = u5:raycast(v30.Origin, v30.Direction.Unit * 1000, v31)
            local v33 = u13:GetPlayers()
            local u34 = false
            local function v40(p35) --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u13
                    [3] = u4
                    [4] = u29
                    [5] = u9
                    [6] = u28
                    [7] = u21
                    [8] = u34
                --]]
                local v36 = p35.Character
                local v37
                if v36 then
                    v37 = u32
                    if v37 ~= nil then
                        v37 = v37.Instance
                        if v37 ~= nil then
                            v37 = v37:IsDescendantOf(v36)
                        end
                    end
                else
                    v37 = v36
                end
                if v37 then
                    if p35 == u13.LocalPlayer then
                        return nil
                    end
                    if u4.isMobileControls() then
                        if u29 then
                            u9.Controllers.PlayerProfileUIController:openPlayerProfile(p35)
                        else
                            local v38 = u28.X * 1.02
                            local v39 = u28.Y * 1.02
                            u21:mountPlayerInfoBillboard(p35, (Vector3.new(v38, v39, 0)))
                        end
                    else
                        u9.Controllers.PlayerProfileUIController:openPlayerProfile(p35)
                    end
                    u34 = true
                    return nil
                end
            end
            local v41 = u34
            for v42, v43 in v33 do
                v40(v43, v42 - 1, v33)
            end
            if not v41 then
                u21:unmountPlayerInfoBillboard()
            end
        end)
    end
end
function u17.mountPlayerInfoBillboard(p44, p45, p46) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u16
        [4] = u13
    --]]
    local v47 = p45.Character
    if v47 ~= nil then
        v47 = v47.PrimaryPart
    end
    local v48 = u4.isMobileControls() and "Double Tap" or "Click"
    if p44.playerInfoBillboard then
        p44.playerInfoBillboard = u12.update(p44.playerInfoBillboard, u12.createElement(u16, {
            ["UserId"] = p45.UserId,
            ["HelperText"] = v48,
            ["ScreenPosition"] = p46
        }))
    else
        p44.playerInfoBillboard = u12.mount(u12.createElement(u16, {
            ["UserId"] = p45.UserId,
            ["HelperText"] = v48,
            ["ScreenPosition"] = p46
        }), u13.LocalPlayer:WaitForChild("PlayerGui"))
    end
end
function u17.unmountPlayerInfoBillboard(p49) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p49.playerInfoBillboard then
        u12.unmount(p49.playerInfoBillboard)
        p49.playerInfoBillboard = nil
    end
end
u8.CreateController(u17.new())
return nil