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
### ブラウザgithub上での操作
github.com フォーク先アカウントで、
フォーク元/project-angularページからforkする。
フォーク先にリポジトリが追加されるので、
projectにrename

### cloneと初期設定
hub clone フォーク元/project.git project

git config --local user.name 'Keiji Kobayashi'
git config --local user.email 'keiji@seeknetusa.com'
git config --local merge.ff false

hub fork

git remote set-url keiji-seeknetusa \
git@github.com-keiji-seeknetusa:フォーク先/project.git

git remote rename origin upstream
git remote rename keiji-seeknetusa origin

git checkout -b develop upstream/develop

git flow init -d

### 作業用ブランチの作成とファイルの編集
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

git flow feature publish pull-request-test

### pull-requestを出し承認
hub pull-request -b develop -h feature/pull-request-test

ブラウザで
pull-requestを承認

cd もとのローカルリポジトリ
git pull origin develop

### upstreamを反映
cd ~/projects/フォーク先/project
git fetch upstream

もしpull-request以外のアップデートがあれば…
git checkout develop
git rebase upstream/develop
(mergeだとfork先のコミットが進んでしまう)

git pull
git push -f origin --all

### 編集用ブランチを削除
git branch -d feature/pull-request-test
git push origin :feature/pull-request-test
