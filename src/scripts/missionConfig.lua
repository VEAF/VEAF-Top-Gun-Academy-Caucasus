--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission configuration file for the VEAF framework
-- see https://github.com/VEAF/VEAF-Mission-Creation-Tools
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.config.MISSION_NAME = "VEAF-Top-Gun-Academy-Caucasus"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize QRA
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veaf then
    --VeafQRA.new()
    --:setName("QRA_Minevody")
    --:addGroup("QRA_Minevody")
    --:setRadius(106680) -- 350,000 feet
    --:setCoalition(coalition.side.RED)
    --:addEnnemyCoalition(coalition.side.BLUE)
    --:setReactOnHelicopters()
    --:start()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize all the scripts
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRadio then
    veaf.loggers.get(veaf.Id):info("init - veafRadio")
    veafRadio.initialize(true)
end
if veafSpawn then
    veaf.loggers.get(veaf.Id):info("init - veafSpawn")
    veafSpawn.initialize()
end
if veafGrass then
    veaf.loggers.get(veaf.Id):info("init - veafGrass")
    veafGrass.initialize()
end
if veafCasMission then
    veaf.loggers.get(veaf.Id):info("init - veafCasMission")
    veafCasMission.initialize()
end
if veafTransportMission then
    veaf.loggers.get(veaf.Id):info("init - veafTransportMission")
    veafTransportMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- change some default parameters
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.DEFAULT_GROUND_SPEED_KPH = 25

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize SHORTCUTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafShortcuts then
    veaf.loggers.get(veaf.Id):info("init - veafShortcuts")
    veafShortcuts.initialize()

    -- you can add all the shortcuts you want here. Shortcuts can be any VEAF command, as entered in a map marker.
    -- here are some examples :

    -- veafShortcuts.AddAlias(
    --     VeafAlias.new()
    --         :setName("-sa11")
    --         :setDescription("SA-11 Gadfly (9K37 Buk) battery")
    --         :setVeafCommand("_spawn group, name sa11")
    --         :setBypassSecurity(true)
    -- )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure ASSETS
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafAssets then
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veafAssets.Assets = {
		-- list the assets in the mission below
        --[[
		{sort=1, name="CSG-01 Tarawa", description="Tarawa (LHA)", information="Tacan 11X TAA\nU226 (11)"},  
		{sort=2, name="CSG-74 Stennis", description="Stennis (CVN)", information="Tacan 10X STS\nICLS 10\nU225 (10)"},  
		{sort=2, name="CSG-71 Roosevelt", description="Roosevelt (CVN)", information="Tacan 12X RHR\nICLS 11\nU227 (12)"},  
		{sort=3, name="T1-Arco-1", description="Arco-1 (KC-135)", information="Tacan 64Y\nU290.50 (20)\nZone OUEST", linked="T1-Arco-1 escort"}, 
		{sort=4, name="T2-Shell-1", description="Shell-1 (KC-135 MPRS)", information="Tacan 62Y\nU290.30 (18)\nZone EST", linked="T2-Shell-1 escort"},  
		{sort=5, name="T3-Texaco-1", description="Texaco-1 (KC-135 MPRS)", information="Tacan 60Y\nU290.10 (17)\nZone OUEST", linked="T3-Texaco-1 escort"},  
		{sort=6, name="T4-Shell-2", description="Shell-2 (KC-135)", information="Tacan 63Y\nU290.40 (19)\nZone EST", linked="T4-Shell-2 escort"},  
		{sort=6, name="T5-Petrolsky", description="900 (IL-78M, RED)", information="U267", linked="T5-Petrolsky escort"},  
		{sort=7, name="CVN-74 Stennis S3B-Tanker", description="Texaco-7 (S3-B)", information="Tacan 75X\nU290.90\nZone PA"},  
		{sort=7, name="CVN-71 Roosevelt S3B-Tanker", description="Texaco-8 (S3-B)", information="Tacan 76X\nU290.80\nZone PA"},  
		{sort=8, name="Bizmuth", description="Colt-1 AFAC Bizmuth (MQ-9)", information="L1688 V118.80 (18)", jtac=1688, freq=118.80, mod="am"},
		{sort=9, name="Agate", description="Dodge-1 AFAC Agate (MQ-9)", information="L1687 V118.90 (19)", jtac=1687, freq=118.90, mod="am"},  
		{sort=10, name="A1-Magic", description="Magic (E-2D)", information="Datalink 315.3 Mhz\nU282.20 (13)", linked="A1-Magic escort"},  
		{sort=11, name="A2-Overlordsky", description="Overlordsky (A-50, RED)", information="V112.12"},  
        ]]
    }

    veaf.loggers.get(veaf.Id):info("init - veafAssets")
    veafAssets.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure MOVE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafMove then
    veaf.loggers.get(veaf.Id):info("Setting move tanker radio menus")
    -- keeping the veafMove.Tankers table empty will force veafMove.initialize() to browse the units, and find the tankers
    veaf.loggers.get(veaf.Id):info("init - veafMove")
    veafMove.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT MISSION
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafCombatMission then 
    veaf.loggers.get(veaf.Id):info("Loading configuration")

    veaf.loggers.get(veaf.Id):info("init - veafCombatMission")
    veafCombatMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT ZONE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCombatZone then 
    veaf.loggers.get(veaf.Id):info("Loading configuration")

    veaf.loggers.get(veaf.Id):info("init - veafCombatZone")
    veafCombatZone.initialize()

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure WW2 settings based on loaded theatre
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local theatre = string.lower(env.mission.theatre)
veaf.loggers.get(veaf.Id):info(string.format("theatre is %s", theatre))
veaf.config.ww2 = false
if theatre == "thechannel" then
    veaf.config.ww2 = true
elseif theatre == "normandy" then
    veaf.config.ww2 = true
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure NAMEDPOINTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafNamedPoints then

    veaf.loggers.get(veaf.Id):info("Loading configuration")

    veaf.loggers.get(veaf.Id):info("init - veafNamedPoints")
    if theatre == "syria" then
        veafNamedPoints.Points = {
            -- Turkish Airports
            {name="INCIRLIK AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("37.001944", "35.425833"), {atc=true, tower="V129.40, U360.10", tacan="21X", runways={{name="05", hdg=50, ils="109.30"}, {name="23", hdg=230, ils="111.70"}}})},
            {name="ADANA SAKIRPASA INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.981944", "35.280278"), {atc=true, tower="V121.10, U251.00", runways={{name="05", hdg=51, ils="108.70"}, {name="23", hdg=231}}})},
            {name="HATAY AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.360278", "36.285000"), {atc=true, tower="V128.50, U250.25", runways={{name="04", hdg=40, ils="108.90"}, {name="22", hdg=220, ils="108.15"}}})},
            {name="GANZIANTEP",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.947057", "37.478579"), {atc=true, tower="V120.10, U250.05", runways={{name="10", hdg=100}, {name="28", hdg=280, ils="109.10"}}})},

            -- Syrian Airports
            {name="MINAKH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.521944", "37.041111"), {atc=true, tower="V120.60, U250.80", runways={{name="10", hdg=97}, {name="28", hdg=277}}})},
            {name="ALEPPO INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.180556", "37.224167"), {atc=true, tower="V119.10, U250.85", runways={{name="09", hdg=93}, {name="27", hdg=273}}})},
            {name="KUWEIRES AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.186944", "37.583056"), {atc=true, tower="V120.50, U251.10", runways={{name="10", hdg=97}, {name="28", hdg=277}}})},
            {name="JIRAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.097500", "37.940278"), {atc=true, tower="V118.10, U250.30", runways={{name="10", hdg=96}, {name="28", hdg=276}}})},
            {name="TAFTANAZ HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.972222", "36.783056"), {atc=true, tower="V122.80, U251.45", runways={{name="10", hdg=100}, {name="28", hdg=280}}})},
            {name="ABU AL DUHUR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.732778", "37.101667"), {atc=true, tower="V122.20, U250.45", runways={{name="09", hdg=89}, {name="27", hdg=269}}})},
            {name="TABQA AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.754444", "38.566667"), {atc=true, tower="V118.50, U251.40", runways={{name="09", hdg=88}, {name="27", hdg=268}}})}, 
            {name="BASSEL AL ASSAD (KHMEIMIM)", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.400833", "35.948611"), {atc=true, tower="V118.10, U250.55", runways={{name="17R", hdg=174, ils="109.10"}, {name="17L", hdg=174}, {name="35R", hdg=354}, {name="35L", hdg=354}}})}, 
            {name="HAMA AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.118056", "36.711111"), {atc=true, tower="V118.05, U250.20", runways={{name="09", hdg=96}, {name="27", hdg=276}}})},
            {name="AL QUSAYR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.570833", "36.571944"),  {atc=true, tower="V119.20, U251.55", runways={{name="10", hdg=98}, {name="28", hdg=278}}})}, 
            {name="PALYMYRA AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.557222", "38.316667"), {atc=true, tower="V121.90, U250.90", runways={{name="08", hdg=80}, {name="26", hdg=260}}})}, 
            {name="AN NASIRIYAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.918889", "36.866389"), {atc=true, tower="V122.30, U251.65", runways={{name="04", hdg=41}, {name="22", hdg=221}}})},
            {name="AL DUMAYR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.609444", "36.748889"), {atc=true, tower="V120.30, U251.95", runways={{name="06", hdg=62}, {name="24", hdg=242}}})}, 
            {name="MEZZEH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.477500", "36.223333"), {atc=true, tower="V120.70, U250.75", runways={{name="06", hdg=57}, {name="24", hdg=237}}})}, 
            {name="MARJ AS SULTAN NTH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.500278", "36.466944"), {atc=true, tower="V122.70, U250.60", runways={{name="08", hdg=80}, {name="26", hdg=260}}})}, 
            {name="MARJ AS SULTAN STH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.486944", "36.475278"), {atc=true, tower="V122.90, U251.90", runways={{name="09", hdg=90}, {name="27", hdg=270}}})}, 
            {name="QABR AS SITT HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.458611", "36.357500"), {atc=true, tower="V122.60, U250.95", runways={{name="05", hdg=50}, {name="23", hdg=230}}})},
            {name="DAMASCUS INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.415000", "36.519444"), {atc=true, tower="V118.50, U251.85", runways={{name="05R", hdg=46}, {name="05L", hdg=46}, {name="23R", hdg=226, ils="109.90"}, {name="23L", hdg=226}}})},
            {name="MARJ RUHAYYIL AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.286389", "36.457222"), {atc=true, tower="V120.80, U250.65", runways={{name="06", hdg=59}, {name="24", hdg=239}}})},
            {name="KHALKHALAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.077222", "36.558056"), {atc=true, tower="V122.50, U250.35", runways={{name="07", hdg=72}, {name="15", hdg=147}, {name="25", hdg=252}, {name="33", hdg=327}}})},
            {name="SAYQUAL AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.679816", "37.218204"), {atc=true, tower="V120.40, U251.30", runways={{name="08", hdg=80}, {name="26", hdg=260}}})},
            {name="SHAYRAT AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.494819", "36.903173"), {atc=true, tower="V120.20, U251.35", runways={{name="11", hdg=110}, {name="29", hdg=290}}})},
            {name="TIYAS AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.522645", "37.627498"), {atc=true, tower="V120.50, U251.50", runways={{name="09", hdg=90}, {name="27", hdg=270}}})},

            -- Lebanese Airports
            {name="RENE MOUAWAD AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.589444", "36.011389"), {atc=true, tower="V121.00, U251.20", runways={{name="06", hdg=59}, {name="24", hdg=239}}})},
            {name="HAJAR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.283333", "35.680278"),  {atc=true, tower="V121.50, U251.60", runways={{name="02", hdg=25}, {name="20", hdg=205}}})},
            {name="BEIRUT INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.821111", "35.488333"), {atc=true, tower="V118.90, U251.80", runways={{name="03", hdg=30, ils="110.70"}, {name="16", hdg=164, ils="110.10"}, {name="17", hdg=175, ils="109.50"}, {name="21", hdg=210}, {name="34", hdg=344}, {name="35", hdg=355}}})},
            {name="RAYAK AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.852222", "35.990278"),  {atc=true, tower="V124.40, U251.15", runways={{name="04", hdg=42}, {name="22", hdg=222}}})},
            {name="NAQOURA HELIPT",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.107877", "35.127728"), {atc=true, tower="V122.00, U251.70"})},

            -- Israeli Airports
            {name="KIRYAT SHMONA AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.216667", "35.596667"), {atc=true, tower="V118.40, U250.50", runways={{name="03", hdg=34}, {name="21", hdg=214}}})},
            {name="HAIFA INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.809167", "35.043056"), {atc=true, tower="V127.80, U250.15", runways={{name="16", hdg=158}, {name="34", hdg=338}}})},
            {name="RAMAT DAVID INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.665000", "35.179444"), {atc=true, tower="V118.60, U251.05", runways={{name="09", hdg=85}, {name="11", hdg=107}, {name="15", hdg=143}, {name="27", hdg=265}, {name="29", hdg=287}, {name="33", hdg=323}}})}, 
            {name="MEGIDDO AIRFIELD", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.597222", "35.228611"), {atc=true, tower="V119.90, U250.70", runways={{name="09", hdg=89}, {name="27", hdg=269}}})}, 
            {name="EYN SHEMER AIRFIELD", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.440556", "35.007500"), {atc=true, tower="V123.40, U250.00", runways={{name="09", hdg=96}, {name="27", hdg=276}}})}, 

            -- Jordan Airports
            {name="KING HUSSEIN AIR COLLEGE", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.356389", "36.259167"), {atc=true, tower="V118.30, U250.40", runways={{name="13", hdg=128}, {name="31", hdg=308}}})},
            {name="H4",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.539122", "38.195841"), {atc=true, tower="V122.60, U250.10", runways={{name="10", hdg=100}, {name="28", hdg=280}}})}, 
        }
        veafNamedPoints.addAllSyriaCities()
    elseif theatre == "caucasus" then
        veafNamedPoints.Points = {
            -- airbases in Georgia
            {name="AIRBASE Batumi",  point={x=-356437,y=0,z=618211, atc=true, tower="V131, U260", tacan="16X BTM", runways={{name="13", hdg=125, ils="110.30"}, {name="31", hdg=305}}}},
            {name="AIRBASE Gudauta", point={x=-196850,y=0,z=516496, atc=true, tower="V130, U259", runways={ {name="15", hdg=150}, {name="33", hdg=330}}}},
            {name="AIRBASE Kobuleti",point={x=-318000,y=0,z=636620, atc=true, tower="V133, U262", tacan="67X KBL", runways={ {name="07", hdg=69, ils="111.50"}}}},
            {name="AIRBASE Kutaisi", point={x=-284860,y=0,z=683839, atc=true, tower="V134, U264", tacan="44X KTS", runways={ {name="08", hdg=74, ils="109.75"}, {name="26", hdg=254}}}},
            {name="AIRBASE Senaki",  point={x=-281903,y=0,z=648379, atc=true, tower="V132, U261", tacan="31X TSK", runways={ {name="09", hdg=94, ils="108.90"}, {name="27", hdg=274}}}},
            {name="AIRBASE Sukhumi", point={x=-221382,y=0,z=565909, atc=true, tower="V129, U258", runways={{name="12", hdg=116}, {name="30", hdg=296}}}},
            {name="AIRBASE Tbilisi", point={x=-314926,y=0,z=895724, atc=true, tower="V138, U267", tacan="25X GTB", runways={{name="13", hdg=127, ils="110.30"},{name="31", hdg=307, ils="108.90"}}}},
            {name="AIRBASE Vaziani", point={x=-319000,y=0,z=903271, atc=true, tower="V140, U269", tacan="22X VAS", runways={ {name="13", hdg=135, ils="108.75"}, {name="31", hdg=315, ils="108.75"}}}},
            -- airbases in Russia
            {name="AIRBASE Anapa - Vityazevo",   point={x=-004448,y=0,z=244022, atc=true, tower="V121, U250" , runways={ {name="22", hdg=220}, {name="04", hdg=40}}}},
            {name="AIRBASE Beslan",              point={x=-148472,y=0,z=842252, atc=true, tower="V141, U270", runways={ {name="10", hdg=93, ils="110.50"}, {name="28", hdg=273}}}},
            {name="AIRBASE Krymsk",              point={x=-007349,y=0,z=293712, atc=true, tower="V124, U253", runways={ {name="04", hdg=39}, {name="22", hdg=219}}}},
            {name="AIRBASE Krasnodar-Pashkovsky",point={x=-008707,y=0,z=388986, atc=true, tower="V128, U257", runways={ {name="23", hdg=227}, {name="05", hdg=47}}}},
            {name="AIRBASE Krasnodar-Center",    point={x=-011653,y=0,z=366766, atc=true, tower="V122, U251", runways={ {name="09", hdg=86}, {name="27", hdg=266}}}},
            {name="AIRBASE Gelendzhik",          point={x=-050996,y=0,z=297849, atc=true, tower="V126, U255", runways={ {hdg=40}, {hdg=220}}}},
            {name="AIRBASE Maykop",              point={x=-027626,y=0,z=457048, atc=true, tower="V125, U254", runways={ {name="04", hdg=40}, {name="22", hdg=220}}}},
            {name="AIRBASE Mineralnye Vody",     point={x=-052090,y=0,z=707418, atc=true, tower="V135, U264", runways={ {name="12", hdg=115, ils="111.70"}, {name="30", hdg=295, ils="109.30"}}}},
            {name="AIRBASE Mozdok",              point={x=-083330,y=0,z=835635, atc=true, tower="V137, U266", runways={ {name="08", hdg=82}, {name="26", hdg=262}}}},
            {name="AIRBASE Nalchik",             point={x=-125500,y=0,z=759543, atc=true, tower="V136, U265", runways={ {name="06", hdg=55}, {name="24", hdg=235, ils="110.50"}}}},
            {name="AIRBASE Novorossiysk",        point={x=-040299,y=0,z=279854, atc=true, tower="V123, U252", runways={ {name="04", hdg=40}, {name="22", hdg=220}}}},
            {name="AIRBASE Sochi",               point={x=-165163,y=0,z=460902, atc=true, tower="V127, U256", runways={ {name="06", hdg=62, ils="111.10"}, {name="24", hdg=242}}}},
        }
        veafNamedPoints.addAllCaucasusCities()
    elseif theatre == "persiangulf" then
        veafNamedPoints.Points = {
        }
        veafNamedPoints.addAllPersianGulfCities()
    elseif theatre == "thechannel" then
        veafNamedPoints.Points = {
        }
        veafNamedPoints.addAllTheChannelCities()
    elseif theatre == "marianaislands" then
        veafNamedPoints.Points = {
            -- airbases in Blue Island
            {name="AIRBASE Andersen AFB",  point={x=-010688,y=0,z=014822, atc=true, tower="V126.2, U250.1", tacan="54X", runways={{name="06", hdg=66}, {name="24", hdg=246}}}},
            {name="AIRBASE Antonio B. Won Pat Intl", point={x=-000068,y=0,z=-000109, atc=true, tower="V118.1, U340.2", runways={ {name="6", hdg=65, ils="110.30"}, {name="24", hdg=245}}}},
            {name="AIRBASE Olf Orote",point={x=-005047,y=0,z=-016913, atc=false}},
            {name="AIRBASE Santa Rita",point={x=-013576,y=0,z=-009925, atc=false}},
            
            -- airbases in Neutral Island
            {name="AIRBASE Rota Intl", point={x=-075886,y=0,z=048612, atc=true, tower="V123.6, U250", tacan="44X KTS", runways={ {name="09", hdg=92, ils="109.75"}, {name="27", hdg=272}}}},
            
            -- airbases in Red Island
            {name="AIRBASE Tinian Intl",  point={x=-166865,y=0,z=090027, atc=true, tower="V123.65, U250.05", tacan="31X TSK", runways={ {name="0", hdg=94, ils="108.90"}, {name="27", hdg=274}}}},
            {name="AIRBASE Saipan Intl", point={x=180074,y=0,z=101921, atc=true, tower="V125.7, U256.9", runways={{name="07", hdg=68, ils="109.90"}, {name="25", hdg=248}}}},
        }
        veafNamedPoints.addAllMarianasIslandsCities()
    else
        veaf.loggers.get(veaf.Id):warn(string.format("theatre %s is not yet supported by veafNamedPoints", theatre))
    end
    -- points of interest
    --table.insert(veafNamedPoints.Points,
    --    {name="RANGE KhalKhalah",point=coord.LLtoLO("33.036180", "37.196608")},
    --)
    veafNamedPoints.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure SECURITY
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSecurity then
    veafSecurity.password_L9["6ade6629f9219d87a011e7b8fbf8ef9584f2786d"] = true -- set the L9 password (the lowest possible security)
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veaf.loggers.get(veaf.Id):info("init - veafSecurity")
    veafSecurity.initialize()

    -- force security in order to test it when dynamic loading is in place (change to TRUE)
    if (false) then
        veaf.SecurityDisabled = false
        veafSecurity.authenticated = false
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CARRIER OPERATIONS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCarrierOperations then
    veaf.loggers.get(veaf.Id):info("init - veafCarrierOperations")
    veafCarrierOperations.initialize(true)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CTLD
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if ctld then
    veaf.loggers.get(veaf.Id):info("init - ctld")
    ctld.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the remote interface
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRemote then
    veaf.loggers.get(veaf.Id):info("init - veafRemote")
    veafRemote.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the interpreter
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafInterpreter then
    veaf.loggers.get(veaf.Id):info("init - veafInterpreter")
    veafInterpreter.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Skynet-IADS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSkynet then -- don't use 
    veaf.loggers.get(veaf.Id):info("init - veafSkynet")
    veafSkynet.initialize(
        false, --includeRedInRadio=true
        false, --debugRed
        false, --includeBlueInRadio
        false --debugBlue
    )
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize veafSanctuary
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSanctuary and false then -- don't use 
    veaf.loggers.get(veaf.Id):info("init - veafSanctuary")
    veafSanctuary.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Hound Elint
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafHoundElint and false then -- don't use Hound Elint
    veaf.loggers.get(veaf.Id):info("init - veafHoundElint")
    veafHoundElint.initialize(
        "ELINT", -- prefix
        { -- red
            admin = false,
            markers = true,
            atis = false,
            controller = false
        },
        { -- blue
            admin = false,
            markers = true,
            atis = {
                freq = 282.125,
                interval = 15,
                speed = 1,
                reportEWR = false
            },
            controller = {
                freq = 282.225,
                voiceEnabled = true
            }
        }
    )
end

-- Silence ATC on all the airdromes
veaf.silenceAtcOnAllAirbases()

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the training zones
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if trainingSpawnZone then
    
    --------- BVR STAGE 1 - MIG-25
    
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG25x1", {"BVR STAGE 1 - MIG-25 - 1vs1 - F/A18C", "BVR STAGE 1 - MIG-25 - 1vs1 - M-2000C", "BVR STAGE 1 - MIG-25 - 1vs1 - F14B", "BVR STAGE 1 - MIG-25 - 1vs1 - F15C", "BVR STAGE 1 - MIG-25 - 1vs1 - F-15E", "BVR STAGE 1 - MIG-25 - 1vs1 - F16CM"}, {"BVR STAGE 1 - MIG-25 -X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG25x2", {"BVR STAGE 1 - MIG-25 - 2vs2 - F/A18C", "BVR STAGE 1 - MIG-25 - 2vs2 - M-2000C", "BVR STAGE 1 - MIG-25 - 2vs2 - F14B", "BVR STAGE 1 - MIG-25 - 2vs2 - F15C", "BVR STAGE 1 - MIG-25 - 2vs2 - F-15E", "BVR STAGE 1 - MIG-25 - 2vs2 - F16CM"}, {"BVR STAGE 1 - MIG-25 -X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG25x4", {"BVR STAGE 1 - MIG-25 - 4vs4 - F/A18C", "BVR STAGE 1 - MIG-25 - 4vs4 - M-2000C", "BVR STAGE 1 - MIG-25 - 4vs4 - F14B", "BVR STAGE 1 - MIG-25 - 4vs4 - F-15E"}, {"BVR STAGE 1 - MIG-25 -X4"}, true)
    
    --------- BVR STAGE 1 - MIG-23
    
    trainingSpawnZone.registerZone("BVR - STAGE 1 MIG23X1", {"BVR STAGE 1 - MIG-23 - 1vs1 - F/A18C", "BVR STAGE 1 - MIG-23 - 1vs1 - M-2000C", "BVR STAGE 1 - MIG-23 - 1vs1 - F14B", "BVR STAGE 1 - MIG-23 - 1vs1 - F-15E"}, {"BVR - STAGE 1 MIG23X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 MIG23X2", {"BVR STAGE 1 - MIG-23 - 2vs2 - F/A18C", "BVR STAGE 1 - MIG-23 - 2vs2 - M-2000C", "BVR STAGE 1 - MIG-23 - 2vs2 - F14B", "BVR STAGE 1 - MIG-23 - 2vs2 - F-15E"}, {"BVR - STAGE 1 MIG23X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 MIG23X4", {"BVR STAGE 1 - MIG-23 - 4vs4 - F/A18C", "BVR STAGE 1 - MIG-23 - 4vs4 - M-2000C", "BVR STAGE 1 - MIG-23 - 4vs4 - F14B", "BVR STAGE 1 - MIG-23 - 4vs4 - F-15E"}, {"BVR - STAGE 1 MIG23X4"}, true)
    
    --------- BVR STAGE 1 - MIG-21
    
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG21x1", {"BVR STAGE 1 - MIG-21 - 1vs1 - F/A18C", "BVR STAGE 1 - MIG-21 - 1vs1 - M-2000C", "BVR STAGE 1 - MIG-21 - 1vs1 - F14B", "BVR STAGE 1 - MIG-21 - 1vs1 - F-15E"}, {"BVR - STAGE 1 MIG21X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG21x2", {"BVR STAGE 1 - MIG-21 - 2vs2 - F/A18C", "BVR STAGE 1 - MIG-21 - 2vs2 - M-2000C", "BVR STAGE 1 - MIG-21 - 2vs2 - F14B", "BVR STAGE 1 - MIG-21 - 2vs2 - F-15E"}, {"BVR - STAGE 1 MIG21X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG21x4", {"BVR STAGE 1 - MIG-21 - 4vs4 - F/A18C", "BVR STAGE 1 - MIG-21 - 4vs4 - M-2000C", "BVR STAGE 1 - MIG-21 - 4vs4 - F14B", "BVR STAGE 1 - MIG-21 - 4vs4 - F-15E"}, {"BVR - STAGE 1 MIG21X4"}, true)
    
    --------- BVR STAGE 1 - F-4E
    
    trainingSpawnZone.registerZone("BVR - STAGE 1 - F-4Ex1", {"BVR STAGE 1 - F-4E - 1vs1 - F/A18C", "BVR STAGE 1 - F-4E - 1vs1 - M-2000C", "BVR STAGE 1 - F-4E - 1vs1 - F14B", "BVR STAGE 1 - F-4E - 1vs1 - F-15E"}, {"BVR - STAGE 1 F-4EX1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - F-4Ex2", {"BVR STAGE 1 - F-4E - 2vs2 - F/A18C", "BVR STAGE 1 - F-4E - 2vs2 - M-2000C", "BVR STAGE 1 - F-4E - 2vs2 - F14B", "BVR STAGE 1 - F-4E - 2vs2 - F-15E"}, {"BVR - STAGE 1 F-4EX2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - F-4Ex4", {"BVR STAGE 1 - F-4E - 4vs4 - F/A18C", "BVR STAGE 1 - F-4E - 4vs4 - M-2000C", "BVR STAGE 1 - F-4E - 4vs4 - F14B","BVR STAGE 1 - F-4E - 4vs4 - F-15E"}, {"BVR - STAGE 1 F-4EX4"}, true)
    
    --------- BVR STAGE 1 - MIG-29A
    
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG-29Ax1", {"BVR STAGE 1 - MIG-29A - 1vs1 - F/A18C", "BVR STAGE 1 - MIG-29A - 1vs1 - M-2000C", "BVR STAGE 1 - MIG-29A - 1vs1 - F14B", "BVR STAGE 1 - MIG-29A - 1vs1 - F-15E"}, {"BVR - STAGE 1 MIG29AX1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG-29Ax2", {"BVR STAGE 1 - MIG-29A - 2vs2 - F/A18C", "BVR STAGE 1 - MIG-29A - 2vs2 - M-2000C", "BVR STAGE 1 - MIG-29A - 2vs2 - F14B","BVR STAGE 1 - MIG-29A - 2vs2 - F-15E"}, {"BVR - STAGE 1 MIG29AX2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 1 - MIG-29Ax4", {"BVR STAGE 1 - MIG-29A - 4vs4 - F/A18C", "BVR STAGE 1 - MIG-29A - 4vs4 - M-2000C", "BVR STAGE 1 - MIG-29A - 4vs4 - F14B","BVR STAGE 1 - MIG-29A - 4vs4 - F-15E"}, {"BVR - STAGE 1 MIG29AX4"}, true)
    
    --------- BVR STAGE 2 - SU-27
    
    trainingSpawnZone.registerZone("BVR - STAGE 2- SU27x1", {"BVR STAGE 2 - SU-27 - 1vs1 - F/A18C", "BVR STAGE 2 - SU-27 - 1vs1 - M-2000C", "BVR STAGE 2 - SU-27 - 1vs1 - F-14B","BVR STAGE 2 - SU-27 - 1vs1 - F-15E","BVR STAGE 2 - SU-27 - 1vs1 - F16CM"}, {"BVR - STAGE 2- SU27x1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- SU27x2", {"BVR STAGE 2 - SU-27 - 2vs2 - F/A18C", "BVR STAGE 2 - SU-27 - 2vs2 - M-2000C", "BVR STAGE 2 - SU-27 - 2vs2 - F-14B","BVR STAGE 2 - SU-27 - 2vs2 - F-15E","BVR STAGE 2 - SU-27 - 2vs2 - F16CM"}, {"BVR - STAGE 2- SU27x2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- SU27x4", {"BVR STAGE 2 - SU-27 - 4vs4 - F/A18C", "BVR STAGE 2 - SU-27 - 4vs4 - M-2000C", "BVR STAGE 2 - SU-27 - 4vs4 - F-14B","BVR STAGE 2 - SU-27 - 4vs4 - F-15E"}, {"BVR - STAGE 2- SU27x4"}, true)
    
    --------- BVR STAGE 2 - MIG-31
    
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG31x1", {"BVR STAGE 2 - MIG-31 - 1vs1 - F/A18C", "BVR STAGE 2 - MIG-31 - 1vs1 - M-2000C", "BVR STAGE 2 - MIG-31 - 1vs1 - F-14B","BVR STAGE 2 - MIG-31 - 1vs1 - F-15E"}, {"BVR - STAGE 2- MIG31x1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG31x2", {"BVR STAGE 2 - MIG-31 - 2vs2 - F/A18C", "BVR STAGE 2 - MIG-31 - 2vs2 - M-2000C", "BVR STAGE 2 - MIG-31 - 2vs2 - F-14B", "BVR STAGE 2 - MIG-31 - 2vs2 - F15C", "BVR STAGE 2 - MIG-31 - 2vs2 - F-15E"}, {"BVR - STAGE 2- MIG31x2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG31x4", {"BVR STAGE 2 - MIG-31 - 4vs4 - F/A18C", "BVR STAGE 2 - MIG-31 - 4vs4 - M-2000C", "BVR STAGE 2 - MIG-31 - 4vs4 - F-14B","BVR STAGE 2 - MIG-31 - 4vs4 - F-15E"}, {"BVR - STAGE 2- MIG31x4"}, true)
    
    --------- BVR STAGE 2 - MIG-29A
    
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG29Ax1", {"BVR STAGE 2 - MIG-29A - 1vs1 - F/A18C", "BVR STAGE 2 - MIG-29A - 1vs1 - M-2000C", "BVR STAGE 2 - MIG-29A - 1vs1 - F-14B","BVR STAGE 2 - MIG-29A - 1vs1 - F-15E"}, {"BVR - STAGE 2- MIG29AFOX2x1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG29Ax2", {"BVR STAGE 2 - MIG-29A - 2vs2 - F/A18C", "BVR STAGE 2 - MIG-29A - 2vs2 - M-2000C", "BVR STAGE 2 - MIG-29A - 2vs2 - F-14B","BVR STAGE 2 - MIG-29A - 2vs2 - F-15E"}, {"BVR - STAGE 2- MIG29AFOX2x2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- MIG29Ax4", {"BVR STAGE 2 - MIG-29A - 4vs4 - F/A18C", "BVR STAGE 2 - MIG-29A - 4vs4 - M-2000C", "BVR STAGE 2 - MIG-29A - 4vs4 - F-14B","BVR STAGE 2 - MIG-29A - 4vs4 - F-15E"}, {"BVR - STAGE 2- MIG29AFOX2x4"}, true)
    
    --------- BVR STAGE 2 - M-2000C
    
    trainingSpawnZone.registerZone("BVR - STAGE 2- M-2000Cx1", {"BVR STAGE 2 - M-2000C - 1vs1 - F/A18C", "BVR STAGE 2 - M-2000C - 1vs1 - M-2000C", "BVR STAGE 2 - M-2000C - 1vs1 - F-14B","BVR STAGE 2 - M-2000C - 1vs1 - F-15E"}, {"BVR - STAGE 2- M2000Cx1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- M-2000Cx2", {"BVR STAGE 2 - M-2000C - 2vs2 - F/A18C", "BVR STAGE 2 - M-2000C - 2vs2 - M-2000C", "BVR STAGE 2 - M-2000C - 2vs2 - F-14B","BVR STAGE 2 - M-2000C - 2vs2 - F-15E"}, {"BVR - STAGE 2- M2000Cx2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 2- M-2000Cx4", {"BVR STAGE 2 - M-2000C - 4vs4 - F/A18C", "BVR STAGE 2 - M-2000C - 4vs4 - M-2000C", "BVR STAGE 2 - M-2000C - 4vs4 - F-14B","BVR STAGE 2 - M-2000C - 4vs4 - F-15E"}, {"BVR - STAGE 2- M2000Cx4"}, true)
    
    --------- BVR STAGE 3 - M2000-5
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 M2000-5 x1 -F18", {"BVR STAGE 3 - M-20005 - 1vs1 - F/A18C", "BVR STAGE 3 - M2000-5 - 1vs1 - M-2000C", "BVR STAGE 3 - M2000-5 - 1vs1 - F-14B","BVR STAGE 3 - M-20005 - 1vs1 - F-15E"}, {"BVR - STAGE 3 - M2000-5 X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 M2000-5 x2 -F18", {"BVR STAGE 3 - M-20005 - 2vs2 - F/A18C", "BVR STAGE 3 - M2000-5 - 2vs2 - M-2000C", "BVR STAGE 3 - M2000-5 - 2vs2 - F-14B","BVR STAGE 3 - M-20005 - 2vs2 - F-15E"}, {"BVR - STAGE 3 - M2000-5 X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 M2000-5 x4 -F18", {"BVR STAGE 3 - M-20005 - 4vs4 - F/A18C", "BVR STAGE 3 - M2000-5 - 4vs4 - M-2000C", "BVR STAGE 3 - M2000-5 - 4vs4 - F-14B","BVR STAGE 3 - M-20005 - 4vs4 - F-15E"}, {"BVR - STAGE 3 - M2000-5 X4"}, true)
    
    --------- BVR STAGE 3 - J-11A
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 J11A x1 -F18", {"BVR STAGE 3 - J-11A - 1vs1 - F/A18C", "BVR STAGE 3 - J-11A - 1vs1 - M-2000C", "BVR STAGE 3 - J-11A - 1vs1 - F-14B","BVR STAGE 3 - J-11A - 1vs1 - F-15E"}, {"BVR - STAGE 3 - J11A X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 J11A x2 -F18", {"BVR STAGE 3 - J-11A - 2vs2 - F/A18C", "BVR STAGE 3 - J-11A - 2vs2 - M-2000C", "BVR STAGE 3 - J-11A - 2vs2 - F-14B", "BVR STAGE 3 - J-11A - 2vs2 - F15C","BVR STAGE 3 - J-11A - 2vs2 - F-15E"}, {"BVR - STAGE 3 - J11A X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 J11A x4 -F18", {"BVR STAGE 3 - J-11A - 4vs4 - F/A18C", "BVR STAGE 3 - J-11A - 4vs4 - M-2000C", "BVR STAGE 3 - J-11A - 4vs4 - F-14B","BVR STAGE 3 - J-11A - 4vs4 - F-15E"}, {"BVR - STAGE 3 - J11A X4"}, true)
    
    --------- BVR STAGE 3 - MIG-29S
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 MIG29 x1 -F18", {"BVR STAGE 3 - MIG-29S - 1vs1 - F/A18C", "BVR STAGE 3 - MIG-29S - 1vs1 - M-2000C", "BVR STAGE 3 -MIG-29S - 1vs1 - F-14B","BVR STAGE 3 -MIG-29S - 1vs1 - F-15E"}, {"BVR - STAGE 3 - MIG29S X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 MIG29 x2 -F18", {"BVR STAGE 3 - MIG-29S - 2vs2 - F/A18C", "BVR STAGE 3 - MIG-29S - 2vs2 - M-2000C", "BVR STAGE 3 -MIG-29S - 2vs2 - F-14B","BVR STAGE 3 -MIG-29S - 2vs2 - F-15E"}, {"BVR - STAGE 3 - MIG29S X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 MIG29 x4 -F18", {"BVR STAGE 3 - MIG-29S - 4vs4 - F/A18C", "BVR STAGE 3 - MIG-29S - 4vs4 - M-2000C", "BVR STAGE 3 -MIG-29S - 4vs4 - F-14B", "BVR STAGE 3 -MIG-29S - 4vs4 - F-15E"}, {"BVR - STAGE 3 - MIG29S X4"}, true)
    
    --------- BVR STAGE 3 - SU-30
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 - SU30x1 -F18", {"BVR STAGE 3 - SU-30 - 1vs1 - F/A18C", "BVR STAGE 3 - SU-30 - 1vs1 - M-2000C", "BVR STAGE 3 - SU-30 - 1vs1 - F-14B", "BVR STAGE 3 - SU-30 - 1vs1 - F-15E", "BVR STAGE 3 - SU-30 - 1vs1 - F16CM"}, {"BVR - STAGE 3 - SU30 X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 - SU30x2 -F18", {"BVR STAGE 3 - SU-30 - 2vs2 - F/A18C", "BVR STAGE 3 - SU-30 - 2vs2 - M-2000C", "BVR STAGE 3 - SU-30 - 2vs2 - F-14B", "BVR STAGE 3 - SU-30 - 2vs2 - F-15E", "BVR STAGE 3 - SU-30 - 2vs2 - F16CM"}, {"BVR - STAGE 3 - SU30 X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 - SU30x4 -F18", {"BVR STAGE 3 - SU-30 - 4vs4 - F/A18C", "BVR STAGE 3 - SU-30 - 4vs4 - M-2000C", "BVR STAGE 3 - SU-30 - 4vs4 - F-14B", "BVR STAGE 3 - SU-30 - 4vs4 - F-15E"}, {"BVR - STAGE 3 - SU30 X4"}, true)
    
    --------- BVR STAGE 3 - JF-17
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 JF-17 x1 -F18", {"BVR STAGE 3 - JF-17 - 1vs1 - F/A18C", "BVR STAGE 3 - JF-17 - 1vs1 - M-2000C", "BVR STAGE 3 - JF17 - 1vs1 - F-14B", "BVR STAGE 3 - JF17 - 1vs1 - F-15E"}, {"BVR - STAGE 3 - JF-17 X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 JF-17 x2 -F18", {"BVR STAGE 3 - JF-17 - 2vs2 - F/A18C", "BVR STAGE 3 - JF-17 - 2vs2 - M-2000C", "BVR STAGE 3 - JF17 - 2vs2 - F-14B", "BVR STAGE 3 - JF17 - 2vs2 - F-15E"}, {"BVR - STAGE 3 - JF-17 X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 JF-17 x4 -F18", {"BVR STAGE 3 - JF-17 - 4vs4 - F/A18C", "BVR STAGE 3 - JF-17 - 4vs4 - M-2000C", "BVR STAGE 3 - JF17 - 4vs4 - F-14B","BVR STAGE 3 - JF17 - 4vs4 - F-15E"}, {"BVR - STAGE 3 - JF-17 X4"}, true)
    
    --------- BVR STAGE 3 - F15E
    
    trainingSpawnZone.registerZone("BVR - STAGE 3 F-15E x1 -F18", {"BVR STAGE 3 - F15-E - 1vs1 - F/A18C", "BVR STAGE 3 - F15-E - 1vs1 - M-2000C", "BVR STAGE 3 - F15-E - 1vs1 - F-14B", "BVR STAGE 3 - F15-E - 1vs1 - F-15E"}, {"BVR - STAGE 3 - F-15E X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 F-15E x2 -F18", {"BVR STAGE 3 - F15-E - 2vs2 - F/A18C", "BVR STAGE 3 - F15-E - 2vs2 - M-2000C", "BVR STAGE 3 - F15-E - 2vs2 - F-14B", "BVR STAGE 3 - F15-E - 2vs2 - F-15E"}, {"BVR - STAGE 3 - F-15E X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 3 F-15E x4 -F18", {"BVR STAGE 3 - F15-E - 4vs4 - F/A18C", "BVR STAGE 3 - F15-E - 4vs4 - M-2000C", "BVR STAGE 3 - F15-E - 4vs4 - F-14B", "BVR STAGE 3 - F15-E - 4vs4 - F-15E"}, {"BVR - STAGE 3 - F-15E X4"}, true)
    
    --------- BVR STAGE 4 - SU-30 ECM
    
    trainingSpawnZone.registerZone("BVR - STAGE 4 SU30ECMx1 -F18", {"BVR STAGE 4 - SU-30-ECM - 1vs1 - F/A18C", "BVR STAGE 4 - SU30ECM - 1vs1 - M-2000C", "BVR STAGE 4 - SU-30ECM - 1vs1 - F-14B", "BVR STAGE 4 - SU-30ECM - 1vs1 - F-15E"}, {"BVR - STAGE 4 - SU30ECM X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 SU30ECMx2 -F18", {"BVR STAGE 4 - SU-30-ECM - 2vs2 - F/A18C", "BVR STAGE 4 - SU30ECM - 2vs2 - M-2000C", "BVR STAGE 4 - SU-30ECM - 2vs2 - F-14B", "BVR STAGE 4 - SU-30ECM - 2vs2 - F-15E"}, {"BVR - STAGE 4 - SU30ECM X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 SU30ECMx4 -F18", {"BVR STAGE 4 - SU-30-ECM - 4vs4 - F/A18C", "BVR STAGE 4 - SU30ECM - 4vs4 - M-2000C", "BVR STAGE 4 - SU-30ECM - 4vs4 - F-14B", "BVR STAGE 4 - SU-30ECM - 4vs4 - F-15E"}, {"BVR - STAGE 4 - SU30ECM X4"}, true)
    
    --------- BVR STAGE 4 - JF-17 ECM
    
    trainingSpawnZone.registerZone("BVR - STAGE 4 JF17ECMx1 -F18", {"BVR STAGE 4 - JF-17-ECM - 1vs1 - F/A18C", "BVR STAGE 4 - JF-17ECM - 1vs1 - M-2000C", "BVR STAGE 4 - JF-17ECM - 1vs1 - F-14B", "BVR STAGE 4 - JF-17ECM - 1vs1 - F-15E", "BVR STAGE 4 - JF-17ECM - 1vs1 - F16CM"}, {"BVR - STAGE 4 - JF-17ECM X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 JF17ECMx2 -F18", {"BVR STAGE 4 - JF-17-ECM - 2vs2 - F/A18C", "BVR STAGE 4 - JF-17ECM - 2vs2 - M-2000C", "BVR STAGE 4 - JF-17ECM - 2vs2 - F-14B", "BVR STAGE 4 - JF-17ECM - 2vs2 - F-15E", "BVR STAGE 4 - JF-17ECM - 2vs2 - F16CM"}, {"BVR - STAGE 4 - JF-17ECM X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 JF17ECMx4 -F18", {"BVR STAGE 4 - JF-17-ECM - 4vs4 - F/A18C", "BVR STAGE 4 - JF-17ECM - 4vs4 - M-2000C", "BVR STAGE 4 - JF-17ECM - 4vs4 - F-14B", "BVR STAGE 4 - JF-17ECM - 4vs4 - F-15E"}, {"BVR - STAGE 4 - JF-17ECM X4"}, true)
    
    --------- BVR STAGE 4 - F16CM ECM
    
    trainingSpawnZone.registerZone("BVR - STAGE 4 F16ECMx1 -F18", {"BVR STAGE 4 - F16CM-ECM - 1vs1 - F/A18C", "BVR STAGE 4  - F16ECM - 1vs1 - M-2000C", "BVR STAGE 4 - F16ECM - 1vs1 - F-14B", "BVR STAGE 4 - F16ECM - 1vs1 - F-15E"}, {"BVR - STAGE 4 - F16ECM X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F16ECMx2 -F18", {"BVR STAGE 4 - F16CM-ECM - 2vs2 - F/A18C", "BVR STAGE 4  - F16ECM - 2vs2 - M-2000C", "BVR STAGE 4 - F16ECM - 2vs2 - F-14B", "BVR STAGE 4 - F16ECM - 2vs2 - F-15E"}, {"BVR - STAGE 4 - F16ECM X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F16ECMx4 -F18", {"BVR STAGE 4 - F16CM-ECM - 4vs4 - F/A18C", "BVR STAGE 4  - F16ECM - 4vs4 - M-2000C", "BVR STAGE 4 - F16ECM - 4vs4 - F-14B", "BVR STAGE 4 - F16ECM - 4vs4 - F-15E"}, {"BVR - STAGE 4 - F16ECM X4"}, true)
    
    --------- BVR STAGE 4 - F18
    
    trainingSpawnZone.registerZone("BVR - STAGE 4 F18x1 -F18", {"BVR STAGE 4 - F/A18C - 1vs1 - F/A18C", "BVR STAGE 4 - F/A18C - 1vs1 - M-2000C", "BVR STAGE 4 - F/A18C - 1vs1 - F-14B", "BVR STAGE 4 - F/A18C - 1vs1 - F-15E"}, {"BVR - STAGE 4 - F18 X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F18x2 -F18", {"BVR STAGE 4 - F/A18C - 2vs2 - F/A18C", "BVR STAGE 4 - F/A18C - 2vs2 - M-2000C", "BVR STAGE 4 - F/A18C - 2vs2 - F-14B", "BVR STAGE 4 - F/A18C - 2vs2 - F-15E"}, {"BVR - STAGE 4 - F18 X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F18x4 -F18", {"BVR STAGE 4 - F/A18C - 4vs4 - F/A18C", "BVR STAGE 4 - F/A18C - 4vs4 - M-2000C", "BVR STAGE 4 - F/A18C - 4vs4 - F-14B", "BVR STAGE 4 - F/A18C - 4vs4 - F-15E"}, {"BVR - STAGE 4 - F18 X4"}, true)
    
    --------- BVR STAGE 4 - F14A
    
    trainingSpawnZone.registerZone("BVR - STAGE 4 F14Ax1 -F18", {"BVR STAGE 4 - F14A - 1vs1 - F/A18C", "BVR STAGE 4 - F14A - 1vs1 - M-2000C", "BVR STAGE 4 - F-14A - 1vs1 - F-14B", "BVR STAGE 4 - F-14A - 1vs1 - F-15E"}, {"BVR - STAGE 4 - F14A X1"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F14Ax2 -F18", {"BVR STAGE 4 - F14A - 2vs2 - F/A18C", "BVR STAGE 4 - F14A - 2vs2 - M-2000C", "BVR STAGE 4 - F-14A - 2vs2 - F-14B", "BVR STAGE 4 - F-14A - 2vs2 - F-15E"}, {"BVR - STAGE 4 - F14A X2"}, true)
    trainingSpawnZone.registerZone("BVR - STAGE 4 F14Ax4 -F18", {"BVR STAGE 4 - F14A - 4vs4 - F/A18C", "BVR STAGE 4 - F14A - 4vs4 - M-2000C", "BVR STAGE 4 - F-14A - 4vs4 - F-14B", "BVR STAGE 4 - F-14A - 4vs4 - F-15E"}, {"BVR - STAGE 4 - F14A X4"}, true)
    
    --------- ENTRAINEMENT - R27-ET
    
    trainingSpawnZone.registerZone("- ENT ET -1", {"ENT - EVITEMENT R27-ET -1 -F/A18C", "ENT - EVITEMENT R27-ET -1 -M2000C", "ENT - EVITEMENT R27-ET -1 -F14B", "ENT - EVITEMENT R27-ET -1 -F-15E", "ENT - EVITEMENT R27-ET -1 -F16CM"}, {"MIG29S - FOX2 - ENT-1"}, true)
    trainingSpawnZone.registerZone("- ENT ET -2", {"ENT - EVITEMENT R27-ET -2 -F/A18C", "ENT - EVITEMENT R27-ET -2 -M2000C", "ENT - EVITEMENT R27-ET -2 -F14B", "ENT - EVITEMENT R27-ET -2 -F-15E"}, {"MIG29S - FOX2 - ENT-2"}, true)
    trainingSpawnZone.registerZone("- ENT ET -3", {"ENT - EVITEMENT R27-ET -3 -F/A18C", "ENT - EVITEMENT R27-ET -3 -M2000C", "ENT - EVITEMENT R27-ET -3 -F14B", "ENT - EVITEMENT R27-ET -3 -F-15E"}, {"MIG29S - FOX2 - ENT-3"}, true)
    
    --------- ENTRAINEMENT - R27-ER
    
    trainingSpawnZone.registerZone("- ENT ER -1", {"ENT - EVITEMENT R27-ER -1 -F/A18C", "ENT - EVITEMENT R27-ER -1 -M2000C", "ENT - EVITEMENT R27-ER -1 -F14B", "ENT - EVITEMENT R27-ER -1 -F-15E", "ENT - EVITEMENT R27-ER -1 -F16CM"}, {"SU-30 - FOX1 - ENT-1"}, true)
    trainingSpawnZone.registerZone("- ENT ER -2", {"ENT - EVITEMENT R27-ER -2 -F/A18C", "ENT - EVITEMENT R27-ER -2 -M2000C", "ENT - EVITEMENT R27-ER -2 -F14B", "ENT - EVITEMENT R27-ER -2 -F-15E"}, {"SU-30 - FOX1 - ENT-2"}, true)
    trainingSpawnZone.registerZone("- ENT ER -3", {"ENT - EVITEMENT R27-ER -3 -F/A18C", "ENT - EVITEMENT R27-ER -3 -M2000C", "ENT - EVITEMENT R27-ER -3 -F14B", "ENT - EVITEMENT R27-ER -3 -F-15E"}, {"SU-30 - FOX1 - ENT-3"}, true)
    
    --------- ENTRAINEMENT - 120C
    
    trainingSpawnZone.registerZone("- ENT 120 -1", {"ENT - EVITEMENT AIM-120C -1 -F/A18C", "ENT - EVITEMENT AIM-120C -1 -M2000C", "ENT - EVITEMENT AIM-120C -1 -F14B", "ENT - EVITEMENT AIM-120C -1 -F-15E"}, {"F-16 - FOX3 - ENT-1"}, true)
    trainingSpawnZone.registerZone("- ENT 120 -2", {"ENT - EVITEMENT AIM-120C -2 -F/A18C", "ENT - EVITEMENT AIM-120C -2 -M2000C", "ENT - EVITEMENT AIM-120C -2 -F14B", "ENT - EVITEMENT AIM-120C -2 -F-15E"}, {"F-18 - FOX3 - ENT-2"}, true)
    trainingSpawnZone.registerZone("- ENT 120 -3", {"ENT - EVITEMENT AIM-120C -3 -F/A18C", "ENT - EVITEMENT AIM-120C -3 -M2000C", "ENT - EVITEMENT AIM-120C -3 -F14B", "ENT - EVITEMENT AIM-120C -3 -F-15E"}, {"F-15E - FOX3 - ENT-3"}, true)
    
    --------- ENTRAINEMENT - R-77
    
    trainingSpawnZone.registerZone("- ENT 77 -1", {"ENT - EVITEMENT R77 -1 -F/A18C", "ENT - EVITEMENT R77 -1 -M2000C", "ENT - EVITEMENT R77 -1 -F14B", "ENT - EVITEMENT R77 -1 -F-15E", "ENT - EVITEMENT R77 -1 -F16CM"}, {"J-11A - FOX3 - ENT-1"}, true)
    trainingSpawnZone.registerZone("- ENT 77 -2", {"ENT - EVITEMENT R77 -2 -F/A18C", "ENT - EVITEMENT R77 -2 -M2000C", "ENT - EVITEMENT R77 -2 -F14B", "ENT - EVITEMENT R77 -2 -F15C", "ENT - EVITEMENT R77 -2 -F-15E"}, {"J-11A - FOX3 - ENT-2"}, true)
    trainingSpawnZone.registerZone("- ENT 77 -3", {"ENT - EVITEMENT R77 -3 -F/A18C", "ENT - EVITEMENT R77 -3 -M2000C", "ENT - EVITEMENT R77 -3 -F14B", "ENT - EVITEMENT R77 -3 -F-15E"}, {"J-11A - FOX3 - ENT-3"}, true)
    
    --------- ENTRAINEMENT - R-530D
    
    trainingSpawnZone.registerZone("- ENT 530D -1", {"ENT - EVITEMENT 530D -1 -F/A18C", "ENT - EVITEMENT 530D -1 -M2000C", "ENT - EVITEMENT 530D -1 -F14B", "ENT - EVITEMENT 530D -1 -F-15E", "ENT - EVITEMENT 530D -1 -F16CM"}, {"M2000C - FOX1 - ENT-1"}, true)
    trainingSpawnZone.registerZone("- ENT 530D -2", {"ENT - EVITEMENT 530D -2 -F/A18C", "ENT - EVITEMENT 530D -2 -M2000C", "ENT - EVITEMENT 530D -2 -F14B", "ENT - EVITEMENT 530D -2 -F-15E"}, {"M2000C - FOX1 - ENT-2"}, true)
    trainingSpawnZone.registerZone("- ENT 530D -3", {"ENT - EVITEMENT 530D -3 -F/A18C", "ENT - EVITEMENT 530D -3 -M2000C", "ENT - EVITEMENT 530D -3 -F14B", "ENT - EVITEMENT 530D -3 -F-15E"}, {"M2000C - FOX1 - ENT-3"}, true)
    
    --------- ENTRAINEMENT - ZONE FOX3
    
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- F16X1 -F18", {"BVR ZONE-FOX3 - F16CM - 1vs1 - F/A18C", "BVR ZONE-FOX3 - F16CM - 1vs1 - M-2000C", "BVR ZONE-FOX3 - F16CM - 1vs1 - F-14B", "BVR ZONE-FOX3 - F16CM - 1vs1 - F-15E"}, {"BVR - ZONEFOX3 - F16ECM X1"}, true)
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- F16X2 -F18", {"BVR ZONE-FOX3 - F16CM - 2vs2 - F/A18C", "BVR ZONE-FOX3 - F16CM - 2vs2 - M-2000C", "BVR ZONE-FOX3 - F16CM - 2vs2 - F-14B", "BVR ZONE-FOX3 - F16CM - 2vs2- F-15E"}, {"BVR - ZONEFOX3 - F16ECM X2-1", "BVR - ZONEFOX3 - F16ECM X2-2"}, true)
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- F16X4 -F18", {"BVR ZONE-FOX3 - F16CM - 4vs4 - F/A18C", "BVR ZONE-FOX3 - F16CM - 4vs4 - M-2000C", "BVR ZONE-FOX3 - F16CM - 4vs4 - F-14B", "BVR ZONE-FOX3 - F16CM - 4vs4- F-15E"}, {"BVR - ZONEFOX3 - F16ECM X4-1", "BVR - ZONEFOX3 - F16ECM X4-2", "BVR - ZONEFOX3 - F16ECM X4-3", "BVR - ZONEFOX3 - F16ECM X4-4"}, true)
    
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- J11AX1", {"BVR ZONE-FOX3 - J-11A - 1vs1 - F/A18C", "BVR ZONE-FOX3 - J-11A - 4vs4 - M-2000C", "BVR ZONE-FOX3 - J-11A - 1vs1 - F-14B", "BVR ZONE-FOX3 - J-11A - 1vs1 - F-15E"}, {"BVR - ZONEFOX3 - J11A X1"}, true)
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- J11AX2", {"BVR ZONE-FOX3 - J-11A - 2vs2 - F/A18C", "BVR ZONE-FOX3 - J-11A - 4vs4 - M-2000C", "BVR ZONE-FOX3 - J-11A - 2vs2 - F-14B", "BVR ZONE-FOX3 - J-11A - 2vs2 - F-15E"}, {"BVR - ZONEFOX3 - J11A X2 -1", "BVR - ZONEFOX3 - J11A X2 -2"}, true)
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- J11AX4", {"BVR ZONE-FOX3 - J-11A - 4vs4 - F/A18C", "BVR ZONE-FOX3 - J-11A - 4vs4 - M-2000C", "BVR ZONE-FOX3 - J-11A - 4vs4 - F-14B", "BVR ZONE-FOX3 - J-11A - 4vs4 - F-15E"}, {"BVR - ZONEFOX3 - J11A X4-1", "BVR - ZONEFOX3 - J11A X4-1", "BVR - ZONEFOX3 - J11A X4-2", "BVR - ZONEFOX3 - J11A X4-3", "BVR - ZONEFOX3 - J11A X4-4"}, true)
    
    trainingSpawnZone.registerZone("BVR - ZONEFOX3- M2000C", {"BVR ZONE-FOX3 - M2000C - 2vs2 - F/A18C", "BVR ZONE-FOX3 - M2000C - 2vs2 - F-15E"}, {"BVR - ZONEFOX3 - M2000C-ECM X2"}, true)


    trainingSpawnZone.start()
end