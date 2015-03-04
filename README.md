# project-angular

# instance再インストール
1. instanceを作成
2. EBSを作成しattach
3. rsyncで/projectを/home/core/shareにコピー
4. /home/core/share/dockerfiles/runでコンテナをすべてダウンロードと起動
5. /home/core/share/
     doc.anagift.com
     kibana.anagift.com
     sh
     backup
   をコピー
6. sh, backupをすべてchmod 777
7. アクセスしてみる

## todos
attributesの不具合

## install
github.com anagiftアカウントで、
レポジトリを'project'で作成

hub clone kobabasu/project.git project

git config --local user.name 'Keiji Kobayashi'
git config --local user.email 'keiji@seeknetusa.com'
git config --local merge.ff false
hub fork

git remote set-url keiji-seeknetusa \
git@github.com-keiji-seeknetusa:anagift/project.git

git remote rename origin upstream
git remote rename keiji-seeknetusa origin

git checkout -b develop upstream/develop

git flow init -d

git flow feature start pull-request-test

git branch -rで確認
origin/develop
origin/master
upstream/HEAD -> upstream/master
upstream/develop
upstream/master
の5つになってればOK

vim README.md
git add README.md
git commit -m '....'

git flow feature 

