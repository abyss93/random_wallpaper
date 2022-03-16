# random_wallpaper.sh
This script can be added to the user's CRON to randomly change desktop wallpaper given a directory path.

example of a 5-minutes cron:

```
# Random wallpaper from /home/lorenzo/Immagini/Sfondi
*/5 * * * * /home/lorenzo/Documenti/projects/random_wallpaper.sh /home/lorenzo/Immagini/Sfondi
```

Tested on Ubuntu 20.04 LTS
