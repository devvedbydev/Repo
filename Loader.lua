local function fetchSupportedExecutors()
    local url = "https://pastebin.com/raw/nceb2xS8"
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        print("[ERROR]: Failed to fetch executors. Reason: " .. response)
        return nil
    end

    local executors = {}
    for line in response:gmatch("[^\r\n]+") do
        table.insert(executors, line)
    end

    return executors
end

local function isExecutorSupported(currentExecutor, supportedExecutors)
    for _, executor in ipairs(supportedExecutors) do
        if currentExecutor:lower():find(executor:lower()) then
            return true
        end
    end
    return false
end

local currentExecutor = identifyexecutor()
print("[INFO]: Checking if executor " .. currentExecutor .. " supported.")

local supportedExecutors = fetchSupportedExecutors()
if supportedExecutors then
    if isExecutorSupported(currentExecutor, supportedExecutors) then
        print("[SUCCESS]: Executor supported.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/devvedbydev/Repo/refs/heads/main/SecondaryLoader.lua"))()
    else
        print("[ERROR]: Executor not supported.")
    end
else
    print("[ERROR]: No supported executors could be retrieved.")
end
