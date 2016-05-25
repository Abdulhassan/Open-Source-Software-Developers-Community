function [BB,chk]=Extract_String(B1,Name)%,n)  % Return string BB to main program BB=Extract_string(X)
                          n=2; 
                          chk=strfind(Name{1}{n},'",')
                          C1=Name{1}{n}
                          while isempty(chk)
                             name1=Name{1}{n};
                             BB=strcat(B1,name1);
                             n=n+1;
                             chk=strfind(Name{1}{n},',');
                             BB=strcat(BB,' ');
                          end
                        if isempty(C1(1:chk-1))
                          return;
                        else
                          C1=Name{1}{n};
                          n1=textscan(C1(1:chk-1),'%s')
                          name1=n1{1}{1};
                          BB=strcat(B1,name1);% conver cell to char 
                        end
                          

end