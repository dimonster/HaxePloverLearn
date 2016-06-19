import shutil
import os

print "copying Flash file into assets/"
shutil.copy2('Export/flash/bin/StenoPlatformer.swf', 'assets/StenoPlatformer.swf')

statinfo = os.stat('assets/StenoPlatformer.swf')
print "Flash file size: %d" % (statinfo.st_size,)

if statinfo.st_size > 300000:
    print "Your Flash file has grown"
