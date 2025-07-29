local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Star Universal",
   Icon = "sparkle", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Universal Hub",
   LoadingSubtitle = "by maz24",
   ShowText = "Star GUI", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- FUNCTIONS --

local function teleportPlayer(cframe)
   game.Player.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
end

-- PLAYER TAB --

local playerTab = Window:CreateTab("Player", "user") -- Title, Image
local HumanoidSection = playerTab:CreateSection("Humanoid")

local Slider = playerTab:CreateSlider({
   Name = "Speed",
   Range = {0, 999},
   Increment = 1,
   Suffix = "speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Slider = playerTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 999},
   Increment = 1,
   Suffix = "jump power",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- BUILD A BOAT TAB --

local babTab = Window:CreateTab("Build A Boat", "gamepad-2") -- Title, Image
local farmSec = babTab:CreateSection("Farming")

local Toggle = babTab:CreateToggle({
   Name = "Autofarm 1",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         
         local stages = game.Workspace.BoatStages.NormalStages:GetChildren()

         for i, v in ipairs(stages) do
            if v == #stages then
               teleportPlayer(game.Workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Cap.Hinge.Part.CFrame)
               task.wait(15)  
            else
               teleportPlayer(v)
               task.wait(0.25)
            end
         end
   end,
})


