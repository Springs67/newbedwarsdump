local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u8 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DiscoEmoteController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p12)
    p12.Name = "DiscoEmoteController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u7
        [4] = u8
        [5] = u4
        [6] = u5
    --]]
    u6.KnitStart(p13)
    local v14 = u2.Controllers.EmoteHandlerController
    local v15 = u7.DISCO
    local u16 = u8
    local u17 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
            return "Anonymous"
        end,
        ["__index"] = u16
    })
    u17.__index = u17
    function u17.new(...) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v18 = u17
        local v19 = setmetatable({}, v18)
        return v19:constructor(...) or v19
    end
    function u17.constructor(p20, ...) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.constructor(p20, ...)
    end
    function u17.onEnable(_, _, p21, _, p22) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
        --]]
        local u23 = u4.Assets.Misc.DiscoFloorTile:Clone()
        for v24, v25 in u23:GetDescendants() do
            local _ = v24 - 1
            if v25:IsA("BasePart") then
                v25.CanQuery = false
                v25.CanCollide = false
            end
        end
        u23.Parent = u5
        local v26 = p21:GetPivot()
        local v27 = p21.Humanoid.HipHeight + p21.PrimaryPart.Size.Y / 2
        u23:PivotTo(v26 - Vector3.new(0, v27, 0))
        local u28 = true
        task.spawn(function() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u23
            --]]
            local v29 = false
            while true do
                local v30 = u28
                if v30 then
                    v30 = task.wait(0.5)
                end
                if v30 == 0 or (v30 ~= v30 or not v30) then
                    return
                end
                local v31 = u23.Tile1
                local v32
                if v29 then
                    v32 = Color3.fromRGB(255, 0, 0)
                else
                    v32 = Color3.fromRGB(255, 102, 204)
                end
                v31.Color = v32
                local v33 = u23.Tile2
                local v34
                if v29 then
                    v34 = Color3.fromRGB(255, 102, 204)
                else
                    v34 = Color3.fromRGB(255, 0, 0)
                end
                v33.Color = v34
                local v35 = u23.Tile3
                local v36
                if v29 then
                    v36 = Color3.fromRGB(255, 0, 0)
                else
                    v36 = Color3.fromRGB(255, 102, 204)
                end
                v35.Color = v36
                local v37 = u23.Tile4
                local v38
                if v29 then
                    v38 = Color3.fromRGB(255, 102, 204)
                else
                    v38 = Color3.fromRGB(255, 0, 0)
                end
                v37.Color = v38
                v29 = not v29
            end
        end)
        p22:GiveTask(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u23
            --]]
            u28 = false
            u23:Destroy()
        end)
    end
    function u17.onDisable(_, _, _, _) --[[ Line: 87 ]] end
    v14:registerHandler(v15, u17)
end
u2.CreateController(u9.new())
return nil