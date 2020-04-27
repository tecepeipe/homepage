@echo off
c:
cd "C:\Users\fabricio\Documents\Home Page\Plex-Export"
"C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
::duration 4500 sec (1h:30m)
::to get token, get media info, click View as XML and extract from URL
php\php cli.php -sections="TV Series",Moviez,"Moviez 3D","Moviez Ultra HD",Animes,Cartoons -token=uPsjdxSwaJdMzrT6Uq2a


::delete and then upload data.js again to dropbox
rclone sync --transfers 20 "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" dropbox-homepage:Apps/paperplane.io/tecepeipe.paperplane.io/plex-export/plex-data --progress --stats-one-line
rclone sync --transfers 20 "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" onedrive-ubundle:"Home Page/Plex-Export/plex-data" --progress --stats-one-line
rclone sync --transfers 20 "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" onedrive-mbundle1:"Home Page/Plex-Export/plex-data" --progress --stats-one-line
rclone sync --transfers 20 "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" onedrive-mbundle2:"Home Page/Plex-Export/plex-data" --progress --stats-one-line
rclone sync --transfers 20 "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" gdrive-bundle:"Home Page/Plex-Export/plex-data" --progress --stats-one-line
rclone sync --transfers 1  "C:\Users\fabricio\Documents\Home Page\Plex-Export\plex-data" "E:/Home Page/Plex-Export/plex-data" --progress --stats-one-line



cd "C:\Users\fabricio\Documents\Home Page"
git\bin\git add --all
git\bin\git commit -m "another plex export update"
git\bin\git push -u tecepeipe master
