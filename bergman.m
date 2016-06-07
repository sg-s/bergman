%% bergman.m
% 

classdef bergman < handle
	properties
		v % videoinput object
        file_name
        file_handle
		
	end

	methods
		function b = bergman() % constructor
			b.v = videoinput('pointgrey');
			b.v.FramesAcquiredFcnCount = 1;
			b.v.FramesAcquiredFcn = @b.lowLevelStreamer;
            
            % generate a file name
            b.file_name = [randomString(10) '_movie.bergman'];
            
		end % end constructor function
        
        function b = set.file_name(b,value)
            b.file_name = value;
            
            % open the file for writing
            b.file_handle = fopen(b.file_name,'W');
        end

        function b = start(b)
        	start(b.v);
        end

        function b = stop(b)
        	stop(b.v)
        end
        
        function lowLevelStreamer(b,vid,event)
            datestr(now)
            vid.FramesAcquired
            
            % grab current frame
            current_frame = peekdata(vid,1);
            current_frame = current_frame(:);
            
            % and write it to disk
            fwrite(b.file_handle,current_frame(:),'uint8');
            
            % flush data
            flushdata(vid);
        end


	end % end methods


end % end classdef