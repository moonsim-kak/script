local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local uwp = library:Window("Toto hub main")

uwp:Toggle("auto click", false, function(Value)
    getgenv().Toggle = Value
    while getgenv().Toggle do
    wait()
    game:GetService("ReplicatedStorage").Events.Click3:FireServer()
    end
end)

spawn(function()
    function rebirth(amount)
        local args = {
            [1] = amount
        }
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
      end
  end)

  function hatch(name, mode)
    local args = {
        [1] = name,
        [2] = mode
    }
    game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
      end
    
    local EggTable = {}
    local Eggs = game:GetService("Workspace").Scripts.Eggs
    
    for _,v in next, Eggs:GetChildren() do
        table.insert(EggTable, v.Name)
    end
    
    local eggchoice;
    local EggChoice = uwp:Dropdown("Select egg",EggTable, function(PetChoice)
        eggchoice = PetChoice
     end)

     local SelectedMode;
     local SelectMode = uwp:Dropdown("Select egg open mode",{"Single", "Triple"}, function(Option)
        SelectedMode = Option
     end)

     uwp:Toggle("auto open egg", false, function(Value)
        getgenv().autohatch = Value 
      while getgenv().autohatch == true do 
      hatch(eggchoice, SelectedMode)
        end
    end)
    
    local EggCombo = uwp:Label(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.EggCombo.Text)

    spawn(function()
        while true do wait()
        EggCombo:set(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.EggCombo.Text)
        end
        end)

        uwp:Toggle("auto craft", false, function(Value)
            getgenv().Toggle = Value
               while getgenv().Toggle do
                wait()
               game:GetService("ReplicatedStorage").Functions.Request:InvokeServer(table.unpack({"CraftAll",{},}))
            end
    end)

  spawn(function()
    function rebirth(amount)
        local args = {
            [1] = amount
        }
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
      end
  end)

  local ToggleHighest = uwp:Toggle("auto rebirth highest you got", false, function(Value)
    getgenv().autorebirth = Value 
    while getgenv().autorebirth == true do 
  wait()
rebirth(game:GetService("Players").LocalPlayer.Upgrades.RebirthButtons.Value)
    end
end)

local set = library:Window("setting")

set:Button("unlock game pass", function()
    game:GetService("Players").LocalPlayer.Passes.AutoClicker.Value = true
    game:GetService("Players").LocalPlayer.Passes.AutoRebirth.Value = true
    game:GetService("Players").LocalPlayer.SpaceUpgrades.Teleport.Value = 1
    game:GetService("Players").LocalPlayer.Upgrades.FreeAutoClicker.Value = 1
    game:GetService("Players").LocalPlayer.Upgrades.FasterFreeAutoClicker.Value = 6
 end)

 set:Button("claim all chest", function()
    game:GetService("Players").LocalPlayer.Passes.AutoChestCollect.Value = true
    wait(10)
    game:GetService("Players").LocalPlayer.Passes.AutoChestCollect.Value = false
 end)
