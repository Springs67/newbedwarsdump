local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "SnakeShrineController"
    end,
    ["__index"] = u8
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
        [1] = u8
        [2] = u11
    --]]
    u8.constructor(p17)
    p17.Name = "SnakeShrineController"
    p17.logger = u11.getLogger("SnakeShrineController")
    p17.shrinePromptsByTeam = {}
end
function u14.KnitStart(u18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u4
        [5] = u2
        [6] = u10
        [7] = u12
        [8] = u9
    --]]
    u8.KnitStart(u18)
    if u7.Controllers.SpectateController:isSpectating() then
        return nil
    end
    u6("SnakeShrine", function(u19) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u2
            [4] = u10
            [5] = u18
        --]]
        local u20 = u19:GetAttribute("Team")
        if u20 == "" or not u20 then
            u18.logger:Error("Failed to get team for snake shrine")
        else
            local v21 = u7.Controllers.ProximityPromptController:createProximityPrompt({
                ["ActionText"] = "Open",
                ["ObjectText"] = "Snake Shrine",
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 8,
                ["Parent"] = u19,
                ["ClickablePrompt"] = u4.isMobileControls()
            })
            v21.Triggered:Connect(function(p22) --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u2
                    [3] = u10
                    [4] = u20
                    [5] = u19
                --]]
                local v23 = u7.Controllers.TeamController:getPlayerTeam(p22)
                if v23 ~= nil then
                    v23 = v23.name
                end
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.SNAKE_SHRINE, {
                    ["TeamId"] = u20,
                    ["IsHomeBase"] = u20 == v23,
                    ["SnakeShrineInstance"] = u19
                })
            end)
            u18.shrinePromptsByTeam[u20] = v21
        end
    end)
    u12.Client:Get("SnakeShrinePurchaseStateUpdate"):Connect(function(p24) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:dispatch({
            ["type"] = "UpdateSnakeShrinePurchaseState",
            ["costMultipliers"] = p24.purchaseMultipliers,
            ["buffCounts"] = p24.buffCount,
            ["activeBuffCounts"] = p24.activeBuffCount
        })
    end)
    u9.changed:connect(function(p25, p26) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v27 = p25.Game.myTeam
        if v27 ~= nil then
            v27 = v27.id
        end
        local v28 = p26.Game.myTeam
        if v28 ~= nil then
            v28 = v28.id
        end
        if v27 ~= v28 or p25.Game.spectating then
            u18:resetPrompts()
        end
    end)
    u12.Client:Get("SnakeFountainEffect"):Connect(function(p29) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:snakeFountainEffect(p29.instance)
    end)
end
function u14.resetPrompts(p30) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v31 = u9:getState().Game.myTeam
    if v31 ~= nil then
        v31 = v31.id
    end
    for v32, v33 in p30.shrinePromptsByTeam do
        v33.Enabled = v32 == v31
    end
end
function u14.snakeFountainEffect(_, u34) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
    --]]
    local v35 = u34:GetAttribute("InEffect")
    if v35 ~= 0 and (v35 == v35 and (v35 ~= "" and v35)) then
        return nil
    end
    u34:SetAttribute("InEffect", true)
    local u36 = u34:FindFirstChild("eyes")
    if u36 then
        u36.Material = Enum.Material.Neon
    end
    for v37, v38 in u34:GetDescendants() do
        local _ = v37 - 1
        if v38.Name == "Water" and v38:IsA("Beam") then
            v38.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56))
        end
    end
    task.delay(5, function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u34
        --]]
        if u36 then
            u36.Material = Enum.Material.Plastic
        end
        for v39, v40 in u34:GetDescendants() do
            local _ = v39 - 1
            if v40.Name == "Water" and v40:IsA("Beam") then
                v40.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
            end
        end
        u34:SetAttribute("InEffect", false)
    end)
    u5:playSound(u13.SNAKE_SHRINE_TRIBUTE, {
        ["volumeMultiplier"] = 0.3,
        ["position"] = u34.Position
    })
end
u7.CreateController(u14.new())
return nil