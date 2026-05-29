local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "ProfileDataKeybindLoader"
    end
})
u3.__index = u3
function u3.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(_) --[[ Line: 16 ]] end
function u3.loadKeybinds(_) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v7, v8 = u1.try(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        local v6 = u2.Client:Get("RetrieveProfileDataKeybinds"):CallServer()
        if v6 then
            return u1.TRY_RETURN, {
                {
                    ["keyboard"] = v6.keyboardKeybindDefinition,
                    ["gamepad"] = v6.gamepadKeybindDefinition
                }
            }
        else
            return u1.TRY_RETURN, { nil }
        end
    end, function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.TRY_RETURN, { nil }
    end)
    if v7 then
        return unpack(v8)
    end
end
return {
    ["ProfileDataKeybindLoader"] = u3
}