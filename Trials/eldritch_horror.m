% Created by Rajeev Rajendran
% 3rd August 2015
% Modified 22 May 2016

function eldritch_horror (n) % n=number of players
rng('shuffle')
ao=randperm(8,1); % select ancient one
% x=randperm(10,1); % select ancient one
rng('shuffle')
ply=randperm(24,3*n); % select players
% y=randperm(32,3*n); % select players
rng('shuffle')
prl=randperm(12,1); % select prelude card
% z=randperm(18,1); % select prelude card

AO={'Azathoth The Daemon Sultan',...
    'Cthulhu The madness from the sea',...
    'Ithaqua The Wind-Walker',...
    'Rise of the Elder Things The Once-Dominant species',...
    'Shub-Niggurath The Black Goat of the woods',...
    'Syzygy The Cosmic alignment',...
    'Yig The father of Serpents',...
    'Yog-Sothoth The lurker at the threshold'};

AOsetup={'Place one eldritch token on the green space of the omen track',... % Azatoth
    'Set aside 1 Deep One, 1 Star Spawn monsters and special encounter cards',... % Cthulhu
    'Set aside 1 Gnoph-keh, 1 Wendigo monsters and special encounter cards',... % Ithaqua
    'Set aside special encounter cards and Antarctica sideboard',... % Rise of the Elder Things
    'Set aside 2 Ghoul, 2 Goat Spawn and 1 Dark Young monsters',... % Shub-Niggurath
    'Set aside special encounter cards and Mystic Ruins deck',... % Syzygy
    'Set aside 6 Cultists, 1 Serpent People monsters and special encounter cards',... % Yig
    'Set aside special encounter cards'}; % Yog-Sothoth

Investigators={'Agnes Baker The Waitress','Akachi Onyele The Shaman',...
    'Charlie Kane The Politician','Daisy Walker The Librarian',...
    'Diana Stanley The Redeemed Cultist','Finn Edwards The Bootlegger',...
    'George Barnaby The Lawyer','Jacqueline Fine The Psychic',...
    'Jim Culver The Musician','Leo Anderson The Expedition leader',...
    'Lily Chen The Martial artist','Lola Hayes The Actress',...
    'Marie Lambeau The Entertainer','Mark Harrigan The Soldier',...
    'Norman Withers The Astronomer','Patrice Hathaway The Violinist',...
    'Silas Marsh The Sailor','Skids OToole The Ex-Convict',...
    'Tommy Muldoon The Rookie Cop','Tony Morgan The Bounty Hunter',...
    'Trish Scarborough The Spy','Ursula Downs The Explorer',...
    'Wilson Richards The Handyman','Zoey Samaras The Chef'};

Plsetup={'London UK, Profane Tome asset, 1 Storm of Spirits spell',... Agnes Baker
    'South Africa (space 15), Mists of Releh spell, 1 Clue',... % Akachi Onyele
    'San Francisco USA, Personal Assistant asset',... % Charlie Kane
    'Istanbul Turkey, Old Journal unique asset, 1 Arcane Insight spell',... % Daisy Walker
    'Central America (space 7), Arcane Manuscripts asset, 1 Wither spell',... % Diana Stanley
    'American Metropolis (space 5), Cat Burgler asset, Whiskey asset, Courier Run unique asset',... % Finn Edwards
    'Urban India (space 17), Investment asset, Pocket Watch asset',... % George Barnaby
    'American Heartland (space 5), Flesh Ward spell, 1 Clue',... % Jacqueline Fine
    'Deep South (space 6), Shriveling spell, 1 Clue',... % Jim Culver
    'Buenos Aires Argentina, Hired Muscle asset',... % Leo Anderson
    'Shanghai China, Protective Amulet asset, Lucky Rabbit''s foot asset',... % Lily Chen
    'Tokyo Japan, .18 Derringer asset, Improve 1 skill',... % Lola Hayes
    'South East Asia (space 20), Ritual Dagger asset, Voice of Ra spell',... % Marie Lambeau
    'Northern Europe (space 14), .38 Revolver asset, Kerosene asset',... % Mark Harrigan
    'Arkham USA, Feed the Mind spell',... % Norman Withers
    'Sydney Australia, Banishment spell, 1 Clue',... % Patrice Hathaway
    'Sydney Australia, Fishing Net asset',... % Silas Marsh
    'Buenos Aires Argentina, Axe asset',... % Skids OToole
    'Alaskan coast (space 1), Carbine Rifle asset, Improve Will',... % Tommy Muldoon
    'Bogota Columbia (space 7), Handcuffs asset, Mists of Releh spell, 1 Clue',... % Tony Morgan
    'Central Russia (space 16), .45 Automatic asset',... % Trish Scarborough
    'The Heart of Africa, Mineralogy asset, Improve 1 skill',... % Ursula Downs
    'Arkham USA, Blunderbuss asset',... % Wilson Richards
    'Rome Italy, Holy Cross asset'}; % Zoey Samaras

Prelude={'Beginning of the end','Blank','Blank with Antarctica','Dark blessings',...
    'Doomsayer from Antarctica','In Cosmic alignment','Key to salvation'...
    'Rumors from the North','The coming storm','The Dunwitch horror',...
    'Ultimate Sacrifice','Unwilling Sacrifice'};
% Pldconditions ={'',... % Beginning of the end
%     '',... % Blank
%     '',... % Blank with Antarctica
%     '',... % Dark blessings
%     '',... % Doomsayer from Antarctica
%     '',... % In Cosmic alignment
%     '',... % Key to salvation
%     '',... % Rumors from the North
%     'After resolving setup, advance omen by 1, Spawn gate and Monster surge' ...
%     'Then starting with lead investigator each player resolves two effects of his choice'...
%     '',...
%     '',... % The Dunwitch horror
%     '',... % Ultimate Sacrifice
%     ''}; % Unwilling Sacrifice

% C={'Beginning of the end','Blank','Blank with Antarctica','Call of Cthulhu','Dark blessings',...
%     'Doomsayer from Antarctica','Epidemic','In Cosmic alignment','Key to salvation'...
%     'Litany of secrets','Rumors from the North','The coming storm','The Dunwitch horror',...
%     'Ultimate Sacrifice','Under the pyramids','Unwilling Sacrifice'};

for i=1:3*n
    Players(i)= Investigators(ply(i));
end
for i=1:n
    Plasset(i)= Plsetup(ply(i));
end

disp(' ')
disp(['Ancient One is ',char(AO(ao))]);
disp(char(AOsetup(ao)));
disp(' ')
disp(['Lead investigator is ',char(Players(1))]);
disp(char(Plasset(1)));
disp(' ')
disp('Other investigators are ')
disp(' ')
 for j=2:n
     disp(char(Players(j)));
     disp(char(Plasset(j)));
     disp(' ')
 end
disp('Backup investigators are ')
disp(' ')
 for k=n+1:3*n
     disp(char(Players(k)));
 end
disp(' ')
disp(['Select prelude card ',char(Prelude(prl))]);
% disp(char(Pldconditions(prl)));

