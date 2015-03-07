# project-angular


## git
------------------------------------------------------------
### github.com
1. ブラウザ上でfork
1. 必要があればsettingでrename

### cloneと初期設定
1. hub clone upstream-account/project.git project
1. cd project
1. config

```
  git config --local user.name 'Keiji Kobayashi'
  git config --local user.email 'keiji@seeknetusa.com'
  git config --local merge.ff false
```

1. hub fork
1. git remote set-url keiji-seeknetusa git@github.com-keiji-seeknetusa:my-account/project.git
1. remoteをrename

```
git remote rename origin upstream
git remote rename keiji-seeknetusa origin
```

1. git checkout -b develop upstream/develop
1. git flow init -d

### pull-requestを出す
1. git flow feature start pull-request-test
1. git branch -rで確認。以下の5つになってればOK

```
origin/develop
origin/master
upstream/HEAD -> upstream/master
upstream/develop
upstream/master
```

1. ファイルを編集
1. git flow feature publish pull-request-test
1. hub pull-request -b develop -h feature/pull-request-test
1. ブラウザでpull-requestを承認

### pull-requestを取り込む
1. fork元のローカルリポジトリに移動
1. git fetch origin
1. git checkout develop
1. git rebase origin/develop
1. git push -f origin --all

### upstreamを反映
1. fork先のローカルリポジトリに移動
1. git fetch upstream
1. git checkout develop
1. git rebase upstream/develop
1. git push -f origin --all

### 編集用ブランチを削除
git branch -d feature/pull-request-test
git push origin :feature/pull-request-test


## vagrant
------------------------------------------------------------
1. rm -fr coreos
1. hub clone coreos/coreos-vagrant coreos
1. mv config.rb.sample config.rb
1. mv user-data.sample user-data
1. Vagrantfileを編集 

```
  80 -> 8080
  443 -> 3443
  3306 -> 3306
  ../ -> /home/core/share
  $instance_name_prefix をプロジェクト名
```

1. vagrant up


## apps
------------------------------------------------------------
必要なファイルを作成・またはコピー
1. apps/sh - permissionを644に
1. apps/certs - これをコピーしないとnginxが立ち上がらない
1. apps/doc.anagift.com
1. apps/kibana.anagift.com
1. apps/www.anagift.com


## vagnratfiles
------------------------------------------------------------
必要なファイルを作成・またはコピー
kobabasu/dockerfilesをclone
詳細はdockerfilesのREADME.mdへ


## docker
------------------------------------------------------------
1. vagrant ssh
1. head -9 /home/core/share/dockerfiles/run | tail -1で確認
1. head -9 /home/core/share/dockerfiles/run | tail -1 | /bin/sh で実行
1. 以下のコンテナすべて起動する

* data-mysql
* data-log
* mysql
* redmine
* jenkins
* fluentd
* nginx

1. ブラウザで表示されるか確認


## aws側
------------------------------------------------------------
### instance作成
1. instanceをcoreosで作成
1. EBSを作成しattach

### docker
1. rsyncで/projectを/home/core/shareにコピー
1. /home/core/share/dockerfiles/runでコンテナをすべて作成

### apps
1. /home/core/share/appsに以下のデータをコピー

   * www.anagift.com
   * doc.anagift.com
   * kibana.anagift.com
   * sh
   * backup

1. shを644, backupを755にパーミッションを変更
1. アクセスし問題ないかを確認 


## todos
------------------------------------------------------------
* kibana4に移行
