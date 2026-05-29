local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local function u12(u5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
        [3] = u3
        [4] = u12
    --]]
    if u5:IsA("ModuleScript") and u4.endsWith(u5.Name, ".module") then
        u1.Promise.new(function(u6, u7) --[[ Line: 9 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u5
            --]]
            u1.try(function() --[[ Line: 10 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                --]]
                u6(require(u5))
            end, function(p8) --[[ Line: 12 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                u7(p8)
            end)
        end):timeout(10):catch(function(p9) --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
            --]]
            u3.Warn("Error while trying to require shared module " .. u5.Name .. " with reason: " .. tostring(p9))
        end):await()
    elseif u5:IsA("Folder") then
        for v10, v11 in u5:GetChildren() do
            local _ = v10 - 1
            u12(v11)
        end
    end
end
local v13 = {}
local function u21(u14) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
        [3] = u3
        [4] = u2
    --]]
    u1.Promise.new(function(p15, p16) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v17 = script.Parent
        if v17 ~= nil then
            v17 = v17:WaitForChild(u14, 9.5)
        end
        if v17 then
            p15(v17)
        else
            p16()
        end
    end):timeout(10):andThen(function(p18) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        for _, v19 in p18:GetChildren() or {} do
            u12(v19)
        end
    end):catch(function(p20) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u14
            [3] = u2
        --]]
        return u3.Warn("[SETUP] Failed to setup shared " .. u14 .. " modules for reason " .. u2(p20))
    end):await()
end
function v13.loadGlobalModules() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21("global")
end
function v13.loadGameModules(u22) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u1
        [3] = u12
        [4] = u3
        [5] = u2
    --]]
    u21("game")
    u1.Promise.new(function(p23, p24) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v25 = script.Parent
        if v25 ~= nil then
            v25 = v25:WaitForChild("games", 9.5)
            if v25 ~= nil then
                v25 = v25:WaitForChild(u22, 9.5)
            end
        end
        if v25 then
            p23(v25)
        else
            p24()
        end
    end):timeout(10):andThen(function(p26) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        for _, v27 in p26:GetChildren() or {} do
            u12(v27)
        end
    end):catch(function(p28) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u22
            [3] = u2
        --]]
        return u3.Warn("[SETUP] Failed to setup shared " .. u22 .. " modules for reason " .. u2(p28))
    end):await()
end
function v13.loadLobbyModules() --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21("lobby")
end
function v13.loadAfkModules() --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21("afk-place")
end
return {
    ["SharedModules"] = v13
}