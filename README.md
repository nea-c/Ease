# Ease

ベジェ曲線等で数値変動を可能にするライブラリデータパック。

## 最新

v1.0

## 動作要件

MinecraftJE 1.19.4

## 使用方法

ease: in ストレージに以下のようなデータを入力してfunction実行
```mcfunction
## 例
data modify storage ease: in set value {tick:{x:50f,end:100f},bezier:[[1f,0f],[0f,1f]],value:{min:0f,max:100f}}
execute store result storage ease: in.tick.x float 1 run scoreboard players get <HOLDER> <OBJECTIVE>
function #ease:
```

### 設定項目

| 引数名 | 必須 | 型 | 説明 |
| -: | :-: | :-: | :- |
| tick.now | o | float | 経過時間 |
| tick.end | o | float | 終了時間 |
| bezier | - | Handle | float型のXY座標リストを2つ格納したリスト |
| bounce | - | float | 未実装 |
| elastic | - | float | 未実装 |
| value.min | o | float | tick.nowが0の時の最小値 |
| value.max | o | float | tick.nowがtick.endと同じときの最大値 |


## ライセンス

[MIT Licence](https://github.com/nea-c/Ease/blob/master/LICENSE)に基づく。

### 一部埋め込み
* [KMFloatOp](https://github.com/komaramune/KMFloatOp) ([MIT Lisence](https://github.com/komaramune/KMFloatOp/blob/main/LICENSE) Copyright (c) 2023 コマ)
  * displayでのfloat計算


## 更新履歴

* v1.0
  * 初版