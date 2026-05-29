local v6 = {
    ["CheckIcon"] = function(p1) --[[ Name: CheckIcon, Line 3 ]]
        return p1 >= 2 and {
            ["Image"] = "rbxassetid://7844324651",
            ["ImageRectOffset"] = Vector2.new(0, 255),
            ["ImageRectSize"] = Vector2.new(45, 34)
        } or {
            ["Image"] = "rbxassetid://70458118592032",
            ["ImageRectOffset"] = Vector2.new(0, 931),
            ["ImageRectSize"] = Vector2.new(23, 17)
        }
    end,
    ["CloseIcon"] = function(p2) --[[ Name: CloseIcon, Line 18 ]]
        return p2 >= 2 and {
            ["Image"] = "rbxassetid://7844324651",
            ["ImageRectOffset"] = Vector2.new(255, 84),
            ["ImageRectSize"] = Vector2.new(24, 24)
        } or {
            ["Image"] = "rbxassetid://70458118592032",
            ["ImageRectOffset"] = Vector2.new(401, 931),
            ["ImageRectSize"] = Vector2.new(12, 12)
        }
    end,
    ["CrownIcon"] = function(p3) --[[ Name: CrownIcon, Line 33 ]]
        return p3 >= 2 and {
            ["Image"] = "rbxassetid://7844324651",
            ["ImageRectOffset"] = Vector2.new(329, 0),
            ["ImageRectSize"] = Vector2.new(32, 26)
        } or {
            ["Image"] = "rbxassetid://70458118592032",
            ["ImageRectOffset"] = Vector2.new(931, 401),
            ["ImageRectSize"] = Vector2.new(16, 13)
        }
    end,
    ["Explode1"] = "rbxassetid://7843586735",
    ["Explode2"] = "rbxassetid://7843594723",
    ["Explode3"] = "rbxassetid://7843594957",
    ["Explode4"] = "rbxassetid://7843595020",
    ["Explode5"] = "rbxassetid://7843624755",
    ["Explode6"] = "rbxassetid://7843624866",
    ["FunnyShape1"] = "rbxassetid://17575802118",
    ["FunnyShape2"] = "rbxassetid://17575802184",
    ["FunnyShape3"] = "rbxassetid://17575802265",
    ["Indicator"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(659, 802),
        ["ImageRectSize"] = Vector2.new(130, 107)
    },
    ["InteractionPromptBackground"] = function(p4) --[[ Name: InteractionPromptBackground, Line 62 ]]
        return p4 >= 2 and {
            ["Image"] = "rbxassetid://7844324651",
            ["ImageRectOffset"] = Vector2.new(0, 0),
            ["ImageRectSize"] = Vector2.new(254, 254)
        } or {
            ["Image"] = "rbxassetid://70458118592032",
            ["ImageRectOffset"] = Vector2.new(802, 659),
            ["ImageRectSize"] = Vector2.new(127, 127)
        }
    end,
    ["InteractionPromptHand"] = function(p5) --[[ Name: InteractionPromptHand, Line 77 ]]
        return p5 >= 2 and {
            ["Image"] = "rbxassetid://7844324651",
            ["ImageRectOffset"] = Vector2.new(255, 0),
            ["ImageRectSize"] = Vector2.new(73, 83)
        } or {
            ["Image"] = "rbxassetid://70458118592032",
            ["ImageRectOffset"] = Vector2.new(931, 0),
            ["ImageRectSize"] = Vector2.new(37, 42)
        }
    end,
    ["NoImage"] = "rbxassetid://7843680216",
    ["Shard1"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(802, 0),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["Shard2"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(0, 802),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["Shard3"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(802, 401),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["Shard4"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(401, 802),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardCarrotOutline"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(802, 129),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardCarrot_1"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(129, 802),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardCarrot_2"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(802, 530),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardCarrot_3"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(530, 802),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardCarrot_4"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(802, 258),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardOutline"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(258, 802),
        ["ImageRectSize"] = Vector2.new(128, 128)
    },
    ["ShardVictoriousOutline"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(0, 0),
        ["ImageRectSize"] = Vector2.new(400, 400)
    },
    ["ShardVictorious_1"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(401, 0),
        ["ImageRectSize"] = Vector2.new(400, 400)
    },
    ["ShardVictorious_2"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(0, 401),
        ["ImageRectSize"] = Vector2.new(400, 400)
    },
    ["ShardVictorious_3"] = {
        ["Image"] = "rbxassetid://70458118592032",
        ["ImageRectOffset"] = Vector2.new(401, 401),
        ["ImageRectSize"] = Vector2.new(400, 400)
    },
    ["ShardVictorious_4"] = {
        ["Image"] = "rbxassetid://112787992229888",
        ["ImageRectOffset"] = Vector2.new(0, 0),
        ["ImageRectSize"] = Vector2.new(400, 400)
    },
    ["blocks"] = {
        ["andesite"] = {
            ["icon"] = "rbxassetid://9072552631",
            ["s"] = "rbxassetid://9072525162"
        },
        ["andesite_polished"] = {
            ["icon"] = "rbxassetid://9072552793",
            ["s"] = "rbxassetid://9072552916"
        },
        ["aquamarine_lantern"] = {
            ["icon"] = "rbxassetid://12948863284",
            ["s"] = "rbxassetid://12946930317"
        },
        ["barrel"] = {
            ["icon"] = "rbxassetid://14968393558",
            ["s"] = "rbxassetid://14968393626",
            ["td"] = "rbxassetid://14968393691"
        },
        ["barrier"] = {
            ["icon"] = "rbxassetid://10569969807",
            ["s"] = "rbxassetid://10569969967"
        },
        ["bedrock"] = {
            ["icon"] = "rbxassetid://9207283973",
            ["s"] = "rbxassetid://9207284200"
        },
        ["birch_log"] = {
            ["icon"] = "rbxassetid://7884365859",
            ["s"] = "rbxassetid://16991765391",
            ["td"] = "rbxassetid://16991765432"
        },
        ["blue_tile"] = {
            ["s"] = "rbxassetid://16238617352"
        },
        ["bookshelf"] = {
            ["icon"] = "rbxassetid://10866360547",
            ["s"] = "rbxassetid://10866119486",
            ["td"] = "rbxassetid://10866360672"
        },
        ["brick"] = {
            ["icon"] = "rbxassetid://7884366460",
            ["s"] = "rbxassetid://12948863341"
        },
        ["ceramic"] = {
            ["icon"] = "rbxassetid://7884366622",
            ["s"] = "rbxassetid://16991765474"
        },
        ["christmas_drawbridge"] = {
            ["icon"] = "rbxassetid://122137461128449",
            ["s"] = "rbxassetid://97798420366864"
        },
        ["christmas_scaffold"] = {
            ["icon"] = "rbxassetid://116346363779293",
            ["s"] = "rbxassetid://127832405061521",
            ["td"] = "rbxassetid://140661205602211"
        },
        ["clay"] = {
            ["icon"] = "rbxassetid://7884366829",
            ["s"] = "rbxassetid://7861526072"
        },
        ["clay_black"] = {
            ["icon"] = "rbxassetid://7884367004",
            ["s"] = "rbxassetid://16991765519"
        },
        ["clay_blue"] = {
            ["icon"] = "rbxassetid://7884367119",
            ["s"] = "rbxassetid://16991765574"
        },
        ["clay_cyan"] = {
            ["icon"] = "rbxassetid://7884367212",
            ["s"] = "rbxassetid://16991765629"
        },
        ["clay_dark_brown"] = {
            ["icon"] = "rbxassetid://7884367299",
            ["s"] = "rbxassetid://16991765722"
        },
        ["clay_dark_green"] = {
            ["icon"] = "rbxassetid://7884367424",
            ["s"] = "rbxassetid://16991765812"
        },
        ["clay_gray"] = {
            ["icon"] = "rbxassetid://7884367563",
            ["s"] = "rbxassetid://16991765869"
        },
        ["clay_green"] = {
            ["icon"] = "rbxassetid://7884367698",
            ["s"] = "rbxassetid://16991765938"
        },
        ["clay_light_brown"] = {
            ["icon"] = "rbxassetid://7884367792",
            ["s"] = "rbxassetid://7872905675"
        },
        ["clay_light_green"] = {
            ["icon"] = "rbxassetid://7884367872",
            ["s"] = "rbxassetid://7872906008"
        },
        ["clay_orange"] = {
            ["icon"] = "rbxassetid://7884367973",
            ["s"] = "rbxassetid://16991766008"
        },
        ["clay_pink"] = {
            ["icon"] = "rbxassetid://7884368035",
            ["s"] = "rbxassetid://16991766060"
        },
        ["clay_purple"] = {
            ["icon"] = "rbxassetid://7884368099",
            ["s"] = "rbxassetid://16991766106"
        },
        ["clay_red"] = {
            ["icon"] = "rbxassetid://7884368246",
            ["s"] = "rbxassetid://16991766155"
        },
        ["clay_tan"] = {
            ["icon"] = "rbxassetid://7884368312",
            ["s"] = "rbxassetid://16991766219"
        },
        ["clay_white"] = {
            ["icon"] = "rbxassetid://7884368439",
            ["s"] = "rbxassetid://16991766265"
        },
        ["clay_yellow"] = {
            ["icon"] = "rbxassetid://7884368673",
            ["s"] = "rbxassetid://16991766313"
        },
        ["cobblestone"] = {
            ["icon"] = "rbxassetid://8296848529",
            ["s"] = "rbxassetid://8296848659"
        },
        ["concrete_green"] = {
            ["icon"] = "rbxassetid://8537949134",
            ["s"] = "rbxassetid://8537949581"
        },
        ["copper_block"] = {
            ["icon"] = "rbxassetid://10859696115",
            ["s"] = "rbxassetid://10859696172"
        },
        ["cosmic_lucky_block"] = {
            ["icon"] = "rbxassetid://11773163557",
            ["s"] = "rbxassetid://11773163645"
        },
        ["diamond_block"] = {
            ["icon"] = "rbxassetid://7884368860",
            ["s"] = "rbxassetid://7861529819"
        },
        ["diamond_ore"] = {
            ["icon"] = "rbxassetid://105644572237110",
            ["s"] = "rbxassetid://117384798039734"
        },
        ["diorite"] = {
            ["icon"] = "rbxassetid://9072525407",
            ["s"] = "rbxassetid://9072525496"
        },
        ["diorite_polished"] = {
            ["icon"] = "rbxassetid://9072553104",
            ["s"] = "rbxassetid://9072553173"
        },
        ["dirt"] = {
            ["icon"] = "rbxassetid://7884368936",
            ["s"] = "rbxassetid://7852097294"
        },
        ["drawbridge"] = {
            ["icon"] = "rbxassetid://12210620616",
            ["s"] = "rbxassetid://12210620676"
        },
        ["emerald_block"] = {
            ["icon"] = "rbxassetid://7884369019",
            ["s"] = "rbxassetid://7843773857"
        },
        ["emerald_ore"] = {
            ["icon"] = "rbxassetid://102665467637199",
            ["s"] = "rbxassetid://137341028781546"
        },
        ["fisherman_coral"] = {
            ["icon"] = "rbxassetid://7884369108",
            ["s"] = "rbxassetid://7843775572"
        },
        ["food_lucky_block"] = {
            ["d"] = "rbxassetid://14192272281",
            ["icon"] = "rbxassetid://14192272584",
            ["s"] = "rbxassetid://14192272698",
            ["t"] = "rbxassetid://14192272804"
        },
        ["forge_lucky_block"] = {
            ["icon"] = "rbxassetid://15644713419",
            ["s"] = "rbxassetid://15644713480",
            ["td"] = "rbxassetid://15644713593"
        },
        ["galactite"] = {
            ["icon"] = "rbxassetid://15966082316",
            ["s"] = "rbxassetid://15966093089"
        },
        ["galactite_brick"] = {
            ["icon"] = "rbxassetid://9839888714",
            ["s"] = "rbxassetid://9839888790"
        },
        ["glitched_lucky_block"] = {
            ["icon"] = "rbxassetid://10866119664",
            ["s"] = "rbxassetid://10849259593"
        },
        ["glowstone"] = {
            ["icon"] = "rbxassetid://12948863407",
            ["s"] = "rbxassetid://12946930610"
        },
        ["gold_block"] = {
            ["icon"] = "rbxassetid://13465465532",
            ["s"] = "rbxassetid://13456088345"
        },
        ["granite"] = {
            ["icon"] = "rbxassetid://9072553261",
            ["s"] = "rbxassetid://9072525939"
        },
        ["granite_polished"] = {
            ["icon"] = "rbxassetid://9072553350",
            ["s"] = "rbxassetid://9072553427"
        },
        ["grass"] = {
            ["d"] = "rbxassetid://7843778275",
            ["icon"] = "rbxassetid://7911370722",
            ["s"] = "rbxassetid://7911371120",
            ["t"] = "rbxassetid://7911371279"
        },
        ["guilded_iron"] = {
            ["icon"] = "rbxassetid://10859696266",
            ["s"] = "rbxassetid://10859696347"
        },
        ["gum"] = {
            ["icon"] = "rbxassetid://14549363304",
            ["s"] = "rbxassetid://14549363342"
        },
        ["halloween_lucky_block"] = {
            ["icon"] = "rbxassetid://17367713630",
            ["s"] = "rbxassetid://17367713680",
            ["td"] = "rbxassetid://17367713724"
        },
        ["haybale"] = {
            ["icon"] = "rbxassetid://14968393791",
            ["s"] = "rbxassetid://14969029405",
            ["td"] = "rbxassetid://14969029474"
        },
        ["hickory_log"] = {
            ["icon"] = "rbxassetid://7884369330",
            ["s"] = "rbxassetid://16991766362",
            ["td"] = "rbxassetid://16991766405"
        },
        ["ice"] = {
            ["icon"] = "rbxassetid://7884369431",
            ["s"] = "rbxassetid://16991766460"
        },
        ["ice_frost_1"] = {
            ["s"] = "rbxassetid://8221158413"
        },
        ["ice_frost_2"] = {
            ["s"] = "rbxassetid://8221571608"
        },
        ["iron_block"] = {
            ["icon"] = "rbxassetid://7884369517",
            ["s"] = "rbxassetid://7852098030"
        },
        ["iron_ore"] = {
            ["icon"] = "rbxassetid://88425197437530",
            ["s"] = "rbxassetid://98659207125198"
        },
        ["kobblak"] = {
            ["icon"] = "rbxassetid://9859002988",
            ["s"] = "rbxassetid://9859003106",
            ["td"] = "rbxassetid://9859003198"
        },
        ["lantern"] = {
            ["icon"] = "rbxassetid://12946930661",
            ["s"] = "rbxassetid://12946930737"
        },
        ["lantern_block"] = {
            ["icon"] = "rbxassetid://12948863466",
            ["s"] = "rbxassetid://12948863498"
        },
        ["limestone"] = {
            ["s"] = "rbxassetid://18880491571"
        },
        ["log_maple"] = {
            ["icon"] = "rbxassetid://7884369649",
            ["s"] = "rbxassetid://16991766500",
            ["td"] = "rbxassetid://16991766540"
        },
        ["lucky_block"] = {
            ["icon"] = "rbxassetid://7884369916",
            ["s"] = "rbxassetid://7843804042"
        },
        ["lucky_block_trap"] = {
            ["icon"] = "rbxassetid://7884370012",
            ["s"] = "rbxassetid://7843813175"
        },
        ["magic_glass"] = {
            ["icon"] = "rbxassetid://72863067929207",
            ["s"] = "rbxassetid://121238080563616"
        },
        ["magical_h_lucky_block"] = {
            ["icon"] = "rbxassetid://16114558922",
            ["s"] = "rbxassetid://16114558985"
        },
        ["magical_hero_lucky_block"] = {
            ["icon"] = "rbxassetid://16114559103",
            ["s"] = "rbxassetid://16114559191"
        },
        ["magical_v_lucky_block"] = {
            ["icon"] = "rbxassetid://16114559288",
            ["s"] = "rbxassetid://16114559343"
        },
        ["magma_block"] = {
            ["icon"] = "rbxassetid://9439108582",
            ["s"] = "rbxassetid://9439108691"
        },
        ["marble"] = {
            ["icon"] = "rbxassetid://7884370119",
            ["s"] = "rbxassetid://7861531930"
        },
        ["marble_pillar"] = {
            ["icon"] = "rbxassetid://7884370206",
            ["s"] = "rbxassetid://16991766587",
            ["td"] = "rbxassetid://16991766637"
        },
        ["moss_block"] = {
            ["icon"] = "rbxassetid://10866497548",
            ["s"] = "rbxassetid://10866261237"
        },
        ["new_years_lucky_block"] = {
            ["icon"] = "rbxassetid://11958841642",
            ["s"] = "rbxassetid://11958841720"
        },
        ["new_years_lucky_block_2024"] = {
            ["icon"] = "rbxassetid://15800004718",
            ["s"] = "rbxassetid://15800004825"
        },
        ["oak_log"] = {
            ["icon"] = "rbxassetid://7884370279",
            ["s"] = "rbxassetid://16991766678",
            ["td"] = "rbxassetid://16991766755"
        },
        ["obsidian"] = {
            ["icon"] = "rbxassetid://8105569883",
            ["s"] = "rbxassetid://16991766822"
        },
        ["pumpkin"] = {
            ["f"] = "rbxassetid://7843844110",
            ["icon"] = "rbxassetid://7884370541",
            ["s"] = "rbxassetid://7843844205",
            ["td"] = "rbxassetid://7843849779"
        },
        ["pumpkin_block"] = {
            ["icon"] = "rbxassetid://14968393998",
            ["s"] = "rbxassetid://14968394120",
            ["td"] = "rbxassetid://14968394203"
        },
        ["purple_lucky_block"] = {
            ["icon"] = "rbxassetid://8105570365",
            ["s"] = "rbxassetid://8105570571"
        },
        ["rainbow_lucky_block"] = {
            ["icon"] = "rbxassetid://12813794908",
            ["s"] = "rbxassetid://12813795010"
        },
        ["red_sand"] = {
            ["icon"] = "rbxassetid://9072732616",
            ["s"] = "rbxassetid://9072732694"
        },
        ["red_sandstone"] = {
            ["icon"] = "rbxassetid://7884370687",
            ["s"] = "rbxassetid://7843853920"
        },
        ["red_sandstone_polished"] = {
            ["icon"] = "rbxassetid://10859696978",
            ["s"] = "rbxassetid://10859697059"
        },
        ["red_sandstone_smooth"] = {
            ["icon"] = "rbxassetid://10859697143",
            ["s"] = "rbxassetid://10859697202"
        },
        ["sand"] = {
            ["icon"] = "rbxassetid://7884370902",
            ["s"] = "rbxassetid://7843856590"
        },
        ["sandstone"] = {
            ["icon"] = "rbxassetid://7884371048",
            ["s"] = "rbxassetid://7872908360"
        },
        ["sandstone_polished"] = {
            ["icon"] = "rbxassetid://10859697278",
            ["s"] = "rbxassetid://10859697352"
        },
        ["sandstone_smooth"] = {
            ["icon"] = "rbxassetid://10859697439",
            ["s"] = "rbxassetid://10859697497"
        },
        ["scaffold"] = {
            ["icon"] = "rbxassetid://12210853999",
            ["s"] = "rbxassetid://12210854096",
            ["td"] = "rbxassetid://12211060975"
        },
        ["siege_tnt"] = {
            ["icon"] = "rbxassetid://14719641593",
            ["s"] = "rbxassetid://14719641708",
            ["td"] = "rbxassetid://14719641761"
        },
        ["slate_brick"] = {
            ["icon"] = "rbxassetid://9072553631",
            ["s"] = "rbxassetid://9072526507"
        },
        ["slate_tiles"] = {
            ["icon"] = "rbxassetid://10859697544",
            ["s"] = "rbxassetid://10859697603"
        },
        ["slime_block"] = {
            ["icon"] = "rbxassetid://7884371303",
            ["s"] = "rbxassetid://16991766905"
        },
        ["smoke_block"] = {
            ["icon"] = "rbxassetid://8538034673",
            ["s"] = "rbxassetid://8538034808"
        },
        ["snow"] = {
            ["icon"] = "rbxassetid://7884371442",
            ["s"] = "rbxassetid://16991766975"
        },
        ["spruce_log"] = {
            ["icon"] = "rbxassetid://7884371618",
            ["s"] = "rbxassetid://16991767062",
            ["td"] = "rbxassetid://16991767140"
        },
        ["steel_block"] = {
            ["icon"] = "rbxassetid://10859697667",
            ["s"] = "rbxassetid://10859697716"
        },
        ["stone"] = {
            ["icon"] = "rbxassetid://7884371892",
            ["s"] = "rbxassetid://16991767248"
        },
        ["stone_brick"] = {
            ["icon"] = "rbxassetid://7884372079",
            ["s"] = "rbxassetid://16991767326"
        },
        ["stone_pillar"] = {
            ["icon"] = "rbxassetid://10859697750",
            ["s"] = "rbxassetid://10859697821",
            ["td"] = "rbxassetid://12938322729"
        },
        ["stone_slab"] = {
            ["icon"] = "rbxassetid://8105570787",
            ["s"] = "rbxassetid://8105570960"
        },
        ["stone_tiles"] = {
            ["icon"] = "rbxassetid://10859697942",
            ["s"] = "rbxassetid://10859698016"
        },
        ["testblock_magenta"] = {
            ["s"] = "rbxassetid://12412674419"
        },
        ["testblock_orange"] = {
            ["s"] = "rbxassetid://12412674518"
        },
        ["testblock_white"] = {
            ["s"] = "rbxassetid://12412674601"
        },
        ["tnt"] = {
            ["icon"] = "rbxassetid://7884372237",
            ["s"] = "rbxassetid://16991767398",
            ["td"] = "rbxassetid://16991767491"
        },
        ["void_block"] = {
            ["icon"] = "rbxassetid://9871961934",
            ["s"] = "rbxassetid://9871962545",
            ["t"] = "rbxassetid://9871962653"
        },
        ["void_dirt"] = {
            ["s"] = "rbxassetid://15958116043"
        },
        ["void_grass"] = {
            ["d"] = "rbxassetid://15957915204",
            ["s"] = "rbxassetid://15957915344",
            ["t"] = "rbxassetid://15957915501"
        },
        ["void_growth"] = {
            ["s"] = "rbxassetid://15957915625"
        },
        ["volatile_stone"] = {
            ["icon"] = "rbxassetid://15380237898",
            ["s"] = "rbxassetid://15380237968"
        },
        ["wood_plank_birch"] = {
            ["icon"] = "rbxassetid://7884372418",
            ["s"] = "rbxassetid://16991767611"
        },
        ["wood_plank_hickory"] = {
            ["icon"] = "rbxassetid://7884372677",
            ["s"] = "rbxassetid://16991767711"
        },
        ["wood_plank_maple"] = {
            ["icon"] = "rbxassetid://7884372787",
            ["s"] = "rbxassetid://16991767778"
        },
        ["wood_plank_oak"] = {
            ["icon"] = "rbxassetid://7884372987",
            ["s"] = "rbxassetid://16991767868"
        },
        ["wood_plank_spruce"] = {
            ["icon"] = "rbxassetid://7884373190",
            ["s"] = "rbxassetid://16991767936"
        },
        ["wool_black"] = {
            ["icon"] = "rbxassetid://7923576966",
            ["s"] = "rbxassetid://7861535149"
        },
        ["wool_blue"] = {
            ["icon"] = "rbxassetid://7923577182",
            ["s"] = "rbxassetid://16991767991"
        },
        ["wool_brown"] = {
            ["icon"] = "rbxassetid://15380238075",
            ["s"] = "rbxassetid://15380238175"
        },
        ["wool_cyan"] = {
            ["icon"] = "rbxassetid://7923577311",
            ["s"] = "rbxassetid://16991768048"
        },
        ["wool_dark_brown"] = {
            ["icon"] = "rbxassetid://7923577434",
            ["s"] = "rbxassetid://7861535961"
        },
        ["wool_gray"] = {
            ["icon"] = "rbxassetid://7923577537",
            ["s"] = "rbxassetid://7861536309"
        },
        ["wool_green"] = {
            ["icon"] = "rbxassetid://7923577655",
            ["s"] = "rbxassetid://16991768151"
        },
        ["wool_light_brown"] = {
            ["icon"] = "rbxassetid://7923577894",
            ["s"] = "rbxassetid://7861537039"
        },
        ["wool_light_green"] = {
            ["icon"] = "rbxassetid://7923578022",
            ["s"] = "rbxassetid://7923578149"
        },
        ["wool_orange"] = {
            ["icon"] = "rbxassetid://7923578297",
            ["s"] = "rbxassetid://16991768271"
        },
        ["wool_pink"] = {
            ["icon"] = "rbxassetid://7923578533",
            ["s"] = "rbxassetid://16991768418"
        },
        ["wool_purple"] = {
            ["icon"] = "rbxassetid://7923578762",
            ["s"] = "rbxassetid://7923578873"
        },
        ["wool_red"] = {
            ["icon"] = "rbxassetid://7923579098",
            ["s"] = "rbxassetid://16991768524"
        },
        ["wool_white"] = {
            ["icon"] = "rbxassetid://7923579263",
            ["s"] = "rbxassetid://16991768606"
        },
        ["wool_yellow"] = {
            ["icon"] = "rbxassetid://7923579520",
            ["s"] = "rbxassetid://16991768659"
        }
    }
}
local v7 = {
    ["amy_easter_murder"] = "rbxassetid://13030624582",
    ["bunny_taliyah"] = "rbxassetid://16752736044",
    ["easter_davey"] = "rbxassetid://16747971547",
    ["easter_taliyah"] = "rbxassetid://16747971683",
    ["marina_eh"] = "rbxassetid://18151078691",
    ["marina_excited"] = "rbxassetid://18151079089",
    ["marina_floating"] = "rbxassetid://18151079861",
    ["nightmare_lyla"] = "rbxassetid://17450455261",
    ["nightmare_season_6"] = "rbxassetid://12739734363",
    ["star_collector_chocolate_bunny"] = "rbxassetid://13030627055",
    ["victorious_beta"] = "rbxassetid://12501296372",
    ["victorious_celebration_season_6"] = "rbxassetid://12739737832",
    ["CrateRewards"] = {
        ["alchemist_evil"] = "rbxassetid://12930117753",
        ["all_good"] = "rbxassetid://12930117869",
        ["beekeeper_gift"] = "rbxassetid://12930118048",
        ["conqueror_fireball"] = "rbxassetid://12930118211",
        ["hats_off"] = "rbxassetid://12930118421",
        ["hmm_ok"] = "rbxassetid://12930118621",
        ["kaliyah_pumped_up"] = "rbxassetid://12930118782",
        ["yuzi_brb"] = "rbxassetid://12930118936"
    },
    ["Event"] = {
        ["easter_2026"] = {
            ["bunny_barbarian_question"] = "rbxassetid://101157856231885",
            ["easter_freiya_danger"] = "rbxassetid://93306429780170",
            ["easter_freiya_omg"] = "rbxassetid://93940571436900",
            ["easter_grim_laughing"] = "rbxassetid://112767044968337",
            ["easter_grim_quiet"] = "rbxassetid://121356168756670",
            ["easter_grove_awe"] = "rbxassetid://96720852558512",
            ["easter_uma_happy"] = "rbxassetid://74056414407453",
            ["easter_uma_love"] = "rbxassetid://84555683223682",
            ["taliyah_mischievous"] = "rbxassetid://94916361047079"
        },
        ["halloween_2023"] = {
            ["corrupted_rage_blade"] = "rbxassetid://72329812867035",
            ["gompy_rock"] = "rbxassetid://137233798263301",
            ["hw_yuzi_laugh"] = "rbxassetid://94129364328857",
            ["hw_yuzi_pin"] = "rbxassetid://124104432584750",
            ["lucia_candy"] = "rbxassetid://109425372721500",
            ["pumpkin_bomb"] = "rbxassetid://115073055744552"
        },
        ["halloween_2025"] = {
            ["alchemist_pumpkin_stew"] = "rbxassetid://90148463138438",
            ["gompy_scared"] = "rbxassetid://77432910331273",
            ["jack_trick_or_treat"] = "rbxassetid://97112515288945",
            ["kaida_witch_apple"] = "rbxassetid://100379804704313",
            ["wren_coffin"] = "rbxassetid://115030279314239"
        },
        ["lny_2024"] = {
            ["dragon_kit_battle"] = "rbxassetid://77569061944998",
            ["dragon_kit_duel"] = "rbxassetid://131701917426273",
            ["dragon_kit_stare"] = "rbxassetid://129909384797670",
            ["lunar_dragon_archer"] = "rbxassetid://105104106400203",
            ["lunar_freiya_cat"] = "rbxassetid://135965681802425",
            ["lunar_freiya_celebration"] = "rbxassetid://131007008291278",
            ["lunar_xurot_meme"] = "rbxassetid://106486245339543",
            ["yuzi_firecrackers"] = "rbxassetid://136999306649852"
        },
        ["lny_2025"] = {
            ["builder_lny"] = "rbxassetid://115438709144788",
            ["builder_red_envelope"] = "rbxassetid://100081063523816",
            ["lian_dumpling_eat"] = "rbxassetid://71719171420125",
            ["lian_lny_celebrate"] = "rbxassetid://94975986825281",
            ["lunar_hannah_fireworks"] = "rbxassetid://81960526416509",
            ["yuzi_lny_lanterns"] = "rbxassetid://126898876738732",
            ["yuzi_red_envelope"] = "rbxassetid://96129727044780"
        },
        ["summer_2024"] = {
            ["amy_floatie"] = "rbxassetid://105984793724896",
            ["ice_cream_trio"] = "rbxassetid://137926027183470",
            ["infernal_surfer_wink"] = "rbxassetid://76057349450605",
            ["milo_sandcastle"] = "rbxassetid://131312258457587",
            ["sheila_volleyball"] = "rbxassetid://79495169263798",
            ["surfer_cool_guy"] = "rbxassetid://85568184210118",
            ["surfer_hot"] = "rbxassetid://113737919286175",
            ["surfer_surfs_up"] = "rbxassetid://130080692094394",
            ["vulcan_brainfreeze"] = "rbxassetid://126239128926243"
        },
        ["summer_2025"] = {
            ["cryptwrecked_salute"] = "rbxassetid://109949836675445",
            ["lifeguard_lassy_chilling"] = "rbxassetid://125411585290753",
            ["lifeguard_lassy_warning"] = "rbxassetid://98029163388093",
            ["martin_hydrate"] = "rbxassetid://87056857306334",
            ["tidal_wren_cheers"] = "rbxassetid://84700655551878",
            ["tidal_wren_shiny"] = "rbxassetid://117469788845776"
        },
        ["three_year_anniversary"] = {
            ["three_year_baker"] = "rbxassetid://98822441277544",
            ["three_year_barbarian"] = "rbxassetid://139982294284755",
            ["three_year_bekzat"] = "rbxassetid://89793134837911",
            ["three_year_cake_face"] = "rbxassetid://128491297440455",
            ["three_year_lyla"] = "rbxassetid://112425026832739",
            ["three_year_taliyah"] = "rbxassetid://129981266961994"
        },
        ["xmas_2023"] = {
            ["baker_holiday_eat"] = "rbxassetid://93969744348521",
            ["cozy_melody_smile"] = "rbxassetid://128501323377125",
            ["frosty_baller"] = "rbxassetid://82585754434050",
            ["gingerbread_man_rage"] = "rbxassetid://115686803168814",
            ["krampus_ember"] = "rbxassetid://80336737718792",
            ["yeti_gift"] = "rbxassetid://100456732669489"
        },
        ["xmas_2025"] = {
            ["holiday_sheepherder_bell"] = "rbxassetid://87350311546297",
            ["moai_yeti"] = "rbxassetid://108326397514100"
        }
    },
    ["KitContractRewards"] = {
        ["aery"] = {
            ["aery_out_of_breath"] = "rbxassetid://104192765357631",
            ["aery_thinking"] = "rbxassetid://101101915429112"
        },
        ["airbender"] = {
            ["ramil_angry_kitty"] = "rbxassetid://91943856931661",
            ["ramil_sandbender"] = "rbxassetid://91529419816543"
        },
        ["baker"] = {
            ["baker_baking"] = "rbxassetid://119302127403930",
            ["baker_nooo"] = "rbxassetid://121711420604238"
        },
        ["barbarian"] = {
            ["barbarian_on_fire"] = "rbxassetid://14549363836",
            ["rageblade_swords"] = "rbxassetid://14567662447"
        },
        ["cowgirl"] = {
            ["lassy_fan"] = "rbxassetid://92652399858796",
            ["lassy_shocked"] = "rbxassetid://116086936295105"
        },
        ["dasher"] = {
            ["yuzi_love_chu"] = "rbxassetid://84875362564161",
            ["yuzi_snake_pet"] = "rbxassetid://92158494061962"
        },
        ["elektra"] = {
            ["elektra_moody"] = "rbxassetid://116736461758322",
            ["elektra_wrath"] = "rbxassetid://76211067296817"
        },
        ["frost_hammer_kit"] = {
            ["adetunde_annoyed"] = "rbxassetid://81903895222772",
            ["adetunde_cold"] = "rbxassetid://135392393987907"
        },
        ["grim_reaper"] = {
            ["grim_reaper_scythe"] = "rbxassetid://17770278287",
            ["grim_reaper_taunt"] = "rbxassetid://17770278478"
        },
        ["jellyfish"] = {
            ["marina_blow_bubbles"] = "rbxassetid://82018613890662",
            ["marina_happy"] = "rbxassetid://96403347129381"
        },
        ["mimic"] = {
            ["milo_hello"] = "rbxassetid://131386492333398",
            ["milo_yippee"] = "rbxassetid://135832451562305"
        },
        ["owl"] = {
            ["good_whisper"] = "rbxassetid://126680251336009",
            ["whisper_chicken"] = "rbxassetid://132475275903041"
        },
        ["spirit_assassin"] = {
            ["spirit_assassin_dagger"] = "rbxassetid://16382242984",
            ["spirit_assassin_hearts"] = "rbxassetid://16382243583"
        },
        ["summoner"] = {
            ["kaida_laugh"] = "rbxassetid://77508498387331",
            ["kaida_serious_summon"] = "rbxassetid://78280609516724"
        }
    },
    ["RobuxStore"] = {
        ["alchemist_yap"] = "rbxassetid://82072292809014",
        ["arachne_ohmy"] = "rbxassetid://103768127497163",
        ["archer_glare"] = "rbxassetid://139587123613285",
        ["baker_sly"] = "rbxassetid://82333686028981",
        ["baker_sus-stew"] = "rbxassetid://128179720900463",
        ["bot_scared"] = "rbxassetid://100931445659758",
        ["builder_bleh"] = "rbxassetid://105055311912019",
        ["chicken_attack"] = "rbxassetid://135763144404507",
        ["cogsworth_ignored"] = "rbxassetid://101289616987417",
        ["conqueror_smirk"] = "rbxassetid://107953235097476",
        ["dragon_angry"] = "rbxassetid://131903368312751",
        ["farmer_clean"] = "rbxassetid://124989654447805",
        ["farmer_pushed"] = "rbxassetid://83928900961902",
        ["farmer_silenced"] = "rbxassetid://74235097054153",
        ["fisherman_doze"] = "rbxassetid://115742335407103",
        ["fisherman_smile"] = "rbxassetid://85825058500600",
        ["frosty_silly"] = "rbxassetid://111131297014336",
        ["isabel_stunned"] = "rbxassetid://103930541553558",
        ["jade_laugh"] = "rbxassetid://86677359792119",
        ["kaida_glare"] = "rbxassetid://110823135198491",
        ["kaida_mock"] = "rbxassetid://98387445920423",
        ["lassy_approve"] = "rbxassetid://115897553091400",
        ["lassy_cry"] = "rbxassetid://81559773320753",
        ["lassy_stop"] = "rbxassetid://133977410358952",
        ["lucia_throw"] = "rbxassetid://122089778788651",
        ["lyla_flowers"] = "rbxassetid://128575344805444",
        ["lyla_letter-read"] = "rbxassetid://109953973152080",
        ["lyla_sad"] = "rbxassetid://106720677750720",
        ["lyla_sus"] = "rbxassetid://91099937291940",
        ["marcel_time"] = "rbxassetid://121525664012633",
        ["marina_angry"] = "rbxassetid://135146205033309",
        ["marina_huh"] = "rbxassetid://108628486935169",
        ["marina_icecream"] = "rbxassetid://94339419100915",
        ["marina_surprised"] = "rbxassetid://88200103869477",
        ["martin_plush"] = "rbxassetid://126038646147091",
        ["melody_cheer"] = "rbxassetid://88989793940304",
        ["melody_stop"] = "rbxassetid://137590781891492",
        ["milo_ice-cream"] = "rbxassetid://78141450350334",
        ["miner_snore"] = "rbxassetid://95295185209415",
        ["noelle_doll"] = "rbxassetid://128637470985470",
        ["noelle_surrender"] = "rbxassetid://112183130045027",
        ["pyro_exhausted"] = "rbxassetid://139544368584070",
        ["ramil_palm-of-my-hand"] = "rbxassetid://78994048026473",
        ["raven_plan"] = "rbxassetid://108522391606624",
        ["rise_up"] = "rbxassetid://111889870592685",
        ["silence"] = "rbxassetid://132523966668156",
        ["skeleton_omg"] = "rbxassetid://89688658553429",
        ["smoke_dissapointed"] = "rbxassetid://115730322815503",
        ["smoke_vanish"] = "rbxassetid://134757997811060",
        ["stella_star-for-you"] = "rbxassetid://118700632316026",
        ["taliyah_flushed"] = "rbxassetid://116360937586111",
        ["taliyah_rainbow"] = "rbxassetid://110682707395390",
        ["terra_powerup"] = "rbxassetid://75777650248418",
        ["trixie_mock"] = "rbxassetid://93991981578569",
        ["whim_reading"] = "rbxassetid://111727312386249",
        ["xurot_dissapointed"] = "rbxassetid://101510795673829",
        ["yamini_sly"] = "rbxassetid://110297653398933",
        ["zarrah_love"] = "rbxassetid://136424439195242"
    },
    ["lny_2026"] = {
        ["builder_cry"] = "rbxassetid://103291721573530",
        ["evelynn_denial"] = "rbxassetid://126395901255750",
        ["evelynn_heartbreak"] = "rbxassetid://106664122875347",
        ["love_struck_vanessa"] = "rbxassetid://129882850673991",
        ["melody_flowers_for_you"] = "rbxassetid://130432040586167",
        ["mischief_valentines_evelynn"] = "rbxassetid://98987770399260",
        ["valentine_aery_love"] = "rbxassetid://131935720085844",
        ["valentine_aery_queen"] = "rbxassetid://100468051245923"
    },
    ["season10"] = {
        ["aery_sob"] = "rbxassetid://17003369471",
        ["agni_angry"] = "rbxassetid://17003369903",
        ["agni_warming"] = "rbxassetid://18566222998",
        ["baker_sad"] = "rbxassetid://17003370215",
        ["barb_menacing"] = "rbxassetid://17003370591",
        ["cat_gun"] = "rbxassetid://17003370913",
        ["cletus_aeugh"] = "rbxassetid://17003371122",
        ["elektra_power_up"] = "rbxassetid://17003371526",
        ["evelynn_adore"] = "rbxassetid://17003371779",
        ["farmer_cletus_water_gun"] = "rbxassetid://18461216235",
        ["freiya_nyan_cat"] = "rbxassetid://17003371945",
        ["gompy_caught_in_4k"] = "rbxassetid://17003372094",
        ["milo_bug_spray"] = "rbxassetid://17004557511",
        ["milo_god"] = "rbxassetid://17003372566",
        ["noelle_well_done"] = "rbxassetid://17003372814",
        ["nyx_angy"] = "rbxassetid://17003373226",
        ["nyx_boba"] = "rbxassetid://17003373448",
        ["sandwich_farmer"] = "rbxassetid://17003373624",
        ["styx_relax"] = "rbxassetid://17003374032",
        ["styx_sad"] = "rbxassetid://17003374252",
        ["trinity_eat_popcorn"] = "rbxassetid://17003374389",
        ["trinity_punch"] = "rbxassetid://17003374528",
        ["trinity_thumbs_up"] = "rbxassetid://17003374634",
        ["trinity_toilet"] = "rbxassetid://17003374773",
        ["void_terra_thumbs_up"] = "rbxassetid://17003375239",
        ["yuzi_copium"] = "rbxassetid://17003375819"
    },
    ["season11"] = {
        ["agni_boom"] = "rbxassetid://76914006723826",
        ["alchemist_dizzy"] = "rbxassetid://94058812383452",
        ["baker_seriously"] = "rbxassetid://112697019428937",
        ["builder_ready"] = "rbxassetid://106099340994861",
        ["candy_please"] = "rbxassetid://117416839210563",
        ["davey_win"] = "rbxassetid://78240443543545",
        ["dragon_roar"] = "rbxassetid://111404453226648",
        ["eldertree_fury"] = "rbxassetid://100270078370389",
        ["friendship_slimes"] = "rbxassetid://91063552058466",
        ["kaliyah_fired_up"] = "rbxassetid://112118478642060",
        ["lassy_heal"] = "rbxassetid://118306703955684",
        ["marina_panic"] = "rbxassetid://83074261097952",
        ["monk_meditation"] = "rbxassetid://116906963693286",
        ["mummy"] = "rbxassetid://77012587166711",
        ["noelle_butterfly"] = "rbxassetid://111493143080212",
        ["raven_hmm"] = "rbxassetid://74699587679988",
        ["raven_ok"] = "rbxassetid://71231274055075",
        ["rebellion_leader_dodo"] = "rbxassetid://133464446529665",
        ["smoke_red_flag"] = "rbxassetid://112088083091397",
        ["sorcerer_aura"] = "rbxassetid://118586011127869",
        ["sorcerer_laugh"] = "rbxassetid://100904728981868",
        ["sorcerer_oops"] = "rbxassetid://108273333887917",
        ["sorcerer_rage"] = "rbxassetid://132527007341460",
        ["sorcery_duo"] = "rbxassetid://128626012767369",
        ["summoner_dragon_buddy"] = "rbxassetid://132189586331544",
        ["summoner_summon"] = "rbxassetid://75151758019987",
        ["terra_buff"] = "rbxassetid://78127638356548",
        ["trader_donate"] = "rbxassetid://120928154469886",
        ["trader_huh"] = "rbxassetid://110074889098241",
        ["trapper_point"] = "rbxassetid://102846442490931",
        ["trapper_proud"] = "rbxassetid://116196634524057",
        ["trapper_warning"] = "rbxassetid://105064715491242",
        ["witch_laugh"] = "rbxassetid://81539624188908",
        ["witch_nom"] = "rbxassetid://133885270795546",
        ["witchs_wrath"] = "rbxassetid://100969249458150",
        ["wren_laugh"] = "rbxassetid://85242155556858",
        ["wrens_nightmare"] = "rbxassetid://125060080583649",
        ["youre_wanted"] = "rbxassetid://139201500097098",
        ["zephyr_yelling"] = "rbxassetid://132175515960452"
    },
    ["season12"] = {
        ["cogsworth_charmed"] = "rbxassetid://82687540380773",
        ["cogsworth_sorry"] = "rbxassetid://70712114546541",
        ["evelynn_i_feel_amazing"] = "rbxassetid://133639153387770",
        ["evelynn_shock"] = "rbxassetid://125166607754663",
        ["fisherman_absolute_cinema"] = "rbxassetid://114020871985103",
        ["ignis_bridge_summon"] = "rbxassetid://75403712053779",
        ["kaliyah_punch"] = "rbxassetid://82238219936187",
        ["metal_detector_lets_go_looting"] = "rbxassetid://83669186030479",
        ["spirit_catcher_stare"] = "rbxassetid://98669926252350",
        ["spirit_critter_please"] = "rbxassetid://89481024377729",
        ["spirit_critter_stare"] = "rbxassetid://96195147042862",
        ["spirit_critter_whatchu_doing"] = "rbxassetid://113446805248102",
        ["spirit_critter_wow"] = "rbxassetid://110083249017661",
        ["spirit_gardener_flower_basket"] = "rbxassetid://73720453991423",
        ["spirit_gardener_sob"] = "rbxassetid://82835881715436",
        ["spirit_gardener_take_them_please"] = "rbxassetid://96895175673899",
        ["taliyah_heart_hands"] = "rbxassetid://80504465632764",
        ["terra_intimidation"] = "rbxassetid://104647373602331",
        ["trinity_two_sides"] = "rbxassetid://134225768241354",
        ["void_knight_sword"] = "rbxassetid://125942699612917",
        ["void_slime_pat"] = "rbxassetid://130989534731045",
        ["whisper_speech"] = "rbxassetid://114969087289253",
        ["whisper_unamused"] = "rbxassetid://98032757587406"
    },
    ["season13"] = {
        ["baker_cooking"] = "rbxassetid://123073579915459",
        ["builder_rage"] = "rbxassetid://98524369643070",
        ["cletus_burned_crops"] = "rbxassetid://74523113313381",
        ["cobalt_low_battery"] = "rbxassetid://81626491002821",
        ["i_see_you"] = "rbxassetid://137155657009092",
        ["im_okay"] = "rbxassetid://72363010329447",
        ["krystal_broken_heart"] = "rbxassetid://131529833203395",
        ["melody_broke"] = "rbxassetid://113167079611749",
        ["merchant_marco_quick_sand"] = "rbxassetid://115693251478272",
        ["nahla_prowler"] = "rbxassetid://80400083605456",
        ["oasis_l"] = "rbxassetid://79397375079288",
        ["oasis_relaxed"] = "rbxassetid://78440023718333",
        ["oasis_water_splash"] = "rbxassetid://128087788942679",
        ["sandbender_peace"] = "rbxassetid://103887342338782",
        ["sandbender_sad"] = "rbxassetid://70732351522936",
        ["skoll_let_me_think"] = "rbxassetid://134401641994063",
        ["skoll_wolf_treat"] = "rbxassetid://80827994744986",
        ["stella_nu_uh"] = "rbxassetid://119914091841114",
        ["taliyah_eat"] = "rbxassetid://117854028093640",
        ["taliyah_mizu5"] = "rbxassetid://115763371426558",
        ["too_much_yapping"] = "rbxassetid://94698461287652",
        ["trixie_haha"] = "rbxassetid://133252343910346",
        ["yamini_point"] = "rbxassetid://135439854362033"
    },
    ["season3"] = {
        ["angry_builder"] = "rbxassetid://12501225874",
        ["archer"] = "rbxassetid://12501225950",
        ["arson"] = "rbxassetid://12501226126",
        ["axolotl_sleeping"] = "rbxassetid://12501226417",
        ["axolotls"] = "rbxassetid://12501226633",
        ["baker_thumbs_up"] = "rbxassetid://12501226857",
        ["balloons"] = "rbxassetid://12501226981",
        ["bee"] = "rbxassetid://12501227054",
        ["boo"] = "rbxassetid://12501227286",
        ["christmas_dodo"] = "rbxassetid://12501227430",
        ["christmas_rocket"] = "rbxassetid://12501227589",
        ["christmas_tree"] = "rbxassetid://12501227734",
        ["duo"] = "rbxassetid://12501227951",
        ["eldertree_gg"] = "rbxassetid://12501228128",
        ["emerald_armor"] = "rbxassetid://12501228319",
        ["freiya"] = "rbxassetid://12501228544",
        ["freiya_2"] = "rbxassetid://12501228740",
        ["freiya_3"] = "rbxassetid://12501228983",
        ["freiya_snowman"] = "rbxassetid://12501229269",
        ["heart"] = "rbxassetid://12501229442",
        ["lucky_gift"] = "rbxassetid://12501229731",
        ["pyro_coal"] = "rbxassetid://12501229828",
        ["raven_sketch"] = "rbxassetid://12501230009",
        ["reaper_gift"] = "rbxassetid://12501230100",
        ["reindeer_rider"] = "rbxassetid://12501230304",
        ["sad_gompy"] = "rbxassetid://12501230481",
        ["selfie"] = "rbxassetid://12501230654",
        ["stocking"] = "rbxassetid://12501230914",
        ["teamwork"] = "rbxassetid://12501231207",
        ["winstreak"] = "rbxassetid://12501231380",
        ["worm_farmer"] = "rbxassetid://12501231461"
    },
    ["season4"] = {
        ["academy_aery_gl"] = "rbxassetid://12501231558",
        ["academy_aery_read"] = "rbxassetid://12501231783",
        ["aery_killer_instinct"] = "rbxassetid://12501232036",
        ["aery_pro"] = "rbxassetid://12501232250",
        ["aery_winstreak"] = "rbxassetid://12501232356",
        ["amy_no"] = "rbxassetid://12501232548",
        ["archer_thumbs_down"] = "rbxassetid://12501232740",
        ["barbarian_enraged"] = "rbxassetid://12501232922",
        ["barbarian_wave"] = "rbxassetid://12501233153",
        ["bounty_mad"] = "rbxassetid://12501233356",
        ["builder_speechless"] = "rbxassetid://12501233536",
        ["clan_invite"] = "rbxassetid://12501233620",
        ["de_vanessa_speechless"] = "rbxassetid://12501233814",
        ["dont_rush_me_pls"] = "rbxassetid://12501233925",
        ["duck_celebration"] = "rbxassetid://12501234001",
        ["elder_tree_injured"] = "rbxassetid://12501234286",
        ["farmer_angry"] = "rbxassetid://12501234439",
        ["freiya_surprised"] = "rbxassetid://12501234550",
        ["grim_reaper_gg"] = "rbxassetid://12501234720",
        ["grim_reaper_sticker"] = "rbxassetid://12501234815",
        ["jade_gg"] = "rbxassetid://12501234899",
        ["jade_heart"] = "rbxassetid://12501235041",
        ["lassy_celebration"] = "rbxassetid://12501235276",
        ["lassy_grab"] = "rbxassetid://12501235497",
        ["miner_laugh"] = "rbxassetid://12501235696",
        ["miner_uwu"] = "rbxassetid://12501235914",
        ["nice"] = "rbxassetid://12501236114",
        ["slay"] = "rbxassetid://12501236329",
        ["space_miner_rage"] = "rbxassetid://12501236422",
        ["spirit_catcher_lol"] = "rbxassetid://12501236672",
        ["spirit_teamwork"] = "rbxassetid://12501236788",
        ["to_battle"] = "rbxassetid://12501236862",
        ["vulcan_loading"] = "rbxassetid://12501237081",
        ["warrior_update_day"] = "rbxassetid://12501237183",
        ["yuzi_hype"] = "rbxassetid://12501237381"
    },
    ["season5"] = {
        ["baker_item_prot"] = "rbxassetid://9869089454",
        ["baker_piece_of_cake"] = "rbxassetid://9869089602",
        ["barb_u_shall_not_pass"] = "rbxassetid://9869104689",
        ["builder_help"] = "rbxassetid://9869090079",
        ["cletus_troll"] = "rbxassetid://9869090233",
        ["cyber_dab"] = "rbxassetid://9869090487",
        ["cyber_defense"] = "rbxassetid://9869090746",
        ["cyber_mad"] = "rbxassetid://9869090944",
        ["dino_hai"] = "rbxassetid://9869091312",
        ["dino_rawr"] = "rbxassetid://9869091636",
        ["dino_yipeee"] = "rbxassetid://9869091840",
        ["freiya_hearts"] = "rbxassetid://9877587705",
        ["jade_im_the_best"] = "rbxassetid://9877587939",
        ["lumen_pain"] = "rbxassetid://9869092095",
        ["lv50_duo_wombo_combo"] = "rbxassetid://9877588265",
        ["melody_you_rock"] = "rbxassetid://9869092278",
        ["metal_detector"] = "rbxassetid://9869092543",
        ["oh_my_stars"] = "rbxassetid://9869092705",
        ["raining_gems"] = "rbxassetid://9869092943",
        ["raven_rip"] = "rbxassetid://9869093163",
        ["reaper_got_em"] = "rbxassetid://9869093287",
        ["smoke_wave"] = "rbxassetid://9869093445",
        ["spirit_duo_ez"] = "rbxassetid://9877588501",
        ["star_collector_fun"] = "rbxassetid://9869093655",
        ["tesla_danger"] = "rbxassetid://9869093778",
        ["tiger_well_played"] = "rbxassetid://9869094059",
        ["vulcan_overheat"] = "rbxassetid://9877588678"
    },
    ["season6"] = {
        ["alchemist_sad"] = "rbxassetid://12501237776",
        ["amy_..."] = "rbxassetid://12501237969",
        ["amy_easter_no_iron"] = "rbxassetid://12501238257",
        ["baker_profit"] = "rbxassetid://12501238367",
        ["bee_keeper_thanks"] = "rbxassetid://12501238578",
        ["builder_leave_door"] = "rbxassetid://12501238752",
        ["builder_sheesh"] = "rbxassetid://12501238937",
        ["cobalt_charged"] = "rbxassetid://12501239167",
        ["crocowolf_you_cant_run"] = "rbxassetid://12501239423",
        ["dom_im_done"] = "rbxassetid://12501239571",
        ["farmer_cry"] = "rbxassetid://12501239824",
        ["farmer_not_bad"] = "rbxassetid://12501239966",
        ["fire_dragon_what"] = "rbxassetid://12501240136",
        ["fire_dragon_win_streak"] = "rbxassetid://12501240263",
        ["fisherman_gold"] = "rbxassetid://12501240536",
        ["freiya_pop_cat"] = "rbxassetid://12501240671",
        ["ghost_catcher_in_love"] = "rbxassetid://12501240908",
        ["lucia_pathetic"] = "rbxassetid://12501241054",
        ["mage_elemental"] = "rbxassetid://12501241283",
        ["marco_villager"] = "rbxassetid://12501241424",
        ["melody_face_palm"] = "rbxassetid://12501241556",
        ["melody_peace_out"] = "rbxassetid://12501241718",
        ["metal_detector_boring"] = "rbxassetid://12501241811",
        ["penguin_sleep"] = "rbxassetid://12501242010",
        ["pinata_party_time"] = "rbxassetid://12501242265",
        ["stella_heart"] = "rbxassetid://12501242527",
        ["void_dragon_angry"] = "rbxassetid://12501242804",
        ["void_dragon_art"] = "rbxassetid://12501243022",
        ["yuzi_angry"] = "rbxassetid://12501243257",
        ["zephyr_smug"] = "rbxassetid://12501243449"
    },
    ["season7"] = {
        ["afk_teammate"] = "rbxassetid://12500886016",
        ["assassin"] = "rbxassetid://12518536734",
        ["barb_angry"] = "rbxassetid://12500886272",
        ["barb_pin"] = "rbxassetid://12500886416",
        ["bathing_in_money"] = "rbxassetid://12500886554",
        ["bing_chilling"] = "rbxassetid://12500886705",
        ["bongo_cat_freiya"] = "rbxassetid://12500886821",
        ["bounty_hunter_hunt"] = "rbxassetid://12500887098",
        ["builder_idea"] = "rbxassetid://12500887255",
        ["burning_the_bed"] = "rbxassetid://12500887452",
        ["get_trapped"] = "rbxassetid://12500887653",
        ["hatter_gg"] = "rbxassetid://12500888433",
        ["hatter_heart"] = "rbxassetid://12500888743",
        ["hatter_shy"] = "rbxassetid://12500888974",
        ["jade_bonking"] = "rbxassetid://12500889273",
        ["jade_sad"] = "rbxassetid://12500889578",
        ["kaliyah_angry"] = "rbxassetid://12500889806",
        ["lani_idk"] = "rbxassetid://12500889994",
        ["lani_point"] = "rbxassetid://12500890276",
        ["lassy_side_eye"] = "rbxassetid://12500890467",
        ["lucia_whats_poppin"] = "rbxassetid://12500890680",
        ["lumen_reverse_card"] = "rbxassetid://12500890870",
        ["marco_diamond_sword"] = "rbxassetid://12500890960",
        ["mic_up"] = "rbxassetid://12514732037",
        ["sheep_herder_love"] = "rbxassetid://12500891249",
        ["sheila_cozy"] = "rbxassetid://12500891512",
        ["spirit_couple"] = "rbxassetid://12500891718",
        ["surprise_attack"] = "rbxassetid://12500892105",
        ["tnt"] = "rbxassetid://12500892311",
        ["vanessa_deserve"] = "rbxassetid://12500892561",
        ["vulcan_get_real"] = "rbxassetid://12514732407",
        ["what_did_i_see"] = "rbxassetid://12500892753"
    },
    ["season8"] = {
        ["2year_penguin_cake"] = "rbxassetid://15288519762",
        ["aery_hmph"] = "rbxassetid://13840384551",
        ["amy_hello"] = "rbxassetid://13830033671",
        ["bee_keeper_peace"] = "rbxassetid://15288528402",
        ["bee_keeper_stare"] = "rbxassetid://13830033828",
        ["blackhole"] = "rbxassetid://13830033977",
        ["caitlyn_rock"] = "rbxassetid://13830034107",
        ["card"] = "rbxassetid://13840139907",
        ["caught_you"] = "rbxassetid://13830034284",
        ["cletus_nerd"] = "rbxassetid://13830034429",
        ["cletus_plushie"] = "rbxassetid://13830034551",
        ["crypt_skull"] = "rbxassetid://13830034687",
        ["diamond_guardian"] = "rbxassetid://15288519867",
        ["florra_icon"] = "rbxassetid://13830034798",
        ["flowers_for_you"] = "rbxassetid://13830034958",
        ["ghost_celebrate"] = "rbxassetid://13830035079",
        ["ghost_ready"] = "rbxassetid://13830035275",
        ["hannah_angry"] = "rbxassetid://13830035660",
        ["kaliyah_rage"] = "rbxassetid://13830035857",
        ["killer_amy"] = "rbxassetid://13830035999",
        ["lumen_confused"] = "rbxassetid://13830036199",
        ["melody_noted"] = "rbxassetid://13830036299",
        ["pyro_celebrate"] = "rbxassetid://13840140103",
        ["sheila_sing"] = "rbxassetid://13830036465",
        ["smug"] = "rbxassetid://13830036645",
        ["stella_bored"] = "rbxassetid://13830036804",
        ["stella_idol"] = "rbxassetid://13830036979",
        ["stella_omg"] = "rbxassetid://13830037125",
        ["tablet_kids"] = "rbxassetid://13830037284",
        ["wasnt_me"] = "rbxassetid://13830037572",
        ["zephyr_stressed"] = "rbxassetid://13830037845",
        ["zephyr_what"] = "rbxassetid://13830037995"
    },
    ["season9"] = {
        ["cat_autumn"] = "rbxassetid://15374476267",
        ["cat_cute"] = "rbxassetid://15374476421",
        ["cat_deal"] = "rbxassetid://15374476629",
        ["cat_friend"] = "rbxassetid://15374476730",
        ["cat_swipe"] = "rbxassetid://15374477016",
        ["dodo_plump"] = "rbxassetid://15374525439",
        ["freiya_salad_meme"] = "rbxassetid://15374477205",
        ["freiya_sus"] = "rbxassetid://15374477332",
        ["gompy_scary"] = "rbxassetid://15374477522",
        ["heal_slime_sad"] = "rbxassetid://15374477684",
        ["kicker_angry"] = "rbxassetid://15374477991",
        ["lyla_popcorn"] = "rbxassetid://15374478242",
        ["marco_inspect"] = "rbxassetid://15374478351",
        ["melody_suprised"] = "rbxassetid://15374478497",
        ["metal_detector_egg"] = "rbxassetid://15374650592",
        ["milo_crazy"] = "rbxassetid://15374478638",
        ["milo_scare"] = "rbxassetid://15374478730",
        ["milo_sleep"] = "rbxassetid://15374478928",
        ["milo_snack"] = "rbxassetid://15374479066",
        ["noelle_confused"] = "rbxassetid://15643381528",
        ["noelle_slimes"] = "rbxassetid://15643382049",
        ["robo_sparkle"] = "rbxassetid://15374479888",
        ["robo_work"] = "rbxassetid://15374480060",
        ["smoke_peace_out"] = "rbxassetid://15374480251",
        ["star_collector_dazed"] = "rbxassetid://15374480449",
        ["taliyah_sparkle"] = "rbxassetid://15374480702",
        ["tinker_amazing"] = "rbxassetid://17025796835",
        ["umbra_villain"] = "rbxassetid://15374480846",
        ["yamini_cat_loaf"] = "rbxassetid://16642523559",
        ["yuzi_bee_swarm"] = "rbxassetid://15374481021"
    },
    ["xmas_2025"] = {
        ["cookie_tree"] = "rbxassetid://105383915551198",
        ["frosty_fury"] = "rbxassetid://110173091447559",
        ["grinch_milo"] = "rbxassetid://136235294478114",
        ["happy_sophia"] = "rbxassetid://80259381688070",
        ["injured_gingerbread"] = "rbxassetid://119822191560247",
        ["nogift_lassy"] = "rbxassetid://130534314159998",
        ["nutcracker_builder_panic"] = "rbxassetid://116144377640845",
        ["reindeer_lassy"] = "rbxassetid://136672739118903",
        ["sophia_bro"] = "rbxassetid://80693802606317",
        ["wrens_gift"] = "rbxassetid://112633226237786"
    }
}
v6.emotes = v7
v6.healthbarfill = "rbxassetid://10013722579"
v6.healthbarstroke = "rbxassetid://10013722726"
v6.maps = {
    ["MapAirship_to4"] = "rbxassetid://17014637552",
    ["MapAquatic_to2"] = "rbxassetid://17014497671",
    ["MapArch_to2"] = "rbxassetid://17014532555",
    ["MapArch_to4"] = "rbxassetid://104910310140975",
    ["MapArena_pvpArena"] = "rbxassetid://18880494791",
    ["MapAtlanticRuins_to2"] = "rbxassetid://17206363555",
    ["MapAtlanticRuins_to4"] = "rbxassetid://76450656146157",
    ["MapAtlanticTemple_to2"] = "rbxassetid://17014497988",
    ["MapAtlanticTemple_to4"] = "rbxassetid://17014498279",
    ["MapAutumn_duels"] = "rbxassetid://93600841396531",
    ["MapAutumn_to2"] = "rbxassetid://17206364230",
    ["MapAztecHalloween_to30"] = "rbxassetid://81914600860033",
    ["MapAztecHalloween_to4"] = "rbxassetid://92376362494617",
    ["MapAztec_to2"] = "rbxassetid://17014638377",
    ["MapAztec_to30"] = "rbxassetid://17014499632",
    ["MapAztec_to4"] = "rbxassetid://17331893123",
    ["MapBambooGarden_sw"] = "rbxassetid://123190756181994",
    ["MapBank_to4"] = "rbxassetid://17014533389",
    ["MapBastion_to5"] = "rbxassetid://131242671308280",
    ["MapBayou_to2"] = "rbxassetid://73199818159080",
    ["MapBayou_to4"] = "rbxassetid://91447535197863",
    ["MapBloom_sw"] = "rbxassetid://17014533553",
    ["MapBlossom_duels"] = "rbxassetid://17014743060",
    ["MapBlossom_sw"] = "rbxassetid://106007285147475",
    ["MapBlossom_to2"] = "rbxassetid://17206365124",
    ["MapBlossom_to4"] = "rbxassetid://17206365609",
    ["MapBlossom_to5"] = "rbxassetid://118594849446503",
    ["MapCampsite_to30"] = "rbxassetid://135877623515827",
    ["MapCandyland_duels"] = "rbxassetid://127932952774337",
    ["MapCandyland_to2"] = "rbxassetid://17014501600",
    ["MapCandyland_to4"] = "rbxassetid://17014533834",
    ["MapCandyland_to5"] = "rbxassetid://94771630615666",
    ["MapCanyon_duels"] = "rbxassetid://17014743316",
    ["MapCanyon_to2"] = "rbxassetid://133294533546214",
    ["MapCanyon_to4"] = "rbxassetid://80670986241810",
    ["MapCastle-Grounds_to4"] = "rbxassetid://91454575825658",
    ["MapCastle_to30"] = "rbxassetid://17014639680",
    ["MapCatacombs_to2"] = "rbxassetid://122980480056765",
    ["MapChampionsValley_to5"] = "rbxassetid://17014502248",
    ["MapCherryHills_to4"] = "rbxassetid://99699606802437",
    ["MapCistern_sw"] = "rbxassetid://111464378108849",
    ["MapCitadelTowers_to4"] = "rbxassetid://108677136313340",
    ["MapCitadelTowers_to5"] = "rbxassetid://136934507977662",
    ["MapCitadel_to2"] = "rbxassetid://17014640051",
    ["MapCitadel_to4"] = "rbxassetid://127889588082459",
    ["MapCoast_to2"] = "rbxassetid://17014503249",
    ["MapCoast_to4"] = "rbxassetid://17014503364",
    ["MapCobblestoneGardens_sw"] = "rbxassetid://111834361900955",
    ["MapCobblestoneGardens_to2"] = "rbxassetid://17206366189",
    ["MapCobblestoneGardens_to4"] = "rbxassetid://17014641336",
    ["MapColosseum_to4"] = "rbxassetid://17014535296",
    ["MapConstruction_to4"] = "rbxassetid://17014535487",
    ["MapCraglands_to4"] = "rbxassetid://17014505031",
    ["MapCreek_to2"] = "rbxassetid://17014505263",
    ["MapCreek_to4"] = "rbxassetid://70782581193769",
    ["MapCrypt_to2"] = "rbxassetid://17014535667",
    ["MapCrypt_to4"] = "rbxassetid://17014535826",
    ["MapCrystalmount_duels"] = "rbxassetid://114747118930080",
    ["MapCrystalmount_to2"] = "rbxassetid://133163733856660",
    ["MapCrystalmount_to4"] = "rbxassetid://129793659861082",
    ["MapCrystalmount_to5"] = "rbxassetid://115428108367374",
    ["MapDarkholm_duels"] = "rbxassetid://136342507589728",
    ["MapDarkholm_to2"] = "rbxassetid://17014642119",
    ["MapDarkholm_to4"] = "rbxassetid://17014642645",
    ["MapDesertOasis_duels"] = "rbxassetid://79732092649166",
    ["MapDesertOasis_sw"] = "rbxassetid://124853340013665",
    ["MapDesertOasis_to2"] = "rbxassetid://134944966415012",
    ["MapDesertOasis_to30"] = "rbxassetid://73559739541713",
    ["MapDesertOasis_to4"] = "rbxassetid://129598654467378",
    ["MapDesertOasis_to5"] = "rbxassetid://105261114023184",
    ["MapDesertShrine_duels"] = "rbxassetid://17014743719",
    ["MapDesertShrine_sw"] = "rbxassetid://139446581743300",
    ["MapDesertShrine_to2"] = "rbxassetid://17014506942",
    ["MapDesertShrine_to30"] = "rbxassetid://17014507296",
    ["MapDesertShrine_to4"] = "rbxassetid://17014507617",
    ["MapDesertShrine_to5"] = "rbxassetid://17331893599",
    ["MapDesertStorm_to2"] = "rbxassetid://17014507813",
    ["MapDesertStorm_to4"] = "rbxassetid://116956189761683",
    ["MapDesertedRuins_to30"] = "rbxassetid://119118001463518",
    ["MapDome_to2"] = "rbxassetid://17014535974",
    ["MapDome_to4"] = "rbxassetid://17014536127",
    ["MapDuneFortress_to4"] = "rbxassetid://91646609177280",
    ["MapEgypt_to4"] = "rbxassetid://100421925046575",
    ["MapElderWoods_to5"] = "rbxassetid://117171667037836",
    ["MapEnchantedForest_duels"] = "rbxassetid://96144364861335",
    ["MapEnchantedForest_to4"] = "rbxassetid://18461220726",
    ["MapFactory_to4"] = "rbxassetid://17014536447",
    ["MapFarm_to2"] = "rbxassetid://17014536700",
    ["MapFarmland_duels"] = "rbxassetid://17014744215",
    ["MapFarmland_to2"] = "rbxassetid://121177970929089",
    ["MapFarmland_to4"] = "rbxassetid://17014508454",
    ["MapFarmland_to5"] = "rbxassetid://89736090255613",
    ["MapFootballField_to4"] = "rbxassetid://17014537003",
    ["MapForestHalloween_to4"] = "rbxassetid://134360858624378",
    ["MapForest_to2"] = "rbxassetid://117335552557543",
    ["MapForest_to4"] = "rbxassetid://78220983569739",
    ["MapFortress_to30"] = "rbxassetid://17014642988",
    ["MapFountainPeaks_duels"] = "rbxassetid://82527201606594",
    ["MapFountainPeaks_to2"] = "rbxassetid://17014509159",
    ["MapFountainPeaks_to4"] = "rbxassetid://17014509443",
    ["MapFrostSite_infected"] = "rbxassetid://17014537608",
    ["MapFungiLand_to2"] = "rbxassetid://17014510337",
    ["MapFungiLand_to4"] = "rbxassetid://17014510511",
    ["MapFusion_to2"] = "rbxassetid://137199709645092",
    ["MapGlacier_duels"] = "rbxassetid://17014744426",
    ["MapGlacier_to2"] = "rbxassetid://17014510873",
    ["MapGlacier_to4"] = "rbxassetid://17014537830",
    ["MapGlade_duels"] = "rbxassetid://17014744624",
    ["MapGlade_sw"] = "rbxassetid://17014538046",
    ["MapGlade_to4"] = "rbxassetid://17014538175",
    ["MapGoldRush_to4"] = "rbxassetid://89501226867024",
    ["MapGorge_royale"] = "rbxassetid://17014511748",
    ["MapGrandpeak_to30"] = "rbxassetid://17014512054",
    ["MapGrandpeak_to4"] = "rbxassetid://129342869389882",
    ["MapGrimGlade_duels"] = "rbxassetid://128029127149805",
    ["MapGrimGlade_sw"] = "rbxassetid://89500437433213",
    ["MapGrotto_to4"] = "rbxassetid://82274949998129",
    ["MapHalloweenMap2025_to4"] = "rbxassetid://107673706897398",
    ["MapHauntedManor_to4"] = "rbxassetid://138500805379544",
    ["MapHighschool_to4"] = "rbxassetid://17014538313",
    ["MapIceberg_pve"] = "rbxassetid://17014512745",
    ["MapIndustry_infected"] = "rbxassetid://17014538487",
    ["MapIrongate_to4"] = "rbxassetid://17014538624",
    ["MapKingdomGardens_to30"] = "rbxassetid://17014513723",
    ["MapMegaPlains_royale"] = "rbxassetid://17014538749",
    ["MapMegaTundra_royale"] = "rbxassetid://17014514068",
    ["MapMilitaryBase_to4"] = "rbxassetid://17014538945",
    ["MapMine_to2"] = "rbxassetid://17014514533",
    ["MapMines_mw"] = "rbxassetid://122748389311593",
    ["MapMineshaft_to4"] = "rbxassetid://17014539137",
    ["MapMiniGolf_to2"] = "rbxassetid://17014539359",
    ["MapMiniGolf_to4"] = "rbxassetid://17014539545",
    ["MapMystic_duels"] = "rbxassetid://17014805953",
    ["MapMystic_to2"] = "rbxassetid://17014515482",
    ["MapMystic_to4"] = "rbxassetid://17014539713",
    ["MapNordicHalloween_duels"] = "rbxassetid://73045980582769",
    ["MapNordic_duels"] = "rbxassetid://17014806140",
    ["MapNordic_to2"] = "rbxassetid://17014643300",
    ["MapNordic_to4"] = "rbxassetid://17014643462",
    ["MapOriental_duels"] = "rbxassetid://120977525722266",
    ["MapOriental_to2"] = "rbxassetid://17014516594",
    ["MapOriental_to4"] = "rbxassetid://17014539905",
    ["MapPagoda_to30"] = "rbxassetid://17014516897",
    ["MapPagoda_to5"] = "rbxassetid://76115021790266",
    ["MapPalace_sw"] = "rbxassetid://85202393441919",
    ["MapPark_to2"] = "rbxassetid://17014540051",
    ["MapPinefallHalloween_to4"] = "rbxassetid://96821638419593",
    ["MapPinefall_to2"] = "rbxassetid://118926600412320",
    ["MapPinefall_to4"] = "rbxassetid://116448090891278",
    ["MapPinewood_duels"] = "rbxassetid://97966792668583",
    ["MapPinewood_sw"] = "rbxassetid://114980048903867",
    ["MapPinewood_to2"] = "rbxassetid://136841316061024",
    ["MapPinewood_to4"] = "rbxassetid://111062822139611",
    ["MapPinewood_to5"] = "rbxassetid://135763814029407",
    ["MapPlaza_to2"] = "rbxassetid://17014540318",
    ["MapPond_to2"] = "rbxassetid://17014643784",
    ["MapPond_to4"] = "rbxassetid://17014644184",
    ["MapPumpkinPatch_duels"] = "rbxassetid://77241450945683",
    ["MapPumpkinPatch_sw"] = "rbxassetid://88617336334879",
    ["MapPumpkinPatch_to30"] = "rbxassetid://113323202844721",
    ["MapPumpkinPatch_to4"] = "rbxassetid://140668140686274",
    ["MapPumpkinPatch_to5"] = "rbxassetid://138187385013221",
    ["MapPumpkin_to4"] = "rbxassetid://77725897319056",
    ["MapQuarry_to4"] = "rbxassetid://17014540621",
    ["MapRabbitsField_to30"] = "rbxassetid://17014644565",
    ["MapReef_to2"] = "rbxassetid://93065445949488",
    ["MapReef_to4"] = "rbxassetid://79784869677421",
    ["MapReservoir_to30"] = "rbxassetid://17014654077",
    ["MapRuins_duels"] = "rbxassetid://17014519098",
    ["MapRuins_gg"] = "rbxassetid://17014519371",
    ["MapRuins_to4"] = "rbxassetid://17014541106",
    ["MapSanctuary_to30"] = "rbxassetid://17014519773",
    ["MapSanctuary_to5"] = "rbxassetid://17014645421",
    ["MapSanctum_to4"] = "rbxassetid://17014520323",
    ["MapSandShrine_to2"] = "rbxassetid://17014520578",
    ["MapSandShrine_to4"] = "rbxassetid://17014520899",
    ["MapSandTemple_duels"] = "rbxassetid://17014521307",
    ["MapSandTemple_to2"] = "rbxassetid://17014521594",
    ["MapSandTemple_to4"] = "rbxassetid://17014541281",
    ["MapSandTemple_to5"] = "rbxassetid://104702173304877",
    ["MapSandbox_to4"] = "rbxassetid://17014521844",
    ["MapSandstorm_to2"] = "rbxassetid://17014541455",
    ["MapSandyCove_sw"] = "rbxassetid://106440814752913",
    ["MapSeasonal_duels"] = "rbxassetid://88076127467705",
    ["MapSeasonal_to2"] = "rbxassetid://17014645801",
    ["MapSeasonal_to4"] = "rbxassetid://17014646087",
    ["MapSecretGardens_to2"] = "rbxassetid://18461221674",
    ["MapShipsAhoy_to30"] = "rbxassetid://17014646695",
    ["MapShrine_to2"] = "rbxassetid://17014541767",
    ["MapShrine_to4"] = "rbxassetid://17014541965",
    ["MapSiege_gg"] = "rbxassetid://17014523259",
    ["MapSkullIsland_to2"] = "rbxassetid://17014523406",
    ["MapSkullIsland_to30"] = "rbxassetid://17014523768",
    ["MapSkullIsland_to4"] = "rbxassetid://17014523945",
    ["MapSnowLodge_duels"] = "rbxassetid://17014806725",
    ["MapSpiritBlossom_to4"] = "rbxassetid://71477087546503",
    ["MapSpookyMansion_to4"] = "rbxassetid://70528958116663",
    ["MapSpookyTowers_to5"] = "rbxassetid://126916024048792",
    ["MapSpring_to30"] = "rbxassetid://17014524102",
    ["MapSteamPunk_duels"] = "rbxassetid://71351659223503",
    ["MapStoneFortress_to5"] = "rbxassetid://75848921575071",
    ["MapStreamValley_to4"] = "rbxassetid://105117768708588",
    ["MapSummit_to5"] = "rbxassetid://17014647047",
    ["MapSwamp_duels"] = "rbxassetid://111144418426037",
    ["MapSwamp_sw"] = "rbxassetid://75971256344756",
    ["MapSwamp_to2"] = "rbxassetid://17014524614",
    ["MapSwamp_to4"] = "rbxassetid://17014647475",
    ["MapTeaTime_to2"] = "rbxassetid://17014542554",
    ["MapTranquilMeadow_to4"] = "rbxassetid://132400730250644",
    ["MapTreehouse_to4"] = "rbxassetid://17014525200",
    ["MapTreetop_gg"] = "rbxassetid://17014525358",
    ["MapTundra_sw"] = "rbxassetid://17014542861",
    ["MapTundra_sw4"] = "rbxassetid://17014543245",
    ["MapUnderworld_to4"] = "rbxassetid://17206480000",
    ["MapVineyard_to2"] = "rbxassetid://17014525888",
    ["MapVineyard_to4"] = "rbxassetid://139769653913796",
    ["MapVoidlands_to4"] = "rbxassetid://17014526083",
    ["MapVolatile_duels"] = "rbxassetid://17014526430",
    ["MapVolatile_sw"] = "rbxassetid://17014543531",
    ["MapVolatile_sw4"] = "rbxassetid://17014543775",
    ["MapVolatile_to2"] = "rbxassetid://106584331136904",
    ["MapVolatile_to4"] = "rbxassetid://122344578423842",
    ["MapVolatile_to5"] = "rbxassetid://117631983653598",
    ["MapVolcano_to2"] = "rbxassetid://17014544027",
    ["MapVolcano_to4"] = "rbxassetid://17014544271",
    ["MapWasteland_sw"] = "rbxassetid://17014544484",
    ["MapWasteland_sw4"] = "rbxassetid://17014544745",
    ["MapWestern_to2"] = "rbxassetid://17014527280",
    ["MapWestern_to4"] = "rbxassetid://17014544898",
    ["MapWindfall_to2"] = "rbxassetid://17014545071",
    ["MapWindfall_to4"] = "rbxassetid://17014545317",
    ["MapWinterForest_to4"] = "rbxassetid://93577954399957",
    ["MapWinterForest_to5"] = "rbxassetid://71094827263064",
    ["MapWorkshop_to4"] = "rbxassetid://17524418597"
}
v6.match_mechanics = {
    ["aerial_warfare"] = "rbxassetid://17449881242",
    ["back_to_school_day"] = "rbxassetid://91091379082823",
    ["blood_money"] = "rbxassetid://18461222062",
    ["capture_points"] = "rbxassetid://17014527861",
    ["delicious_diamonds"] = "rbxassetid://18461222208",
    ["excaliburs_bounty"] = "rbxassetid://18461222415",
    ["forge"] = "rbxassetid://17014527947",
    ["glitched_enchant_table"] = "rbxassetid://17014528023",
    ["golden_goose"] = "rbxassetid://17014528096",
    ["guardian_of_dream"] = "rbxassetid://101510751621010",
    ["head_start"] = "rbxassetid://82476670873245",
    ["increased_health"] = "rbxassetid://17014528184",
    ["item_balloon_snowball"] = "rbxassetid://17014528259",
    ["item_grappling_hook_stopwatch"] = "rbxassetid://17014528367",
    ["item_potions"] = "rbxassetid://17014528477",
    ["lightning"] = "rbxassetid://17207588531",
    ["more_ores"] = "rbxassetid://17182452477",
    ["none"] = "rbxassetid://17014528538",
    ["relic_dragon_egg"] = "rbxassetid://17014528616",
    ["relic_enchanted"] = "rbxassetid://17014528661",
    ["relic_knights_code"] = "rbxassetid://17014528777",
    ["relic_light_step"] = "rbxassetid://17014528873",
    ["relic_runic_divide"] = "rbxassetid://17014529007",
    ["relic_supercharged_drill"] = "rbxassetid://17014529136",
    ["rising_lava"] = "rbxassetid://94892832720402",
    ["simplified"] = "rbxassetid://17014529254",
    ["snow_cone_machine"] = "rbxassetid://17014529354",
    ["squad_launcher"] = "rbxassetid://17449401358",
    ["swift_finale"] = "rbxassetid://17182729859",
    ["traveling_merchant"] = "rbxassetid://17014529447",
    ["vending_machine"] = "rbxassetid://17014529513",
    ["void_portals"] = "rbxassetid://17449924762"
}
v6.og_blocks = {
    ["birch_log"] = {
        ["icon"] = "rbxassetid://122243766367487",
        ["s"] = "rbxassetid://121965007873757",
        ["td"] = "rbxassetid://77510118741694"
    },
    ["brick"] = {
        ["icon"] = "rbxassetid://82764103503812",
        ["s"] = "rbxassetid://88951048102898"
    },
    ["ceramic"] = {
        ["icon"] = "rbxassetid://109043125104970",
        ["s"] = "rbxassetid://121325627321832"
    },
    ["clay"] = {
        ["icon"] = "rbxassetid://110186295918708",
        ["s"] = "rbxassetid://132704840039886"
    },
    ["clay_black"] = {
        ["icon"] = "rbxassetid://94545100037183",
        ["s"] = "rbxassetid://89868133205247"
    },
    ["clay_blue"] = {
        ["icon"] = "rbxassetid://112682834212534",
        ["s"] = "rbxassetid://127022227115882"
    },
    ["clay_cyan"] = {
        ["icon"] = "rbxassetid://132059320122785",
        ["s"] = "rbxassetid://75762259997649"
    },
    ["clay_dark_brown"] = {
        ["icon"] = "rbxassetid://97847555762953",
        ["s"] = "rbxassetid://80437388006171"
    },
    ["clay_dark_green"] = {
        ["icon"] = "rbxassetid://78211618022831",
        ["s"] = "rbxassetid://81217574315563"
    },
    ["clay_gray"] = {
        ["icon"] = "rbxassetid://138147695972882",
        ["s"] = "rbxassetid://117860987987684"
    },
    ["clay_light_green"] = {
        ["icon"] = "rbxassetid://122375789196184",
        ["s"] = "rbxassetid://124450976644175"
    },
    ["clay_orange"] = {
        ["icon"] = "rbxassetid://139747748846281",
        ["s"] = "rbxassetid://71700580920512"
    },
    ["clay_pink"] = {
        ["icon"] = "rbxassetid://130402476141606",
        ["s"] = "rbxassetid://124914910846898"
    },
    ["clay_purple"] = {
        ["icon"] = "rbxassetid://129844983474517",
        ["s"] = "rbxassetid://92926168432453"
    },
    ["clay_red"] = {
        ["icon"] = "rbxassetid://108127500228746",
        ["s"] = "rbxassetid://130414204961031"
    },
    ["clay_white"] = {
        ["icon"] = "rbxassetid://83571456202126",
        ["s"] = "rbxassetid://137881506693953"
    },
    ["clay_yellow"] = {
        ["icon"] = "rbxassetid://137747849096223",
        ["s"] = "rbxassetid://71924942100204"
    },
    ["cobblestone"] = {
        ["icon"] = "rbxassetid://84841949943919",
        ["s"] = "rbxassetid://123072592623392"
    },
    ["diamond_block"] = {
        ["icon"] = "rbxassetid://114624479793699",
        ["s"] = "rbxassetid://106490117387870"
    },
    ["emerald_block"] = {
        ["icon"] = "rbxassetid://119980109224603",
        ["s"] = "rbxassetid://81244085822951"
    },
    ["gold_block"] = {
        ["icon"] = "rbxassetid://124033257883774",
        ["s"] = "rbxassetid://127902947115447"
    },
    ["grass"] = {
        ["d"] = "rbxassetid://118655329103528",
        ["icon"] = "rbxassetid://125461738768635",
        ["s"] = "rbxassetid://106516217671621",
        ["t"] = "rbxassetid://96082904840083"
    },
    ["hickory_log"] = {
        ["icon"] = "rbxassetid://70666385725041",
        ["s"] = "rbxassetid://76597236171973",
        ["td"] = "rbxassetid://101758719421740"
    },
    ["ice"] = {
        ["icon"] = "rbxassetid://120528592123296",
        ["s"] = "rbxassetid://116614766114215"
    },
    ["iron_block"] = {
        ["icon"] = "rbxassetid://130931743156322",
        ["s"] = "rbxassetid://123517761643578"
    },
    ["log_maple"] = {
        ["icon"] = "rbxassetid://97301418089106",
        ["s"] = "rbxassetid://125567712365754",
        ["td"] = "rbxassetid://85806656097161"
    },
    ["marble"] = {
        ["icon"] = "rbxassetid://136299642824179",
        ["s"] = "rbxassetid://88467139703778"
    },
    ["marble_pillar"] = {
        ["icon"] = "rbxassetid://133597883079375",
        ["s"] = "rbxassetid://85687063208015",
        ["td"] = "rbxassetid://98212753758603"
    },
    ["oak_log"] = {
        ["icon"] = "rbxassetid://89493774822936",
        ["s"] = "rbxassetid://75662912774273",
        ["td"] = "rbxassetid://75881511441800"
    },
    ["obsidian"] = {
        ["icon"] = "rbxassetid://88827491837062",
        ["s"] = "rbxassetid://79546092270536"
    },
    ["red_sandstone"] = {
        ["icon"] = "rbxassetid://121087001877158",
        ["s"] = "rbxassetid://86399348170380"
    },
    ["red_sandstone_polished"] = {
        ["icon"] = "rbxassetid://139119487220328",
        ["s"] = "rbxassetid://113012931793338"
    },
    ["red_sandstone_smooth"] = {
        ["icon"] = "rbxassetid://115093731110230",
        ["s"] = "rbxassetid://80928391293656"
    },
    ["sand"] = {
        ["icon"] = "rbxassetid://101561775377277",
        ["s"] = "rbxassetid://73651176274525"
    },
    ["sandstone"] = {
        ["icon"] = "rbxassetid://92025434539953",
        ["s"] = "rbxassetid://76683142785642"
    },
    ["sandstone_polished"] = {
        ["icon"] = "rbxassetid://82984398391008",
        ["s"] = "rbxassetid://120794486821941"
    },
    ["slime_block"] = {
        ["icon"] = "rbxassetid://126676190901482",
        ["s"] = "rbxassetid://77640855869710"
    },
    ["snow"] = {
        ["icon"] = "rbxassetid://99233485325555",
        ["s"] = "rbxassetid://121105850128839"
    },
    ["spruce_log"] = {
        ["icon"] = "rbxassetid://114405700839414",
        ["s"] = "rbxassetid://89044058073103",
        ["td"] = "rbxassetid://109265252479168"
    },
    ["stone"] = {
        ["icon"] = "rbxassetid://86412466460282",
        ["s"] = "rbxassetid://120157326877905"
    },
    ["stone_brick"] = {
        ["icon"] = "rbxassetid://100440456273043",
        ["s"] = "rbxassetid://121360821520074"
    },
    ["stone_tiles"] = {
        ["icon"] = "rbxassetid://107917862767177",
        ["s"] = "rbxassetid://129337600883305"
    },
    ["tnt"] = {
        ["icon"] = "rbxassetid://76224292755882",
        ["s"] = "rbxassetid://111133407279235",
        ["td"] = "rbxassetid://134620720679563"
    },
    ["wood_plank_birch"] = {
        ["icon"] = "rbxassetid://111872086602198",
        ["s"] = "rbxassetid://105312562306225"
    },
    ["wood_plank_hickory"] = {
        ["icon"] = "rbxassetid://75678697686720",
        ["s"] = "rbxassetid://89895824529447"
    },
    ["wood_plank_maple"] = {
        ["icon"] = "rbxassetid://109399462276575",
        ["s"] = "rbxassetid://82376810351479"
    },
    ["wood_plank_oak"] = {
        ["icon"] = "rbxassetid://134760215044349",
        ["s"] = "rbxassetid://123765855499884"
    },
    ["wood_plank_spruce"] = {
        ["icon"] = "rbxassetid://108654578090711",
        ["s"] = "rbxassetid://131996468540015"
    },
    ["wool_black"] = {
        ["icon"] = "rbxassetid://91179509360769",
        ["s"] = "rbxassetid://100825063838586"
    },
    ["wool_blue"] = {
        ["icon"] = "rbxassetid://81447386828366",
        ["s"] = "rbxassetid://121852575855715"
    },
    ["wool_cyan"] = {
        ["icon"] = "rbxassetid://104712218683938",
        ["s"] = "rbxassetid://82511554840802"
    },
    ["wool_green"] = {
        ["carpetDarkGreen"] = "rbxassetid://105307467334155",
        ["icon"] = "rbxassetid://76772331960563",
        ["s"] = "rbxassetid://101574924719239"
    },
    ["wool_orange"] = {
        ["icon"] = "rbxassetid://89802447176082",
        ["s"] = "rbxassetid://90607460579295"
    },
    ["wool_pink"] = {
        ["icon"] = "rbxassetid://121401427850799",
        ["s"] = "rbxassetid://91373246098086"
    },
    ["wool_purple"] = {
        ["icon"] = "rbxassetid://126811899981260",
        ["s"] = "rbxassetid://76197686839302"
    },
    ["wool_red"] = {
        ["icon"] = "rbxassetid://71977870341343",
        ["s"] = "rbxassetid://101440233200804"
    },
    ["wool_white"] = {
        ["icon"] = "rbxassetid://85491393837313",
        ["s"] = "rbxassetid://97683582467853"
    },
    ["wool_yellow"] = {
        ["icon"] = "rbxassetid://83963228559436",
        ["s"] = "rbxassetid://113128975669839"
    }
}
return v6