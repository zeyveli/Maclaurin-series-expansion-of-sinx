
%% Taylor Expansion for sinus with given requirements

n = 8; %the significant figure number
Es = (0.5*10^(2-n)); %error tolarence per cent

%initials
x = 0.3*pi; 
i = 0; %iteration default

Ea = 100; %a default number for approximation error so that it is not smaller than Ea for the beginning iteration.

%calculating the first step beforehands for convenience in the loop, vector for listing later
result(i+1,1) = ((-1)^i)*(x^(2*i+1))/(factorial(2*i+1)); 

%taylor series expansion
while abs(Ea) >= Es 
    
    i = i+1;
    calculation = ((-1)^i)*(x^(2*i+1))/(factorial(2*i+1)); %new step calculation
    result(i+1,1) = result(i,1) + calculation; %finding the new result
    
    Ea = ((result(i+1,1) - result(i,1))/result(i+1,1))*100; %new approximation error
    Error_a(i,1) = Ea; %combining errors in a vector for easier table making for later
    
end

%% Table Properties

format long

Terms = transpose(1:i+1);
Results = result;
Approximation_Error = [NaN;Error_a];

T = table(Terms,Results,Approximation_Error);

T
