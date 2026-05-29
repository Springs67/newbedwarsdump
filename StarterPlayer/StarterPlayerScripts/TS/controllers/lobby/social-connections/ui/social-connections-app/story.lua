local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, script.Parent, "social-connections-core").SocialConnectionsCore
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u2
    --]]
    local v7 = {
        ["type"] = "SocialConnectionsSetAll",
        ["supportTasks"] = {
            ["joinedGroup"] = false
        },
        ["connections"] = {
            ["discord"] = {
                ["verificationCode"] = "A3K4LL1",
                ["validated"] = false,
                ["legacyDiscordVerification"] = false
            }
        }
    }
    u4:dispatch(v7)
    local u8 = u3("SocialConnectionsApp", u5, {}, {}, {
        ["Parent"] = p6
    })
    return function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end