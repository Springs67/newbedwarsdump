local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v2 = {}
for v3, v4 in v1.Dummy.Asen do
    v2[v3] = v4
end
v2.message = "1 hi"
v2.time = os.time()
local v5 = {}
for v6, v7 in v1.Dummy.Asen do
    v5[v6] = v7
end
v5.message = "2 hi my name is asen. And i\'m a pro at modeling!"
v5.time = os.time()
local v8 = {}
for v9, v10 in v1.Dummy.Asen do
    v8[v9] = v10
end
v8.message = "3 hi"
v8.time = os.time()
local v11 = {}
for v12, v13 in v1.Dummy.Asen do
    v11[v12] = v13
end
v11.message = "4 hi"
v11.time = os.time()
local v14 = {}
for v15, v16 in v1.Dummy.Asen do
    v14[v15] = v16
end
v14.message = "5 hi"
v14.time = os.time()
local v17 = {}
for v18, v19 in v1.Dummy.Asen do
    v17[v18] = v19
end
v17.message = "6 hi"
v17.time = os.time()
local v20 = {}
for v21, v22 in v1.Dummy.Asen do
    v20[v21] = v22
end
v20.message = "7 hi"
v20.time = os.time()
local v23 = {}
for v24, v25 in v1.Dummy.Asen do
    v23[v24] = v25
end
v23.message = "8 hi"
v23.time = os.time()
local v26 = {}
for v27, v28 in v1.Dummy.Asen do
    v26[v27] = v28
end
v26.message = "9 hi"
v26.time = os.time()
local v29 = {}
for v30, v31 in v1.Dummy.SnickTrix do
    v29[v30] = v31
end
v29.message = "10 hi"
v29.time = os.time()
local v32 = {}
for v33, v34 in v1.Dummy.Chase do
    v32[v33] = v34
end
v32.message = "11 last message"
v32.time = os.time()
local v35 = {}
for v36, v37 in v1.Dummy.oiogy do
    v35[v36] = v37
end
v35.message = "12 last last message"
v35.time = os.time()
return {
    ["ClanChatHoarcekatMessages"] = {
        v2,
        v5,
        v8,
        v11,
        v14,
        v17,
        v20,
        v23,
        v26,
        v29,
        v32,
        v35
    }
}