# ぱけっととれーさーを Mac の XQuartz で動かそうの巻

## 使い方

1. XQuartz をインストールする
2. cisco から `Packet Tracer 7.2 for Linux 64 bit.tar.gz` をダウンロードする
3. Docker のイメージをビルドする
   ```
   docker build -t packet-tracer:7.2 .
   ```
4. packet Tracer を起動する
   ```
   sh run.sh
   ```
5. ワイワイする
