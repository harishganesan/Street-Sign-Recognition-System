import os
from shutil import copyfile

data_directories = ['/Users/danielemanuelpuleio/Downloads/signDatabasePublicFramesOnly/aiua120214-0/frameAnnotations-DataLog02142012_external_camera.avi_annotations',
'/Users/danielemanuelpuleio/Downloads/signDatabasePublicFramesOnly/aiua120214-1/frameAnnotations-DataLog02142012_001_external_camera.avi_annotations',
'/Users/danielemanuelpuleio/Downloads/signDatabasePublicFramesOnly/aiua120214-2/frameAnnotations-DataLog02142012_002_external_camera.avi_annotations',
'/Users/danielemanuelpuleio/Downloads/signDatabasePublicFramesOnly/aiua120306-0/frameAnnotations-DataLog02142012_002_external_camera.avi_annotations',
'/Users/danielemanuelpuleio/Downloads/signDatabasePublicFramesOnly/aiua120306-1/frameAnnotations-DataLog02142012_003_external_camera.avi_annotations']

stop_signs = '/Users/danielemanuelpuleio/Desktop/stop_signs'
ped_cross = '/Users/danielemanuelpuleio/Desktop/ped_cross'
sig_ahead = '/Users/danielemanuelpuleio/Desktop/sig_ahead'
keep_right = '/Users/danielemanuelpuleio/Desktop/keep_right'
added_lane = '/Users/danielemanuelpuleio/Desktop/added_lane'

for directory in data_directories:
	for filename in os.listdir(directory):
	    if "stop_" in filename: 
	    	if not os.path.exists(stop_signs):
    			os.makedirs(stop_signs)
	        copyfile(os.path.join(directory, filename), os.path.join(stop_signs, filename))
	    elif "pedestrianCrossing" in filename:
	    	if not os.path.exists(ped_cross):
    			os.makedirs(ped_cross)
	        copyfile(os.path.join(directory, filename), os.path.join(ped_cross, filename))
	    elif "signalAhead" in filename:
	    	if not os.path.exists(sig_ahead):
    			os.makedirs(sig_ahead)
	        copyfile(os.path.join(directory, filename), os.path.join(sig_ahead, filename))
	    elif "keepRight" in filename:
	    	if not os.path.exists(keep_right):
    			os.makedirs(keep_right)
	        copyfile(os.path.join(directory, filename), os.path.join(keep_right, filename))
	    elif "addedLane" in filename:
	    	if not os.path.exists(added_lane):
    			os.makedirs(added_lane)
	        copyfile(os.path.join(directory, filename), os.path.join(added_lane, filename))








