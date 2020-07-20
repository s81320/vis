setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

soccer.preprocessed <- read.csv(
  "soccer-preprocessed.csv",
  encoding = "UTF-8"
)

# Club-Country Information (in plain text, required some text processing)
# https://www.ea.com/games/fifa/news/fifa-19-leagues-and-teams

clubs.argentina <- c(
  "Boca Juniors",
  "Club Atlético Aldosivi",
  "Argentinos Juniors",
  "Atlético Tucumán",
  "Club Atlético Banfield",
  "Belgrano de Córdoba",
  "Buenos Aires",
  "Club Atlético Colón",
  "Defensa y Justicia",
  "Estudiantes de La Plata",
  "Gimnasia y Esgrima La Plata",
  "Godoy Cruz",
  "Club Atlético Huracán",
  "Independiente",
  "Club Atlético Lanús",
  "Newell's Old Boys",
  "Patronato",
  "Racing Club",
  "River Plate",
  "Rosario Central",
  "San Lorenzo de Almagro",
  "San Martín de San Juan",
  "San Martin de Tucumán",
  "Club Atlético Talleres",
  "Club Atlético Tigre",
  "Unión de Santa Fe",
  "Vélez Sarsfield"
)

clubs.australia <- c(
  "Adelaide United",
  "Brisbane Roar",
  "Central Coast Mariners",
  "Melbourne Victory",
  "Melbourne City FC",
  "Newcastle Jets",
  "Perth Glory",
  "Sydney FC",
  "Wellington Phoenix",
  "Western Sydney Wanderers"
)

clubs.austria <- c(
  "FC Admira Wacker Mödling",
  "FK Austria Wien",
  "FC Wacker Innsbruck",
  "LASK Linz",
  "FC Red Bull Salzburg",
  "SCR Altach",
  "SK Rapid Wien",
  "SK Sturm Graz",
  "SKN St. Pölten",
  "SV Mattersburg",
  "TSV Hartberg",
  "Wolfsberger AC"
)

clubs.belgium <- c(
  "KSV Cercle Brugge", 
  "Club Brugge KV",
  "Royal Excel Mouscron",
  "KAA Gent",
  "KAS Eupen",
  "KRC Genk",
  "KV Kortrijk",
  "KV Oostende",
  "Royal Antwerp FC",
  "RSC Anderlecht",
  "Sint-Truidense VV",
  "Sporting de Charleroi",
  "Sporting Lokeren",
  "Standard de Liège",
  "Waasland-Beveren",
  "SV Zulte-Waregem"
)

clubs.spain <- c(
  "Athletic Club de Bilbao",
  "Atlético Madrid",
  "CD Leganés",
  "Deportivo Alavés",
  "FC Barcelona",
  "Getafe CF",
  "Girona FC",
  "Levante UD",
  "Real Valladolid CF",
  "Rayo Vallecano",
  "RC Celta",
  "RCD Espanyol",
  "Real Betis",
  "Real Madrid",
  "Real Sociedad",
  "SD Eibar",
  "SD Huesca",
  "Sevilla FC",
  "Valencia CF",
  "Villarreal CF",
  "AD Alcorcón",
  "Albacete BP",
  "CA Osasuna",
  "Cádiz CF",
  "CD Lugo",
  "CD Numancia",
  "CD Tenerife",
  "CF Rayo Majadahonda",
  "CF Reus Deportiu",
  "Córdoba CF",
  "Elche CF",
  "Extremadura UD",
  "Granada CF",
  "Málaga CF",
  "Gimnàstic de Tarragona",
  "Real Oviedo",
  "Real Sporting de Gijón",
  "Real Zaragoza",
  "Deportivo de La Coruña",
  "RCD Mallorca",
  "UD Almería",
  "UD Las Palmas"
)

clubs.brazil <- c(
  "América FC (Minas Gerais)",
  "Atlético Paranaense",
  "Atlético Mineiro",
  "Bahia",
  "Botafogo",
  "Ceará Sporting Club",
  "Chapecoense",
  "Cruzeiro",
  "Fluminense",
  "Grêmio",
  "Internacional",
  "Paraná",
  "Santos",
  "Sport Club do Recife",
  "Vitória"
)

clubs.chile <- c(
  "Colo-Colo",
  "Audax Italiano",
  "CD Antofagasta",
  "CD Huachipato",
  "CD O'Higgins",
  "CD Palestino",
  "CD Viñazur",
  "Curicó Unido",
  "Deportes Iquique",
  "Club Deportes Temuco",
  "CD Everton de Viña del Mar",
  "San Luis de Quillota",
  "Universidad Católica",
  "CD Universidad de Concepción",
  "Universidad de Chile",
  "Unión Española",
  "Unión La Calera"
)

clubs.china <- c(
  "Beijing Sinobo Guoan FC",
  "Beijing Renhe FC",
  "Changchun Yatai FC",
  "Chongqing Dangdai Lifan FC SWM Team",
  "Dalian YiFang FC",
  "Guangzhou Evergrande Taobao FC",
  "Guangzhou R&F; FC",
  "Guizhou Hengfeng FC",
  "Hebei China Fortune FC",
  "Henan Jianye FC",
  "Jiangsu Suning FC",
  "Shandong Luneng TaiShan FC",
  "Shanghai Greenland Shenhua FC",
  "Shanghai SIPG FC",
  "Tianjin Quanjian FC",
  "Tianjin TEDA FC"
)

clubs.colombia <- c(
  "Alianza Petrolera",
  "América de Cali",
  "Atlético Bucaramanga",
  "Atlético Nacional",
  "Atlético Huila",
  "Boyacá Chicó FC",
  "Deportes Tolima",
  "Deportivo Cali",
  "Deportivo Pasto",
  "Envigado FC",
  "Independiente Santa Fe",
  "Independiente Medellín",
  "Jaguares de Córdoba",
  "Junior FC",
  "La Equidad",
  "Itagüí Leones FC",
  "Millonarios FC",
  "Once Caldas",
  "Patriotas Boyacá FC",
  "Rionegro Águilas"
)

clubs.denmark <- c(
  "Aalborg BK",
  "Aarhus GF",
  "AC Horsens",
  "Brøndby IF",
  "Esbjerg fB",
  "FC København",
  "FC Midtjylland",
  "FC Nordsjælland",
  "Hobro IK",
  "Odense Boldklub",
  "Randers FC",
  "SønderjyskE",
  "Vejle Boldklub",
  "Vendsyssel FF"
)

clubs.england <- c(  
  "Arsenal",
  "Bournemouth",
  "Brighton & Hove Albion",
  "Brighton & Hove Albion Football Club",
  "Burnley",
  "Cardiff City",
  "Chelsea",
  "Crystal Palace",
  "Everton",
  "Fulham",
  "Huddersfield Town",
  "Leicester City",
  "Liverpool",
  "Manchester City",
  "Manchester United",
  "Newcastle United",
  "Southampton",
  "Tottenham Hotspur",
  "Watford",
  "West Ham United",
  "Wolverhampton Wanderers",
  "Aston Villa",
  "Birmingham City",
  "Blackburn Rovers",
  "Bolton Wanderers",
  "Brentford",
  "Bristol City",
  "Derby County",
  "Hull City",
  "Ipswich Town",
  "Leeds United",
  "Middlesbrough",
  "Millwall",
  "Norwich City",
  "Nottingham Forest",
  "Preston North End",
  "Queens Park Rangers",
  "Reading",
  "Rotherham United",
  "Sheffield United",
  "Sheffield Wednesday",
  "Stoke City",
  "Swansea City",
  "West Bromwich Albion",
  "Wigan Athletic",
  "Accrington Stanley",
  "AFC Wimbledon",
  "Barnsley",
  "Blackpool",
  "Bradford City",
  "Bristol Rovers",
  "Burton Albion",
  "Charlton Athletic",
  "Coventry City",
  "Doncaster Rovers",
  "Fleetwood Town",
  "Gillingham",
  "Luton Town",
  "Oxford United",
  "Peterborough United",
  "Plymouth Argyle",
  "Portsmouth",
  "Rochdale",
  "Scunthorpe United",
  "Shrewsbury",
  "Southend United",
  "Sunderland",
  "Walsall",
  "Wycombe Wanderers",
  "Bury",
  "Cambridge United",
  "Carlisle United",
  "Cheltenham Town",
  "Colchester United",
  "Crawley Town",
  "Crewe Alexandra",
  "Exeter City",
  "Forest Green Rovers",
  "Grimsby Town",
  "Lincoln City",
  "Macclesfield Town",
  "Mansfield Town",
  "Milton Keynes Dons",
  "Morecambe",
  "Newport County",
  "Northampton Town",
  "Notts County",
  "Oldham Athletic",
  "Port Vale",
  "Stevenage",
  "Swindon Town",
  "Tranmere Rovers",
  "Yeovil Town"
)

clubs.france <- c(    
  "Amiens SC",
  "Angers SCO",
  "AS Monaco",
  "AS Saint-Étienne",
  "Dijon FCO",
  "En Avant de Guingamp",
  "FC Nantes",
  "FC Girondins de Bordeaux",
  "LOSC Lille",
  "Montpellier HSC",
  "Nîmes Olympique",
  "OGC Nice",
  "Olympique Lyonnais",
  "Olympique de Marseille",
  "Paris Saint-Germain",
  "RC Strasbourg Alsace",
  "Stade Malherbe Caen",
  "Stade de Reims",
  "Stade Rennais FC",
  "Toulouse Football Club",
  "AC Ajaccio",
  "AJ Auxerre",
  "AS Béziers",
  "Chamois Niortais Football Club",
  "Clermont Foot 63",
  "ESTAC Troyes",
  "FC Lorient",
  "FC Metz",
  "FC Sochaux-Montbéliard",
  "Gazélec Ajaccio",
  "GFC Ajaccio",
  "Grenoble Foot 38",
  "Le Havre AC",
  "La Berrichonne de Châteauroux",
  "AS Nancy Lorraine",
  "Paris FC",
  "Racing Club de Lens",
  "Red Star FC",
  "Stade Brestois 29",
  "US Orléans Loiret Football",
  "Valenciennes FC"
)

clubs.germany <- c(    
  "1. FC Nürnberg",
  "1. FSV Mainz 05",
  "Borussia Dortmund",
  "Fortuna Düsseldorf",
  "FC Augsburg",
  "FC Bayern München",
  "Eintracht Frankfurt",
  "Hannover 96",
  "Hertha BSC",
  "Bayer 04 Leverkusen",
  "Borussia Mönchengladbach",
  "RB Leipzig",
  "SC Freiburg",
  "FC Schalke 04",
  "TSG 1899 Hoffenheim",
  "VfB Stuttgart",
  "VfL Wolfsburg",
  "SV Werder Bremen",
  "FC Erzgebirge Aue",
  "DSC Arminia Bielefeld",
  "VfL Bochum 1848",
  "SV Darmstadt 98",
  "SG Dynamo Dresden",
  "MSV Duisburg",
  "SpVgg Greuther Fürth",
  "Hamburger SV",
  "1. FC Heidenheim 1846",
  "FC Ingolstadt 04",
  "Holstein Kiel",
  "1. FC Köln",
  "1. FC Magdeburg",
  "SC Paderborn 07",
  "SSV Jahn Regensburg",
  "SV Sandhausen",
  "FC St. Pauli",
  "1. FC Union Berlin",
  "TSV 1860 München",
  "Eintracht Braunschweig",
  "FC Carl Zeiss Jena",
  "FC Energie Cottbus",
  "SC Fortuna Köln",
  "FSV Zwickau",
  "Hallescher FC",
  "FC Hansa Rostock",
  "1. FC Kaiserslautern",
  "Karlsruher SC",
  "KFC Uerdingen 05",
  "SC Preußen Münster",
  "SG Sonnenhof Großaspach",
  "VfL Sportfreunde Lotte",
  "SV Meppen",
  "SV Wehen Wiesbaden",
  "SpVgg Unterhaching",
  "VfL Osnabrück",
  "VfR Aalen",
  "FC Würzburger Kickers"
)

clubs.ireland <- c(
  "Bohemian FC",
  "Bray Wanderers",
  "Cork City",
  "Derry City",
  "Dundalk",
  "Limerick FC",
  "Shamrock Rovers",
  "Sligo Rovers",
  "St. Pats",
  "St. Patrick's Athletic",
  "Waterford FC"
)

clubs.italy <- c(
  "Atalanta",
  "Bologna",
  "Cagliari",
  "Chievo Verona",
  "Empoli",
  "Fiorentina",
  "Frosinone",
  "Genoa",
  "Inter",
  "Juventus",
  "Lazio",
  "Milan",
  "Napoli",
  "Parma",
  "Roma",
  "Sampdoria",
  "Sassuolo",
  "SPAL",
  "Torino",
  "Udinese",
  "Ascoli",
  "Benevento",
  "Brescia",
  "Carpi",
  "Cittadella",
  "Cosenza",
  "Cremona",
  "Crotone",
  "Foggia",
  "Hellas Verona",
  "Spezia",
  "La Spezia",
  "Lecce",
  "Livorno",
  "Padova",
  "Palermo",
  "Perugia",
  "Pescara",
  "Salerno",
  "US Cremonese",
  "US Salernitana 1919",
  "Venezia FC"
)

clubs.japan <- c(
  "Cerezo Osaka",
  "FC Tokyo",
  "Gamba Osaka",
  "Hokkaido Consadole Sapporo",
  "Júbilo Iwata",
  "Kashima Antlers",
  "Kashiwa Reysol",
  "Kawasaki Frontale",
  "Nagoya Grampus",
  "Sagan Tosu",
  "Shimizu S-Pulse",
  "Sanfrecce Hiroshima",
  "Shonan Bellmare",
  "Urawa Red Diamonds",
  "Vegalta Sendai",
  "Vissel Kobe",
  "V-Varen Nagasaki",
  "Yokohama F. Marinos"
)

clubs.korea <- c(
  "Daegu FC",
  "FC Seoul",
  "Gangwon FC",
  "Gyeongnam FC",
  "Incheon United FC",
  "Jeju United FC",
  "Jeonbuk Hyundai Motors",
  "Jeonnam Dragons",
  "Pohang Steelers",
  "Sangju Sangmu FC",
  "Suwon Samsung Bluewings",
  "Ulsan Hyundai FC"
)

clubs.mexico <- c(    
  "Club América",
  "Club Atlas",
  "Cruz Azul",
  "Guadalajara",
  "Club León",
  "Lobos BUAP",
  "Monarcas Morelia",
  "Monterrey",
  "Club Necaxa",
  "Pachuca",
  "Puebla FC",
  "Querétaro",
  "Santos Laguna",
  "Tigres U.A.N.L.",
  "Club Tijuana",
  "Deportivo Toluca",
  "U.N.A.M.",
  "Tiburones Rojos de Veracruz"
)

clubs.netherlands <- c(
  "ADO Den Haag",
  "Ajax",
  "AZ",
  "AZ Alkmaar",
  "De Graafschap",
  "Excelsior",
  "FC Emmen",
  "FC Groningen",
  "FC Utrecht",
  "Feyenoord",
  "Fortuna Sittard",
  "Heracles Almelo",
  "NAC Breda",
  "PEC Zwolle",
  "PSV",
  "SC Heerenveen",
  "Vitesse",
  "VVV-Venlo",
  "Willem II"
)

clubs.norway <- c(
  "FK Bodø/Glimt",
  "FK Haugesund",
  "IK Start",
  "Kristiansund BK",
  "Lillestrøm SK",
  "Molde FK",
  "Odds BK",
  "Ranheim Fotball",
  "Rosenborg BK",
  "Sandefjord Fotball",
  "Sarpsborg 08 FF",
  "SK Brann",
  "Stabæk Fotball",
  "Strømsgodset IF",
  "Tromsø IL",
  "Vålerenga Fotball"
)

clubs.poland <- c(
  "Arka Gdynia",
  "Cracovia",
  "Górnik Zabrze",
  "Jagiellonia Bialystok",
  "Korona Kielce",
  "Lech Poznan",
  "Lechia Gdansk",
  "Legia Warszawa",
  "Miedz Legnica",
  "Piast Gliwice",
  "Pogon Szczecin",
  "Slask Wroclaw",
  "Wisla Kraków",
  "Wisla Plock",
  "Zaglebie Sosnowiec",
  "Zaglebie Lubin"
)

clubs.portugal <- c(
  "Os Belenenses",
  "Boavista FC",
  "CD Nacional",
  "CD Feirense",
  "CD Tondela",
  "CD Aves",
  "FC Porto",
  "Funchal",
  "GD Chaves",
  "Clube Sport Marítimo",
  "Moreirense FC",
  "Portimonense SC",
  "Rio Ave FC",
  "Santa Clara",
  "SC Braga",
  "SL Benfica",
  "Sporting CP",
  "Vitória Guimarães",
  "Vitória de Setúbal"
)

clubs.saudiarabia <- c(
  "Al Ahli",
  "Al Batin",
  "Al Faisaly",
  "Al Fateh",
  "Al Fayha",
  "Al Hazem",
  "Al Hilal",
  "Al Ittihad",
  "Al Nassr",
  "Al Qadisiyah",
  "Al Raed",
  "Al Shabab",
  "Al Wehda",
  "Al Taawoun",
  "Ettifaq FC",
  "Ohod Club"
)

clubs.scotland <- c(
  "Aberdeen",
  "Celtic",
  "Dundee FC",
  "Hamilton Academical FC",
  "Hearts",
  "Heart of Midlothian",
  "Hibernian",
  "Kilmarnock",
  "Livingston FC",
  "Motherwell",
  "Rangers FC",
  "St. Johnstone FC",
  "St. Mirren"
)

clubs.sweden <- c(
  "AIK",
  "BK Häcken",
  "IF Brommapojkarna",
  "Dalkurd FF",
  "Djurgårdens IF",
  "GIF Sundsvall",
  "Hammarby IF",
  "IF Elfsborg",
  "IFK Göteborg",
  "IFK Norrköping",
  "IK Sirius",
  "Kalmar FF",
  "Malmö FF",
  "Örebro SK",
  "Östersunds FK",
  "Trelleborgs FF"
)

clubs.switzerland <- c(  
  "BSC Young Boys",
  "FC Basel 1893",
  "FC Lugano",
  "FC Luzern",
  "FC Sion",
  "FC St. Gallen",
  "FC Thun",
  "FC Zürich",
  "Grasshopper Club Zürich",
  "Neuchâtel Xamax"
)

clubs.turkey <- c(
  "Akhisar Belediyespor",
  "Alanyaspor",
  "Antalyaspor",
  "Medipol Basaksehir FK",
  "BB Erzurumspor",
  "Besiktas JK",
  "Bursaspor",
  "Çaykur Rizespor",
  "Fenerbahçe SK",
  "Galatasaray SK",
  "Göztepe SK",
  "Kasimpasa SK",
  "Kayserispor",
  "Atiker Konyaspor",
  "MKE Ankaragücü",
  "Sivasspor",
  "Trabzonspor",
  "Yeni Malatyaspor"
)

clubs.usacanada <- c(
  "Atlanta United",
  "Chicago Fire",
  "Colorado Rapids",
  "Columbus Crew SC",
  "DC United",
  "FC Dallas",
  "Houston Dynamo",
  "Montreal Impact",
  "Los Angeles FC",
  "LA Galaxy",
  "Minnesota United FC",
  "New England Revolution",
  "New York City FC",
  "New York Red Bulls",
  "Orlando City SC",
  "Philadelphia Union",
  "Portland Timbers",
  "Real Salt Lake",
  "Seattle Sounders FC",
  "San Jose Earthquakes",
  "Sporting Kansas City",
  "Toronto FC",
  "Vancouver Whitecaps FC"
)

clubs.restofworld <- c(
  "AEK Athens",
  "PFC CSKA Moscow",
  "Dinamo Zagreb",
  "Dynamo Kyiv",
  "HJK Helsinki",
  "Kaizer Chiefs",
  "Lokomotiv Moscow",
  "MLS All Stars",
  "Olympiacos CFP",
  "Orlando Pirates",
  "Panathinaikos FC",
  "PAOK",
  "Shakhtar Donetsk",
  "SK Slavia Praha",
  "Sparta Praha",
  "Spartak Moscow",
  "Viktoria Plzen"
)

soccer.preprocessed$Club <- trimws(soccer.preprocessed$Club)

soccer.preprocessed$Club.Nationality <- ifelse(
  soccer.preprocessed$Club %in% clubs.argentina, "Argentina", ifelse(
    soccer.preprocessed$Club %in% clubs.australia, "Australia", ifelse(
      soccer.preprocessed$Club %in% clubs.austria, "Austria", ifelse(
        soccer.preprocessed$Club %in% clubs.belgium, "Belgium", ifelse(
          soccer.preprocessed$Club %in% clubs.brazil, "Brazil", ifelse(
            soccer.preprocessed$Club %in% clubs.chile, "Chile", ifelse(
              soccer.preprocessed$Club %in% clubs.china, "China PR", ifelse(
                soccer.preprocessed$Club %in% clubs.colombia, "Colombia", ifelse(
                  soccer.preprocessed$Club %in% clubs.denmark, "Denmark", ifelse(
                    soccer.preprocessed$Club %in% clubs.england, "England", ifelse(
                      soccer.preprocessed$Club %in% clubs.france, "France", ifelse(
                        soccer.preprocessed$Club %in% clubs.germany, "Germany", ifelse(
                          soccer.preprocessed$Club %in% clubs.ireland, "Republic of Ireland", ifelse(
                            soccer.preprocessed$Club %in% clubs.italy, "Italy", ifelse(
                              soccer.preprocessed$Club %in% clubs.japan, "Japan", ifelse(
                                soccer.preprocessed$Club %in% clubs.korea, "Korea Republic", ifelse(
                                  soccer.preprocessed$Club %in% clubs.mexico, "Mexico", ifelse(
                                    soccer.preprocessed$Club %in% clubs.netherlands, "Netherlands", ifelse(
                                      soccer.preprocessed$Club %in% clubs.norway, "Norway", ifelse(
                                        soccer.preprocessed$Club %in% clubs.poland, "Poland", ifelse(
                                          soccer.preprocessed$Club %in% clubs.portugal, "Portugal", ifelse(
                                            soccer.preprocessed$Club %in% clubs.saudiarabia, "Saudi Arabia", ifelse(
                                              soccer.preprocessed$Club %in% clubs.scotland, "Scotland", ifelse(
                                                soccer.preprocessed$Club %in% clubs.sweden, "Sweden", ifelse(
                                                  soccer.preprocessed$Club %in% clubs.spain, "Spain", ifelse(
                                                    soccer.preprocessed$Club %in% clubs.switzerland, "Switzerland", ifelse(
                                                      soccer.preprocessed$Club %in% clubs.turkey, "Turkey", ifelse(
                                                        soccer.preprocessed$Club %in% clubs.usacanada, "USA/Canada", ifelse(
                                                          soccer.preprocessed$Club %in% clubs.restofworld, "Rest of World", NA
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)

soccer.preprocessed <- soccer.preprocessed[, c(1:6, 81, 7:80)]
View(head(soccer.preprocessed))

io_dir="D:/msc-ds/course-resource/data-visualization/project"
output_csv_name <- "soccer-preprocessed-with-club-nationality.csv"
output_csv <- file.path(io_dir, output_csv_name, fsep=.Platform$file.sep)
write.csv(
  x=soccer.preprocessed,
  file=output_csv,
  fileEncoding="UTF-8",
  row.names=FALSE
)

names(soccer.preprocessed)
