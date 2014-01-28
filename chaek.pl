        use strict;
        use warnings;
        use POSIX;
        use utf8;
        binmode STDIN,  ":encoding(cp932)";
        binmode STDOUT, ":encoding(cp932)";

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



    print "先行指定:\n";
    print "1.風(DEX/INT)  \n";
    print "2.雷(INT/MR)   \n";
    print "3.共(DEX/AGI)  \n";
    print "4.剣(STAB/DEX) \n";
    print "5.刀(HACK/DEF) \n";
    my $upstatase = <STDIN>;


    #先行指定処理
         sub auto_bouns{
                    my $rand = rand();
                    my $method;

    # 先行設定
    #    1.風(DEX/INT)  -> character[7] / character[4];
    #    2.雷(INT/MR)   -> character[4] / character[6];
    #    3.共(DEX/AGI)  -> character[7] / character[8];
    #    4.剣(STAB/DEX) -> character[2] / character[7];
    #    5.刀(HACK/DEF) -> character[3] / character[5];

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


    # ステータスアップの必要ポイント計算
        sub point_up_loop{

              for my $p(1..4){

                    #配列で一気に更新したほうがいいいか？

        #    @statuslist = ('level','pont','stab','hack','int','def','mr','dex','agi');
                    print "上げるステータス指定\n";
                    print "1.stab/2.hack/3.int/4.def/5.mr/6.dex/7.agi\n";
                    my $up_status_point = <STDIN>;

                        if( $up_status_point == 1 ){

                             $needpoint  =  floor( $charapoint[0] + ( ($character[2] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[2] < 255){
                                    print  "$character[2]","から";
                                    $character[2] = $character[2] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[2]","にアップ\n\n";
                                }
                                 else {
                                    print "ポイントが足りません\n";
                                    last;

                            }    
                         }
                         elsif( $up_status_point == 2 ){

                              $needpoint  =  floor( $charapoint[1] + ( ($character[3] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[3] < 255){
                                    print  "$character[3]","から";
                                    $character[3] = $character[3] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[3]","にアップ\n\n";
                                }
                                else {

                                    print "ポイントが足りません\n";
                                    last;
                            }    
                         }
                          elsif( $up_status_point == 3 ){

                              $needpoint  =  floor( $charapoint[2] + ( ($character[4] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[4] < 255){
                                    print  "$character[4]","から";
                                    $character[4] = $character[4] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                     print  "$character[4]","にアップ\n\n";
                                }
                                else {
                                    print "ポイントが足りません\n";
                                    last;
                            }    
                         }
                          elsif( $up_status_point == 4 ){

                              $needpoint  =  floor( $charapoint[3] + ( ($character[5] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[5] < 255){
                                    print  "$character[5]","から";
                                    $character[5] = $character[5] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[5]","にアップ\n\n";
                                }
                                else {
                                    print "ポイントが足りません\n";
                                    last;
                            }    
                         }
                          elsif( $up_status_point == 5 ){

                                $needpoint  =  floor( $charapoint[4] + ( ($character[6] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[6] < 255){
                                    print  "$character[5]","から";
                                    $character[6] = $character[6] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[6]","にアップ\n\n";
                                }
                                else {
                                    print "ポイントが足りません\n";
                                    last;
                            }    
                         }
                          elsif( $up_status_point == 6 ){

                              $needpoint  =  floor( $charapoint[5] + ( ($character[7] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[7] < 255){
                                    print  "$character[5]","から";
                                    $character[7] = $character[7] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[7]","にアップ\n\n";
                                }

                                else {
                                    print "ポイントが足りません\n";
                                    last;
                            }    
                         }
                          elsif( $up_status_point == 7 ){

                              $needpoint  =  floor( $charapoint[6] + ( ($character[8] * 5 ) + $character[0] ) / 125);

                                  if( $character[1] - $needpoint > -1 && $character[8] < 255){
                                    print  "$character[5]","から";
                                    $character[8] = $character[8] + 1;
                                    $character[1] =  ( $character[1] - $needpoint);
                                    print  "$character[8]","にアップ\n\n";
                                }
                                else {
                                    print "ポイントが足りません\n";
                                    last;
                            }       
                    
                        }

                         else {
                                last;
                                print "END!!!\n";  
                            }    
            }
    }
    
        #確認用
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
                    print "\n";

        }






        for my $i(1..20){

    print "行動選択:\n";
    print "1.レベルアップ\n";
    print "2.先行変更:\n";
    print "3.終了:\n";
       my $levelup  = <STDIN>;
 #           my $levelup = 1;

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
            }elsif( $levelup == 2){

                print "先行指定 id:\n";
                print "1.風(DEX/INT)  \n";
                print "2.雷(INT/MR)   \n";
                print "3.共(DEX/AGI)  \n";
                print "4.剣(STAB/DEX) \n";
                print "5.刀(HACK/DEF) \n";
                my  $upstatase = <STDIN>;

            }
            else{
                last;
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
                    print "\n";

