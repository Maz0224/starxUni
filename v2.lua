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
	SupportedExecutors = {"Delta", "Solara", "Xeno"}, -- A Table Of Executors Your Script Supports. Add strings of the executor i for each executor.
	DiscordInvite = "1234", -- The Discord Invite Link. Do Not Include discord.gg/ | Only Include the code.
	Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})

-- g bools --
_G.moneyfarmscam = false


-- script functions --
local function moneyfarmscamfunc()
	while _G.moneyfarmscam do
		game:GetService("ReplicatedStorage").Reward:FireServer("notepad")
		task.wait()
	end
end

-- vars --
local player = game.Players.LocalPlayer
local scamMsg

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

local scamTab = Window:CreateTab({
    Name = "☎️ scam call center simulator",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})

scamTab:CreateSection("Text")

local Input = scamTab:CreateInput({
	Name = "Say Anything",
	Description = nil,
	PlaceholderText = "Text",
	CurrentValue = "", -- the current text
	Numeric = false, -- When true, the user may only type numbers in the box (Example walkspeed)
	MaxCharacters = nil, -- if a number, the textbox length cannot exceed the number
	Enter = false, -- When true, the callback will only be executed when the user presses enter.
    	Callback = function(Text)
			scamMsg = Text
    	end
}, "Input") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

scamTab:CreateDivider()

local Button = scamTab:CreateButton({
	Name = "Annouce It",
	Description = "CS", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
local Remote = game:GetService("ReplicatedStorage").Announcement
firesignal(Remote.OnClientEvent, table.unpack({
    [1] = game.Players.LocalPlayer.Name,
    [2] = scamMsg,
}))			
    	end
})

local Button = scamTab:CreateButton({
	Name = "Say It!",
	Description = "SS", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
		game:GetService("ReplicatedStorage").DialogueClicked:FireServer(scamMsg)
    	end
})

scamTab:CreateSection("Player")

local Button = scamTab:CreateButton({
	Name = "Unfreeze Player",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
			game:GetService("ReplicatedStorage").FreezePlr:FireServer(false)
    	end
})

local Button = scamTab:CreateButton({
	Name = "Energy Drink",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
			game:GetService("ReplicatedStorage").Passoffs.Energydrink:FireServer(true)
    	end
})

scamTab:CreateSection("Computer")

local Button = scamTab:CreateButton({
	Name = "Dial",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
			game:GetService("ReplicatedStorage").Passoffs.Dialedup:FireServer(true)
    	end
})

scamTab:CreateSection("Money")

local Button = scamTab:CreateButton({
	Name = "Give Money",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
			game:GetService("ReplicatedStorage").Reward:FireServer("notepad")
    	end
})

local Toggle = scamTab:CreateToggle({
	Name = "Infinite Money",
	Description = nil,
	CurrentValue = false,
    	Callback = function(Value)
			_G.moneyfarmscam = Value
			moneyfarmscamfunc()
    	end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

