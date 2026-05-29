local v1 = {
    ["WOOD"] = {
        ["TopSurface"] = Enum.SurfaceType.Studs,
        ["BottomSurface"] = Enum.SurfaceType.Studs,
        ["LeftSurface"] = Enum.SurfaceType.Studs,
        ["RightSurface"] = Enum.SurfaceType.Studs,
        ["FrontSurface"] = Enum.SurfaceType.Studs,
        ["BackSurface"] = Enum.SurfaceType.Studs
    },
    ["LEAVES"] = {
        ["TopSurface"] = Enum.SurfaceType.Weld,
        ["BottomSurface"] = Enum.SurfaceType.Weld,
        ["LeftSurface"] = Enum.SurfaceType.Weld,
        ["RightSurface"] = Enum.SurfaceType.Weld,
        ["FrontSurface"] = Enum.SurfaceType.Weld,
        ["BackSurface"] = Enum.SurfaceType.Weld
    },
    ["WOOL"] = {
        ["TopSurface"] = Enum.SurfaceType.Universal,
        ["BottomSurface"] = Enum.SurfaceType.Universal,
        ["LeftSurface"] = Enum.SurfaceType.Universal,
        ["RightSurface"] = Enum.SurfaceType.Universal,
        ["FrontSurface"] = Enum.SurfaceType.Universal,
        ["BackSurface"] = Enum.SurfaceType.Universal
    },
    ["STONE"] = {}
}
return {
    ["StuddedMapBlockTypes"] = v1
}