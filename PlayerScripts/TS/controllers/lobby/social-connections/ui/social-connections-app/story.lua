-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local SocialConnectionsCore = RuntimeLib.import(script, script.Parent, "social-connections-core").SocialConnectionsCore;

return function(p2) -- Line: 7
    -- upvalues: ClientStore (copy), CreateRoduxApp (copy), SocialConnectionsCore (copy), u1 (copy)
    ClientStore:dispatch({
        type = "SocialConnectionsSetAll",
        supportTasks = {
            joinedGroup = false
        },
        connections = {
            discord = {
                verificationCode = "A3K4LL1",
                validated = false,
                legacyDiscordVerification = false
            }
        }
    });
    local u3 = CreateRoduxApp("SocialConnectionsApp", SocialConnectionsCore, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 24
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;