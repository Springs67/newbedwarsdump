local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "ab-tests", "ab-test-ids").ABTestId
local v2 = {
    [v1.SHIFT_LOCK_DEFAULT] = {
        ["values"] = { true, false },
        ["ratios"] = { 0.5, 0.5 }
    },
    [v1.SEND_SESSION_DATA] = {
        ["values"] = { true, false },
        ["ratios"] = { 0.1, 0.9 }
    },
    [v1.REWARD_DATA] = {
        ["values"] = { true, false },
        ["ratios"] = { 0.1, 0.9 }
    }
}
return {
    ["ABTestConfig"] = v2
}