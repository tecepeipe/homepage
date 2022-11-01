@echo off
c:
cd "C:\Users\user\Documents\Home Page\Plex-Export"
::start /b "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
::sleep 2s
::to get token, get media info, click View as XML and extract from URL
php\php cli.php -sections="TV Series","TV Shows",Moviez,"Moviez 3D","Moviez Ultra HD",Animes,Cartoons -token=mXEZK8s_sHxVyysWDjMB

rclone sync --transfers 15 "C:\Users\user\Documents\Home Page\Plex-Export\plex-data" gdrive-bundle:"Home Page/Plex-Export/plex-data" --progress --stats-one-line
if exist e:\Documentos rclone sync --transfers 2  "C:\Users\User\Documents\Home Page\Plex-Export\plex-data" "E:/Home Page/Plex-Export/plex-data" --progress --stats-one-line --size-only
rclone sync "C:\Users\User\Documents\Home Page" gdrive-bundle:"Home Page" -P --size-only --exclude git/** --exclude .git/**  --exclude Plex-Export/php/**

cd C:\Users\User\Documents\Bundle\
for %%a in (Resume.docx "Resume NG.pdf") do (
  copy /y %%a "C:\Users\User\Documents\Home Page\"
  if exist e:\Documentos copy /y %%a "E:\Home Page\" 
)

cd "C:\Users\User\Documents\Home Page"
::git clone https://github.com/tecepeipe/tecepeipe
::git init .
::git remote add tecepeipe https://github.com/tecepeipe/tecepeipe

::git pull tecepeipe master
git\bin\git add --all
git\bin\git commit -m "another plex export update"
git\bin\git push -u tecepeipe master
