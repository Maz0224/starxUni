local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "Star X2", -- This Is Title Of Your Window
	Subtitle = "Universal Script", -- A Gray Subtitle next To the main title.
	LogoID = "114104362637519", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
	LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
	LoadingTitle = "StarX • V2", -- Header for loading screen
	LoadingSubtitle = "by maz24", -- Subtitle for loading screen

	ConfigSettings = {
		RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
		ConfigFolder = "Big Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
	},

	KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
	KeySettings = {
		Title = "Luna Example Key",
		Subtitle = "Key System",
		Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
		SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		Key = {"Example Key"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		SecondAction = {
			Enabled = true, -- Set to false if you do not want a second action,
			Type = "Link", -- Link / Discord.
			Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
		}
	}
})

Window:CreateHomeTab({
	SupportedExecutors = {"Delta", "Solara", "Xeno"}, -- A Table Of Executors Your Script Supports. Add strings of the executor names for each executor.
	DiscordInvite = "1234", -- The Discord Invite Link. Do Not Include discord.gg/ | Only Include the code.
	Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})

local player = game.Players.LocalPlayer

-- functions --
local function tp(cf)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf
end

-- player tab --
local playerTab = Window:CreateTab({
    Name = "Player Tab",
    Icon = "person",
    ImageSource = "Material",
    ShowTitle = true
})

playerTab:CreateSection("Local Player")

local WalkSpeedSlider = playerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 999},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
}, "Slider")

local JumpPowerSlider = playerTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 999},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
}, "Slider")

-- blocks n props --

local bapTab = Window:CreateTab({
    Name = "Blocks N' Props",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})

bapTab:CreateSection("Tower")

local Button = bapTab:CreateButton({
	Name = "Instant Win",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
		if player.Team == game.Teams.Towers then
			tp(workspace.Map.Classic.Button.CFrame)
		end
    	end
})

local Button = bapTab:CreateButton({
	Name = "TP To Destroyer",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
		if player.Team == game.Teams.Towers then
			tp(workspace.Map.Classic.Shooter.PARTSPAWNAREA.CFrame)
		end
    	end
})

local Button = bapTab:CreateButton({
	Name = "Destroy Kill Brick",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
		workspace.Map.Classic.KillBrick:Destroy()
    	end
})
