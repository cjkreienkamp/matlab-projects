classdef Student < Person

properties(GetAccess='private',SetAccess='private')
 studentId;
 university;
 end

 methods
 function obj = setUniversity(obj, uni)
 obj.university = uni;
 end
 function obj = setSid(obj, sId)
 obj.studentId = sId;
 end
 function SID = getSid(obj)
 SID= obj.studentId;
 end
 function uni = getUniversity(obj)
 uni = obj.university;
 end
 end

end %End of classdef