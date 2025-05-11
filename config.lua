Config = {}

Config.Framework = 'QBOX' -- QBOX, ESX
Config.Mult = 3.6 -- 3.6 KMH, 2.23 MPH
Config.SkiniOdmah = true -- if true it will remove money instantly if false it will create invoice (currently okokBilling) if you are using another billing script go to server.lua 25 line and update it

Config.Kamere = {
    ['centar'] = {
        coords = vec3(227.1921, -1045.0660, 28.8257),
        radius = 15.0,
        debug = false,
        brzina = 60.0, -- speed limit
        society = false, -- if true money will go to jobs society account (if you're on qbox it goes to jobs bank account (Renewed Banking), if you're on esx it will go to bossmenu)
        cena = 120, -- fine amount
        razlog = 'Prekoračenje brzine', -- reason
        stash = 'tkmr', -- if society is true set the job name here if false set the stash name where the money should go
        blip = {
            ukljuceno = true, -- enabled?
            sprite = 744, -- sprite
            ime = 'Kamera', -- name
            boja = 1, -- color
            velicina = 0.6, -- size
        }
    },
    ['centar2'] = {
        coords = vec3(174.0283, -817.8543, 30.6391),
        radius = 25.0,
        debug = false,
        brzina = 80.0,
        society = false,
        cena = 120,
        razlog = 'Prekoracenje Brzine',
        stash = 'tkmr',
        blip = {
            ukljuceno = true,
            sprite = 744,
            ime = 'Kamera',
            boja = 1,
            velicina = 0.6,
        }
    },
    ['centar3'] = {
        coords = vec3(289.3162, -859.2834, 28.5449),
        radius = 15.0,
        debug = false,
        brzina = 60.0,
        society = false,
        cena = 120,
        razlog = 'Prekoracenje Brzine',
        stash = 'tkmr',
        blip = {
            ukljuceno = true,
            sprite = 744,
            ime = 'Kamera',
            boja = 1,
            velicina = 0.6,
        }
    },
    ['centar4'] = {
        coords = vec3(105.5290, -998.1022, 28.6765),
        radius = 15.0,
        debug = false,
        brzina = 60.0,
        society = false,
        cena = 120,
        razlog = 'Prekoracenje Brzine',
        stash = 'tkmr',
        blip = {
            ukljuceno = true,
            sprite = 744,
            ime = 'Kamera',
            boja = 1,
            velicina = 0.6,
        }
    },
}

Config.Notify = {
    notifTitle = 'Kamera',
    notifDesc = 'Prekoracili ste brzinu! dobili ste kaznu u iznosu od ',
    icon = 'gauge-high',
    duration = 10000,
    pos = 'top-right'
}