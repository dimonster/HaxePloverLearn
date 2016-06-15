import shutil
import os

# Take index.html and copy it to each of the lesson folders. index.html itself is only a template.

print "Distributing lessons..."

all_the_lesson_dirs = ['lessons', 'lessons/fables', 'lessons/single-stroke-briefs', 'lessons/hans-christian-andersen/the-bell','lessons/hans-christian-andersen/the-dream-of-little-tuk','lessons/hans-christian-andersen/the-elderbush','lessons/hans-christian-andersen/the-emperors-new-clothes','lessons/hans-christian-andersen/the-false-collar','lessons/hans-christian-andersen/the-fir-tree','lessons/hans-christian-andersen/the-happy-family','lessons/hans-christian-andersen/the-leap-frog','lessons/hans-christian-andersen/the-little-match-girl','lessons/hans-christian-andersen/the-naughty-boy','lessons/hans-christian-andersen/the-old-house','lessons/hans-christian-andersen/the-real-princess','lessons/hans-christian-andersen/the-red-shoes','lessons/hans-christian-andersen/the-shadow','lessons/hans-christian-andersen/the-shoes-of-fortune-i','lessons/hans-christian-andersen/the-shoes-of-fortune-ii','lessons/hans-christian-andersen/the-shoes-of-fortune-iii','lessons/hans-christian-andersen/the-shoes-of-fortune-iv','lessons/hans-christian-andersen/the-shoes-of-fortune-v','lessons/hans-christian-andersen/the-shoes-of-fortune-vi','lessons/hans-christian-andersen/the-snow-queen-fifth-story','lessons/hans-christian-andersen/the-snow-queen-first-story','lessons/hans-christian-andersen/the-snow-queen-fourth-story','lessons/hans-christian-andersen/the-snow-queen-second-story','lessons/hans-christian-andersen/the-snow-queen-seventh-story','lessons/hans-christian-andersen/the-snow-queen-sixth-story','lessons/hans-christian-andersen/the-snow-queen-third-story','lessons/hans-christian-andersen/the-story-of-a-mother','lessons/hans-christian-andersen/the-swineherd']

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
