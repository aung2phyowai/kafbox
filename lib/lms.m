% Least Mean Squares algorithm
%
% From A. H. Sayed, "Fundamentals of adaptive filtering}", Wiley-IEEE
% Press, 2003, Chapter 5.
%
% This file is part of the Kernel Adaptive Filtering Toolbox for Matlab.
% http://sourceforge.net/projects/kafbox/

classdef lms
    
    properties (GetAccess = 'public', SetAccess = 'private')
        mu = 0.001; % learning rate
    end
    
    properties (GetAccess = 'public', SetAccess = 'private')
        w = []; % filter coefficients
    end
    
    methods
        
        function obj = lms(parameters) % constructor
            if (nargin > 0)
                obj.mu = parameters.mu;
            end
        end
        
        function y_est = evaluate(obj,x) % evaluate the algorithm
            if numel(obj.w)>0
                y_est = x*obj.w;
            else
                y_est = 0;
            end
        end
        
        function obj = train(obj,x,y) % train the algorithm
            if numel(obj.w)==0, % initialize
                obj.w = zeros(length(x),1);
            end

            % Algorithm 5.2.1 in reference
            err = y - x*obj.w;
            obj.w = obj.w + obj.mu*x'*err;
        end
        
    end
end
