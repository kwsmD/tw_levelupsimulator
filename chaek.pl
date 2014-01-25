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
     my @charapoint=  @maximin_complex_point;
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

    # 先行設定
#    1.風(DEX/INT)  -> character[7] / character[4];
#    2.雷(INT/MR)   -> character[4] / character[6];
#    3.共(DEX/AGI)  -> character[7] / character[8];
#    4.剣(STAB/DEX) -> character[2] / character[7];
#    5.刀(HACK/DEF) -> character[3] / character[5];
my $upstatase = <STDIN>;


#先行指定処理
     sub auto_bouns{

                my $rand = rand();
                my $method;

                if ($ upstatase == 1){
                                 if( $character[7] < 255){
                                                $character[7] = $character[7] + 1;
                                            }
                                        if($rand < 0.5){
                                                $character[4] = $character[4] +1 ;
                                    }
                            }
                     elsif ($ upstatase == 2){
                                 if( $character[4] < 255){
                                                $character[4] = $character[4] + 1;
                                            }
                                        if($rand < 0.5){
                                                $character[6] = $character[6] +1 ;
                                      }   
                            }
                     elsif ($ upstatase == 3){
                                 if( $character[7] < 255){
                                                $character[7] = $character[7] + 1;
                                            }
                                        if($rand < 0.5){
                                                $character[8] = $character[8] +1 ;
                                     }   
                            }
                    elsif ($ upstatase == 4){
                                 if( $character[2] < 255){
                                                $character[2] = $character[2] + 1;
                                            }
                                        if($rand < 0.5){
                                                $character[7] = $character[7] +1 ;
                                      }   
                            }
                    elsif ($ upstatase == 5){
                                 if( $character[3] < 255){
                                                $character[3] = $character[3] + 1;
                                            }
                                        if($rand < 0.5){
                                                $character[5] = $character[5] +1 ;
                                       }   
                            }            


     }


# ステータスアップの必要ポイント計算(ここでは仮に$character[3]=hack)を直接入れている
    sub point_up_loop{

          for my $p(1..4){
                $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);

    
                    if( $character[1] - $needpoint > -1 && $character[3] < 255){
                                        print "needpoint:","$needpoint\n";
                                $character[3] = $character[3] + 1;
                              $character[1] =  ( $character[1] - $needpoint);
                     }
                
                }
        }


#
    sub check_all_status{

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

    }






    for my $i(1..50){

    #    my $levelup = <STDIN>;
        my $levelup = 1;

        if( $levelup == 1){


# Lv6以下の場合-------------------------------------------------------------------------------
            if( $character[0] < 6){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 2;
                # レベルアップ処理とポイントの付与処理
                
               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示

            }


# Lv22以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 22){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 3;
                # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示


            }

# Lv48以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 48){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 4;
                # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示

            }

# Lv80以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 80){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 5;
                 # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示
            }

# Lv129以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 129){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 6   ;
                   # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示
            }

# Lv175以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 175){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 7;
                # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示
            }

# Lv235以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 235){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 8;
                # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示
            }

# Lv255以下の場合-------------------------------------------------------------------------------
            elsif( $character[0] < 255){
                $character[0] = $character[0] + 1;
                $character[1] = $character[1] + 9;
                # レベルアップ処理とポイントの付与処理

               &auto_bouns($upstatase);
               #先行処理の呼び出し  

               &point_up_loop();
               #ポイントを振る処理呼び出し

               &check_all_status();
                #確認用のステータス表示
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

