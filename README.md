# Rubocop体験アプリ（レビュワーにGiveを!!）

## 概要

インデントが揃っていなかったり、1つのメソッドに長い記載がされていると、コードレビューするのが苦労することがあります。


今回用意した`Rubocop体験アプリ`を使って、インデントを揃えることの大切さ、Rubocop(静的解析ツール)を活用することで得られるメリットなどを体験し、レビューする人に優しいコードの書き方を学んで、コードレビュワーにGiveしていきましょう！

---

## セットアップ

Ruby : 2.5.1

Rails : 5.2.6

```bash
$ git clone git@github.com:Tsuchiya2/experience_rubocop_app.git
$ cd experience_rubocop_app
$ git remote rm origin
$ git checkout -b give_code
$ rbenv local 2.5.1
$ gem install bundler -v 2.1.4
$ bundle install
$ bin/rails db:migrate
$ bin/rails db:seed
$ bin/rails s
```

サーバーを立ち上げて`http://localhost:3000/`にアクセスできればセットアップ完了です。

![root_page](/public/readme_images/root_page.jpg)

---

## 状況の確認＆注意事項

まずRubocopを使ってLintチェックしてみましょう。

※ 注意事項： **このアプリケーション内では`-a`オプションは付けないでください。**（Rubocopの方である程度自動で整えてしまうため）

```bash
$ bundle exec rubocop
```
![first_rubocop](/public/readme_images/first_rubocop.jpg)

`42 offenses detected` ← Rubocop のLintチェックに引っかかった数。内容はその表記の上にあるログに書かれています。

---

## 【課題１】 config/routes.rb の Lint チェック＆修正

全てを一度に解消しようとすると大変なので、まずはconfig/routes.rbから取り掛かりましょう。

まずはGitHubにアップされているコードを、レビュワーになったつもりで確認してください。

[config/routes.rb](https://github.com/Tsuchiya2/experience_rubocop_app/blob/main/config/routes.rb)

![routes](/public/readme_images/github-routes.jpg)

３行目の `%i[` 以降の部分が疎らにスペースが空いていて整っていないのが分かるかと思います。

このコード量だとあまり大変さが伝わりにくいと思いますが、数十行に及びこのような状態だとパッと見ただけでは`only`設定されている項目を把握するのも大変になってしまいます。

Rubocopを使うとどんなログが返ってくるのかを試してみて、表示されてログ内容を検索したりして、以下のコマンドを実行しても `offenses` が表示されない状態に修正してください。（ `no offenses` と表示される状態にしてください）

```bash
$ bundle exec rubocop config/routes.rb
```

![config_routes](/public/readme_images/config_routes.jpg)

---

## 【課題２】 app/controllers/posts_controller.rb

続いて app/controllers/posts_controller.rb を見てみましょう。

[app/controllers/posts_controller.rb](https://github.com/Tsuchiya2/experience_rubocop_app/blob/main/app/controllers/posts_controller.rb)

![GitHub_posts_controller](/public/readme_images/github-posts_controller.jpg)

上記を見た際にどう感じたでしょうか？

所々変な箇所があったりして、「ん？」と思ったのではないでしょうか。

課題１と同様に以下のコマンドでRubocopを実行して修正を行い、出来上がったコードと上記を見比べてみましょう。

```bash
$ bundle exec rubocop app/controllers/posts_controller.rb
```

![posts_controller](/public/readme_images/posts_controller.jpg)

---

## 【課題３】 app/controllers/change_posts_controller.rb

課題３からは課題１･２と異なり、やや難しいかもしれません。ヒントになるような記載をコメントアウトしていますので、適宜利用してRubocopのチェックが `no offenses` となるように修正してみましょう。

[app/controllers/change_posts_controller.rb](https://github.com/Tsuchiya2/experience_rubocop_app/blob/main/app/controllers/change_posts_controller.rb)

![GitHub_change_posts_controller](/public/readme_images/github-change_posts_controller.jpg)

```bash
$ bundle exec rubocop app/controllers/change_posts_controller.rb
```

![change_posts_controller](/public/readme_images/change_posts_controller.jpg)

---

## 【課題４】 app/models/post.rb

課題４で修正した記載ですが、ロジックに関する記述がControllerに書かれており、望ましい状態ではありません。また、このまま他のアクションを追加実装していくと `Fat Controller` にも成りかねません。ロジック部分をModelへ移行して `Fat Controller` を解消しましょう。

こちらも課題３と同様にやや難しいかと思うので、同ファイルにヒントになるような記載をコメントアウトで用意しておりますので適宜活用してください。

[app/models/post.rb](https://github.com/Tsuchiya2/experience_rubocop_app/blob/main/app/models/post.rb)

```bash
$ bundle exec rubocop app/models/post.rb
```

上記まで修正ができれば `bundle exec rubocop` を実行しても `no offenses` と表示されるかと思います。

---

## 最後に

いかがでしたでしょうか？普段カリキュラムに取り組んでいる際は現役エンジニアの方々が書かれたコードや解答例に触れることが多いので、大なり小なり戸惑いもあったかもしれません。

今回用意したインデント崩れなどは、ルーティングやコントローラーの限られた部分にしか用意できませんでしたが、ビューファイルでも同様のインデント崩れは散見されるので、注意する癖、レビュワーに読みやすいコードになっているかに気を配ってあげると、良い `Give` になるかと思います。


最後まで取り組んでいただき、ありがとうございました🐱🐾
