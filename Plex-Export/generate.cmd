@echo off
c:
cd "C:\Users\user\Documents\Home Page\Plex-Export"
start /b "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
sleep 2s
::to get token, get media info, click View as XML and extract from URL
php\php cli.php -sections="TV Series",Moviez,"Moviez 3D","Moviez Ultra HD",Animes,Cartoons -token=uPsjdxSwaJdMzrT6Uq2a

rclone sync "C:\Users\User\Documents\Home Page" gdrive-bundle:"Home Page" -P --size-only --exclude git/** --exclude .git/**  --exclude Plex-Export/php/**
rclone sync --transfers 20 "C:\Users\user\Documents\Home Page\Plex-Export\plex-data" gdrive-bundle:"Home Page/Plex-Export/plex-data" --progress --stats-one-line

cd "C:\Users\user\Documents\Home Page"
git\bin\git add --all
git\bin\git commit -m "another plex export update"
git\bin\git push -u tecepeipe master
