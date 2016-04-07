# vagrant192

## 概要
ruby1.9.2-p320がインストールされたCentOS6仮想環境を自動的に作成する

## 操作
### ホストOS
1. Virtualboxをインストール `brew cask install vitualbox` など
2. Vagrantをインストール `brew cask install vagrant` など
3. `git clone git@github.com:kfsawada/vagrant192.git`
4. `cd vagrant192`
5. Railsなどport 3000を使っているアプリケーションを終了させておく
6. Vagrant起動 `vagrant up`
7. パスワードを求められたらホストOSのパスワードを入力
8. ひたすら待つ
9. 対象プロジェクトを `git clone` する。
11. ゲストOSにログイン。`vagrant ssh`

#### ゲストOS
1. 共有フォルダに移動 `cd sync`
2. Rails環境を整える `bundle install --path vendor/bundle` `bundle exec rake db:create` etc...
3. railsを起動 `bundle exec rails s -b 0.0.0.0`

#### ホストOS
1. ウェブブラウザから localhost:3000 にアクセス
2. HAPPY!

### Vagrantコマンド
- `vagrant up` ゲストOSを起動
- `vagrant ssh` ゲストOSにsshログイン
- `vagrant halt` ゲストOSをシャットダウン
- `vagrant reload` ゲストOSを再起動



参考サイト

[rbenv を利用した ruby のインストール中にエラーとなる場合の対応](http://qiita.com/kakipo/items/482b32b0c2ec0f9d113c)
