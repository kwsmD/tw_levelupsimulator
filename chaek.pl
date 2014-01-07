use strict;
use warnings;
use POSIX;


# charadeta

# ステータスの基本配列
my    @statuslist = ('level','pont','stab','hack','int','def','mr','dex','agi');


# @[キャラ名]_[タイプ]_[初期ステータスor初期ポイント]

# マキシミンデータ----------------------------------------------------------

# マキシ複合初期パラメータとポイント(ステータスの頭２つはレベルとポイントを記載)
my    @maximin_complex_status = (1,0,4,4,1,2,1,2,1);
my    @maximin_complex_point = (1,1,3,2,3,2,2);

# マキシ斬り初期パラメータとポイント
my    @maximin_sword_status = (1,0,3,5,1,2,1,2,1);
my    @maximin_sword_point = (2,1,3,2,3,1,2);

# マキシ魔法初期パラメータとポイント
my    @maximin_magic_status = (1,0,2,4,2,2,2,2,1);
my    @maximin_magic_point = (3,1,2,3,2,1,2);

# ----------------------------------------------------------


# 使用キャラの指定_後で指定できるようにする
# マキシミン・斬りステ指定(強制)
 my @character =  @maximin_complex_status;
 my @charapoint=  @maximin_sword_point;
 my $defapoint;
 my $needpoint;



# 初期必要POINT +［（ステ値 × 5 ）＋ LV ］÷ 125

# 必要 POINT 計算式(配列形式)
#   $needpoint[2]   =   @charapoint[0] + ( (@character[2] * 5 ) + $level ) % 125
#   $needpoint[3]   =   @charapoint[1] + ( (@character[3] * 5 ) + $level ) % 125
#   $needpoint[4]   =   @charapoint[2] + ( (@character[4] * 5 ) + $level ) % 125
#   $needpoint[5]   =   @charapoint[3] + ( (@character[5] * 5 ) + $level ) % 125
#   $needpoint[6]   =   @charapoint[4] + ( (@character[6] * 5 ) + $level ) % 125
#   $needpoint[7]   =   @charapoint[5] + ( (@character[7] * 5 ) + $level ) % 125
#   $needpoint[8]   =   @charapoint[6] + ( (@character[8] * 5 ) + $level ) % 125


for my $i(1..255){

#    my $levelup = <STDIN>;
    my $levelup = 1;

    if( $levelup == 1){

        if( $character[0] < 6){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 2;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは仮に$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";

                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] + int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);
                 }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";
        }


        elsif( $character[0] < 22){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 3;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";

                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);
                }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";

        }

        elsif( $character[0] < 48){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 4;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";
   
                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);

            }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";

        }

        elsif( $character[0] < 80){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 5;
             # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";

                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);
            }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";

        }

        elsif( $character[0] < 129){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 6   ;
               # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";

                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                       $character[3] = $character[3] +     int( $character[1] / $needpoint);
                       $character[1] =  ( $character[1] - $needpoint);
            }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";
        }

        elsif( $character[0] < 175){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 7;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";

                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);
            }
              print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";
        }

        elsif( $character[0] < 235){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 8;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";
  
                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);
                        $character[1] =  ( $character[1] - $needpoint);
            }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";

        }

        elsif( $character[0] < 255){
            $character[0] = $character[0] + 1;
            $character[1] = $character[1] + 9;
            # レベルアップ処理とポイントの付与処理

            $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);
            # ステータスアップの必要ポイント計算(ここでは$character[3]=hack)を直接入れている
            print "needpoint:","$needpoint\n";
                if( $character[1] - $needpoint > 0 && $character[3] < 255){
                        $character[3] = $character[3] +     int( $character[1] / $needpoint);  
                        $character[1] =  ( $character[1] - $needpoint);
            }
               print "Level:"."$character[0]\n"."Point:"."$character[1]\n"."Hack:","$character[3]\n"."\n";
        }
    }

}

# 確認用
            print "Level:","$character[0]\n";
            print "Pont:","$character[1]\n";
            print "Stab:","$character[2]\n";
            print "Hack:","$character[3]\n";
            print "Int:","$character[4]\n";
            print "Def:","$character[5]\n";
            print "Mr:","$character[6]\n";
            print "Dex:","$character[7]\n";
            print "Agi:","$character[8]\n";
            print "$needpoint\n";
