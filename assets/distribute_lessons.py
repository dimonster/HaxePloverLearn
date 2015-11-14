import shutil
import os

# Take index.html and copy it to each of the lesson folders. index.html itself is only a template.

lessons_dir = 'lessons'
for fileName in os.listdir(lessons_dir):
    print fileName
    lesson_path = os.path.join(lessons_dir, fileName)
    if os.path.isdir(lesson_path):
        print fileName
        shutil.copy2('index.html', lesson_path + '/index.html')

shutil.copy2('../Export/flash/bin/StenoPlatformer.swf', 'StenoPlatformer.swf')
