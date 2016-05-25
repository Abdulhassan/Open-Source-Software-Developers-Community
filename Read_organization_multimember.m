%%-------------- This program extract user logine name in an organization files
% ---------------Input: a text file that represent organization information (organizations name users of that organization) or an array of organizations file (Array A
%%---------------- Output File that have the names of all user in that organization

%% -------------- Read any file using the open text box  
% [f1 ,p]=uigetfile(); f=strcat(p,f1); f1=(fopenf,'r'); % Read using  open file box  to locate the inpout file
% f1=fopen('C:\Users\Mustafa\Desktop\software mohammad\facebook.txt','r');   % Otherway of direct define file if path is known
%% -------------------------specify deestination file where the login name should be save f2 is the one here-------- 
f2=fopen('C:\Users\Mustafa\Desktop\software mohammad\Organizations_login.txt', 'wt+');
%A=char('microsoft1.txt','microsoft2.txt','microsoft3.txt','microsoft4.txt','microsoft5.txt','microsoft6.txt','microsoft7.txt','microsoft8.txt','microsoft9.txt','microsoft10.txt','microsoft11.txt','microsoft12.txt','microsoft13.txt','microsoft14.txt','microsoft15.txt','microsoft16.txt','microsoft17.txt','microsoft18.txt','microsoft19.txt','microsoft20.txt','microsoft21.txt','microsoft22.txt','microsoft23.txt','microsoft24.txt','microsoft25.txt','microsoft26.txt','microsoft27.txt','microsoft28.txt','microsoft29.txt','microsoft30.txt','microsoft31.txt','microsoft32.txt','microsoft33.txt','microsoft34.txt','microsoft35.txt','microsoft36.txt','microsoft37.txt','microsoft38.txt','microsoft39.txt','microsoft40.txt','microsoft41.txt','microsoft42.txt','microsoft43.txt','microsoft44.txt','microsoft45.txt','microsoft46.txt','microsoft47.txt','microsoft48.txt','microsoft49.txt','microsoft50.txt','microsoft51.txt','microsoft52.txt','microsoft53.txt','microsoft54.txt','microsoft55.txt','microsoft56.txt','microsoft57.txt','microsoft58.txt','microsoft59.txt')
                                                        % if we have more than one file just need to make array of files
PPath='C:\Users\Mustafa\Documents\GitHub\'; 
% %% ------------------------------- Extract Information from file-------------------------------
Fil='organization';
extension='.txt'
for i=1:174
    filename=strcat(Fil,int2str(i));
    A1=strcat(filename,extension)
    f=strcat(PPath,A1);   % to get exited file name from the array of files 
    f1=fopen(f,'r');          % open each file to read information from 
    User=' ';
while ~feof(f1)
 C=fgets(f1);
 if ischar(C)                      % if the line is string (not new line or parthense or any special symbol
       U = strfind(C, '"login": ');    % locate where user name is (if at all)
             if isfinite(U) == 1             % if the world ("login: ") is there the isfinite function value will be 1
                      k=strfind(C,'"login": ');         % Determine location of the word ("login: ") with in the line
                      Name=textscan(C(k+10:end),'%s')   % Save the string following the "login:" word in  Name variable 
                      k=strfind(Name{1},'",')           % to optain only the user name we should find and cut the end of the line which  known from the present of ( ",)
                      BB=Name{1}{1};                    % conver cell to char 
                      User_Name=textscan(BB(1:k{1}-1),'%s');   % extract the user name in cell User_Name
                      User=User_Name{1}{1} ;            % convert cell to char to place it in file 
                      fprintf(f2,'%s',User);
                      fprintf(f2,'%s\n',' ');
          else
            continue;  
       end;
 end
%  fprintf(f2,'\n'); 
end
 fclose(f1);
end;
fclose('all');


%%-----------------Save to ext file--not required since we store infile immediatly ---------------------------------



