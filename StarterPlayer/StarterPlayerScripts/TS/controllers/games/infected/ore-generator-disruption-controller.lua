local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "OreGeneratorDisruptionController"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p16)
    p16.Name = "OreGeneratorDisruptionController"
    p16.disruptionPrompts = {}
    p16.fixPrompts = {}
end
function u13.KnitStart(u17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u12
        [4] = u9
        [5] = u7
        [6] = u2
        [7] = u10
        [8] = u11
    --]]
    u8.KnitStart(u17)
    u5.Controllers.PreloadController:runPreload({
        ["sounds"] = { u12.TESLA_SHORT_CIRCUIT_1, u12.GATHER_BOT_CONSTRUCTION },
        ["loadOnGameTypes"] = { u9.INFECTED }
    })
    u7.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u17
            [3] = u2
            [4] = u10
        --]]
        local v18 = u7.LocalPlayer:GetAttribute("InfectedVariantType")
        u17:initializeDisabledPrompts()
        if v18 ~= nil then
            for v19, v20 in u2.values(u17.fixPrompts) do
                local _ = v19 - 1
                v20.Enabled = false
                local _ = v20.Enabled
            end
        end
        for v21, v22 in u2.values(u17.disruptionPrompts) do
            local _ = v21 - 1
            v22.Enabled = false
            local _ = v22.Enabled
        end
        if v18 == u10.DISRUPTOR then
            u17:enableActiveDisruptionPrompts()
        end
    end)
    u11.Client:Get("OreGeneratorDisruptionStatusChanged"):Connect(function(p23) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u7
            [3] = u10
        --]]
        u17:initializeDisabledPrompts()
        local v24 = u7.LocalPlayer:GetAttribute("InfectedVariantType")
        if v24 == u10.DISRUPTOR then
            u17.disruptionPrompts[p23.generatorId].Enabled = not p23.isDisrupted
        elseif v24 == nil then
            u17.fixPrompts[p23.generatorId].Enabled = p23.isDisrupted
        end
    end)
end
function u13.tryRetrieveAllOreGenerators(_) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    return u1.Promise.retryWithDelay(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u11
        --]]
        return u1.Promise.new(function(u25, u26) --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u11
            --]]
            u1.try(function() --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u11
                --]]
                u25(u11.Client:Get("RetrieveAllGlobalOreGenerators"):CallServer())
            end, function(p27) --[[ Line: 92 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26(p27)
            end)
        end)
    end, 3, 1)
end
function u13.initializeDisabledPrompts(p28) --[[ Line: 98 ]]
    if next(p28.fixPrompts) == nil or next(p28.disruptionPrompts) == nil then
        table.clear(p28.fixPrompts)
        table.clear(p28.disruptionPrompts)
        p28:setupOreGenProximityPrompts():await()
    end
end
function u13.setupOreGenProximityPrompts(u29) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u29:tryRetrieveAllOreGenerators():andThen(function(p30) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        for v31, v32 in p30 do
            local _ = v31 - 1
            local v33 = u29:createOreGeneratorProximityPrompt(v32.adornee, v32.id, false)
            local v34 = u29:createOreGeneratorProximityPrompt(v32.adornee, v32.id, true)
            u29.fixPrompts[v32.id] = v33
            u29.disruptionPrompts[v32.id] = v34
        end
    end, function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.Promise.new(function(_, p35) --[[ Line: 122 ]]
            return p35("Failed to create Infected Disruptor proximity prompts.")
        end)
    end)
end
function u13.createOreGeneratorProximityPrompt(_, p36, u37, u38) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u3
        [4] = u11
    --]]
    local v39 = u38 and { "DisruptOreGenerator", 9, "Disrupt Generator" } or { "FixOreGenerator", 5, "Fix Generator" }
    local v40 = v39[1]
    local v41 = v39[2]
    local v42 = v39[3]
    local v43 = u6.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = true,
        ["MaxActivationDistance"] = 12,
        ["Enabled"] = false,
        ["Name"] = v40 .. "-" .. u37,
        ["HoldDuration"] = v41,
        ["Parent"] = p36,
        ["ActionText"] = v42
    })
    v43.Triggered:Connect(function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u12
            [3] = u3
            [4] = u11
            [5] = u37
        --]]
        local v44
        if u38 then
            v44 = u12.TESLA_SHORT_CIRCUIT_1
        else
            v44 = u12.GATHER_BOT_CONSTRUCTION
        end
        u3:playSound(v44)
        local v45 = {
            ["generatorId"] = u37,
            ["isDisrupted"] = u38
        }
        u11.Client:Get("OreGeneratorDisruptionStatusUpdate"):SendToServer(v45)
    end)
    return v43
end
function u13.enableActiveDisruptionPrompts(u46) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u46:tryRetrieveAllOreGenerators():andThen(function(p47) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        local v48 = 0
        local v49 = {}
        for v50, v51 in p47 do
            local _ = v50 - 1
            if not v51.isDisrupted == true then
                v48 = v48 + 1
                v49[v48] = v51
            end
        end
        for v52, v53 in v49 do
            local _ = v52 - 1
            if u46.disruptionPrompts[v53.id] ~= nil then
                u46.disruptionPrompts[v53.id].Enabled = true
            end
        end
    end, function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.Promise.new(function(_, p54) --[[ Line: 180 ]]
            return p54("Failed to create Infected Disruptor proximity prompts.")
        end)
    end)
end
u5.CreateController(u13.new())
return nil