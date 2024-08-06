%Cinder Menu

function cinderGUI

% For changing prefs later
firstRun = 1;
changeChar = 0;
changePref = 0;
userID = 0;

%Initial Figure
fig = uifigure('Name','Cinder');
fig.Position = [680,678,340,480];
cText = uilabel(fig,'Position',[125,400,200,40]);
cText.FontSize = 30;
cText.Text = 'Cinder';
%Variable to track if past initial
i = 0;
    
%Initial State

    %Name and Age
    fText = uilabel(fig,'Text','First Name','Position',[70,300,200,22]);
    fName = uitextarea(fig,'Position',[70,280,200,22]);
    
    lText = uilabel(fig,'Text','Last Name','Position',[70,260,200,22]);
    lName = uitextarea(fig,'Position',[70,240,200,22]);

    aText = uilabel(fig,'Text','Age','Position',[70,220,200,22]);
    age = uieditfield(fig,'numeric','Position',[70,200,200,22]);

    %Submit Button
    sb = uicontrol(fig,'Style', 'push', 'String', 'Submit',...
        'Position', [70,152,200,22],'CallBack', @sbPush);
    
    %Characteristics State

    charac = uilabel(fig,'Position',[70,375,200,22],'visible','off');
    charac.Text = 'Please input your characteristics:';
    na = uilabel(fig,'Position',[70,358,200,22],'visible','off');
    na.Text = 'Put "N/A" if not applicable';

    heightText = uilabel(fig,'Text','Height (cm)','Position',[70,340,200,22],'visible','off');
    height = uieditfield(fig,'numeric','Position',[70,320,200,22],'visible','off');

    genderText = uilabel(fig,'Text','Gender','Position',[70,300,200,22],'visible','off');
    gender = uitextarea(fig,'Position',[70,280,200,22],'visible','off');

    hairColorText = uilabel(fig,'Text','Hair Color','Position',[70,260,200,22],'visible','off');
    hairColor = uitextarea(fig,'Position',[70,240,200,22],'visible','off');

    eyeColorText = uilabel(fig,'Text','Eye Color','Position',[70,220,200,22],'visible','off');
    eyeColor = uitextarea(fig,'Position',[70,200,200,22],'visible','off');

    favouriteMusicText = uilabel(fig,'Text','Favourite Music','Position',[70,180,200,22],'visible','off');
    favouriteMusic = uitextarea(fig,'Position',[70,160,200,22],'visible','off');

    favouriteArtistText = uilabel(fig,'Text','Favourite Artist','Position',[70,140,200,22],'visible','off');
    favouriteArtist = uitextarea(fig,'Position',[70,120,200,22],'visible','off');

    favouriteBookGenreText = uilabel(fig,'Text','Favourite Book Genre','Position',[70,100,200,22],'visible','off');
    favouriteBookGenre = uitextarea(fig,'Position',[70,80,200,22],'visible','off');

    favouriteBookText = uilabel(fig,'Text','Favourite Book','Position',[70,60,200,22],'visible','off');
    favouriteBook = uitextarea(fig,'Position',[70,40,200,22],'visible','off');

    sb2 = uicontrol(fig,'Style', 'push', 'String', 'Submit',...
        'Position', [70,10,200,22],'CallBack', @sbPush2,'visible','off');

    %Preferences State

    pref = uilabel(fig,'Position',[70,375,200,22],'visible','off');
    pref.Text = 'Please input your preferences:';

    lowestHeightText = uilabel(fig,'Text','Lowest height (cm)','Position',[70,340,200,22],'visible','off');
    matchHeight = uieditfield(fig,'numeric','Position',[70,320,200,22],'visible','off');

    matchGender = uitextarea(fig,'Position',[70,280,200,22],'visible','off');

    matchHairColor = uitextarea(fig,'Position',[70,240,200,22],'visible','off');

    matchEyeColor = uitextarea(fig,'Position',[70,200,200,22],'visible','off');

    matchFavouriteMusic = uitextarea(fig,'Position',[70,160,200,22],'visible','off');

    matchFavouriteBookGenre = uitextarea(fig,'Position',[70,120,200,22],'visible','off');

    matchAgeLText = uilabel(fig,'Text','Lowest age you would date','Position',[70,100,200,22],'visible','off');
    matchAgeL = uieditfield(fig,'numeric','Position',[70,80,200,22],'visible','off');

    matchAgeHText = uilabel(fig,'Text','Highest age you would date','Position',[70,60,200,22],'visible','off');
    matchAgeH = uieditfield(fig,'numeric','Position',[70,40,200,22],'visible','off');

    sb4 = uicontrol(fig,'Style', 'push', 'String', 'Submit',...
        'Position', [70,10,200,22],'CallBack', @sbPush4,'visible','off');


    
    %Menu State

    redoCharac = uicontrol(fig,'Style', 'push', 'String', 'Change characteristics',...
        'Position', [70,280,200,22],'CallBack', @sbPush,'visible','off');

    redoPref = uicontrol(fig,'Style', 'push', 'String', 'Change preferences',...
        'Position', [70,250,200,22],'CallBack', @sbPush2,'visible','off');

    match = uicontrol(fig,'Style', 'push', 'String', 'Scan for match!',...
        'Position', [70,220,200,22],'CallBack', @bMatch,'visible','off');

    %Match State

    function sbPush(hObj,event,handles)

        %Close if age is too low
        if age.Value < 18
            selection = uiconfirm(fig, 'You are not old enough for this application'...
                ,'Warning!','Icon','warning');
            switch selection
                case 'OK'
                    delete(fig)
                case 'Cancel'
                    delete(fig)
            end
        end
        found = 0;

        data = readtable('group project/User_DatabaseUser.xls');
        data2 = readtable('group project/User_DatabasePref.xls');
        
        for num = 1:length(data.Var1)
            if strcmp(data.Var1{num}, fName.Value{1}) && strcmp(data.Var2{num}, lName.Value{1})...
                    && data.Var3(num) == age.Value(1)
                userID = num;
                
                % Setting all the users data characteristics
                fName.Value = data.Var1(userID);
                lName.Value = data.Var2(userID);
                age.Value = data.Var3(userID);
                height.Value = data.Var4(userID);
                gender.Value = data.Var5(userID);
                hairColor.Value = data.Var6(userID);
                eyeColor.Value = data.Var7(userID);
                favouriteMusic.Value = data.Var8(userID);
                favouriteArtist.Value = data.Var9(userID);
                favouriteBookGenre.Value = data.Var10(userID);
                favouriteBook.Value = data.Var11(userID);

                % Setting all the users preferences
                matchHeight.Value = data2.Var1(userID);
                matchGender.Value = data2.Var2(userID);
                matchHairColor.Value = data2.Var3(userID);
                matchEyeColor.Value = data2.Var4(userID);
                matchFavouriteBookGenre.Value = data2.Var5(userID);
                matchFavouriteMusic.Value = data2.Var6(userID);
                matchAgeL.Value = data2.Var7(userID);
                matchAgeH.Value = data2.Var8(userID);
                
                
                % Updating some variables
                firstRun = 0;
                found = 1;
                break

            end
        end


        
        if found == 1 && i == 0
            i = i + 1;
            disableAll
            enableMenu
            selection = uiconfirm(fig, 'Welcome Back!','Registered User');
            switch selection
                case 'OK'
                case 'Cancel'
            end
        else
            disableAll   
            enableCharac
        end
        disp(fName.Value);
        disp(class(fName.Value));


    end

    function sbPush2(hObj,event,handles)
        disableAll
        enablePref

    end

    function sbPush4(hObj,event,handles)
        if firstRun == 1
            user = [fName.Value, lName.Value, age.Value, height.Value,...
            gender.Value, hairColor.Value, eyeColor.Value, ...
            favouriteMusic.Value, favouriteArtist.Value, ...
            favouriteBookGenre.Value, favouriteBook.Value];

            userPref = [matchHeight.Value, matchGender.Value, ...
                matchHairColor.Value, matchEyeColor.Value, ...
                matchFavouriteBookGenre.Value, matchFavouriteMusic.Value,...
                matchAgeL.Value, matchAgeH.Value];
    
            disp(user)
            disp(userPref)
    
            userID = size(readtable('group project/User_DatabaseUser.xls'));
            userID = userID(1) + 1;

            disp(userID)
            writecell(user, 'group project/User_DatabaseUser.xls', 'WriteMode','append')
            writecell(userPref, 'group project/User_DatabasePref.xls', 'WriteMode','append')
            firstRun = 0;
            
        elseif changeChar == 1
            disp("Chaging Char V2")
            
            range = "" + userID + ":" + userID;

            user = [fName.Value, lName.Value, age.Value, height.Value,...
            gender.Value, hairColor.Value, eyeColor.Value, ...
            favouriteMusic.Value, favouriteArtist.Value, ...
            favouriteBookGenre.Value, favouriteBook.Value];
            filename = 'group project/User_DatabaseUser.xls';
            writecell(user,filename,"Range", range)
            changeChar = 0;

        elseif changePref == 1
            disp("Chaging Pref V2")

            userPref = [matchHeight.Value, matchGender.Value, ...
                matchHairColor.Value, matchEyeColor.Value, ...
                matchFavouriteBookGenre.Value, matchFavouriteMusic.Value,...
                matchAgeL.Value, matchAgeH.Value];

            range = "" + userID + ":" + userID;
            filenamePref = 'group project/User_DatabasePref.xls';
            writecell(userPref,filenamePref,"Range", range)

            changePref = 0;
        end
            

        
        disableAll
        enableMenu
    end

    function bMatch(hObj,event,handles)
        numMatches = 0

        % Scan for everybody who matches eachothers MUST HAVE terms
        disp("Matching!")

        disp(userID)
        disp(matchHeight.Value)
        disp(matchGender.Value)
        disp(matchAgeH.Value + " - " + matchAgeL.Value)

        users = readtable('group project/User_DatabaseUser.xls');
        usersPref = readtable('group project/User_DatabasePref.xls');

        % HAS TO MATCH 3: Var1 (Min Height), Var2 (Gender pref), Var7 < age < Var8
        len = size(readtable('group project/User_DatabaseUser.xls'));
        len = len(1);
        disp(len);
        matchList = [];
        for person = 1:len
            if person ~= userID
                % Seeing if you meet there MAJOR 3 preferences
                if height.Value(1) >= usersPref.Var1(person) && ...
                        (strcmpi(gender.Value{1}, usersPref.Var2{person})...
                        || strcmpi(usersPref.Var2{person}, 'N/A')) &&...
                        ((usersPref.Var7(person) <= age.Value(1) && ...
                        age.Value(1) <=  usersPref.Var8(person)))

                    % Seeing if they meet your MAJOR 3 prefs
                    if matchHeight.Value(1) <= users.Var4(person) && ...
                        (strcmpi(matchGender.Value{1}, users.Var5{person})...
                        || strcmpi(matchGender.Value{1}, 'N/A')) &&...
                        ((users.Var3(person) >= matchAgeL.Value(1) && ...
                        matchAgeH.Value(1) >= users.Var3(person)))
                        
                        c = true;
                        numMatches = numMatches + 1;
                        matchPer = 75;
                        disp("MATCH")
                        disp(users(person,:))
                        disp(usersPref(person,:))
                        disp(person)

                        % Getting the percentage of match
                        if strcmpi(matchHairColor.Value{1}, 'N/A') ||...
                                strcmpi(matchHairColor.Value{1}, users.Var6{person})
                            matchPer = matchPer + 25;
                        end

                        if strcmpi(matchEyeColor.Value{1}, 'N/A') ||...
                                strcmpi(matchEyeColor.Value{1}, users.Var7{person})
                            matchPer = matchPer + 25;
                        end

                        if strcmpi(matchFavouriteMusic.Value{1}, 'N/A') ||...
                                strcmpi(matchFavouriteMusic.Value{1}, users.Var8{person})
                            matchPer = matchPer + 12.5;
                        end

                        if strcmpi(matchFavouriteBookGenre.Value{1}, 'N/A') ||...
                                strcmpi(matchFavouriteBookGenre.Value{1}, users.Var10{person})
                            matchPer = matchPer + 12.5;
                        end
                        
                        % Anything above 70% is good
                        matchPer = (matchPer / 150) * 100;
                        disp(matchPer)
                        matchList = [matchList, person];
                        
                    end

                end
            end
        end
        disp(matchList)
        disableAll
        disp(numMatches)
        if matchList > 0
            grabMatch(matchList(1), 1)
        else
            uiconfirm(fig, 'You have recived no matches.');
            disableAll
            enableMenu
        end

        function grabMatch(num, matchNum)

                %Match Buttons

                accept = uicontrol(fig,'Style', 'push', 'String', 'Accept',...
                'Position', [100,30,50,22],'CallBack', @bAccept,'visible','off');

                reject = uicontrol(fig,'Style', 'push', 'String', 'Reject',...
                'Position', [180,30,50,22],'CallBack', @bReject,'visible','off');

                    mfName = users.Var1(num);
                    mlName = users.Var2(num);
                    mAge = users.Var3(num);
                    mHeight = users.Var4(num);
                    mGender = users.Var5(num);
                    mHairColor = users.Var6(num);
                    mEyeColor = users.Var7(num);
                    mMusic = users.Var8(num);
                    mArtist = users.Var9(num);
                    mBookGenre = users.Var10(num);
                    mBook = users.Var11(num);
          

            disPercent = uilabel(fig,'Text',...
                "We found a match! ("+matchPer+"% Match)",...
                'Position',[70,300,200,22]);
            disName = uilabel(fig,'Text',mfName+" "+mlName,'Position',[70,280,200,22]);
            break1 = uilabel(fig,'Text',...
                '----------------------------------------------',...
                'Position',[70,260,200,22]);
            disGA = uilabel(fig,'Text',"Gender: "+mGender+"  | Age: "+mAge,...
                'Position',[70,240,200,22]);
            disHeight = uilabel(fig,'Text',"Height: "+mHeight+"cm",...
                'Position',[70,220,200,22]);
            disHE = uilabel(fig,'Text',...
                "Hair Color: "+mHairColor+" | Eye Color: "+mEyeColor,...
                'Position',[70,200,200,22]);
            break2 = uilabel(fig,'Text',...
                '----------------------------------------------',...
                'Position',[70,180,200,22]);
            disMU = uilabel(fig,'Text',"Favourite Music: "+mMusic,...
                'Position',[70,160,200,22]);
            disArt = uilabel(fig,'Text',"Favourite Artist: "+mArtist,...
                'Position',[70,140,200,22]);
            disBG = uilabel(fig,'Text',"Favourite Book Genre: "+mBookGenre,...
                'Position',[70,120,200,22]);
            disB = uilabel(fig,'Text',"Favourite Book: "+mBook,...
                'Position',[70,100,200,22]);
            break3 = uilabel(fig,'Text',...
                '----------------------------------------------',...
                'Position',[70,80,200,22]);
            request = uilabel(fig,'Text',"Do you accept this match?",...
                'Position',[70,60,200,22]);
            set(accept,'visible','on');
            set(reject,'visible','on');
    
                    
                    function bAccept(hObj,event,handles)
                        disableMatch
                        matchConfirm = uiconfirm(fig,...
                        'We have sent a request to your match!','Match Accepted!');
                        switch matchConfirm
                        case 'OK'
                        case 'Cancel'
                        end
                       
                        if length(matchList) >= matchNum + 1
                            grabMatch(matchList(matchNum + 1), matchNum + 1)
                        else
                            disableAll
                            enableMenu
                        end
                    end
                    
                    function bReject(hObj,event,handles)
                            disableMatch
                            if length(matchList) >= matchNum + 1
                                grabMatch(matchList(matchNum + 1), matchNum + 1)
                            else
                                disableAll
                                enableMenu
                            end
                    end
    
                    function disableMatch
                        set(disPercent,'visible','off');
                        set(disName,'visible','off');
                        set(break1,'visible','off');
                        set(disGA,'visible','off');
                        set(disHeight,'visible','off');
                        set(disHE,'visible','off');
                        set(break2,'visible','off');
                        set(disMU,'visible','off');
                        set(disArt,'visible','off');
                        set(disBG,'visible','off');
                        set(disB,'visible','off');
                        set(break3,'visible','off');
                        set(request,'visible','off');
                        set(accept,'visible','off');
                        set(reject,'visible','off');
                    end
    
        end

end
    
    function disableAll

        %Remove all    
        set(fText,'visible','off');
        set(fName,'visible','off');
        set(lText,'visible','off');
        set(lName,'visible','off');
        set(aText,'visible','off');
        set(age,'visible','off');
        set(charac,'visible','off');
        set(na,'visible','off');
        set(pref,'visible','off');
        set(heightText,'visible','off');
        set(height,'visible','off');
        set(matchHeight,'visible','off');
        set(genderText,'visible','off');
        set(gender,'visible','off');
        set(matchGender,'visible','off');
        set(hairColorText,'visible','off');
        set(hairColor,'visible','off');
        set(matchHairColor,'visible','off');
        set(eyeColorText,'visible','off');
        set(eyeColor,'visible','off');
        set(matchEyeColor,'visible','off');
        set(favouriteMusicText,'visible','off');
        set(favouriteMusic,'visible','off');
        set(matchFavouriteMusic,'visible','off');
        set(favouriteArtistText,'visible','off');
        set(favouriteArtist,'visible','off');
        set(favouriteBookGenreText,'visible','off');
        set(favouriteBookGenre,'visible','off');
        set(matchFavouriteBookGenre,'visible','off');
        set(favouriteBookText,'visible','off');
        set(favouriteBook,'visible','off');
        set(matchAgeLText,'visible','off');
        set(matchAgeL,'visible','off');
        set(matchAgeHText,'visible','off');
        set(matchAgeH,'visible','off');
        set(sb,'visible','off');
        set(sb2,'visible','off');
        set(sb4,'visible','off');
        set(redoCharac,'visible','off');
        set(redoPref,'visible','off');
        set(match,'visible','off');
        set(lowestHeightText,'visible','off');
    end

    function enableCharac

        %Enable characteristics
        set(charac,'visible','on');
        set(heightText,'visible','on');
        set(height,'visible','on');
        set(genderText,'visible','on');
        set(gender,'visible','on');
        set(hairColorText,'visible','on');
        set(hairColor,'visible','on');
        set(eyeColorText,'visible','on');
        set(eyeColor,'visible','on');
        set(favouriteMusicText,'visible','on');
        set(favouriteMusic,'visible','on');
        set(favouriteArtistText,'visible','on');
        set(favouriteArtist,'visible','on');
        set(favouriteBookGenreText,'visible','on','Position',[70,100,200,22]);
        set(favouriteBookGenre,'visible','on');
        set(favouriteBookText,'visible','on');
        set(favouriteBook,'visible','on');
        
        set(na,'visible','on');

        if i == 0
            set(sb2,'visible','on');
            i = i + 1;
        else
            set(sb4,'visible','on','Position', [70,10,200,22]);
        end
        if firstRun == 0
            changeChar = 1;
            disp("Changing Char")
        end
    end

    function enablePref
        set(pref,'visible','on');
        set(lowestHeightText,'visible','on');
        set(matchHeight,'visible','on');
        set(genderText,'visible','on');
        set(matchGender,'visible','on');
        set(hairColorText,'visible','on');
        set(matchHairColor,'visible','on');
        set(eyeColorText,'visible','on');
        set(matchEyeColor,'visible','on');
        set(favouriteMusicText,'visible','on');
        set(matchFavouriteMusic,'visible','on');        
        set(favouriteBookGenreText,'visible','on','Position',[70,140,200,22]);
        set(matchFavouriteBookGenre,'visible','on');
        set(matchAgeLText,'visible','on');
        set(matchAgeL,'visible','on');
        set(matchAgeHText,'visible','on');
        set(matchAgeH,'visible','on');
        set(sb4,'visible','on');
        set(na,'visible','on');

        if firstRun == 0
            changePref = 1;
            disp("Changing Pref")
        end
    end

    function enableMenu
        set(redoCharac,'visible','on');
        set(redoPref,'visible','on');
        set(match,'visible','on');
    end

end
