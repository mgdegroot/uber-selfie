#uber-selfie

Project Uber-selfie

Na een paar uurtjes experimenteren met een Ubertooth dongle gecombineerd met een WiFi signaal scan miste er toch nog wat. Dus even verder prutsen om een ideetje uit te werken: De Uber-stick:
 
Zoals waarschijnlijk wel bekend is de selfie-stick het perfecte middel om jezelf voor schut te zetten.

De Uber-stick breidt de al aanwezige mogelijkheden van de selfie-stick wat uit, hieronder de beschrijving:

Voor het gemak heb ik het geheel verdeeld in twee componenten: het P-blok en het S-blok.

S(ensor)-blok:
Voor nu bestaande uit 
– de WiFi antennes gekoppeld aan de Athereos stick,
– de Uberstick
– een GPS antenne.
Middels USB is het S-blok te koppelen aan het P-blok (of eventueel direct aansluiten op een normale computer). 
Omdat de sensoren op afstand zitten zou de interferentie minder moeten zijn. Ook is het eenvoudiger om de antennes gericht te maken zodat op basis van SNR naar een signaal ‘toe gelopen’ kan worden. Een ander voordeel is dat het sensor blok makkelijker in moeilijk bereikbare plaatsen (b.v. gaten waar de zon nooit schijnt) te duwen is.

P(rocessing)-blok:
Centraal een Beaglebone Black, een al wat ouder bordje met een ARM Cortex-A8 cpu, een EMMC, sdkaart slot, een ethernet poort en twee USB 2.0 aansluitingen.  
Hieraan met duckt-tape  (http://mentalfloss.com/article/52151/it-duck-tape-or-duct-tape) bevestigd een powered USB 2.0 hub en een U-Blox unit. Enige externe afhankelijkheid is een 5V voeding met genoeg vermogen voor alle accessoires.

Op de Beaglebone draait Debian voor ARM, met als hoofdapplicatie Kismet. Kismet gebruikt de ubertooth en de spectools (spectrum analyser) plugins. Via GPSD wordt de locatie gekoppeld aan de meting.

De volgende signalen worden nu opgepikt:
– WiFi (2.4 / 5 GHz)
– Bluetooth (inc. BTLE)

Er kan verbinding gemaakt worden via ethernet (kabel) of usb  over TCP/IP.

Gebruik:
De uberstick kent twee operatie-modi: automatisch en interactief.

Automatisch: 
Zodra er spanning geleverd wordt start de Beaglebone op en wordt een Tmux sessie gestart. In deze sessie start Kismet op en begint met scannen. De resultaten worden opgeslagen, inclusief PCap’s.

(De beaglebone heeft ook drie hardware knoppen. Hiermee kan ook nog eea ingeregeld worden. Ook een aantal LEDs kunnen gebruikt worden om een status visueel weer te geven. Op deze manier kan iemand zonder technische kennis toch gebruik maken van de uberstick).

Interactief: 
Via het netwerk (ethernet of usb) wordt ingelogd en de Tmux sessie overgenomen. Kismet (en alle overige tools, bv Aircrack-ng, nmap, tcpdump, etc) kunnen normaal gebruikt worden.

Achteraf of tussendoor kunnen alle verzamelde bestanden overgehaald worden met een webbrowser of offline door ze van de sdkaart te kopieren. Naast de ruwe captures maakt een script elk interval van de aanwezige bestanden een kml bestand. Dit kan direct in een GIS (of simpelweg Google Earth) geladen worden om de metingen visueel weer te geven.

Kosten:
Deze setup is redelijk goedkoop, en kan nog goedkoper door ipv de ubertooth een generieke bluetooth dongle te gebruiken. De beaglebone kan ook vervangen worden door een Raspberry Pi. Voor rond de 100Eur moet zo een compleet scan-platform te realiseren zijn.
