local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v4 = {
    ["guided_missile"] = {
        ["lifetime"] = 8,
        ["guidedProjectileModel"] = "guided_missile",
        ["speed"] = 60,
        ["flightRotation"] = Vector3.new(0, 0, 0),
        ["cameraOffset"] = Vector3.new(0, 2, 8),
        ["explosionType"] = v2.GUIDED_MISSILE,
        ["yAngleLimit"] = {
            ["lower"] = -0.8,
            ["upper"] = 0.8
        }
    },
    ["heat_seeking_rock"] = {
        ["lifetime"] = 10,
        ["guidedProjectileModel"] = "heat_seeking_rock",
        ["speed"] = 60,
        ["flightRotation"] = Vector3.new(0, 0, 0),
        ["cameraOffset"] = Vector3.new(0, 8, 30),
        ["fov"] = 120,
        ["explosionType"] = v2.GUIDED_MISSILE,
        ["yAngleLimit"] = {
            ["lower"] = -0.8,
            ["upper"] = 0.8
        }
    },
    ["drone"] = {
        ["lifetime"] = 500,
        ["guidedProjectileModel"] = "drone",
        ["speed"] = 0,
        ["cameraOffset"] = Vector3.new(0, 0, 0),
        ["doNotSetVelocity"] = true,
        ["persistent"] = true,
        ["modelSpringSettings"] = "Instant",
        ["dontShowCooldown"] = true,
        ["dontDetonateOnEntityNearby"] = true,
        ["observeExplosionTime"] = 0.6,
        ["explosionType"] = v2.GUIDED_MISSILE,
        ["yAngleLimit"] = {
            ["lower"] = -0.8,
            ["upper"] = 0.8
        },
        ["tags"] = { "Drone" },
        ["deploySound"] = v3.DRONE_DEPLOY,
        ["loopSound"] = v3.DRONE_PROPELLER_LOOP
    },
    ["tnt_wars_drone"] = {
        ["lifetime"] = 500,
        ["guidedProjectileModel"] = "tnt_wars_drone",
        ["speed"] = 0,
        ["cameraOffset"] = Vector3.new(0, 0, 0),
        ["doNotSetVelocity"] = true,
        ["persistent"] = true,
        ["modelSpringSettings"] = "Instant",
        ["dontShowCooldown"] = true,
        ["dontDetonateOnEntityNearby"] = true,
        ["observeExplosionTime"] = 0.6,
        ["explosionType"] = v2.GUIDED_MISSILE,
        ["yAngleLimit"] = {
            ["lower"] = -0.8,
            ["upper"] = 0.8
        },
        ["tags"] = { "TNTWarsDrone" },
        ["deploySound"] = v3.DRONE_DEPLOY,
        ["loopSound"] = v3.DRONE_PROPELLER_LOOP
    }
}
return {
    ["GuidedProjectileMeta"] = v4
}