import shutil
import os

# Take index.html and copy it to each of the lesson folders. index.html itself is only a template.
for fileName in os.listdir('lessons'):
    if os.path.isdir(fileName):
        print fileName
        shutil.copy2('index.html', fileName + '/index.html')

shutil.copy2('../Export/flash/bin/StenoPlatformer.swf', 'StenoPlatformer.swf')
