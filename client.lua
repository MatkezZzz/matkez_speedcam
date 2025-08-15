
Citizen.CreateThread(function()
    Wait(2000)
    for k, v in pairs(Config.Kamere) do
        if v.blip.ukljuceno then
            local blip = AddBlipForCoord(v.coords.xyz)
            SetBlipSprite(blip, v.blip.sprite) 
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.blip.velicina)
            SetBlipColour(blip, v.blip.boja)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.blip.ime)
            EndTextCommandSetBlipName(blip)
        end
        local k = lib.zones.sphere({
            coords = v.coords,
            radius = v.radius,
            debug = v.debug,
        })
        function k:onEnter()
            local igracPed = PlayerPedId()
            if IsPedInAnyVehicle(igracPed, false) then
                local vozilo = GetVehiclePedIsIn(igracPed, false)
                if GetPedInVehicleSeat(vozilo, -1) ~= PlayerPedId() then return end
                local brzina = GetEntitySpeed(vozilo) * Config.Mult
                if GetVehicleClass(vozilo) == 18 then return end
                if math.round(brzina) > v.brzina then
                    AnimpostfxPlay('LostTimeDay', 0, true)
                    PlaySoundFrontend(-1, 'Crash', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1 )
                    Wait(50)
                    AnimpostfxStopAll()
                    lib.callback.await('matkez_speedcam:napisiKaznu', false, k)
                end
            end
        end
    end

end)
