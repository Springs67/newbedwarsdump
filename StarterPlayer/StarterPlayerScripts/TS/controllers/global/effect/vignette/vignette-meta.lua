local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.EXECUTE = "execute"
v5.execute = "EXECUTE"
v6.ZAPPED = "zapped"
v5.zapped = "ZAPPED"
v6.BURN = "burn"
v5.burn = "BURN"
v6.POISON = "poison"
v5.poison = "POISON"
v6.POISON_SPLASH = "poison_splash"
v5.poison_splash = "POISON_SPLASH"
v6.SPEED = "speed"
v5.speed = "SPEED"
v6.HEAL = "heal"
v5.heal = "HEAL"
v6.INVISIBILITY = "invisibility"
v5.invisibility = "INVISIBILITY"
v6.SOUL_REAVER = "soul_reaver"
v5.soul_reaver = "SOUL_REAVER"
v6.DECAY = "decay"
v5.decay = "DECAY"
v6.SOAKED = "soaked"
v5.soaked = "SOAKED"
v6.ANTI_KNOCKBACK = "anti_knockback"
v5.anti_knockback = "ANTI_KNOCKBACK"
v6.REVIVE = "revive"
v5.revive = "REVIVE"
v6.FROSTED = "frosted"
v5.frosted = "FROSTED"
v6.ICE = "ice"
v5.ice = "ICE"
v6.GROUNDED = "grounded"
v5.grounded = "GROUNDED"
v6.SILENCE = "silence"
v5.silence = "SILENCE"
v6.COLD = "cold"
v5.cold = "COLD"
v6.SANDSTORM = "sandstorm"
v5.sandstorm = "SANDSTORM"
local v7 = {}
local v8 = v6.EXECUTE
local v9 = {
    ["particle"] = {
        ["offset"] = -0.5,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["emitters"] = { v3.Assets.Effects.ExecuteVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.9,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["color"] = Color3.fromRGB(120, 0, 143)
    }
}
v7[v8] = v9
local v10 = v6.ZAPPED
local v11 = {
    ["statusEffectType"] = { v4.ZAPPED_2 },
    ["particle"] = {
        ["offset"] = -1,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["emitters"] = { v3.Assets.Effects.LightningVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.85,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["color"] = Color3.fromRGB(18, 66, 255)
    }
}
v7[v10] = v11
local v12 = v6.BURN
local v13 = {
    ["statusEffectType"] = { v4.BURN },
    ["particle"] = {
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["offset"] = -0.5,
        ["emitters"] = { v3.Assets.Effects.BurnVignette }
    }
}
local v17 = {
    ["fadeInDuration"] = 0.5,
    ["fadeOutDuration"] = 0.5,
    ["transparencyFunction"] = {
        ["peakValue"] = 0.9,
        ["function"] = function(p14) --[[ Line: 92 ]]
            local v15 = p14 * 2 * 3.141592653589793
            local v16 = math.cos(v15)
            return math.lerp(0.9, 1, v16)
        end
    },
    ["color"] = Color3.fromRGB(255, 140, 38)
}
v13.vignette = v17
v7[v12] = v13
local v18 = v6.POISON
local v19 = {
    ["statusEffectType"] = { v4.POISON, v4.INFECTED_POISON },
    ["particle"] = {
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["emitters"] = { v3.Assets.Effects.PoisonVignette }
    }
}
local v23 = {
    ["fadeInDuration"] = 0.5,
    ["fadeOutDuration"] = 0.5,
    ["transparencyFunction"] = {
        ["peakValue"] = 0.9,
        ["function"] = function(p20) --[[ Line: 111 ]]
            local v21 = p20 * 2 * 3.141592653589793
            local v22 = math.cos(v21)
            return math.lerp(0.9, 1, v22)
        end
    },
    ["color"] = Color3.fromRGB(64, 135, 64)
}
v19.vignette = v23
v7[v18] = v19
local v24 = v6.SPEED
local v25 = {
    ["statusEffectType"] = { v4.SPEED, v4.SPEED_PIE },
    ["particle"] = {
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["emitters"] = { v3.Assets.Effects.SpeedVignette }
    }
}
local v29 = {
    ["fadeInDuration"] = 0.5,
    ["fadeOutDuration"] = 0.5,
    ["transparencyFunction"] = {
        ["peakValue"] = 0.9,
        ["function"] = function(p26) --[[ Line: 130 ]]
            local v27 = p26 * 3.141592653589793
            local v28 = math.cos(v27)
            return math.lerp(0.9, 1, v28)
        end
    },
    ["color"] = Color3.fromRGB(209, 209, 209)
}
v25.vignette = v29
v7[v24] = v25
local v30 = v6.HEAL
local v31 = {
    ["statusEffectType"] = { v4.HEAL_OVER_TIME, v4.LIFE_STEAL_1 },
    ["particle"] = {
        ["fadeInDuration"] = 0.25,
        ["fadeOutDuration"] = 0.25,
        ["emitters"] = { v3.Assets.Effects.HealVignette }
    }
}
local v35 = {
    ["fadeInDuration"] = 0.25,
    ["fadeOutDuration"] = 0.25,
    ["transparencyFunction"] = {
        ["peakValue"] = 0.85,
        ["function"] = function(p32) --[[ Line: 149 ]]
            local v33 = p32 * 3.141592653589793
            local v34 = math.cos(v33)
            return math.lerp(0.7, 1, v34)
        end
    },
    ["color"] = Color3.fromRGB(115, 255, 115)
}
v31.vignette = v35
v7[v30] = v31
local v36 = v6.INVISIBILITY
local v37 = {
    ["statusEffectType"] = { v4.INVISIBILITY }
}
local v41 = {
    ["fadeInDuration"] = 0.5,
    ["fadeOutDuration"] = 0.5,
    ["transparencyFunction"] = {
        ["peakValue"] = 0.9,
        ["function"] = function(p38) --[[ Line: 163 ]]
            local v39 = p38 * 3.141592653589793
            local v40 = math.cos(v39)
            return math.lerp(0.9, 1, v40)
        end
    },
    ["color"] = Color3.fromRGB(87, 87, 87)
}
v37.vignette = v41
v7[v36] = v37
local v42 = v6.SOUL_REAVER
local v43 = {
    ["particle"] = {
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["emitters"] = { v3.Assets.Effects.SoulReaverVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.8,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["color"] = Color3.fromRGB(145, 227, 176)
    }
}
v7[v42] = v43
local v44 = v6.DECAY
local v45 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.DecayVignette }
    }
}
v7[v44] = v45
local v46 = v6.POISON_SPLASH
local v47 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.Potion.PoisonSplashPotion.Attachment.Splash }
    }
}
v7[v46] = v47
local v48 = v6.SOAKED
local v49 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.SoakedVignette },
        ["shouldShow"] = function() --[[ Name: shouldShow, Line 198 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
        end
    }
}
v7[v48] = v49
local v50 = v6.ANTI_KNOCKBACK
local v51 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.AntiKnockbackVignette },
        ["shouldShow"] = function() --[[ Name: shouldShow, Line 207 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
        end
    }
}
v7[v50] = v51
local v52 = v6.REVIVE
local v53 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.ReviveVignette }
    }
}
v7[v52] = v53
local v54 = v6.FROSTED
local v55 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.FrostedVignette, v3.Assets.Effects.SnowVignette },
        ["shouldShow"] = function() --[[ Name: shouldShow, Line 220 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
        end
    }
}
v7[v54] = v55
local v56 = v6.COLD
local v57 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.FrostedVignette, v3.Assets.Effects.SnowVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.6,
        ["fadeInDuration"] = 1.5,
        ["fadeOutDuration"] = 1.5,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v7[v56] = v57
local v58 = v6.SANDSTORM
local v59 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.SandstormSandVignette, v3.Assets.Effects.SandstormDustVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.65,
        ["fadeInDuration"] = 1.5,
        ["fadeOutDuration"] = 1.5,
        ["color"] = Color3.fromRGB(255, 186, 84)
    }
}
v7[v58] = v59
local v60 = v6.ICE
local v61 = {
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.IceVignette },
        ["shouldShow"] = function() --[[ Name: shouldShow, Line 251 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
        end
    }
}
v7[v60] = v61
local v62 = v6.GROUNDED
local v63 = {
    ["statusEffectType"] = { v4.GROUNDED },
    ["particle"] = {
        ["emitters"] = { v3.Assets.Effects.GroundedVignette }
    },
    ["vignette"] = {
        ["transparency"] = 0.8,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["color"] = Color3.fromRGB(255, 240, 171)
    }
}
v7[v62] = v63
local v64 = v6.SILENCE
local v65 = {
    ["statusEffectType"] = { v4.SILENCE },
    ["vignette"] = {
        ["transparency"] = 0.8,
        ["fadeInDuration"] = 0.5,
        ["fadeOutDuration"] = 0.5,
        ["color"] = Color3.fromRGB(199, 82, 82)
    }
}
v7[v64] = v65
return {
    ["VignetteType"] = v6,
    ["VignetteMeta"] = v7
}