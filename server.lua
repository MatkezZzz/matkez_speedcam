local ESX
if Config.Framework == 'ESX' then 
    ESX = exports.es_extended:getSharedObject()
end

lib.callback.register('matkez_speedcam:napisiKaznu', function(source, kamera)
    local cfg = Config.Kamere[kamera]
    if not cfg then return false end
    if Config.SkiniOdmah then
        if Config.Framework == 'QBOX' then
            exports.qbx_core:RemoveMoney(source, 'bank', cfg.cena, cfg.razlog)
        elseif Config.Framework == 'ESX' then 
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeAccountMoney('bank', cfg.cena)
        end
        if cfg.society then
            if Config.Framework == 'QBOX' then
                exports['Renewed-Banking']:addAccountMoney(cfg.stash, cfg.cena)
            elseif Config.Framework == 'ESX' then 
                TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..cfg.stash, function(acc)
                    acc.addMoney(cfg.cena)
                end)
            end
        else
            exports.ox_inventory:AddItem(cfg.stash, 'money', cfg.cena)
        end
    else
        TriggerEvent("okokBilling:CreateCustomInvoice", source, cfg.cena, cfg.razlog, cfg.razlog, cfg.stash, cfg.stash)
    end
    TriggerClientEvent('ox_lib:notify', source, {
        title = Config.Notify.notifTitle,
        description = Config.Notify.notifDesc..cfg.cena..'$',
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
