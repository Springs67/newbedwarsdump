return function(p1, p2, p3, p4) --[[ Line: 1 ]]
    local v5 = Instance.new("Attachment")
    v5.Position = Vector3.new(0, p2, 0)
    v5.Parent = p1
    local v6 = Instance.new("Attachment")
    local v7 = -p2
    v6.Position = Vector3.new(0, v7, 0)
    v6.Parent = p1
    local v8 = Instance.new("Trail")
    v8.FaceCamera = true
    v8.LightInfluence = false
    v8.Lifetime = 0.55
    v8.Attachment0 = v5
    v8.Attachment1 = v6
    v8.Brightness = 5
    v8.Color = ColorSequence.new(p3 or Color3.fromRGB(108, 168, 255))
    v8.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0) })
    v8.Transparency = NumberSequence.new(p4)
    v8.Parent = p1
    return v8
end