%% CODE
classdef Person
    
    properties(GetAccess='private', SetAccess='private')
        name;
        ssn;
    end
    
    methods function obj = setName(obj, n)
            obj.name = n;
        end
        function obj = setSsn(obj, s)
            obj.ssn = s;
        end
        function SSN = getSsn(obj)
            SSN = obj.name;
        end
        function nm = getName(obj)
            nm = obj.name;
        end
        
        function printName(obj)
            disp(obj.name);
        end
    end
end % End of classdef