if Config.Framework == 'ESX' then 
    local ESX = exports.es_extended:GetSharedObject()
end

lib.callback.register('matkez_speedcam:napisiKaznu', function(source, cena, razlog, stash, society)
    if not source or cena >= 10000 then return end
    if Config.SkiniOdmah then
        if Config.Framework == 'QBOX' then
            exports.qbx_core:RemoveMoney(source, 'bank', cena, razlog)
        elseif Config.Framework == 'ESX' then 
            xPlayer.removeAccountMoney('bank', cena)
        end
        if society then
            if Config.Framework == 'QBOX' then
                exports['Renewed-Banking']:addAccountMoney(stash, cena)
            elseif Config.Framework == 'ESX' then 
                TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..stash, function(acc)
                    acc.addMoney(cena)
                end)
            end
        else
            exports.ox_inventory:AddItem(stash, 'money', cena)
        end
    else
        TriggerEvent("okokBilling:CreateCustomInvoice", source, cena, razlog, razlog, stash, stash)
    end
    TriggerClientEvent('ox_lib:notify', source, {
        title = Config.Notify.notifTitle,
        description = Config.Notify.notifDesc..cena..'$',
        duration = Config.Notify.duration,
        showDuration = true,
        position = Config.Notify.pos,
        style = {
            backgroundColor = '#141517',
            color = '#ffffff',
            ['.description'] = {
              color = '#ffffff'
            }
        },
        icon = Config.Notify.icon,
        iconColor = '#FF9600'
    })
end)