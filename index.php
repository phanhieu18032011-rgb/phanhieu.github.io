<?php
/* TUANORI.COM - PHÁT TRIỂN MÃ NGUỒN 2022 - 2023 */
    require_once(__DIR__."/core/config.php");
    require_once(__DIR__."/core/function.php");

    $title = 'HOME | '.$TUANORI->site('tenweb');
    require_once(__DIR__."/pages/client/Head.php");
    require_once(__DIR__."/pages/client/Header.php");
?>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-4"></div>
    <?php if(isset($getUser['username'])) { ?>
    <div class="row">
        <div class="col-12 col-xl-6 mb-2">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="fs-5 fw-normal">Số dư</h2>
                            <h3 class="fs-1 fw-extrabold mb-1"><?=number_format($getUser['money']);?>đ</h3>
                            <div class="d-flex align-items-center">
                                <span>Tổng số tiền của bạn</span>
                            </div> 
                        </div>
                      </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="fs-5 fw-normal">Tiền nạp hôm nay</h2>
                            <h3 class="fs-1 fw-extrabold mb-1"><?=format_cash(
                            $TUANORI->get_row("SELECT SUM(`sotien`) FROM `napatm` WHERE `username` = '".$getUser['username']."' AND `thoigian` >= DATE(NOW()) AND `thoigian` < DATE(NOW()) + INTERVAL 1 DAY ")['SUM(`sotien`)'] +
                            $TUANORI->get_row("SELECT SUM(`thucnhan`) FROM `napcard` WHERE `username` = '".$getUser['username']."' AND `status` = 'thanhcong' AND `thoigian` >= DATE(NOW()) AND `thoigian` < DATE(NOW()) + INTERVAL 1 DAY ")['SUM(`thucnhan`)']
                            );?>đ</h3>
                            <div class="d-flex align-items-center">
                                <span>Tổng số tiền nạp hôm nay</span>
                            </div> 
                        </div>
                      </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="fs-5 fw-normal">Hosting đang có</h2>
                            <h3 class="fs-1 fw-extrabold mb-1"><?=format_cash($TUANORI->num_rows("SELECT * FROM `historyhost` WHERE `username` = '".$getUser['username']."' AND `status` = 'hoatdong' "));?> host</h3>
                            <div class="d-flex align-items-center">
                                <span>Số hosting đang hoạt động</span>
                            </div> 
                        </div>
                      </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="fs-5 fw-normal">VPS đang có</h2>
                            <h3 class="fs-1 fw-extrabold mb-1"><?=format_cash($TUANORI->num_rows("SELECT * FROM `listvps` WHERE `username` = '".$getUser['username']."' AND `status` = 'hoatdong' "));?> VPS</h3>
                            <div class="d-flex align-items-center">
                                <span>Tổng VPS đang hoạt động</span>
                            </div> 
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <h5>Dịch vụ cung cấp</h5>
    <div class="row">
        <div class="col-12 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <span class="display-5"><i class="fa fa-shopping-cart"></i></span>
                                <h2 class="mt-3">HOSTING</h2>
                                <p>Hosting chất lượng, máy chủ Việt Nam.</p>
                                <a href="<?=BASE_URL('host');?>" class="btn btn-info">Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <span class="display-5"><i class="fa fa-shopping-cart"></i></span>
                                <h2 class="mt-3">RESELLER</h2>
                                <p>Reseller chất lượng, không giới hạn tài khoản</p>
                                <a href="<?=BASE_URL('reseller');?>" class="btn btn-danger">Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <span class="display-5"><i class="fa fa-shopping-cart"></i></span>
                                <h2 class="mt-3">TÊN MIỀN</h2>
                                <p>Tên miền chính chủ. Không bị gián đoạn sử dụng</p>
                                <a href="<?=BASE_URL('Mua-mien');?>" class="btn btn-warning">Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <span class="display-5"><i class="fa fa-money"></i></span>
                                <h2 class="mt-3">NẠP TIỀN</h2>
                                <p>NẠP TIỀN VÀO TÀI KHOẢN</p>
                                <a href="<?=BASE_URL('Banking');?>" class="btn btn-success">Nạp ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="py-2"></div>
    <h5>Liên hệ ADMIN</h5>
    <div class="row">
        <div class="col-12 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <img alt="" class="rounded-circle mt-4" src="https://i.imgur.com/phdCCX1.jpg">
                                <h4 class="card-widget__title text-dark mt-3"><?=$TUANORI->site('ten_facebook');?></h4>
                                <p class="text-muted">FACEBOOK ADMIN</p>
                                <a href="<?=$TUANORI->site('facebook');?>" class="btn btn-danger">Liên Hệ</a>
                            </div>
                        </div>
                        <div class="card-footer border-0 bg-transparent">
                            <div class="row">
                                <div class="col-4 border-right-1 pt-3">
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <img alt="" class="rounded-circle mt-4" src="https://i.imgur.com/phdCCX1.jpg">
                                <h4 class="card-widget__title text-dark mt-3"><?=$TUANORI->site('ten_zalo');?></h4>
                                <p class="text-muted"><b>ZALO ADMIN</b></p>
                                <a href="https://zalo.me/<?=$TUANORI->site('hotline');?>" class="btn btn-danger">Liên Hệ</a>
                            </div>
                        </div>
                        <div class="card-footer border-0 bg-transparent">
                            <div class="row">
                                <div class="col-4 border-right-1 pt-3">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        
                        <div class="card-body">
                            <div class="text-center">
                                <img alt="" class="rounded-circle mt-4" src="https://i.imgur.com/phdCCX1.jpg">
                                <h4 class="card-widget__title text-dark mt-3"><?=$TUANORI->site('ten_fanpage');?></h4>
                                <p class="text-muted">FANPAGE HỖ TRỢ</p>
                                <a href="<?=$TUANORI->site('fanpage_admin');?>" class="btn btn-danger">Liên Hệ</a>
                            </div>
                        </div>
                        <div class="card-footer border-0 bg-transparent">
                            <div class="row">
                                <div class="col-4 border-right-1 pt-3">
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xxl-6 mb-4 mb-xxl-0">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <div class="text-center">
                                <img alt="" class="rounded-circle mt-4" src="https://i.imgur.com/phdCCX1.jpg">
                                <h4 class="card-widget__title text-dark mt-3"><?=$TUANORI->site('ten_youtube');?></h4>
                                <p class="text-muted">YOUTUBE ADMIN</p>
                                <a href="<?=$TUANORI->site('youtube_admin');?>" class="btn btn-danger">Liên Hệ</a>
                            </div>
                        </div>
                        <div class="card-footer border-0 bg-transparent">
                            <div class="row">
                                <div class="col-4 border-right-1 pt-3">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php
    require_once(__DIR__."/pages/client/Footer.php");
?>
