<?php
    require_once(__DIR__."/core/config.php");
    require_once(__DIR__."/core/function.php");
    if(isset($_COOKIE['token']) && $getUser['level'] == 'admin')
    {
        //CONFIG THÔNG SỐ
        define('filename', 'update_'.mt_rand().'.zip');
        define('serverfile', 'https://api.tuanori.vn/HOSTING.zip');
        // TIẾN HÀNH TẢI BẢN CẬP NHẬT TỪ SERVER VỀ 
        file_put_contents(filename, file_get_contents(serverfile));
        // TIẾN HÀNH GIẢI NÉN BẢN CẬP NHẬT VÀ GHI ĐÈ VÀO HỆ THỐNG
        $version = file_get_contents('http://api.tuanori.vn/version.php?version=HOSTING');
        $file = filename;
        $path = pathinfo(realpath($file), PATHINFO_DIRNAME);
        $zip = new ZipArchive;
        $res = $zip->open($file);
        if ($res === TRUE)
        {
            $zip->extractTo($path);
            $zip->close();
            // XÓA FILE ZIP CẬP NHẬT TRÁNH TỤI KHÔNG MUA ĐÒI XÀI FREE
            unlink(filename);
            // TIẾN HÀNH INSTALL DATABASE MỚI
            $query = file_get_contents(BASE_URL('install.php'));
            // XÓA FILE INSTALL DATABASE
            unlink('install.php');
            $file = @fopen('logs/Update.txt', 'a');
            if ($file)
            {
                $data = "[UPDATE] Phiên cập nhật phiên bản $version vào lúc ".gettime().PHP_EOL;
                fwrite($file, $data);
                fclose($file);
            }
            msg_success2("Tải bản cập nhật thành công");
        }
        else
        {
            msg_error2("Tải bản cập nhật thất bại");
        }
    }
?>