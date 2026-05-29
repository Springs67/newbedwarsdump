local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Anime = 0
v1[0] = "Anime"
v2.Blue = 1
v1[1] = "Blue"
v2.Fireworks = 2
v1[2] = "Fireworks"
v2.Night = 3
v1[3] = "Night"
v2.NorthernLights = 4
v1[4] = "NorthernLights"
v2.Pale = 5
v1[5] = "Pale"
v2.Sunset = 6
v1[6] = "Sunset"
return {
    ["SkyboxId"] = v2,
    ["SkyboxTextureMeta"] = {
        [v2.Anime] = {
            ["backTexture"] = "rbxassetid://73580800650233",
            ["downTexture"] = "rbxassetid://131462391839487",
            ["frontTexture"] = "rbxassetid://89436809987566",
            ["leftTexture"] = "rbxassetid://82968313189430",
            ["rightTexture"] = "rbxassetid://106415199313719",
            ["upTexture"] = "rbxassetid://101252075790244"
        },
        [v2.Blue] = {
            ["backTexture"] = "rbxassetid://127785447934533",
            ["downTexture"] = "rbxassetid://85993601594151",
            ["frontTexture"] = "rbxassetid://71124029678853",
            ["leftTexture"] = "rbxassetid://94735736143995",
            ["rightTexture"] = "rbxassetid://132551654663146",
            ["upTexture"] = "rbxassetid://98007067951706"
        },
        [v2.Fireworks] = {
            ["backTexture"] = "rbxassetid://122256464156794",
            ["downTexture"] = "rbxassetid://72892858335199",
            ["frontTexture"] = "rbxassetid://104616460919899",
            ["leftTexture"] = "rbxassetid://80394836102071",
            ["rightTexture"] = "rbxassetid://133079014848906",
            ["upTexture"] = "rbxassetid://101297169341533"
        },
        [v2.Night] = {
            ["backTexture"] = "rbxassetid://138362781796021",
            ["downTexture"] = "rbxassetid://96949356501511",
            ["frontTexture"] = "rbxassetid://109816510422243",
            ["leftTexture"] = "rbxassetid://94475569989615",
            ["rightTexture"] = "rbxassetid://94855042406340",
            ["upTexture"] = "rbxassetid://71804936650611"
        },
        [v2.NorthernLights] = {
            ["backTexture"] = "rbxassetid://99514670127922",
            ["downTexture"] = "rbxassetid://128428391446685",
            ["frontTexture"] = "rbxassetid://116479375430315",
            ["leftTexture"] = "rbxassetid://102995613808064",
            ["rightTexture"] = "rbxassetid://129016689174401",
            ["upTexture"] = "rbxassetid://119793574107846"
        },
        [v2.Pale] = {
            ["backTexture"] = "rbxassetid://129040057799005",
            ["downTexture"] = "rbxassetid://108229978830691",
            ["frontTexture"] = "rbxassetid://94401936580470",
            ["leftTexture"] = "rbxassetid://137645305790364",
            ["rightTexture"] = "rbxassetid://135988132779001",
            ["upTexture"] = "rbxassetid://99891198993750"
        },
        [v2.Sunset] = {
            ["backTexture"] = "rbxassetid://124652558951194",
            ["downTexture"] = "rbxassetid://106376994713514",
            ["frontTexture"] = "rbxassetid://123461330403707",
            ["leftTexture"] = "rbxassetid://76927241868103",
            ["rightTexture"] = "rbxassetid://78071966045361",
            ["upTexture"] = "rbxassetid://137293079840573"
        }
    }
}