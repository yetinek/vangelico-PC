ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

local MinigameActive = false
local MinigameFinished = false
local SuccessTrigger = nil
local FailTrigger = nil
local Success = false

function StartPc(cb)
        if MinigameActive then return end
    
            SetNuiFocus(true, true)
            SendNUIMessage({type = 'otworz'})
            MinigameActive = true
            MinigameFinished = false
    
            while MinigameActive do
                Citizen.Wait(500)
            end
    
            if cb then
                cb(Success)
            end
    
            return Success
        end
    
    exports('StartPc', StartPc)

    RegisterCommand("test1", function(cb)
        StartPc()
    end)


RegisterNUICallback('udane', function(data, cb)
    SetNuiFocus(false, false)
    Success = true
    MinigameFinished = false
    MinigameActive = false
    cb('ok')
end)

RegisterNUICallback('nieudane', function(data, cb)
    SetNuiFocus(false, false)
    MinigameActive = false
    Success = false
    cb('ok')
end)

---local success = exports['flecca_panel']:StartPc()
---if success then
    ---ESX.ShowNotification('Udane')
---elseif not success then
---ESX.ShowNotification('Nie Udane')
---end
