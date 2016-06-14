import shutil
import os

# Take index.html and copy it to each of the lesson folders. index.html itself is only a template.

print "Distributing lessons..."

all_the_lesson_dirs = ['lessons', 'lessons/fables', 'lessons/single-stroke-briefs']

for lessons_dir in all_the_lesson_dirs:

    print "lessons directory: " + lessons_dir

    for fileName in os.listdir(lessons_dir):
        lesson_path = os.path.join(lessons_dir, fileName)
        if os.path.isdir(lesson_path):
            print "copying template files into lesson: " + fileName
            shutil.copy2('assets/templates/index.html', lesson_path + '/index.html')

print "copying Flash file into assets/"
shutil.copy2('Export/flash/bin/StenoPlatformer.swf', 'assets/StenoPlatformer.swf')

statinfo = os.stat('assets/StenoPlatformer.swf')
print "Flash file size: %d" % (statinfo.st_size,)

if statinfo.st_size > 300000:
    print "Your Flash file has grown"
