-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local v1 = {};
local v2 = setmetatable({}, {
    __index = v1
});
v2.EXECUTE = "execute";
v1.execute = "EXECUTE";
v2.ZAPPED = "zapped";
v1.zapped = "ZAPPED";
v2.BURN = "burn";
v1.burn = "BURN";
v2.POISON = "poison";
v1.poison = "POISON";
v2.POISON_SPLASH = "poison_splash";
v1.poison_splash = "POISON_SPLASH";
v2.SPEED = "speed";
v1.speed = "SPEED";
v2.HEAL = "heal";
v1.heal = "HEAL";
v2.INVISIBILITY = "invisibility";
v1.invisibility = "INVISIBILITY";
v2.SOUL_REAVER = "soul_reaver";
v1.soul_reaver = "SOUL_REAVER";
v2.DECAY = "decay";
v1.decay = "DECAY";
v2.SOAKED = "soaked";
v1.soaked = "SOAKED";
v2.ANTI_KNOCKBACK = "anti_knockback";
v1.anti_knockback = "ANTI_KNOCKBACK";
v2.REVIVE = "revive";
v1.revive = "REVIVE";
v2.FROSTED = "frosted";
v1.frosted = "FROSTED";
v2.ICE = "ice";
v1.ice = "ICE";
v2.GROUNDED = "grounded";
v1.grounded = "GROUNDED";
v2.SILENCE = "silence";
v1.silence = "SILENCE";
v2.COLD = "cold";
v1.cold = "COLD";
v2.SANDSTORM = "sandstorm";
v1.sandstorm = "SANDSTORM";

return {
    VignetteType = v2,
    VignetteMeta = {
        [v2.EXECUTE] = {
            particle = {
                offset = -0.5,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                emitters = { ReplicatedStorage.Assets.Effects.ExecuteVignette }
            },
            vignette = {
                transparency = 0.9,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                color = Color3.fromRGB(120, 0, 143)
            }
        },
        [v2.ZAPPED] = {
            statusEffectType = { StatusEffectType.ZAPPED_2 },
            particle = {
                offset = -1,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                emitters = { ReplicatedStorage.Assets.Effects.LightningVignette }
            },
            vignette = {
                transparency = 0.85,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                color = Color3.fromRGB(18, 66, 255)
            }
        },
        [v2.BURN] = {
            statusEffectType = { StatusEffectType.BURN },
            particle = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                offset = -0.5,
                emitters = { ReplicatedStorage.Assets.Effects.BurnVignette }
            },
            vignette = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                transparencyFunction = {
                    peakValue = 0.9,

                    ["function"] = function(p3) -- Line: 92
                        local v4 = math.cos(p3 * 2 * 3.141592653589793);

                        return math.lerp(0.9, 1, v4);
                    end
                },
                color = Color3.fromRGB(255, 140, 38)
            }
        },
        [v2.POISON] = {
            statusEffectType = { StatusEffectType.POISON, StatusEffectType.INFECTED_POISON },
            particle = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                emitters = { ReplicatedStorage.Assets.Effects.PoisonVignette }
            },
            vignette = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                transparencyFunction = {
                    peakValue = 0.9,

                    ["function"] = function(p5) -- Line: 111
                        local v6 = math.cos(p5 * 2 * 3.141592653589793);

                        return math.lerp(0.9, 1, v6);
                    end
                },
                color = Color3.fromRGB(64, 135, 64)
            }
        },
        [v2.SPEED] = {
            statusEffectType = { StatusEffectType.SPEED, StatusEffectType.SPEED_PIE },
            particle = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                emitters = { ReplicatedStorage.Assets.Effects.SpeedVignette }
            },
            vignette = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                transparencyFunction = {
                    peakValue = 0.9,

                    ["function"] = function(p7) -- Line: 130
                        local v8 = math.cos(p7 * 3.141592653589793);

                        return math.lerp(0.9, 1, v8);
                    end
                },
                color = Color3.fromRGB(209, 209, 209)
            }
        },
        [v2.HEAL] = {
            statusEffectType = { StatusEffectType.HEAL_OVER_TIME, StatusEffectType.LIFE_STEAL_1 },
            particle = {
                fadeInDuration = 0.25,
                fadeOutDuration = 0.25,
                emitters = { ReplicatedStorage.Assets.Effects.HealVignette }
            },
            vignette = {
                fadeInDuration = 0.25,
                fadeOutDuration = 0.25,
                transparencyFunction = {
                    peakValue = 0.85,

                    ["function"] = function(p9) -- Line: 149
                        local v10 = math.cos(p9 * 3.141592653589793);

                        return math.lerp(0.7, 1, v10);
                    end
                },
                color = Color3.fromRGB(115, 255, 115)
            }
        },
        [v2.INVISIBILITY] = {
            statusEffectType = { StatusEffectType.INVISIBILITY },
            vignette = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                transparencyFunction = {
                    peakValue = 0.9,

                    ["function"] = function(p11) -- Line: 163
                        local v12 = math.cos(p11 * 3.141592653589793);

                        return math.lerp(0.9, 1, v12);
                    end
                },
                color = Color3.fromRGB(87, 87, 87)
            }
        },
        [v2.SOUL_REAVER] = {
            particle = {
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                emitters = { ReplicatedStorage.Assets.Effects.SoulReaverVignette }
            },
            vignette = {
                transparency = 0.8,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                color = Color3.fromRGB(145, 227, 176)
            }
        },
        [v2.DECAY] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.DecayVignette }
            }
        },
        [v2.POISON_SPLASH] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.Potion.PoisonSplashPotion.Attachment.Splash }
            }
        },
        [v2.SOAKED] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.SoakedVignette },

                shouldShow = function() -- Line: 198, Name: shouldShow
                    -- upvalues: KnitClient (copy)
                    return KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;
                end
            }
        },
        [v2.ANTI_KNOCKBACK] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.AntiKnockbackVignette },

                shouldShow = function() -- Line: 207, Name: shouldShow
                    -- upvalues: KnitClient (copy)
                    return KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;
                end
            }
        },
        [v2.REVIVE] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.ReviveVignette }
            }
        },
        [v2.FROSTED] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.FrostedVignette, ReplicatedStorage.Assets.Effects.SnowVignette },

                shouldShow = function() -- Line: 220, Name: shouldShow
                    -- upvalues: KnitClient (copy)
                    return KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;
                end
            }
        },
        [v2.COLD] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.FrostedVignette, ReplicatedStorage.Assets.Effects.SnowVignette }
            },
            vignette = {
                transparency = 0.6,
                fadeInDuration = 1.5,
                fadeOutDuration = 1.5,
                color = Color3.fromRGB(255, 255, 255)
            }
        },
        [v2.SANDSTORM] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.SandstormSandVignette, ReplicatedStorage.Assets.Effects.SandstormDustVignette }
            },
            vignette = {
                transparency = 0.65,
                fadeInDuration = 1.5,
                fadeOutDuration = 1.5,
                color = Color3.fromRGB(255, 186, 84)
            }
        },
        [v2.ICE] = {
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.IceVignette },

                shouldShow = function() -- Line: 251, Name: shouldShow
                    -- upvalues: KnitClient (copy)
                    return KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;
                end
            }
        },
        [v2.GROUNDED] = {
            statusEffectType = { StatusEffectType.GROUNDED },
            particle = {
                emitters = { ReplicatedStorage.Assets.Effects.GroundedVignette }
            },
            vignette = {
                transparency = 0.8,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                color = Color3.fromRGB(255, 240, 171)
            }
        },
        [v2.SILENCE] = {
            statusEffectType = { StatusEffectType.SILENCE },
            vignette = {
                transparency = 0.8,
                fadeInDuration = 0.5,
                fadeOutDuration = 0.5,
                color = Color3.fromRGB(199, 82, 82)
            }
        }
    }
};